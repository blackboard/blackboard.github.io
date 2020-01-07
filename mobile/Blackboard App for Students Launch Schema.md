---
layout: main
---
# Blackboard App for Students Launch Schema
*Author: Scott Hurrey*  
*Categories: []*  
*Tags: ['developer', 'mobile', 'bbstudent', 'blackboard mobile', 'app-to-app', 'custom url']*  
<hr />

## Bb Student is now Blackboard

As of June 2017, Bb Student is now known as Blackboard. The app’s functions
remain the same. For consistency, the app-to-app launch schemas will change
and the older ones using the bbstudent:// prefix will be deprecated. As with
any deprecation, we are informing you, the developer, that we plan to remove
this functionality at a later date. The purpose of this deprecation is to
provide the time necessary to migrate your application from one scheme to the
other. At this time, there is no firm date at which this change will take
place. We will use usage data to inform that decision, and once a date is
selected and confirmed, we will make an announcement. As part of the
deprecation process, all new links will require the new blackboard:// URL
scheme.

<hr />

### Activity Stream 

**Endpoint**: blackboard://activity 

**Version**: Blackboard 3.0

<hr />

### Course Base 

**Endpoint**: blackboard://courses 

**Version**: Blackboard 3.0

<hr />

### Organization Base 

**Endpoint**: blackboard://org 

**Version**: Blackboard 3.2

<hr />

### Grades 

**Endpoint**: blackboard://grades 

**Version**: Blackboard 3.0

<hr />

### Due Dates 

**Endpoint**: blackboard://calendar 

**Version**: Blackboard 3.0

<hr />

### Profile 

**Endpoint**: blackboard://profile 

**Version**: Blackboard 3.0

<hr />

### Settings 

**Endpoint**: blackboard://settings 

**Version**: Blackboard 3.0

<hr />

### Linked Accounts 

**Endpoint**: blackboard://settings/linkedAccounts

**Version**: Blackboard 3.0

<hr />

### Feedback 

**Endpoint**: blackboard://feedback 

**Version**: Blackboard 3.0

<hr />

### Course Overview 

**Endpoint**: blackboard://course/[course_id]/overview

**Notes**:
* [course_id] is the id of the course you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization Overview 

**Endpoint**: blackboard://org/[org_id]/overview

**Notes**:
* [org_id] is the id of the organization you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Content 

**Endpoint**: blackboard://course/[course_id]/content

**Notes**:
* [course_id] is the id of the course you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Content 

**Endpoint**: blackboard://org/[org_id]/content

**Notes**:
* [org_id] is the id of the organization you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Announcements 

**Endpoint**: blackboard://course/[course_id]/announcement

**Notes**:
* [course_id] is the id of the course you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Announcements 

**Endpoint**: blackboard://org/[org_id]/announcement

**Notes**:
* [org_id] is the id of the organization you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Calendar 

**Endpoint**: blackboard://course/[course_id]/calendar

**Notes**:
* [course_id] is the id of the course you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Calendar 

**Endpoint**: blackboard://org/[org_id]/calendar

**Notes**:
* [org_id] is the id of the organization you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Grades 

**Endpoint**: blackboard://course/[course_id]/grades

**Notes**:
* [course_id] is the id of the course you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Grades 

**Endpoint**: blackboard://org/[org_id]/grades

**Notes**:
* [org_id] is the id of the organization you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Discussion Panel 

**Endpoint**: blackboard://course/[course_id]/discussion

**Notes**:
* [course_id] is the id of the course you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Discussion Panel 

**Endpoint**: blackboard://org/[org_id]/discussion

**Notes**:
* [org_id] is the id of the organization you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Assignment/Overview 

**Endpoint**: blackboard://course/[course_id]/assessment/assignment/[assignment_id]/overview

**Notes**:
* [course_id] is the id of the course the assignment resides in 
* [assignment_id] is the id of the assignment you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Assignment/Overview 

**Endpoint**: blackboard://org/[org_id]/assessment/assignment/[assignment_id]/overview

**Notes**:
* [org_id] is the id of the organization you would like to open 
* [assignment_id] is the id of the assignment you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Assignment/Submissions 

**Endpoint**: blackboard://course/[course_id]/assessment/assignment/[assignment_id]/submissions

**Notes**:
* [course_id] is the id of the course the assignment resides in 
* [assignment_id] is the id of the assignment you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Assignment/Submissions 

**Endpoint**: blackboard://org/[org_id]/assessment/assignment/[assignment_id]/submissions

**Notes**:
* [org_id] is the id of the organization you would like to open 
* [assignment_id] is the id of the assignment you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Test/Overview 

**Endpoint**: blackboard://course/[course_id]/assessment/test/[test_id]/overview

**Notes**:
* [course_id] is the id of the course the test resides in 
* [test_id] is the id of the test you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Test/Overview 

**Endpoint**: blackboard://org/[org_id]/assessment/test/[test_id]/overview

**Notes**:
* [org_id] is the id of the course the test resides in 
* [test_id] is the id of the test you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Test/Submissions 

**Endpoint**: blackboard://course/[course_id]/assessment/test/[test_id]/submissions

