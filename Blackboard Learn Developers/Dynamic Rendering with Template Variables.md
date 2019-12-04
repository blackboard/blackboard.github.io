# Dynamic Rendering with Template Variables
*Author: Scott Hurrey*
*Categories: ['Building Blocks', 'Getting Started']*
*Tags: ['building blocks', 'blackboard learn', 'template variable', 'developer']*
---
Template variables allow for integration with other systems by exposing
information about the user's context in a way that makes creating URLs to pass
information to these systems easy.

Template variables are represented by a series of values given a special
syntax. This syntax is

@X@object.attribute@X@. When used, these variables are expanded when rendered
into their corresponding values. Within the UI, they can be used in portal
modules and within the body of content items in courses.

Note that not all of these variables will resolve on all pages, For example,
if the page is not inside a course, there will be no course-related variables
available.

## Using context variables

Context itemContext variableExample output

User external person key

@X@user.batch_uid@X@

123-45-6789

User username (user id)

@X@user.id@X@

jsmith

User full name

@X@user.full_name@X@

John Smith

User primary key identifier

@X@user.pk_string@X@

_521_1

User locale

@X@user.locale@X@

en_GB

User system role(s)

@X@user.role@X@

System Roles

C- Course Administrator

U- Guest

N- None

O- Observer

Y- Community Administrator

R- Support

Z- System Admin

H- System Support

A- User Administrator

User primary institution role

@X@user.institution_role@X@

or

@X@user.primary_institution_role@X@

student

User secondary institution role(s)

@X@user.secondary_institution_role@X@

student,faculty

Course membership role

@X@membership.role@X@

Course/Organization Roles

B- Course Builder/Organization Builder

G- Grader/Grader

U- Guest/Guest

P- Instructor/Leader

S- Student/Participant

T- Teacher's Assistant/Assistant

Course external course key

@X@course.batch_uid@X@

ABC123ABC

Course course id

@X@course.id@X@

BIO101

Course name

@X@course.course_name@X@

Introduction to Concepts in Biology

Course primary key identifier

@X@course.pk_string@X@

_12344_1

Course URL

@X@course.url@X@

/courses/1/BIO101/

Course membership role

@X@course.role@X@

student

Course locale

@X@course.locale@X@

en_US

Content primary key identifier

@X@content.id@X@ or

@X@content.pk_string@X@

_23_1

Content URL

@X@content.url@X@

/courses/1/BOB101/content/_221_1

Request [UUID](https://community.blackboard.com/external-link.jspa?url=http%3A
//www.opengroup.org/onlinepubs/009629399/apdxa.htm)

@X@request.id@X@

Request locale

@X@request.locale@X@

Request return URL

@X@request.return@X@

System host name

@X@system.site_id@X@

