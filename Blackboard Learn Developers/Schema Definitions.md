# Schema Definitions
*Author: Kelley MacEwen*
*Categories: ['Building Blocks', 'OpenDB']*
*Tags: ['develop', 'opendb', 'schema.xml', 'schema definitions', 'migrated from edugarage', 'developer']*
---
This article discusses the configuration and data required to define schema
elements in a Building Block.

# Directory Structure

Schema definitions are contained within a simple directory structure with a
specific layout including table definitions, SQL scripts for various stages of
the update process, views, functions, stored procedures, etc.

  * Schema.xml - A required file that defines the table structure to install in the Learn database.
  * datatemplates - a directory containing delimited files used as seed data for tables defined in schema.xml
  * functions, stored-procedures, triggers, views - user-defined functions, stored procedures, triggers, and views, respectively
  * pre_update_sql - Scripts that are run before DDL updates
  * post_schema_update_sql - Scripts that are run after DDL updates
  * post_update_sql - Scripts that are run after post_schema_update_sql

Note that for all objects defined from files (functions, triggers, stored
procedures, and views), there are a handful of constraints on the file's
structure -

  * Only a single object may be defined per file
  * The file name must be the same as the object name (with the exception of the SQL and db-type extension)
  * On Oracle, create statements do not need to use the or replace clause, as the installation code automatically drops all objects, based on the file name

## Manifests

Each directory containing raw SQL objects (view definitions, pre- and post-
update scripts, etc.) must include a manifest.txt file to specify object
creation or script execution order in order to ensure compilation dependencies
are met. The manifest is simply a list of newline-separated script names
(without the database-specific suffix).

# Schema.xml Format

The main file, schema.xml is in the root of the directory, and is a very
straightforward representation of the application's table structure. Keep in
mind it is built to support the set of data definitions that Blackboard
supports in its database implementation, so there is not necessarily fine-
grained control over the creation of things like indexes.

## Schema Element

The root element is the "schema" - it is a simple container, with no processed
attributes. As with all elements, <schema> may be commented via attribute or
element. Except for comment, the only other element that appears under schema
is table

## Table Element

The basic table definition is very simple - a single attribute, "name". Tables
may contain the following elements:

  * column. One or more columns may be defined.
  * index. Any number of indexes may be defined.
  * primary-key. Only a single primary key may be defined for the table.
  * foreign-key. Any number of foreign keys may be defined.

**Table names MUST be prefixed with the vendor-id from the bb-manifest.xml**

<table name="bb_custom_table">

<comment>A table to store custom data for the sample</comment>

<!-- additional definitions -->

</table>

## Column Element

Each table must contain one or more columns to define the data that can be
stored.

**name**
Required. The column name

**data-type**
Required. The type to use for the column; the schema file uses a generic
syntax based on SQL Server, that gets translated to a database-specific type.

**nullable**
Flags whether the column can contain SQL NULL values. Default is 'true'.

**default**
The value to insert in the database if none is supplied from the application
tier. If the type is a string, this attribute is a literal AND MUST INCLUDE
SINGLE QUOTES.

**identity**
Flags whether the column should be treated as an identity column. Default is
'false'. On SQL Server, the column will get created as an auto-increment
identity column. On Oracle, a sequence will be created.

## Column Constraints

The following table shows the data types that may be referenced in the column
definitions, and correspond to data types in use by the Blackboard
application. Some of the types, such as "int" are used as synonyms for an
underlying type commonly used in the Learn application, and don't support the
same specifiers that may be used when creating a similar column using raw DDL.
The conventions already in use by the Blackboard database affect many of these
specifications - for example, because of difference in the database
characterset and the NLS characterset, text fields must be explicitly designed
for single- vs. multi-byte data.

**nvarchar**
Used for text that may contain multi-byte characters. All user-entered data
should use this type. Additionally, a length specifier is required (e.g.,
nvarchar(50)), just as if the type were being directly defined with DDL.

**varchar**
Used for text that will only contain ASCII or ISO-8859-1 characters. This is
only recommended for fields that will store known inputs. As with nvarchar, a
length specifier is required.

