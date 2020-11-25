---
layout: post
title: "Event Driven API" 
categories: Learn b2
id: learn-b2-advced-event-driven-api
author: Kelley MacEwen
---

# Event Driven API

The Blackboard Learn Event Driven API is used to programmatically push the
following data into the Blackboard Learn database from an external system:

  * User
  * Course
  * Organization
  * Enrollment
  * Staff Student
  * Organization membership
  * Course and Organization category
  * Course and Organization category membership

The collaboration between the entity and the persistence classes is the
process by which data is obtained from the institution systems. An instance is
created for that data, and input into the Blackboard Learn database as a data
record.

The intended audience includes developers creating data integration solutions
for the Blackboard Learn. The Data Integration API Specifications describe the
packages, classes, and objects of the Event Driven API in systemlib/cms-
admin.jar.

## Event Driven API architecture

The API is a collection of java classes and objects that move data from the
institution systems into Blackboard Learn. Concrete data from the institution
systems are encapsulated as java objects. The methods contained in the java
classes determine how the data is input into Blackboard Learn. The data input
is controlled by persisters that process the appropriate method, convert the
object into data that can be input into Blackboard Learn database, and then
input that data according to the method called.

### Entities and persisters

There are two main types of objects in the API: entities (objects) and
persisters (actions). Entities include the objects that represent data in the
system, such as users. Persisters are behind-the-scenes methods that handle
the storage of the entities into a persistent store or transient data format.

### Operations

All data classes have methods to handle persistence actions. The following
persistence operations are supported:

  * _Insert_: Inserts a record into the Blackboard Learn database.
  * _Update_: Updates an existing record in the Blackboard Learn database.
  * _Save_: Updates an existing record if it already exists. Otherwise, if it does not exist, inserts the record in the Blackboard Learn database.
  * _Remove_: Purges the record from the Blackboard Learn database.
  * _Change Key_: (Person and Group, Course, and Organization) Changes the primary key. This will automatically update any related Memberships of the changed keys.

### Create an object

To create an object in the system, instantiate a corresponding entity, set
attributes on the object, and then call a persister method (insert, update,
save, delete).

### Persisters

The following Persisters are found in the Event Driven API:

* CourseSitePersister
* OrganizationPersister
* EnrollmentPersister
* OrganizationMembershipPersister
* StaffStudentPersister
* PersonPersister
* CourseCategoryPersister
* OrganizationCategoryPersister
* CourseCategoryMembershipPersister
* OrganizationCategoryMembershipPersister
* PortalRolePersister

Persist methods include changeKey, insert, remove, save, update, clone. Change
key is not relevant for membership type items. Clone is only relevant for
Coursesite/Organization. More information about Persist methods can be found
in the API specifications.

### Loaders

The following Loaders are found in the Event Driven API:

* SourseSiteLoader
* OrganizationLoader
* EnrollmentLoader
* OrganizationMembershipLoader
* StaffStudentLoader
* PersonLoader
* CourseCategoryLoader
* OrganizationCategoryLoader
* CourseCategoryMembershipLoader
* OrganizationCategoryMembershipLoader
* PortalRoleLoader

Load methods include load by batch_uid and load by template. More information
about Load methods can be found in the API specifications.

### Data source loader and persister

The following Data Source Loader and Persister are found in the Event Driven
API:

**DataSourceLoader**

* loadAll()
* loadAdminObjectCount()
* loadAllAdminObjectCounts()
* loadByBatchUid()
* DataSourcePersister
* create()
* disableAdminObjectsByDataType()
* disableAllAdminObjects()
* modify()
* purgeAdminObjectsByDataType()
* purgeAllAdmiObjects()
* purgeSnapshotSessions()
* removeByBatchUid()

## Persistence package

For the most complete and up-to-date information about packages and classes,
refer to the Javadocs included with the API.

### Persistence package

The persistence package provides a framework to handle the insert, update,
save, and delete for the entity objects. The framework includes:

  * BbServiceManage: This class handles the coordination of Blackboard Learn enabled services.
  * PersistenceService: This class is a singleton, an object only intended to exist once, that manages the different persistence context for the entity objects.
  * DbPersistenceManager: This class maintains the reference points for each individual loader/persister. An instance of any persister/loader is requested through it.
  * PersisterInterfaces: This includes the PersonPersister, CoursesitePersister, and so forth.

