---
layout: post
title: "Creating Database Objects with Building Blocks"
categories: Learn b2
id: archive-b2-opendb-creatingdb-object
author: Kelley MacEwen
---

# Creating Database Objects with Building Blocks

With Release 9.1, Blackboard included the ability for Building Blocks to
define schema elements in the .war file that would get automatically installed
and managed in the Learn database schema. However, that feature was limited to
Building Blocks that were signed and distributed by Blackboard.

As of 9.1 Service Pack 1 (R9.1SP1), that "sign-gating" restriction has been
lifted. Building Blocks authored by independent developers can define and
install schema elements via special configuration files referenced from their
manifest. In some ways, this was in recognition of the fact that Building
Blocks frequently created custom schema objects directly. By enabling it as a
feature allows system admins to get more visibility into the process, and
ensure some level of consistency.

It should be noted that this is not on by default - Administrators must enable
this functionality from the Building Blocks management section of the admin
panel. The allowed schema actions are specified from the "Global Settings"
screen, including:

- Prevent any Building Block from creating custom database objects
- Prompt each time a Building Block wants to create custom database objects
- Allow any Building Block to create custom database objects

Also note that these options are not enforced for Blackboard-authored, signed
Building Blocks - that would disrupt the operation of some key features, such
as the Wiki, that are delivered via Building Blocks. The first option is the
default - no schema may be installed. The second option prompts the
administrator - previewing the tables/objects that would be created. The third
option simply processes the objects, without prompting the admin. That option
is only recommended for development, in order to facilitate rapid iteration.
In practice, we expect most administrators to choose "prompt", and then only
after attempting to install a Building Block and seeing the error message.

With great power comes great responsibility - there are a few things to keep
in mind when designing the schema using this mechanism:

- Database objects must be prefixed with the vendor-id in the B2 manifest (the B2 installer will complain if the prefixes do not match).
- Minimize your dependency on Blackboard objects
- If you do need to link to a Blackboard database object, ensure that the relationship does not interfere with standard Blackboard processing - you must specify an on-delete action (cascade or setnull)
- The Blackboard schema is not an officially supported integration API, and will change from release to release.
- Test test test - if you do reference a core entity, such as a course or user, make sure you can still delete that entity

## Getting Started

The schema is defined primarily via a file called schema.xml, which is part of
a directory structure that also defines various SQL scripts - procedures,
functions, views, etc. One or more schema definition directories are
referenced via the schema-dirs element in the manifest, as follows:

```xml
<schema-dirs>
  <schema-dir dir-name="test"/>
  <schema-dir dir-name="statstest" database="stats"/>
</schema-dirs>
```

The dir-name attribute is evaluated first against the webapp root, then
against WEB-INF. The schema.xml should be in that directory; all other scripts
are in sub-directories. The database attribute indicates which schema the
objects should be created in. By default, the objects are created in the
transactional schema - so if you are creating tables to support the day-to-day
features of your Building Block, you would not need to define this value.
Tables and other objects can also be created in the reporting schema by using
the value "stats". As of R9.1SP1, there are no other supported values.

See [Schema Definitions](/archive/b2/opendb/schema-definitions) for
more information on the structure of schema.xml, the containing directory
structure, and the supporting scripts.

### Next Steps

Take a look at [Tutorial - Schema.XML](/archive/b2/opendb/schema-xml) for an in-depth
look and working example using schema.xml to store building block
configuration details in a custom database table.
