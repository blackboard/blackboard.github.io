# Use APIs to Merge and Cross-list Courses
*Author: Ryan Haber*
*Categories: []*
*Tags: ['developer']*
---
# Overview

Your institution often needs to manage many courses or sections together. The
mechanism that Blackboard Learn provides for doing this is referred to as
course merging or cross-listing. Merged and cross-listed courses are, under
the hood, the same thing: two or more courses in a parent-child relationship.
A course set is a parent course together with all its child courses. In
physical terms, these students might have different courses listed on their
schedules. If their courses are merged in Learn, their schedules show the time
and place as determined by the registrar and they receive instruction from the
same instructor(s). All students in the child courses have access to the same
online content.

Blackboard Learn synchronizes enrollments in child courses with their parent
course. Users enrolled in a child course thus have access to the content of
the parent course. Likewise, when you use management tools in a parent course,
you will also affect users enrolled in its children courses. Blackboard Learn
preserves user roles from the last time a user is enrolled into any of the
courses in the course set. A student can only exist in one course in a course
set; Learn ignores duplicate enrollments.

Users with administrative entitlements can merge courses.

## Before you begin

You need an authentication token from a user with administrative entitlements
to merge courses. For a complete list of specific requirements for any
particular method, see the [Blackboard Learn API
reference](https://community.blackboard.com/external-link.jspa?url=https%3A/
/developer.blackboard.com/portal/displayApi/Learn).

## Merge a course

To merge one course as a child of another:

  1. Find the courseId of the course that you want to be the parent.
  2. Find the courseId of the course you want to be the child.
  3. Make a PUT request to /learn/api/public/v1/courses/{courseId}/children/{childCourseId}.

## Get the children of a course

To identify the children courses of a course:

  1. Find the courseId of the parent course.
  2. Make a GET request to /learn/api/public/v1/courses/{courseId}/children.

## Get the course set that a course belongs to

To get a list of all the courses merged with a particular course, regardless
of which are children and which is the parent, make a GET request to
/learn/api/public/v1/courses/{courseId}/crossListSet.