~~~ java
blackboard.platform.BbServiceManager.init( serviceConfig,bbprops );

blackboard.platform.persistence.PersistenceService pService =
BbServiceManager.getPersistenceService().

blackboard.persist.BbPersistenceManager bManager =
pService.getDbPersistenceManager()

CoursesiteLoader cLoader=
(CoursesiteLoader)bManager.getLoader(CoursesiteLoader.TYPE);

PersistenceManager.getLoader=PersonPersister.Default.getInstance()
~~~

The user must initialize the BbServiceManager before attempting any
persistence of the admin data objects. After BbServiceManager is initialized
the appropriate loader/persister must be used according to the data type the
programmer intends to manage.

## Determining relationships

When using the API, there are specific steps than need to be followed to
determine the relationships between the entity and the persistence classes.

The following is an example of how to get a Course site:

~~~ java
blackboard.admin.data.course.CourseSite site=new

blackboard.admin.data.course.CourseSite();
~~~

  1. The program must first initialize the BbServiceManager object. The method call is blackboard.platform.BbServiceManager.init( serviceConfig ); where serviceConfig is a java.io.File object. This object represents a link to the configuration file on the operating system. The file is a detailed list of all services that are active on the instance of the servicemanager as well as any of their configuration files.
  2. The BbServiceManager object is only initialized once for each execution of the application.

  3. A virtual host is also needed for proper setup. A virtual host can be obtained by first getting the Virtual Installation Manager using BBServiceManager.lookupService(VirtualInstallationManager.class). The Virtual Installation Manager has a getVirtualHost(String id) method which returns the virtual host.

  4. Next, the ContextManager must be retrieved using BBServiceManager.lookupService(ContextManager.class). Finally, the context can be set by calling the ContextManager’s setContext() method and passing in the virtual host as an argument.

  5. The following code sample assumes a “SERVICE_CONFIG_DIR” and “VIRTUAL_HOST_KEY” properties will be set, probably through –D parameters if it is used in a command line application. The SERVICE_CONFIG_DIR should be set to the full path of the Blackboard config directory, while the VIRTUAL_HOST_KEY needs to be the virtual installation you want to test, by default it is bb_bb60.

~~~ java
// Initialize the BbServiceManager and set the context

//Follow the steps below to determine the relationships between the entity and persistence classes.

try

{

blackboard.platform.BbServiceManager.init(System.getProperties().getProperty("
SERVICE_CONFIG_DIR") + "service-config-snapshot-jdbc.properties");

// The virtual host is needed to establish the proper database context.

VirtualInstallationManager vm = (VirtualInstallationManager)

BbServiceManager.lookupService(VirtualInstallationManager.class);

String vhostUID = System.getProperty("VIRTUAL_HOST_KEY", "bb_bb60");

VirtualHost vhost = vm.getVirtualHost(vhostUID);

vhost = vm.getVirtualHost(vhostUID);

if(vhost == null)

{

throw new Exception("Virtual Host '" + vhostUID + "' not found.");

}

// Now that the vhost is set we can set the context based on that vhost

ContextManager cm = (ContextManager)
BbServiceManager.lookupService(ContextManager.class);

Context context = cm.setContext(vhost);

}

catch(Exception e)

{

System.out.println("Exception trying to init the BbPersistenceManager\n " +
e.toString() + "..exiting.\n");

System.exit(0);

}
~~~

  6. The controller creates an entity object and sets its attributes.
  7. The controller requests a persist action off the Loader / Persister

~~~ java
CourseSiteLoader cLoader=

(CourseSiteLoader)BbServiceManager.getPersistenceService().getDbPersistenceMan
ager().getLoader(CourseSiteLoader.TYPE);

CourseSitePersister cPersister=

(CourseSitePersister)BbServiceManager.getPersistenceService().getDbPersistence
Manager().getPersister(CoursesSitePersister.TYPE);

PersistenceManager.getLoader=PersonPersister.Default.getInstance()
~~~

  8. The controller catches any persistence exceptions that occur.

Repeat steps 2, 3, and 4 as needed for different entities and different
persist actions.