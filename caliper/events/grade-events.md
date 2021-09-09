---
layout: post
title: "Grade Events"
categories: Standards
id: caliper-events-grade_events
author: Scott Hurrey
---

# Grade Events

Blackboard Learn's Caliper Analytics stream emits a GradeEvent to cover the
following use cases:

- **Student submits an assignment, a group assignment, or a test**
- **Instructor enters a grade, comments, or feedback**
- **Any user updates feedback**
- **Instructor posts a manual grade**
- **Instructor overrides a grade**
- **Instructor clears an overridden grade**
- **Instructor deletes an attempt**

GradeEvents are sent in bulk nightly. Here is some of the key data that is
associated with these events:

### GradeEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.assignable** - …/gradableItems/id - the primary key for the content ID

**action** - Graded

**actor.id** - contains a unique ID of the user (the ID is known to Bb)

**generated.normalScore** - score provided

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

### Sample Payload

Here is a sample of what a workflow might look like:

```json
{
  "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
  "sendTime": "2021-01-05T07:55:48.048Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
      "type": "GradeEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "action": "Graded",
      "object": {
        "startedAtTime": "2021-01-04T12:57:55.941Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1/attempts/_12345_1",
        "type": "Attempt",
        "assignable": {
          "dateToSubmit": "2021-01-04T12:57:55.941Z",
          "maxAttempts": 0,
          "maxSubmits": 0,
          "maxScore": 160,
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1",
          "type": "Assessment",
          "dateCreated": "2021-01-04T12:57:55.941Z",
          "dateModified": "2021-01-04T12:59:47.248Z",
          "creators": [],
          "learningObjectives": [],
          "keywords": [],
          "items": []
        },
        "assignee": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/0e9625cdef42403c9c8aed38d7cd80b2",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "count": 1
      },
      "generated": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1/attempts/_12345_1/score",
        "type": "Score",
        "dateCreated": "2021-01-04T12:59:47.248Z",
        "dateModified": "2021-01-04T12:59:47.248Z",
        "extensions": {
          "bb:action.name": "instructor.grade.history.event.attempt.grade",
          "bb:content.id": "_12345_1",
          "bb:provider.domain": "lti.mytool.com"
        },
        "attempt": {
          "startedAtTime": "2021-01-04T12:57:55.941Z",
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1/attempts/_12345_1",
          "type": "Attempt",
          "assignable": {
            "dateToSubmit": "2021-01-04T12:57:55.941Z",
            "maxAttempts": 0,
            "maxSubmits": 0,
            "maxScore": 160,
            "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1",
            "type": "Assessment",
            "dateCreated": "2021-01-04T12:57:55.941Z",
            "dateModified": "2021-01-04T12:59:47.248Z",
            "creators": [],
            "learningObjectives": [],
            "keywords": [],
            "items": []
          },
          "assignee": {
            "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/0e9625cdef42403c9c8aed38d7cd80b2",
            "type": "Person",
            "extensions": {
              "bb:user.id": "_12345_1",
              "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
            }
          },
          "count": 1
        },
        "maxScore": 0,
        "scoreGiven": 39.45205,
        "scoredBy": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
          "type": "SoftwareApplication"
        }
      },
      "eventTime": "2021-01-04T12:59:47.248Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "group": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/6d0140f42843472da7e3ecd150908fa3",
        "type": "CourseOffering",
        "extensions": {
          "bb:course.id": "_12345_1"
        },
        "members": [],
        "courseNumber": "BIO-101"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/6d0140f42843472da7e3ecd150908fa3/members/0e9625cdef42403c9c8aed38d7cd80b2",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/0e9625cdef42403c9c8aed38d7cd80b2",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/6d0140f42843472da7e3ecd150908fa3",
          "type": "CourseOffering",
          "extensions": {
            "bb:course.id": "_12345_1"
          },
          "members": [],
          "courseNumber": "BIO-101"
        },
        "roles": ["Learner"],
        "status": "Active"
      },
      "extensions": {}
    }
  ]
}
```
