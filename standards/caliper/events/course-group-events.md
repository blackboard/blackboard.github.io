---
layout: post
title: "Course Group Events" 
categories: Standards
id: standards-caliper-events-course-group
author: Scott Hurrey
---
# Course Group Events

Blackboard Learn's Caliper Analytics stream emits a CourseGroupEvent whenever
an instructor creates, updates, or deletes a group in a course.

Here is some of the key data that is associated with these events:

### CourseGroupEvent

**extensions** - contains bb:group.users with list of course membership ids in the group

**action** - Created _**or**_ Modified _**or**_ Deleted

### Sample Payload

Here is a sample of what a payload might look like:

~~~ json
{
    "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
    "sendTime": "2021-01-05T09:37:13.827Z",
    "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
    "data": [
        {
            "@context": [
                "http://caliper.blackboard.com/ctx/caliper/v1/Context",
                "http://purl.imsglobal.org/ctx/caliper/v1p1"
            ],
            "type": "http://caliper.blackboard.com/caliper/v1/CourseGroupEvent",
            "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
            "actor": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a1165a247b9044dc9730620872d11788",
                "type": "Person",
                "extensions": {
                    "bb:user.id": "_12345_1",
                    "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
                }
            },
            "action": "Created",
            "object": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/a3fe89604fc6437ea381979569cd6d81/groups/_12345_1",
                "type": "Group",
                "extensions": {
                    "bb:group.name": "Team 2"
                },
                "subOrganizationOf": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/a3fe89604fc6437ea381979569cd6d81",
                    "type": "CourseOffering",
                    "extensions": {
                        "bb:course.id": "_12345_1"
                    },
                    "members": [],
                    "courseNumber": "BIO-101"
                },
                "members": []
            },
            "eventTime": "2021-01-05T09:37:09.585Z",
            "edApp": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
                "type": "SoftwareApplication"
            },
            "group": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/a3fe89604fc6437ea381979569cd6d81/groups/_12345_1",
                "type": "Group",
                "extensions": {
                    "bb:group.name": "Team 2"
                },
                "subOrganizationOf": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/a3fe89604fc6437ea381979569cd6d81",
                    "type": "CourseOffering",
                    "extensions": {
                        "bb:course.id": "_12345_1"
                    },
                    "members": [],
                    "courseNumber": "BIO-101"
                },
                "members": []
            },
            "membership": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/a3fe89604fc6437ea381979569cd6d81/members/a1165a247b9044dc9730620872d11788",
                "type": "Membership",
                "extensions": {
                    "bb:course.id": "_12345_1",
                    "bb:course.externalId": "BIO-101",
                    "bb:user.id": "_12345_1",
                    "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
                },
                "member": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a1165a247b9044dc9730620872d11788",
                    "type": "Person",
                    "extensions": {
                        "bb:user.id": "_12345_1",
                        "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
                    }
                },
                "organization": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/a3fe89604fc6437ea381979569cd6d81",
                    "type": "CourseOffering",
                    "extensions": {
                        "bb:course.id": "_12345_1"
                    },
                    "members": [],
                    "courseNumber": "BIO-101"
                },
                "roles": [],
                "status": "Active"
            },
            "federatedSession": {
                "startedAtTime": "2021-01-05T09:37:09.585Z",
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/10497B7377117FFD7B5FD7D3EE58227E",
                "type": "LtiSession",
                "name": "10497B7377117FFD7B5FD7D3EE58227E",
                "dateCreated": "2021-01-05T09:37:09.585Z",
                "user": {
                    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a1165a247b9044dc9730620872d11788",
                    "type": "Person",
                    "extensions": {
                        "bb:user.id": "_12345_1",
                        "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
                    }
                }
            },
            "extensions": {},
            "session": {
                "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/10497B7377117FFD7B5FD7D3EE58227E",
                "type": "Session"
            }
        }
    ]
}
~~~