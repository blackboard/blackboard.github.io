# Blackboard App for Students Launch Schema
*Author: Scott Hurrey*
*Categories: []*
*Tags: ['developer', 'mobile', 'bbstudent', 'blackboard mobile', 'app-to-app', 'custom url']*
---
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

FeatureSchemaDescriptionsRelease

Activity Stream

bbstudent://activity (To Be Deprecated)

blackboard://activity

Bb Student 2.5

Blackboard 3.0

Course Base

bbstudent://courses (To Be Deprecated)

blackboard://courses

Bb Student 2.5

Blackboard 3.0

Organization Base

blackboard://org

Blackboard 3.2

Grades

bbstudent://grades (To Be Deprecated)

blackboard://grades

Bb Student 2.5

Blackboard 3.0

Due Dates

bbstudent://calendar (To Be Deprecated)

blackboard://calendar

Bb Student 2.5

Blackboard 3.0

Profile

bbstudent://profile (To Be Deprecated)

blackboard://profile

Bb Student 2.5

Blackboard 3.0

Settings

bbstudent://settings (To Be Deprecated)

blackboard://settings

Bb Student 2.5

Blackboard 3.0

Linked Accounts

bbstudent://settings/linkedAccounts (To Be Deprecated)

blackboard://settings/linkedAccounts

Bb Student 2.5

Blackboard 3.0

Feedback

bbstudent://feedback (To Be Deprecated)

blackboard://feedback

Bb Student 2.5

Blackboard 3.0

Course Outline

bbstudent://course/[course_id]/outline (To Be Deprecated)

[course_id] is the id of the course you would like to open

Bb Student 2.5

Blackboard 3.0

Course Overview

blackboard://course/[course_id]/overview

[course_id] is the id of the course you would like to open

Blackboard 3.0

Organisation Overview

blackboard://org/[org_id]/overview

[org_id] is the id of the organization you would like to open

Blackboard 3.2

Course/Content

blackboard://course/[course_id]/content

[course_id] is the id of the course you would like to open

Blackboard 3.0

Organization/Content

blackboard://org/[org_id]/content

[org_id] is the id of the organization you would like to open

Blackboard 3.2

Course/Announcements

blackboard://course/[course_id]/announcement

[course_id] is the id of the course you would like to open

Blackboard 3.0

Organization/Announcements

blackboard://org/[org_id]/announcement

[org_id] is the id of the organization you would like to open

Blackboard 3.2

Course/Calendar

blackboard://course/[course_id]/calendar

[course_id] is the id of the course you would like to open

Blackboard 3.0

Organization/Calendar

blackboard://org/[org_id]/calendar

[org_id] is the id of the organization you would like to open

Blackboard 3.2

Course/Grades

bbstudent://course/[course_id]/grades (To Be Deprecated)

blackboard://course/[course_id]/grades

[course_id] is the id of the course you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Grades

blackboard://org/[org_id]/grades

[org_id] is the id of the organization you would like to open

Blackboard 3.2

Course/Discussion Panel

bbstudent://course/[course_id]/discussion (To Be Deprecated)

blackboard://course/[course_id]/discussion

[course_id] is the id of the course you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Discussion Panel

blackboard://org/[org_id]/discussion

[org_id] is the id of the organization you would like to open

Blackboard 3.2

Course/Assignment/Overview

bbstudent://course/[course_id]/assessment/assignment/[assignment_id]/overview
(To Be Deprecated)

blackboard://course/[course_id]/assessment/assignment/[assignment_id]/overview

[course_id] is the id of the course the assignment resides in

[assignment_id] is the id of the assignment you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Assignment/Overview

blackboard://org/[org_id]/assessment/assignment/[assignment_id]/overview

[org_id] is the id of the organization you would like to open

[assignment_id] is the id of the assignment you would like to open

Blackboard 3.2

Course/Assignment/Submissions

bbstudent://course/[course_id]/assessment/assignment/[assignment_id]/submissio
ns (To Be Deprecated)

blackboard://course/[course_id]/assessment/assignment/[assignment_id]/submissi
ons

[course_id] is the id of the course the assignment resides in

[assignment_id] is the id of the assignment you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Assignment/Submissions

blackboard://org/[org_id]/assessment/assignment/[assignment_id]/submissions

[org_id] is the id of the organization you would like to open

[assignment_id] is the id of the assignment you would like to open

Blackboard 3.2

Course/Test/Overview

bbstudent://course/[course_id]/assessment/test/[test_id]/overview (To Be
Deprecated)

blackboard://course/[course_id]/assessment/test/[test_id]/overview

[course_id] is the id of the course the test resides in

[test_id] is the id of the test you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Test/Overview

://org/[org_id]/assessment/test/[test_id]/overview

[org_id] is the id of the course the test resides in

[test_id] is the id of the test you would like to open

Blackboard 3.2

Course/Test/Submissions

bbstudent://course/[course_id]/assessment/test/[test_id]/submissions (To Be
Deprecated)

blackboard://course/[course_id]/assessment/test/[test_id]/submissions

