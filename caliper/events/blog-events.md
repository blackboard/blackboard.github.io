---
layout: post
title: "Blog Events"
categories: Standards
id: caliper-events-blogs
author: Scott Hurrey
---

# Blog Events

Blackboard Learn's Caliper Analytics stream emits a BlogEvent whenever a
student submits a blog entry in an original experience course. Here is some of
the key data that is associated with these events:

### BlogEvent

**object.id** - the primary key for the Blog

**action** - Created, Modified, Commented

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

### Sample Payload

Here is a sample of what an event payload might look like:

```json
{
  "sensor": "530efc49-6b9f-40a6-918b-966ee83a744c",
  "sendTime": "2021-01-05T16:55:05.235Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": [
        "http://caliper.blackboard.com/ctx/caliper/v1/Context",
        "http://purl.imsglobal.org/ctx/caliper/v1p1"
      ],
      "type": "http://caliper.blackboard.com/caliper/v1/BlogEvent",
      "id": "a6fa63b8-9db7-44f8-aff8-63b94b952ead",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/users/9c60a9cdb3144d1aa77ff56c34ef248b",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_227_1",
          "bb:user.externalId": "scott.hurrey@myschool.edu"
        }
      },
      "action": "Created",
      "object": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/Blog",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/blog/_39_1",
        "name": "Test Blog",
        "description": "",
        "blogType": "INDIVIDUAL",
        "journal": false,
        "pointsPossible": 100,
        "extensions": {}
      },
      "generated": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/BlogPost",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/blog/_39_1/post/_40_1",
        "name": "",
        "description": "",
        "anonymous": false,
        "attachedFilesCount": 0,
        "length": 51,
        "extensions": {}
      },
      "eventTime": "2021-01-05T16:55:03.225Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/applications/learn",
        "type": "SoftwareApplication"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/courses/e9c09e39c7844ae3b2ed677ac4fd90d7/members/9c60a9cdb3144d1aa77ff56c34ef248b",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_124_1",
          "bb:course.externalId": "og-101",
          "bb:user.id": "_227_1",
          "bb:user.externalId": "scott.hurrey@myschool.edu"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/users/9c60a9cdb3144d1aa77ff56c34ef248b",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_227_1",
            "bb:user.externalId": "scott.hurrey@myschool.edu"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/courses/e9c09e39c7844ae3b2ed677ac4fd90d7",
          "type": "CourseOffering",
          "extensions": {
            "bb:course.id": "_124_1"
          },
          "members": [],
          "courseNumber": "og-101"
        },
        "roles": ["Learner"],
        "status": "Active"
      },
      "federatedSession": {
        "startedAtTime": "2021-01-05T16:55:03.225Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/sessions/5118E091FCBDF29709BBD9D6F6758679",
        "type": "LtiSession",
        "name": "5118E091FCBDF29709BBD9D6F6758679",
        "dateCreated": "2021-01-05T16:55:03.225Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/users/9c60a9cdb3144d1aa77ff56c34ef248b",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_227_1",
            "bb:user.externalId": "scott.hurrey@myschool.edu"
          }
        }
      },
      "extensions": {},
      "session": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/sessions/5118E091FCBDF29709BBD9D6F6758679",
        "type": "Session"
      }
    }
  ]
}
```
