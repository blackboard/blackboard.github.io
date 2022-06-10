---
layout: post
title: "Forum Events"
categories: Standards
id: caliper-events-forum
author: Scott Hurrey
---

# Forum Events

Learn's Caliper Analytics stream emits a ForumEvent to cover five
use cases:

- **User posts a non-gradable thread**
- **User posts a gradable thread**
- **User posts an assignment conversation comment**
- **User posts a non-gradable thread for group discussion**
- **User posts a group conversation comment**

Here is some of the key data that is associated with these events:

### ForumEvent - Non-Gradable Thread

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**action** - Created _**or**_ Modified _**or**_ Deleted

### ForumEvent - Gradable Thread

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.forumPointsPossible** - number of possible points

**action** - Created _**or**_ Modified _**or**_ Deleted

### ForumEvent - Assignment Conversation Comment

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.forumPointsPossible** - number of possible points

**action** - Created _**or**_ Modified _**or**_ Deleted

### ForumEvent - Non-Gradable Group Thread

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**group.subOrganizationOf** - course information

**action** - Created _**or**_ Modified _**or**_ Deleted

### ForumEvent - Group Conversation Comment

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.forumPointsPossible** - number of possible points

**group.subOrganizationOf** - course information

**action** - Created _**or**_ Modified _**or**_ Deleted

### Sample Payload

```json
{
  "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
  "sendTime": "2021-01-05T14:48:59.462Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": [
        "http://caliper.blackboard.com/ctx/caliper/v1/Context",
        "http://purl.imsglobal.org/ctx/caliper/v1p1"
      ],
      "type": "http://caliper.blackboard.com/caliper/v1/ForumEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/9eda44a94869439d8dd77496de1db568",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        }
      },
      "action": "Created",
      "object": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/Forum",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/discussion/_12345_1",
        "name": "Placeholder 2",
        "description": "",
        "threadPointsPossible": 20,
        "dueDate": "2021-01-12T06:59:00.000Z",
        "isDiscussion": true,
        "contentId": "_12345_1",
        "extensions": {}
      },
      "generated": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/ForumPost",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/discussion/_12345_1/post/_12345_1",
        "name": "",
        "description": "",
        "parentId": "_12345_1",
        "threadId": "_12345_1",
        "fileAttached": false,
        "length": 1468,
        "anonymous": false,
        "firstPost": false,
        "extensions": {}
      },
      "eventTime": "2021-01-05T14:48:52.852Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/1b5fe13ea75b4e9f97f23da85600b6f7/members/9eda44a94869439d8dd77496de1db568",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/9eda44a94869439d8dd77496de1db568",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/1b5fe13ea75b4e9f97f23da85600b6f7",
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
        "startedAtTime": "2021-01-05T14:48:52.852Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/85A3CA3571288387778479A527A9D478",
        "type": "LtiSession",
        "name": "85A3CA3571288387778479A527A9D478",
        "dateCreated": "2021-01-05T14:48:52.852Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/9eda44a94869439d8dd77496de1db568",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        }
      },
      "extensions": {},
      "session": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/85A3CA3571288387778479A527A9D478",
        "type": "Session"
      }
    },
    {
      "@context": [
        "http://caliper.blackboard.com/ctx/caliper/v1/Context",
        "http://purl.imsglobal.org/ctx/caliper/v1p1"
      ],
      "type": "http://caliper.blackboard.com/caliper/v1/ForumEvent",
      "id": "5c7a2f72-6806-49c3-8bb2-0677df17f7a8",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/9eda44a94869439d8dd77496de1db568",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        }
      },
      "action": "Modified",
      "object": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/Forum",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/discussion/_12345_1",
        "name": "Placeholder 2",
        "description": "",
        "threadPointsPossible": 20,
        "dueDate": "2021-01-12T06:59:00.000Z",
        "isDiscussion": true,
        "contentId": "_12345_1",
        "extensions": {}
      },
      "generated": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/ForumPost",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/discussion/_12345_1/post/_12345_1",
        "name": "",
        "description": "",
        "parentId": "_12345_1",
        "threadId": "_12345_1",
        "fileAttached": false,
        "length": 1474,
        "anonymous": false,
        "firstPost": false,
        "extensions": {}
      },
      "eventTime": "2021-01-05T14:48:52.852Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/1b5fe13ea75b4e9f97f23da85600b6f7/members/9eda44a94869439d8dd77496de1db568",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/9eda44a94869439d8dd77496de1db568",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/1b5fe13ea75b4e9f97f23da85600b6f7",
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
        "startedAtTime": "2021-01-05T14:48:52.852Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/85A3CA3571288387778479A527A9D478",
        "type": "LtiSession",
        "name": "85A3CA3571288387778479A527A9D478",
        "dateCreated": "2021-01-05T14:48:52.852Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/9eda44a94869439d8dd77496de1db568",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        }
      },
      "extensions": {},
      "session": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/85A3CA3571288387778479A527A9D478",
        "type": "Session"
      }
    }
  ]
}
```
