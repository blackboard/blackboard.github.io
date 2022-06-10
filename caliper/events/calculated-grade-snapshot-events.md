---
layout: post
title: "Calculated Grade Snapshot Events"
categories: Standards
id: caliper-events-calculated_grade_snapshots
author: Scott Hurrey
---

# Calculated Grade Snapshot Events

Learn's Caliper Analytics stream emits a CalculatedGradeSnapshotEvent nightly for any grade that is recalculated.

Here is some of the key data that is associated with these events:

### CalculatedGradeSnapshotEvent

**object.course.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.itemId** - the primary key for the calculated grade column

**user.id** - contains a unique ID of the user (the ID is known to Bb)

**object.score** - score provided

**object.isCourseGrade** - true if final grade

**user.extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

**action** - Graded

### Sample Payload

Here is a sample of what a payload might look like:

```json
{
  "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
  "sendTime": "2021-01-05T08:20:38.600Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": [
        "http://caliper.blackboard.com/ctx/caliper/v1/Context",
        "http://purl.imsglobal.org/ctx/caliper/v1p1"
      ],
      "type": "http://caliper.blackboard.com/caliper/v1/CalculatedGradeSnapshotEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "action": "Graded",
      "object": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/CalculatedGrade",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1/calculatedGrade/329189703",
        "name": "",
        "description": "",
        "itemId": "_12345_1",
        "scorePossible": 100,
        "isCourseGrade": false,
        "syncVersion": 329189703,
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/b1ea2fccd95144a29e5e906034e4ddee",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "course": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/ab336626104044daab61e9a9d72ac8e2",
          "type": "CourseOffering",
          "extensions": {
            "bb:course.id": "_12345_1"
          },
          "members": [],
          "courseNumber": "BIO-101"
        },
        "extensions": {}
      },
      "eventTime": "2021-01-05T08:20:33.572Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/ab336626104044daab61e9a9d72ac8e2/members/b1ea2fccd95144a29e5e906034e4ddee",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/b1ea2fccd95144a29e5e906034e4ddee",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/ab336626104044daab61e9a9d72ac8e2",
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
