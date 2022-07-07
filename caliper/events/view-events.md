---
layout: post
title: "View Events"
categories: Standards
id: caliper-events-views
author: Scott Hurrey
---

# View Events

Learn's Caliper Analytics stream sends ViewEvent messages to cover
four use cases:

- **User clicks on an assignment link**
- **User clicks on an external link**
- **User clicks on a discussion board link**
- **User clicks on a content file link**

Here is some of the key data that is associated with all ViewEvents:

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/content/id - the primary key for the content ID

**action** - Viewed

### Example Payload

```json
{
  "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "type": "ViewEvent",
  "id": "788e0326-c12c-4c23-be39-27b446992b79",
  "actor": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
    "type": "Person",
    "extensions": {
      "bb:user.id": "_1_1",
      "bb:user.externalId": "administrator"
    }
  },
  "action": "Viewed",
  "object": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/unknown/unknown",
    "type": "Chapter",
    "creators": [],
    "learningObjectives": [],
    "keywords": [],
    "index": 0
  },
  "target": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/unknown/unknown",
    "type": "Chapter",
    "creators": [],
    "learningObjectives": [],
    "keywords": [],
    "index": 0
  },
  "eventTime": "2020-12-24T21:04:41.359Z",
  "edApp": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/applications/learn",
    "type": "SoftwareApplication",
    "extensions": {}
  },
  "group": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/courses/875ab28d354e444a81784e58e44a60b2",
    "type": "CourseOffering",
    "extensions": {
      "bb:course.id": "_1358_1"
    },
    "members": [],
    "courseNumber": "04650987_bbtest_ignore"
  },
  "membership": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/courses/875ab28d354e444a81784e58e44a60b2/members/ffc08009f0884c059192bac549e117b2",
    "type": "Membership",
    "extensions": {
      "bb:course.id": "_1358_1",
      "bb:course.externalId": "04650987_bbtest_ignore",
      "bb:user.id": "_1_1",
      "bb:user.externalId": "administrator"
    },
    "member": {
      "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
      "type": "Person",
      "extensions": {
        "bb:user.id": "_1_1",
        "bb:user.externalId": "administrator"
      }
    },
    "organization": {
      "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/courses/875ab28d354e444a81784e58e44a60b2",
      "type": "CourseOffering",
      "extensions": {
        "bb:course.id": "_1358_1"
      },
      "members": [],
      "courseNumber": "04650987_bbtest_ignore"
    },
    "roles": ["Instructor"],
    "status": "Active"
  },
  "federatedSession": {
    "startedAtTime": "2020-12-24T21:04:41.359Z",
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/sessions/0D8663C4ABF729F1B7B9CA8B93A5AE0D",
    "type": "LtiSession",
    "name": "0D8663C4ABF729F1B7B9CA8B93A5AE0D",
    "dateCreated": "2020-12-24T21:04:41.359Z",
    "user": {
      "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
      "type": "Person",
      "extensions": {
        "bb:user.id": "_1_1",
        "bb:user.externalId": "administrator"
      }
    }
  },
  "extensions": {}
}
```
