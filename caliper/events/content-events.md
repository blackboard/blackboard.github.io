---
layout: post
title: "Content Events"
categories: Standards
id: caliper-events-content_events
author: Scott Hurrey
---

# Content Events

Learn's Caliper Analytics stream emits a ContentEvent to cover a
plethora of use cases. Here is when a message will be sent:

### Content Item Created

| Object              |            Message Sent            |
| ------------------- | :--------------------------------: |
| Folder              | <i class="material-icons">done</i> |
| Link                | <i class="material-icons">done</i> |
| LTI                 | <i class="material-icons">done</i> |
| Assignment          | <i class="material-icons">done</i> |
| Forum               | <i class="material-icons">done</i> |
| Content File Upload | <i class="material-icons">done</i> |
| Test                | <i class="material-icons">done</i> |
| Document            | <i class="material-icons">done</i> |
| File Upload         | <i class="material-icons">done</i> |

### Content Item Updated (by member value)

The columns contain attributes of the Content Item.

**Legend**

<i class="material-icons">done</i> - Changing this value emits a caliper event<br />
<i class="material-icons">close</i> - Changing this value does not emit a caliper event<br />
<i class="material-icons">remove</i> - This value is not applicable for this attribute<br />
<i class="material-icons">radio_button_unchecked</i> - This results in a ForumEvent<br />

| Object              | Name                                 | URL                                    | Des                                    | Avl                                  | Parm                                   | Score                                  | Due Date                               | Start Date                           | End Date                             | Disc                                                   | Grp                                    | Inst                                   | Qs                                     |
| ------------------- | ------------------------------------ | -------------------------------------- | -------------------------------------- | ------------------------------------ | -------------------------------------- | -------------------------------------- | -------------------------------------- | ------------------------------------ | ------------------------------------ | ------------------------------------------------------ | -------------------------------------- | -------------------------------------- | -------------------------------------- |
| Folder              | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">close</i>                  | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> |                                        |
| Link                | <i   class="material-icons">done</i> | <i   class="material-icons">done</i>   | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">close</i>                  | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> |                                        |
| LTI                 | <i   class="material-icons">done</i> | <i   class="material-icons">done</i>   | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">done</i>   | <i   class="material-icons">close</i>  | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">radio_button_unchecked</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> |
| Assignment          | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">close</i>  | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">radio_button_unchecked</i> | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i>   | <i   class="material-icons">remove</i> |
| Forum               | <i class="material-icons">done</i>   | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">close</i>  | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">close</i>                  | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> |
| Content File Upload | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">close</i>                  | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i>   | <i   class="material-icons">remove</i> |
| Test                | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">close</i>  | <i   class="material-icons">close</i>  | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">radio_button_unchecked</i> | <i   class="material-icons">close</i>  | <i   class="material-icons">close</i>  | <i   class="material-icons">close</i>  |
| Document            | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">close</i>                  | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i>   | <i   class="material-icons">remove</i> |
| File Upload         | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i> | <i   class="material-icons">done</i> | <i   class="material-icons">close</i>                  | <i   class="material-icons">remove</i> | <i   class="material-icons">done</i>   | <i   class="material-icons">remove</i> |

{: .striped}

### Content Item Deleted

| Object              |             Message Sent             |
| ------------------- | :----------------------------------: |
| Folder              | <i   class="material-icons">done</i> |
| Link                | <i   class="material-icons">done</i> |
| LTI                 | <i   class="material-icons">done</i> |
| Assignment          | <i   class="material-icons">done</i> |
| Forum               | <i   class="material-icons">done</i> |
| Content File Upload | <i   class="material-icons">done</i> |
| Test                | <i   class="material-icons">done</i> |
| Document            | <i   class="material-icons">done</i> |
| File Upload         | <i   class="material-icons">done</i> |

GradeEvents are sent in bulk nightly. Here is some of the key data that is
associated with these events:

### ContentEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/content/id - the primary key for the content ID

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**membership.roles** - #Instructor

**action** - Created _**or**_ Modified _**or**_ Deleted

### Sample Payload

Here is a sample of what a payload might look like:

```json
{
    "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
    "sendTime": "2021-01-05T14:50:35.681Z",
    "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
    "data": [
        {
            "@context": [
                "http://caliper.blackboard.com/ctx/caliper/v1/Context",
                "http://purl.imsglobal.org/ctx/caliper/v1p1"
            ],
            "type": "http://caliper.blackboard.com/caliper/v1/ContentEvent",
            "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
            "actor": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/566f88cb92b64e1086590458deeeb0da",
                "type": "Person",
                "extensions": {
                    "bb:user.id": "_12345_1",
                    "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                }
            },
            "action": "Modified",
            "object": {
                "@context": [
                    "http://caliper.blackboard.com/ctx/caliper/v1/Context",
                    "http://purl.imsglobal.org/ctx/caliper/v1p1"
                ],
                "type": "http://caliper.blackboard.com/caliper/v1/Content",
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/content/_12345_1",
                "name": "",
                "description": "",
                "handler": "resource/x-bb-forumlink",
                "isLesson": false,
                "isFolder": false,
                "isGroupContent": false,
                "dataVersion": 3,
                "renderType": "LINK",
                "scorePossible": 20,
                "dueDate": "2021-01-19T06:59:00.000Z",
                "aggregationModel": "Last",
                "extensions": {}
            },
            "eventTime": "2021-01-05T14:50:29.906Z",
            "edApp": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
                "type": "SoftwareApplication"
            },
            "membership": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/3ced8bf8f6174c339908f7dab224f0fa/members/566f88cb92b64e1086590458deeeb0da",
                "type": "Membership",
                "extensions": {
                    "bb:course.id": "_12345_1",
                    "bb:course.externalId": "BIO-101",
                    "bb:user.id": "_12345_1",
                    "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                },
                "member": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/566f88cb92b64e1086590458deeeb0da",
                    "type": "Person",
                    "extensions": {
                        "bb:user.id": "_12345_1",
                        "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                    }
                },
                "organization": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/3ced8bf8f6174c339908f7dab224f0fa",
                    "type": "CourseOffering",
                    "extensions": {
                        "bb:course.id": "_12345_1"
                    },
                    "members": [],
                    "courseNumber": "BIO-101"
                },
                "roles": [
                    "Instructor"
                ],
                "status": "Active"
            },
            "federatedSession": {
                "startedAtTime": "2021-01-05T14:50:29.906Z",
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/98CDC6B4501AF7FDAF55D8CC2B3DD7CA",
                "type": "LtiSession",
                "name": "98CDC6B4501AF7FDAF55D8CC2B3DD7CA",
                "dateCreated": "2021-01-05T14:50:29.906Z",
                "user": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/566f88cb92b64e1086590458deeeb0da",
                    "type": "Person",
                    "extensions": {
                        "bb:user.id": "_12345_1",
                        "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                    }
                }
            },
            "extensions": {},
            "session": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/98CDC6B4501AF7FDAF55D8CC2B3DD7CA",
                "type": "Session"
            }
        },
        {
            "@context": [
                "http://caliper.blackboard.com/ctx/caliper/v1/Context",
                "http://purl.imsglobal.org/ctx/caliper/v1p1"
            ],
            "type": "http://caliper.blackboard.com/caliper/v1/ContentEvent",
            "id": "90cc7d43-60df-49a4-8782-f4719988d5fb",
            "actor": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/566f88cb92b64e1086590458deeeb0da",
                "type": "Person",
                "extensions": {
                    "bb:user.id": "_12345_1",
                    "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                }
            },
            "action": "Modified",
            "object": {
                "@context": [
                    "http://caliper.blackboard.com/ctx/caliper/v1/Context",
                    "http://purl.imsglobal.org/ctx/caliper/v1p1"
                ],
                "type": "http://caliper.blackboard.com/caliper/v1/Content",
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/content/_12345_1",
                "name": "",
                "description": "",
                "handler": "resource/x-bb-forumlink",
                "isLesson": false,
                "isFolder": false,
                "isGroupContent": false,
                "dataVersion": 3,
                "renderType": "LINK",
                "scorePossible": 20,
                "dueDate": "2021-01-19T06:59:00.000Z",
                "aggregationModel": "Last",
                "extensions": {}
            },
            "eventTime": "2021-01-05T14:50:30.114Z",
            "edApp": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
                "type": "SoftwareApplication"
            },
            "membership": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/3ced8bf8f6174c339908f7dab224f0fa/members/566f88cb92b64e1086590458deeeb0da",
                "type": "Membership",
                "extensions": {
                    "bb:course.id": "_12345_1",
                    "bb:course.externalId": "BIO-101",
                    "bb:user.id": "_12345_1",
                    "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                },
                "member": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/566f88cb92b64e1086590458deeeb0da",
                    "type": "Person",
                    "extensions": {
                        "bb:user.id": "_12345_1",
                        "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                    }
                },
                "organization": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/3ced8bf8f6174c339908f7dab224f0fa",
                    "type": "CourseOffering",
                    "extensions": {
                        "bb:course.id": "_12345_1"
                    },
                    "members": [],
                    "courseNumber": "BIO-101"
                },
                "roles": [
                    "Instructor"
                ],
                "status": "Active"
            },
            "federatedSession": {
                "startedAtTime": "2021-01-05T14:50:30.114Z",
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/98CDC6B4501AF7FDAF55D8CC2B3DD7CA",
                "type": "LtiSession",
                "name": "98CDC6B4501AF7FDAF55D8CC2B3DD7CA",
                "dateCreated": "2021-01-05T14:50:30.114Z",
                "user": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/566f88cb92b64e1086590458deeeb0da",
                    "type": "Person",
                    "extensions": {
                        "bb:user.id": "_12345_1",
                        "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c

"
                    }
                }
            },
            "extensions": {},
            "session": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/98CDC6B4501AF7FDAF55D8CC2B3DD7CA",
                "type": "Session"
            }
        }
    ]
}
```