**int**
An integer value, mapped to numeric(38) in Oracle and 'int' on SQL Server

**char**
A fixed length, non-internationalized string. A length specifier must be
provided.

<column name="batch_uid" data-type="nvarchar(256)" nullable="true" />

<column name="user_id" data-type="nvarchar(50)" nullable="false" />

## Some Blackboard Conventions

The following represents a sample of data type conventions used by Blackboard-
defined schema.

  * Mapping boolean values. Data type char(1), with a constraint limiting the values to Y/N, named with a _ind (for "indicator") suffix.
  * Primary keys. Data type int, name with _pk1 suffix.

##

## Column Constraints

Constraints on the columns values are defined with the value-constraint
element. A single, required name attribute must be provided to identify the
constraint. Each accepted value is defined with a child accepted-value
element, with a single, mandatory value attribute. Unlike default values
defined on columns, constraint values do not need the quote literals.

<column name="available_ind" data-type="char(1)" default="'Y'"
nullable="false">

<value-constraint name="indicator57">

<accepted-value value="Y"/>

<accepted-value value="N"/>

</value-constraint>

</column>

## Primary Key

**name**
Required. The name of the constraint that will be created in the database.

Primary keys must contain one columnref subelement that includes a single
attribute, name, that references the column name to include in the primary
key. In SQL Server, the key is mapped as an identity field with an auto-
incremented value. On Oracle, a sequence is automatically created with the
table name plus _seq suffix.

**Keep that in mind when creating table names, as there is an Oracle limit of 30 characters for object names. So, in practice, names defined in the schema XML must be shorter than 26 characters (because the automatically applied suffixes will extend the object name)**

<primary-key name="domain_pk" comment="[Table:domain][Primary-key:domain_pk]
on Column pk1 .">

<columnref name="pk1" />

</primary-key>

## Indexes and Uniqueness Constraints

Indexes may be defined via the index element.

**name**
An identifier for the index; Blackboard naming conventions typically include
the table name with a suffix of 'if', 'ak', or 'ie', followed by a number.

**unique**
True/false flag indicating whether a uniqueness constraint should be applied

<index name="course_users_ak1" unique="true">

<columnref name="users_pk1" />

<columnref name="crsmain_pk1" />

</index>

<index name="course_users_ie1" unique="false"> <columnref
name="enrollment_date" /> </index>

## Foreign Keys

References to data stored in other tables are defined via the foreign-key
element.

**name**
Required. An identifier for the referential integrity constraint created by
the key. The Blackboard naming convention is table name, followed by 'fk',
followed by a numeric suffix to distinguish multiple constraints.
E.g.,announcements_fk2.

**reference-table**
Required. Indicates which table is referenced by columnref.

**on-delete**
Indicates what action should be taken if the referenced column is deleted.
Valid values are setnull, which means the column should be set to null, and
delete, which means the row should be deleted. If setnull is specified, the
column specified in columnref must have nullable="true".

**Although on-delete is not a required attribute, it is very important to consider how a core Blackboard table is being referenced. Failure to specify an appropriate on-delete action could result in core functionality breaking (e.g. it could cause deletion of a core object to fail).**

<foreign-key name="course_users_fk2" reference-table="course_main"
comment="This is a Foreign Key referencing the primary key of the
[AS_CORE].course_main table. ">

<columnref name="crsmain_pk1" />

</foreign-key>

## Comments

Comments may be included on any element, via a comment element or attribute.
The main factor in which kind of comment is used is simply source readability.
Longer comments should be created via elements. In either case, HTML must be
escaped, as there is no defined namespace. While no validation is used in
processing schema XML and HTML tags would not cause a failure,
escaping/encoding is considered a best practice in order to avoid potential
markup conflicts ("table" for example).

# Cross-Database Support

The Blackboard platform supports both SQL Server and Oracle. While the schema
definition framework transparently converts the generic XML syntax to the
correct flavor, the same is not true for SQL scripts. That means developers
should provide a version for the database versions supported using a simple
extension to indicate the target database: db-oracle for Oracle-specific
scripts and db-mssql for SQL Server-specific scripts.