[course_id] is the id of the course the test resides in

[test_id] is the id of the test you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Test/Submissions

blackboard://org/[org_id]/assessment/test/[test_id]/submissions

[org_id] is the id of the course the test resides in

[test_id] is the id of the test you would like to open

Blackboard 3.2

Course/Content Item

bbstudent://course/[course_id]/item/[item_id] (To Be Deprecated)

blackboard://course/[course_id]/item/[item_id]

[course_id] is the id of the course the item is linked to

[item_id] is the id of the item you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Content Item

blackboard://org/[org_id]/item/[item_id]

[org_id] is the id of the course the item is linked to

[item_id] is the id of the item you would like to open

Blackboard 3.2

Course/Content File

bbstudent://course/[course_id]/file/[file_id] (To Be Deprecated)

blackboard://course/[course_id]/file/[file_id]

[course_id] is the id of the course the file is linked to

[file_id] is the id of the file you would like to open

Bb Student 2.5

Blackboard 3.0

Organization/Content File

blackboard://org/[org_id]/file/[file_id]

[org_id] is the id of the course the file is linked to

[file_id] is the id of the file you would like to open

Blackboard 3.2

Enterprise learn course/Discussion Group

bbstudent://course/[course_id]/discussion/discussionBoard/[discussion_board_id
] (To Be Deprecated)

blackboard://course/[course_id]/discussion/discussionBoard/[discussion_board_i
d]

[course_id] is the id of the course the discussion board is linked to

[discussion_board_id] is the id of the discussion board you would like to open

Bb Student 2.5

Blackboard 3.0

Enterprise learn Organisation/Discussion Group

blackboard://org/[org_id]/discussion/discussionBoard/[discussion_board_id]

[org_id] is the id of the course the discussion board is linked to

[discussion_board_id] is the id of the discussion board you would like to open

Blackboard 3.2

Enterprise learn course/Discussion Thread

bbstudent://course/[course_id]/discussion/discussionThread/[discussion_thread_
id] (To Be Deprecated)

blackboard://course/[course_id]/discussion/discussionThread/[discussion_thread
_id]

[course_id] is the id of the course the discussion thread is linked to

[discussion_thread_id] is the id of the discussion thread you would like to
open

Bb Student 2.5

Blackboard 3.0

Enterprise learn Organisation/Discussion Thread

blackboard://org/[org_id]/discussion/discussionThread/[discussion_thread_id]

[org_id] is the id of the course the discussion thread is linked to

[discussion_thread_id] is the id of the discussion thread you would like to
open

Blackboard 3.2

Ultra course/Discussion Thread

bbstudent://course/[course_id]/discussion/discussionThread/[discussion_thread_
id]/discussionGroup/[discussion_group_id]/contentId/[content_id] (To Be
Deprecated)

blackboard://course/[course_id]/discussion/discussionThread/[discussion_thread
_id]/discussionGroup/[discussion_group_id]/contentId/[content_id]

[course_id] is the id of the course the discussion thread is linked to

[discussion_thread_id] is the id of the discussion thread you would like to
open

[discussion_group_id] is the id of a virtual discussion group the discussion
thread is linked to

[content_id] is the content id of this discussion thread

**Note:** [discussion_group_id] and [content_id] are ultra course required only

Bb Student 2.5

Blackboard 3.0

Ultra Organisation/Discussion Thread

blackboard://org/[org_id]/discussion/discussionThread/[discussion_thread_id]/d
iscussionGroup/[discussion_group_id]/contentId/[content_id]

[org_id] is the id of the course the discussion thread is linked to

[discussion_thread_id] is the id of the discussion thread you would like to
open

[discussion_group_id] is the id of a virtual discussion group the discussion
thread is linked to

[content_id] is the content id of this discussion thread

**Note:** [discussion_group_id] and [content_id] are ultra course required only

Blackboard 3.2

Ultra course/Discussion Folder

bbstudent://course/[course_id]/discussion/discussionFolder/contentId/[content_
id] (To Be Deprecated)

blackboard://course/[course_id]/discussion/discussionFolder/contentId/[content
_id]

[course_id] is the id of the course the discussion folder is linked to

[content_id] is the content id of this discussion folder

**Note:** [content_id] are ultra course required only

Bb Student 2.6

Blackboard 3.0

Ultra Organisation/Discussion Folder

blackboard://org/[org_id]/discussion/discussionFolder/contentId/[content_id]

[org_id] is the id of the course the discussion folder is linked to

[content_id] is the content id of this discussion folder

**Note:** [content_id] are ultra course required only

Blackboard 3.2

Course/Content Folder

bbstudent://course/[course_id]/folder/[folder_id] (To Be Deprecated)

blackboard://course/[course_id]/folder/[folder_id]

[course_id] is the id of the course the content folder resides in

[folder_id] is the folder id of the content folder

Bb Student 2.6

Blackboard 3.0

Organisation/Content Folder

blackboard://org/[org_id]/folder/[folder_id]

[org_id] is the id of the course the content folder resides in

[folder_id] is the folder id of the content folder

Blackboard 3.2

