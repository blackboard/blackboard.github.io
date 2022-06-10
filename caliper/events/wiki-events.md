---
layout: post
title: "Wiki Events"
categories: Standards
id: caliper-events-wikis
author: Scott Hurrey
---

# Wiki Events

Learn's Caliper Analytics stream emits a WikiEvent whenever a
student posts to a wiki in an original experience course. Here is some of the
key data that is associated with these events:

### WikiEvent

**object.wikiId** - the primary key for the wiki

**action** - Created, Modified, Commented

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

### Sample Payload

Here is a sample of what an event payload might look like:

```json
{
  "sensor": "530efc49-6b9f-40a6-918b-966ee83a744c",
  "sendTime": "2021-01-05T16:58:53.778Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": [
        "http://caliper.blackboard.com/ctx/caliper/v1/Context",
        "http://purl.imsglobal.org/ctx/caliper/v1p1"
      ],
      "type": "http://caliper.blackboard.com/caliper/v1/WikiEvent",
      "id": "1162c8d4-c3f8-446f-a08a-c673e2a2eaf2",
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
        "type": "http://caliper.blackboard.com/caliper/v1/WikiPage",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/wiki/7cdeb8248ba84ec3a6f859973fb7764c",
        "name": "Second Wiki Post",
        "description": "",
        "wikiId": "_36_1",
        "wikiName": "Test Wiki",
        "pointsPossible": 100,
        "extensions": {}
      },
      "generated": {
        "@context": [
          "http://caliper.blackboard.com/ctx/caliper/v1/Context",
          "http://purl.imsglobal.org/ctx/caliper/v1p1"
        ],
        "type": "http://caliper.blackboard.com/caliper/v1/WikiPost",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/wiki/7cdeb8248ba84ec3a6f859973fb7764c/post/AXbTfLPSgpyqar8j43GB",
        "name": "",
        "description": "",
        "totalWordCount": 17,
        "extensions": {}
      },
      "eventTime": "2021-01-05T16:58:42.126Z",
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
        "startedAtTime": "2021-01-05T16:58:42.126Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/530efc49-6b9f-40a6-918b-966ee83a744c/sessions/5118E091FCBDF29709BBD9D6F6758679",
        "type": "LtiSession",
        "name": "5118E091FCBDF29709BBD9D6F6758679",
        "dateCreated": "2021-01-05T16:58:42.126Z",
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
