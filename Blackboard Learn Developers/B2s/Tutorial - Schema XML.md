---
layout: learn
parent: b2s
category: examples-b2
---
# Tutorial - Schema.XML
*Author: Scott Hurrey*  
*Categories: ['Building Blocks', 'Tutorials']*  
*Tags: ['building blocks', 'tutorial', 'blackboard learn', 'schema.xml', 'developer']*  
<hr />
Building Blocks often require the means to store data specific to their
function. This was often accomplished using local flat files stored in the
Building Block directory or by utilizing an external database. Neither
solution was desirable from a scalability or performance perspective, and
certainly limited the sharing of solutions due to additional constrains for
hardware or software.

Staring with Release 9.1 Service Pack 6, Blackboard provided to Building
Blocks the ability to define schema elements in their .war file that would get
automatically installed and managed in the Learn database schema. The document
used to define the schema is referred to as Schema.xml.

Including a schema.xml document in your project means that your Building Block
can define and install schema elements via special configuration files
referenced from the bb-manifest and managed by included sql. This means you no
longer need to establish 'out-of-band' communication to external databases or
write data to the Building Block directory to save information necessary to
the function of your Building Block.

[Schema.xml Example Project](https://github.com/blackboard/BBDN-Schema-Sample)
contains a sample project demonstrating the use schema.xml within a building
block.

Accessing your Building Block Tables contains a sample project demonstrating
how to use the Learn Data Access Object model for accessing your Building
Block data tables.

## Preparing Learn for using schema.xml enabled Building Blocks

By default Blackboard Learn does not allow installation of schema.xml enabled
Building Blocks. Administrators must enable this functionality from the
Building Blocks management section of the admin panel. The allowed schema
actions are specified from the "Global Settings" screen, including:

  * Prevent any Building Block from creating custom database objects
    * This option is the default - no schema may be installed by any Building Block
  * Prompt each time a Building Block wants to create custom database objects
    * This option prompts the administrator - previewing the tables/objects that would be created.
  * Allow any Building Block to create custom database objects
    * option simply processes the objects, without prompting the admin. That option is only recommended for development to facilitate rapid iteration.

Best practice is to choose the "prompt" option, and then only after attempting
to install a Building Block and seeing the error message.

**NOTE**: _These settings are do not apply to Blackboard-authored, signed Building Blocks as that would disrupt the operation of some key features, such as the Wiki, that are delivered via Building Blocks._

### A Word of Caution

With great power comes great responsibility - there are a few things to keep
in mind when designing the schema using this mechanism:

  * Schema.xml object prefixes - Database objects must be prefixed with the vendor-id in the Building Block manifest (the Building Block installer will complain if the prefixes do not match). This will be explained further in the examples section.
  * Minimize your dependency on Blackboard objects - If you do need to link to a Blackboard database object, ensure that the relationship does not interfere with standard Blackboard processing - you must specify an on-delete action (cascade or setnull) for managing the Buidling Block table data on foreign key data removal.
  * The Blackboard schema is not an officially supported integration API, and will change from release to release.
  * Test, test, test - if you do reference a core entity, such as a course or user, make sure you can still delete that entity

## Cross-Database Support

The Blackboard platform supports both SQL Server, Oracle, and for development
purposes (as of Learn 9.1SP14) PostgreSQL. While the schema definition
framework transparently converts the generic XML syntax to the correct flavor,
the same is not true for SQL scripts. That means developers should provide a
database specific schema definition for each database version supported.

## Getting Started: An Overview

Use of schema.xml is comprised of three basic concepts which will be covered
in the remainder of this article:

  1. schema.xml directory structure
  2. schema.xml file format
  3. sql support

## Directory Structure

The Building Block schema is defined primarily via a file called schema.xml,
which is part of a directory structure that also defines various SQL scripts -
procedures, functions, views, etc. One or more schema definition directories
are referenced via the schema-dirs element in the bb-manifest, as follows (it
is recommended practice to specify using a vendor ID prefix):

### bb-manifest.xml
```
        <?xml version="1.0" encoding="UTF-8"?>  
         <manifest>  
             <plugin>  
                 <name value= "Zeta TM a task manager for the rest of us"/>  
                 <handle value= "ztm1"/>  
                      ...             <vendor>  
                     <id value="zeta"/>  
                         ...             </vendor>  
                 ...             <schema-dirs>  
                     <schema-dir dir-name="zeta-tasks"/>  
                     <schema-dir dir-name="zeta-stats"/>  
                 </schema-dirs>  
             </plugin>  
             ...  
         </manifest>
```

The dir-name attribute is evaluated first against the webapp root, then
against WEB-INF. The schema.xml should be in the WEB-INF directory in a sub-
directory labeled 'schema'. All other schema related files and scripts are in
sub-directories. Below is the start of a WEB-INF directory structure for a
Building block based on the above bb-manifest.xml entry:
```
        WEB-INF  
             web.xml  
             bb-manifest  
             schema  
                 zeta-tasks  
                     schema.xml  
                 zeta-stats  
                     schema.xml
```

The database attribute, noted as the dir-name in the above entry, indicates
which schema the objects should be created in. By default, the objects are
created in the transactional schema and require no additional specification.
For example: 'zeta-tasks'. Tables and other objects can also be created in the
reporting schema by using the value "-stats". For example: 'zeta-stats'.

### Schema Directory Structure

Schema definitions are contained within a directory structure with a specific
layout including table definitions, SQL scripts for various stages of the
update process, views, functions, stored procedures, etc.

Once you have the directory structure and empty schema.xml files for the
desired schemas in place you then define the SQL that will set up and manage
the tables in the Building Block schema. There are five basic groups of files
which may be created under the database directory:

  1. datatemplates - a directory containing delimited files used as seed data for tables defined in schema.xml
  2. functions, stored-procedures, triggers, views - user-defined functions, stored procedures, triggers, and views, respectively
  3. pre_update_sql - Scripts that are run before DDL (Data Definition Language) updates
  4. post_schema_update_sql - Scripts that are run after DDL updates
  5. post_update_sql - Scripts that are run after post_schema_update_sql

Adding these directories for a schema could result in the following directory
structure:
```
        WEB-INF  
             web.xml  
             bb-manifest  
             schema  
                 zeta-tasks  
                     schema.xml  
                     datatemplates  
                     pre_update_sql  
                     post_schema_update_sql  
                     post_update_sql  
                     functions  
                     stored_procedures  
                     triggers  
                     views  
                 zeta-stats  
                     schema.xml  
                     pre_update_sql  
                     post_schema_update_sql  
                     post_update_sql  
                   
```

**NOTE**: _You are not required to specify files for each operation - only those required for proper instantiation of the Building Block schema per it's functional requirements._

### File Structure Constraints

All objects defined from files (functions, triggers, stored procedures, and
views), have a handful of constraints on the file's structure

  * Only a single object may be defined per file
  * The file name must be the same as the object name (with the exception of the SQL and db-type extension)
  * On Oracle, create statements do not need to use the or replace clause, as the installation code automatically drops all objects, based on the file name

### Cross-Database SQL

As previously noted, schema.xml supports the same databases that Learn
supports, but any SQL used in creation, updating, configuration, triggers,
etc., must be database specific. This is supported by adding the appropriate
extension to the SQL files that you add to the operation directories:

* Oracle: .db-oracle
* MSSQL: .db-mssql
* PostgreSQL: .db-pgsql

**NOTE**: _generic SQL may use a .sql extension_

### Processing Order

When providing a directory containing raw SQL objects (view definitions, pre-
and post-update scripts, etc.) it may be important to specify object creation
or script execution order to ensure compilation dependencies are met. This is
done by providing an entries in the schema.xml for each operation directory.
This is covered in more detail in the below section Schema.xml format.

## Schema.xml Format

The main file, schema.xml is in the root of the directory, and is a very
straightforward representation of the application's table structure. Keep in
mind it is built to support the set of data definitions that Blackboard
supports in its database implementation, so there is not necessarily fine-
grained control over the creation of things like indexes.

### Schema Element

The root element is the "schema" - it is a simple container, with no processed
attributes. As with all elements, <schema> may be commented via attribute or
element. Except for <comment>, the only other element that appears under
schema is <table>

### Table Element

The basic table definition is very simple - a single attribute - name. Tables
may contain the following elements:

  * <column>: One or more columns may be defined.
  * <index>: Any number of indexes may be defined.
  * <primary-key>: Only a single primary key may be defined for the table.
  * <foreign-key>: Any number of foreign keys may be defined.

Table names **MUST** be prefixed with the vendor-id from the bb-manifest.xml

### Schema.xml sample:

Click here to review the schema.xml file in the sample schema code on Github.

### Column Element

Each table must contain one or more columns to define the data that can be
stored.

  * **_name_**: **Required**. The column name.
  * **_data-type_**: **Required**. The type to use for the column; the schema file uses a generic syntax based on SQL Server, that gets translated to a database-specific type.
  * **_nullableFlags_**: whether the column can contain SQL NULL values. Default is 'true'.
  * **_default_**: The value to insert in the database if none is supplied from the application tier. If the type is a string, this attribute is a literal AND MUST INCLUDE SINGLE QUOTES.
  * **_identityFlags_**: whether the column should be treated as an identity column. Default is 'false'. On SQL Server, the column will get created as an auto-increment identity column. On Oracle, a sequence will be created.

### **Supported Column Data Types**

The following table shows the data types that may be referenced in the column
definitions, and correspond to data types in use by the Blackboard
application. Some of the types, such as "int" are used as synonyms for an
underlying type commonly used in the Learn application, and don't support the
same specifiers that may be used when creating a similar column using raw
vendor specific Data Definition Language (DDL). The conventions already in use
by the Blackboard database affect many of these specifications - for example,
because of difference in the database characterset and the NLS characterset,
text fields must be explicitly designed for single- vs. multi-byte data.

  * **_nvarchar_**: Used for text that may contain multi-byte characters. All user-entered data should use this type. Additionally, a length specifier is required (for example, nvarchar(50)), just as if the type were being directly defined with DDL.
  * **_varchar_**: Used for text that will only contain ASCII or ISO-8859-1 characters. This is only recommended for fields that will store known inputs. As with nvarchar, a length specifier is required.
  * **_int_**: An integer value, mapped to numeric(38) in Oracle and 'int' on SQL Server
  * **_char_**: A fixed length, non-internationalized string. A length specifier must be provided.
  * **_date_**
  * **_clob_**

### **Some Blackboard Conventions**

The following represents a sample of data type conventions used by Blackboard-
defined schema.

  * Mapping boolean values. Data type char(1), with a constraint limiting the values to Y/N, named with a _ind (for "indicator") suffix.
  * Primary keys. Data type int, name with _pk1 suffix.

### **Column Constraints**

Constraints on the columns values are defined with the value-constraint
element. A single, required name attribute must be provided to identify the
constraint. Each accepted value is defined with a child accepted-value
element, with a single, mandatory value attribute. Unlike default values
defined on columns, constraint values do not need the quote literals.
```
         <column name="available_ind" data-type="char(1)" default="'Y'" nullable="false">  
               <value-constraint name="indicator57">  
               <accepted-value value="Y"/>  
               <accepted-value value="N"/>  
               </value-constraint>  
          </column>
```

### **Primary Key**

  * **_name_**: **Required**. The name of the constraint that will be created in the database.

Primary keys must contain one columnref sub-element that includes a single
attribute, name, that references the column name to include in the primary
key. In SQL Server, the key is mapped as an identity field with an auto-
incremented value. On Oracle, a sequence is automatically created with the
table name plus _seq suffix.

**IMPORTANT**: Keep that in mind when creating table names, as there is an Oracle limit of 30 characters for object names. So, in practice, names defined in the schema XML must be shorter than 26 characters (because the automatically applied suffixes will extend the object name)
         <primary-key name="domain_pk" comment="[Table:domain][Primary-key:domain_pk] on Column pk1  .">  
          <columnref name="pk1" />  
         </primary-key>

### **Indexes and Uniqueness Constraints**

Indexes may be defined via the index element.

  * **_name_**: An identifier for the index; Blackboard naming conventions typically include the table name with a suffix of 'if', 'ak', or 'ie', followed by a number.
  * **_unique_**: True/false flag indicating whether a uniqueness constraint should be applied
```
         <index name="course_users_ak1" unique="true">  
               <columnref name="users_pk1" />  
               <columnref name="crsmain_pk1" />  
          </index>  
           <index name="course_users_ie1" unique="false">  
               <columnref name="enrollment_date" />  
            </index>
```

### **Foreign Keys**

References to data stored in other tables are defined via the foreign-key
element.

* **_name_**: **Required**. An identifier for the referential integrity constraint created by the key. The Blackboard naming convention is table name, followed by 'fk', followed by a numeric suffix to distinguish multiple constraints. For example: announcements_fk2.
* **_reference-table_**: **Required**. Indicates which table is referenced by columnref.
* **_on-delete_**: Indicates what action should be taken if the referenced column is deleted. Valid values are setnull, which means the column should be set to null, and delete, which means the row should be deleted. If setnull is specified, the column specified in columnref must have nullable="true".

Although on-delete is not a required attribute, it is very important to
consider how a core Blackboard table is being referenced. Failure to specify
an appropriate on-delete action could result in core functionality breaking
(for example, it could cause deletion of a core object to fail).
```
         <foreign-key name="course_users_fk2" reference-table="course_main" comment="This is a Foreign Key referencing the primary key of the [AS_CORE].course_main table. ">  
               <columnref name="crsmain_pk1" />  
         </foreign-key>
```

### **Comments**

Comments may be included on any element, via a comment element or attribute.
The main factor in which this kind of comment is used is simply source
readability. Longer comments should be created via elements. In either case,
HTML must be escaped, as there is no defined namespace. While no validation is
used in processing schema XML and HTML tags would not cause a failure,
escaping/encoding is considered a best practice to avoid potential markup
conflicts ("table" for example).

For examples of schema.xml documents, take a look in the
/usr/local/blackboard/system/database/vi/* directory.

For an example of how a Building Block may create schema tables using
schema.xml, see [Schema.xml Example
Project](https://github.com/blackboard/BBDN-Schema-Sample).

### Other useful information:

[Schema.xml validator](https://bbprepo.blackboard.com/content/repositories/releases/blackboard/platform/bb-schema-xsd/)

[Bb-manifest validator](https://bbprepo.blackboard.com/content/repositories/releases/blackboard/platform/bb-manifest-plugin/)

