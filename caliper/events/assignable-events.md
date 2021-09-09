---
layout: post
title: "Assignable Events"
categories: Standards
id: caliper-events-assignables
author: Scott Hurrey
---

# Assignable Events

Blackboard Learn's Caliper Analytics stream emits an AssignableEvent in four
cases:

- **A student starts an assignment**
- **A student submits an assignment**
- **A student starts a group assignment**
- **A student submits a group assignment**

Here is some of the key data that is associated with these events:

### AssignableEvent - Assignment

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/gradableItems/id - the primary key for the content ID

**action** - Started, Submitted, Completed

### AssignableEvent - Group Assignment

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/gradableItems/id - the primary key for the content ID

**extensions.bb:group.users** - an array of users in the group. The batchUId field will contain the batch_uid for the user

**action** - Started, Submitted, Completed

For a completed group assignment, the course information is located one level
lower in group.subOrganizationOf

## Sample Payload

```json
{
  "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
  "sendTime": "2021-01-05T14:51:22.739Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
      "type": "AssignableEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/47fe55cef30441458b7625885e8aee83",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        }
      },
      "action": "Completed",
      "object": {
        "dateToSubmit": "2021-01-12T06:59:00.000Z",
        "maxAttempts": 0,
        "maxSubmits": 0,
        "maxScore": 60,
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1",
        "type": "AssignableDigitalResource",
        "name": "My Assignable Item",
        "creators": [],
        "learningObjectives": [],
        "keywords": []
      },
      "generated": {
        "startedAtTime": "2021-01-05T14:51:14.512Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1/attempts/_12345_1",
        "type": "Attempt",
        "assignable": {
          "dateToSubmit": "2021-01-12T06:59:00.000Z",
          "maxAttempts": 0,
          "maxSubmits": 0,
          "maxScore": 60,
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1",
          "type": "AssignableDigitalResource",
          "name": "My Assignable Item",
          "creators": [],
          "learningObjectives": [],
          "keywords": []
        },
        "assignee": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/47fe55cef30441458b7625885e8aee83",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "count": 1
      },
      "eventTime": "2021-01-05T14:51:14.512Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "group": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/22fb6a3e811f4bad8a418dcb2caa0a85",
        "type": "CourseOffering",
        "extensions": {
          "bb:course.id": "_12345_1"
        },
        "members": [],
        "courseNumber": "BIO-101"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/22fb6a3e811f4bad8a418dcb2caa0a85/members/47fe55cef30441458b7625885e8aee83",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/47fe55cef30441458b7625885e8aee83",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/22fb6a3e811f4bad8a418dcb2caa0a85",
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
      "federatedSession": {
        "startedAtTime": "2021-01-05T14:51:14.512Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/",
        "type": "LtiSession",
        "name": "",
        "dateCreated": "2021-01-05T14:51:14.512Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/47fe55cef30441458b7625885e8aee83",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        }
      },
      "extensions": {}
    }
  ]
}
```
