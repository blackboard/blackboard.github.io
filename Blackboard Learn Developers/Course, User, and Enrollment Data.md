# Course, User, and Enrollment Data
*Author: Kelley MacEwen*
*Categories: ['Building Blocks', 'Examples']*
*Tags: ['tutorial', 'tutorials', 'blackboard learn', 'developers', 'migrated from edugarage', 'developer']*
---
This tutorial will show you how to retrieve and save user information using
various methods throughout the user interface.

#

# Loading user information from the context

A new utility API was added in version 7.2 that allows even easier access to
the Blackboard context from inside your Building Block. It is located in
blackboard.platform.context.ContextManagerFactory.

An example of how to use this API to load user information follows:

//initializes context

ContextManagerFactory.getInstance().setContext(request);

//retrieves the users first name, you can get any parameter from
blackboard.data.user.User from the getUser() method.

String firstName =
ContextManagerFactory.getInstance().getContext().getUser().getGivenName();

# Loading user information by using the UserSearch API

The UserSearch API located in blackboard.persist.user.UserSearch can be used
to search for specific users that exist within Blackboard.

An example of how to use this API follows:

//Creates and initializes a new user search

UserSearch us = UserSearch.getNameSearch( UserSearch.SearchKey.UserName,
SearchOperator.Equals, "administrator" );

//Gets a list of users who match (note: the above search will only return one
user)

List users = UserDbLoader.Default.getInstance().loadByUserSearch(us);

//Iterate through users

Search keys exist to search by name, e-mail, system role, username, and
enrollment count. Search operators exist for search methods including equals,
contains, like, greater than, less than, is null, starts with, and others.
These are documented in the API Javadocs located in the Documentation section
of this web site.

# Getting a role

To retrieve a persons role within a course, simply use the following code:

CourseMembership existing = null;

try {

existing = CourseMembershipDbLoader.Default.getInstance().loadByCourseAndUserI
d(courseCode, personCode);

} catch (KeyNotFoundException e) {

} catch (PersistenceException e) {

log.severe("BlackboardRole.add: Check on role for "+courseCode+"
"+personCode+" failed. "+e.getMessage());

}

# Adding Roles

## Allocation of a role

Here is a basic example that will get you going. It is all you need. You can
use this code to associate any person with any subject with any role.

CourseMembership newRole = new CourseMembership();

/* Specify which role to allocate */

newRole.setRole(CourseMembership.Role.STUDENT);

/* You could also use one of these:

newRole.setRole(CourseMembership.Role.INSTRUCTOR);

newRole.setRole(CourseMembership.Role.GRADER);

newRole.setRole(CourseMembership.Role.COURSE_BUILDER);

newRole.setRole(CourseMembership.Role.TEACHING_ASSISTANT);

*/

/* Specify the course batch uid, and person batch uid */

newRole.setCourseId("JACOB101");

newRole.setUserId("jrhoden");

/* Now simply persist the role to the database */

try {

CourseMembershipDbPersister.Default.getInstance().persist(newRole);

log.fine("BlackboardRole.add: Success "+role2.subjectCode+" "+role2.username+"
"+role2.role);

} catch (Exception e) {

log.severe("Problem adding role: Failed "+role2.subjectCode+"
"+role2.username+" "+role2.role+". "+e.getMessage());

return false;

}

However this code does not handle very well when there is a problem. For
example you may only insert one role, per person, per course. You probably
want something a bit more sophisticated which first checks for a current role
before inserting.

# Sophisticated allocation of a role

The following example is what we use for our blackboard server. It attempts to
neatly handle exceptions.

public static boolean add(String courseCode, String personCode, String role) {

CourseMembership newRole = new CourseMembership();

/* First we set the specified role */

try {

if(role.equals("student"))

newRole.setRole(CourseMembership.Role.STUDENT);

else if(role.equals("primary_coordinator"))

newRole.setRole(CourseMembership.Role.INSTRUCTOR);

else if(role.equals("secondary_coordinator"))

newRole.setRole(CourseMembership.Role.INSTRUCTOR);

else if(role.equals("marker"))

newRole.setRole(CourseMembership.Role.GRADER);

else if(role.equals("designer"))

newRole.setRole(CourseMembership.Role.COURSE_BUILDER);

else if(role.equals("tutor"))

newRole.setRole(CourseMembership.Role.TEACHING_ASSISTANT);

else {

log.fine("BlackboardRole.add: Failed. Invalid role: "+role);

return false;

}

}

catch(java.lang.IllegalArgumentException e) {

log.severe("BlackboardRole.add: Failed on course "+courseCode+" adding
"+personCode+" as "+role+". "+e.getMessage());

return false;

}

/* Check that the specified course exists */

try {

course = CourseSiteLoader.Default.getInstance().load(courseCode);

} catch(blackboard.persist.PersistenceException e){

log.severe("BlackboardRole.add: Could not find course: "+courseCode+"
"+e.getMessage());

return false;

}

/* Check the specified person exists */

try {

person = PersonLoader.Default.getInstance().load(personCode);

} catch(blackboard.persist.PersistenceException e){

log.severe("BlackboardRole.add: Could not find person: "+personCode+"
"+e.getMessage());

return false;

}

newRole.setCourseId(course.getId());

newRole.setUserId(person.getId());

/* Check if the person already has a role in this course */

try {

CourseMembership existing =
CourseMembershipDbLoader.Default.getInstance().loadByCourseAndUserId(

course.getId(), person.getId());

if(existing.getRole()==newRole.getRole()) {

log.fine("BlackboardRole.add: Silently ignoring message. "+person.getId()+"
already has this role in "+course.getId()+".");

return true;

}

log.warning("BlackboardRole.add: Overriding existing role for
"+person.getId()+" in "+course.getId()+".");

/* Person already has a role in this course, we will update the current role
and issue a warning */

existing.setRole(newRole.getRole());

try {

CourseMembershipDbPersister.Default.getInstance().persist(existing);

} catch (ValidationException e) {

log.warning("BlackboardRole.add: Overriding existing role for
"+person.getId()+" in "+course.getId()+" failed. "+e.getMessage());

return false;

}

return false;

} catch (KeyNotFoundException e) {

} catch (PersistenceException e) {

log.severe("BlackboardRole.add: Check on role for "+courseCode+"
"+personCode+" failed. "+e.getMessage());

return false;

}

/* If the person has no role, we now persist the role */

try {

CourseMembershipDbPersister.Default.getInstance().persist(newRole);

log.fine("BlackboardRole.add: Success "+courseCode+" "+personCode+" "+role);

} catch (Exception e) {

log.severe("Problem adding role: Failed "+courseCode+" "+personCode+"
"+role+". "+e.getMessage());

return false;

}

return true;

}

