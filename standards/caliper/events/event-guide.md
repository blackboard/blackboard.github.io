---
layout: post
title: "Blackboard Caliper Event Guide" 
categories: Standards
id: standards-caliper-events-guide
author: Scott Hurrey
---

# Blackboard Caliper Event Guide

This document contains a map of the Caliper events emitted by Blackboard
Learn. If you are interested in learning more about Moodle's Caliper
implementation, please visit the [Moodle Documentation](https://docs.moodle.org/dev/Caliper).

### SessionEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Log In | All Users | Immediately |
| Log Out | All Users | Immediately |
| Session Time Out | All Users | Immediately |

For more information, see [Session Events](session-events).

### ViewEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Click Content File Link | All Users | Immediately |
| Click External Link | All Users | Immediately |
| Click Assignment Link | All Users | Immediately |
| Click Discussion Link | All Users | Immediately |

For more information, see [View Events](view-events).

### LTIEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Click LTI Link | All Users | Immediately |
| Return from LTI Link | All Users | Immediately |

For more information, see [LTI Events](lti-events).

### AssignableEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Start an Assignment | Student | Immediately |
| Start a Group Assignment | Student | Immediately |
| Submit an Assignment | Student | Immediately |
| Submit a Group Assignment | Student | Immediately|

For more information, see [Assignable Events](assignable-events).

### AssessmentEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Start a Test | Student | Immediately |
| Submit a Test | Student | Immediately |

For more information, see [Assessment Events](assessment-events).

### AssessmentItemEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Start a Test Question | Student | Immediately |
| Submit a Test Question | Student | Immediately |

For more information see, [Assessment Events](assessment-events).

### ForumEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Create a Discussion Thread Top Message | Instructor | Immediately |
| Update Discussion Thread Name, Points Possible, or Message | Instructor | Immediately |
| Delete a Discussion Thread Top Message | Instructor | Immediately |
| Post a Thread | All Users | Immediately |
| Save a Thread as Draft | All Users | Immediately |
| Post an Assignment Conversation Comment | All Users | Immediately |
| Post a Group Thread | All Users | Immediately |
| Post a Group Conversation Comment | All Users | Immediately |
| Delete a Message | Instructor | Immediately |

For more information, see [Forum Events](forum-events).

### GradeEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Submit an Assignment | Student | Immediately |
| Submit a Group Assignment | Student | Immediately |
| Submit a Test | Student | Immediately |
| Enter Grade, Comments, or Feedback | Instructor | Nightly |
| Update Feedback | All Users | Nightly |
| Post a Manual Grade | Instructor | Nightly |
| Override a Grade | Instructor | Nightly |
| Clear an Overridden Grade | Instructor | Nightly |
| Delete an Attempt | Instructor | Nightly |

For more information, see [Grade Events](grade-events).

### CalculatedGradeSnapshotEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Trigger Calculated Grade Re-Calculation | Instructor | Nightly |

For more information, see [Calculated Grade Snapshot Events](calculated-grade-snapshot-events).

### ContentEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Create or Delete Folder | Instructor | Immediately |
| Update Folder: Name, Description, Availability, Show Dates, Hide Dates | Instructor | Immediately |
| Create or Delete Link | Instructor | Immediately |
| Update Link: Name, URL, Description, Availability, Show Dates, Hide Dates | Instructor | Immediately |
| Create or Delete LTI | Instructor | Immediately |
| Update LTI: Name, URL, Description, Parameters, Availability, Points Possible,Due Date, Show Dates, Hide Dates | Instructor | Immediately |
| Create or Delete Assignment | Instructor | Immediately |
| Update Assignment: Name, Availability, Points Possible, Due Date, Show Dates, Hide Dates, Instructions, Attempts Allowed, Scoring Method | Instructor | Immediately |
| Create or Delete Discussion Forum Link | Instructor | Immediately |
| Update Discussion Forum Link: Name, Availability, Due Date, Show Dates, Hide Dates | Instructor | Immediately |
| Create or Delete Content File (Upload) | Instructor | Immediately |
| Update Content File (Upload): Name, Availability, Show Dates, Hide Dates, Instructions | Instructor | Immediately |
| Create or Delete Test | Instructor | Immediately |
| Update Test: Name, Availability, Points Possible, Due Date, Show Dates, Hide Dates, Instructions, Attempts Allowed, Scoring Method | Instructor | Immediately |
| Create or Delete Document | Instructor | Immediately |
| Update Document: Name, Availability, Show Dates, Hide Dates, Instructions | Instructor | Immediately |
| Create or Delete Document File | Instructor | Immediately |
| Update Document File: Name, Availability, Show Dates, Hide Dates, Instructions | Instructor | Immediately |
| Add Questions to Assignment or Test | Instructor | Immediately |

For more information, see [Content Events](content-events).

### CourseGroupEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Create or Delete Group | Instructor | Immediately |
| Update Group: Assignment, Discussion Forum, or Test | Instructor | Immediately |

For more information, see [Course Group Events](course-group-events).

### BlogEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Post a Blog Entry in an Original Experience Course | Student | Immediately |

For more information, see [Blog Events](blog-events).

### WikiEvent

| Action | Actor | When |
| ------ | ----- | ---- |
| Post to a Wiki in an Original Experience Course | Student | Immediately |

For more information, see [Wiki Events](wiki-events).