**Notes**:
* [course_id] is the id of the course the test resides in 
* [test_id] is the id of the test you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Test/Submissions 

**Endpoint**: blackboard://org/[org_id]/assessment/test/[test_id]/submissions

**Notes**:
* [org_id] is the id of the course the test resides in 
* [test_id] is the id of the test you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Content Item 

**Endpoint**: blackboard://course/[course_id]/item/[item_id]

**Notes**:
* [course_id] is the id of the course the item is linked to 
* [item_id] is the id of the item you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Content Item 

**Endpoint**: blackboard://org/[org_id]/item/[item_id]

**Notes**:
* [org_id] is the id of the course the item is linked to 
* [item_id] is the id of the item you would like to open 

**Version**: Blackboard 3.2

<hr />

### Course/Content File 

**Endpoint**: blackboard://course/[course_id]/file/[file_id]

**Notes**:
* [course_id] is the id of the course the file is linked to 
* [file_id] is the id of the file you would like to open 

**Version**: Blackboard 3.0

<hr />

### Organization/Content File 

**Endpoint**: blackboard://org/[org_id]/file/[file_id]

**Notes**:
* [org_id] is the id of the course the file is linked to 
* [file_id] is the id of the file you would like to open 

**Version**: Blackboard 3.2

<hr />

### Original Course/Discussion Group 

**Endpoint**: blackboard://course/[course_id]/discussion/discussionBoard/[discussion_board_id]

**Notes**:
* [course_id] is the id of the course the discussion board is linked to 
* [discussion_board_id] is the id of the discussion board you would like to open 

**Version**: Blackboard 3.0

<hr />

### Original Organization/Discussion Group 

**Endpoint**: blackboard://org/[org_id]/discussion/discussionBoard/[discussion_board_id]

**Notes**:
* [org_id] is the id of the course the discussion board is linked to 
* [discussion_board_id] is the id of the discussion board you would like to open 

**Version**: Blackboard 3.2

<hr />

### Original Course/Discussion Thread 

**Endpoint**: blackboard://course/[course_id]/discussion/discussionThread/[discussion_thread_id]

**Notes**:
* [course_id] is the id of the course the discussion thread is linked to 
* [discussion_thread_id] is the id of the discussion thread you would like to open

**Version**: Blackboard 3.0

<hr />

### Original Organization/Discussion Thread 

**Endpoint**: blackboard://org/[org_id]/discussion/discussionThread/[discussion_thread_id]

**Notes**:
* [org_id] is the id of the course the discussion thread is linked to 
* [discussion_thread_id] is the id of the discussion thread you would like to open 

**Version**: Blackboard 3.2

<hr />

### Ultra Course/Discussion Thread 

**Endpoint**: blackboard://course/[course_id]/discussion/discussionThread/[discussion_thread_id]/discussionGroup/[discussion_group_id]/contentId/[content_id]

**Notes**:
* [course_id] is the id of the course the discussion thread is linked to 
* [discussion_thread_id] is the id of the discussion thread you would like to open 
* [discussion_group_id] is the id of a virtual discussion group the discussion thread is linked to 
* [content_id] is the content id of this discussion thread 
* _[discussion_group_id] and [content_id] are ultra course required only_ 

**Version**: Blackboard 3.0

<hr />

### Ultra Organization/Discussion Thread 

**Endpoint**: blackboard://org/[org_id]/discussion/discussionThread/[discussion_thread_id]/discussionGroup/[discussion_group_id]/contentId/[content_id]

**Notes**:
* [org_id] is the id of the course the discussion thread is linked to 
* [discussion_thread_id] is the id of the discussion thread you would like to open 
* [discussion_group_id] is the id of a virtual discussion group the discussion thread is linked to 
* [content_id] is the content id of this discussion thread 
* _[discussion_group_id] and [content_id] are ultra course required only_ 

**Version**: Blackboard 3.2

<hr />

### Ultra Course/Discussion Folder 

**Endpoint**: blackboard://course/[course_id]/discussion/discussionFolder/contentId/[content_id]

**Notes**:
* [course_id] is the id of the course the discussion folder is linked to 
* [content_id] is the content id of this discussion folder 
* _[content_id] are ultra course required only_ 

**Version**: Blackboard 3.0

<hr />

### Ultra Organization/Discussion Folder 

**Endpoint**: blackboard://org/[org_id]/discussion/discussionFolder/contentId/[content_id]

**Notes**:
* [org_id] is the id of the course the discussion folder is linked to 
* [content_id] is the content id of this discussion folder 
* _[content_id] are ultra course required only_ 

**Version**: Blackboard 3.2

<hr />

### Course/Content Folder 

**Endpoint**: blackboard://course/[course_id]/folder/[folder_id]

**Notes**:
* [course_id] is the id of the course the content folder resides in 
* [folder_id] is the folder id of the content folder 

**Version**: Blackboard 3.0

<hr />

### Organization/Content Folder 

**Endpoint**: blackboard://org/[org_id]/folder/[folder_id] 

**Notes**:
* [org_id] is the id of the course the content folder resides in
* [folder_id] is the folder id of the content folder 

**Version**: Blackboard 3.2
