---
layout: post
title: "Assessment Events"
categories: Standards
id: caliper-events-assesments
author: Scott Hurrey
---

# Assessment Events

Blackboard Learn's Caliper Analytics stream has two event types dedicated to assessments:

- **AssessmentEvent**
- **AssessmentItemEvent**

These events work hand-in-hand. An AssessmentEvent is fired whenever a student
starts or submits a test, and the AssessmentItemEvent is fired whenever a
student starts or submits a question on an assessment.

Here is some of the key data that is associated with these events:

### AssessmentEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/assessments/id - the primary key for the assessment ID

**action** - Started, Completed

### AssessmentItemEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/questions/id - the primary key for the question ID

**object.ispartOf.@id** .../assessments/id - the primary key for the assessment this questions is a part of

**action** - Started, Submitted

### Sample Payloads

1. AssessmentEvent
2. AssessmentItemEvent

### 1. AssessmentEvent

```json
{
  "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
  "sendTime": "2021-01-05T14:49:40.609Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
      "type": "AssessmentEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a361d45a65564777b98460834687183f",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        }
      },
      "action": "Started",
      "object": {
        "dateToSubmit": "2021-01-12T06:59:00.000Z",
        "maxAttempts": 0,
        "maxSubmits": 0,
        "maxScore": 150,
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1",
        "type": "Assessment",
        "name": "My Test",
        "extensions": {
          "bb:assessment.categoryId": "_12345_1",
          "bb:assessment.categoryName": "Assignment",
          "bb:contentId": "_12345_1",
          "bb:assessment.gradeableItemId": "_12345_1",
          "bb:assessment.catUserDefined": "false"
        },
        "creators": [],
        "learningObjectives": [],
        "keywords": [],
        "items": []
      },
      "generated": {
        "startedAtTime": "2021-01-05T14:49:36.451Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/gradableItems/_12345_1/attempts/_12345_1",
        "type": "Attempt",
        "assignable": {
          "dateToSubmit": "2021-01-12T06:59:00.000Z",
          "maxAttempts": 0,
          "maxSubmits": 0,
          "maxScore": 150,
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1",
          "type": "Assessment",
          "name": "My Test",
          "extensions": {
            "bb:assessment.categoryId": "_12345_1",
            "bb:assessment.categoryName": "Assignment",
            "bb:contentId": "_12345_1",
            "bb:assessment.gradeableItemId": "_12345_1",
            "bb:assessment.catUserDefined": "false"
          },
          "creators": [],
          "learningObjectives": [],
          "keywords": [],
          "items": []
        },
        "assignee": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a361d45a65564777b98460834687183f",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "count": 1
      },
      "eventTime": "2021-01-05T14:49:36.451Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "group": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/34f0705416864ca09a34f22f73446686",
        "type": "CourseOffering",
        "extensions": {
          "bb:course.id": "_12345_1"
        },
        "members": [],
        "courseNumber": "BIO-101"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/34f0705416864ca09a34f22f73446686/members/a361d45a65564777b98460834687183f",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a361d45a65564777b98460834687183f",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/34f0705416864ca09a34f22f73446686",
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
        "startedAtTime": "2021-01-05T14:49:36.451Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/94DD6EFB1B20EBD3B62889A38C7BF590",
        "type": "LtiSession",
        "name": "94DD6EFB1B20EBD3B62889A38C7BF590",
        "dateCreated": "2021-01-05T14:49:36.451Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/a361d45a65564777b98460834687183f",
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

### AssessmentItemEvent

```json
{
  "sensor": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
  "sendTime": "2021-01-05T14:50:26.769Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
      "type": "AssessmentItemEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        }
      },
      "action": "Started",
      "object": {
        "maxAttempts": 0,
        "maxSubmits": 0,
        "maxScore": 0,
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1/questions/_12345_1",
        "type": "AssessmentItem",
        "creators": [],
        "learningObjectives": [],
        "keywords": [],
        "isPartOf": {
          "dateToSubmit": "2020-12-23T07:59:00.000Z",
          "maxAttempts": 1,
          "maxSubmits": 0,
          "maxScore": 300,
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7cc/assessments/_12345_1",
          "type": "Assessment",
          "name": "My Test",
          "extensions": {
            "bb:assessment.categoryId": "_12345_1",
            "bb:assessment.categoryName": "Test",
            "bb:assessment.catUserDefined": "false",
            "bb:assessment.gradeableItemId": "_12345_1"
          },
          "creators": [],
          "learningObjectives": [],
          "keywords": [],
          "items": []
        }
      },
      "generated": {
        "startedAtTime": "2021-01-04T19:13:19.774Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1/questions/_12345_1/attempts/_12345_1",
        "type": "Attempt",
        "assignable": {
          "maxAttempts": 0,
          "maxSubmits": 0,
          "maxScore": 0,
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1/questions/_12345_1",
          "type": "AssessmentItem",
          "creators": [],
          "learningObjectives": [],
          "keywords": [],
          "isPartOf": {
            "dateToSubmit": "2020-12-23T07:59:00.000Z",
            "maxAttempts": 1,
            "maxSubmits": 0,
            "maxScore": 300,
            "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1",
            "type": "Assessment",
            "name": "My Test",
            "extensions": {
              "bb:assessment.categoryId": "_12345_1",
              "bb:assessment.categoryName": "Test",
              "bb:assessment.catUserDefined": "false",
              "bb:assessment.gradeableItemId": "_12345_1"
            },
            "creators": [],
            "learningObjectives": [],
            "keywords": [],
            "items": []
          }
        },
        "assignee": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "count": 1
      },
      "eventTime": "2021-01-04T19:13:19.774Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "group": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/35983609b6084ef88407f98a2263e574",
        "type": "CourseOffering",
        "extensions": {
          "bb:course.id": "_12345_1"
        },
        "members": [],
        "courseNumber": "BIO-101"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/35983609b6084ef88407f98a2263e574/members/1a26d8c5b4d44f1db491db1f24407715",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/35983609b6084ef88407f98a2263e574",
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
        "startedAtTime": "2021-01-04T19:13:19.774Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/DCC5DE08316F7BB7F5355929DD49AE28",
        "type": "LtiSession",
        "name": "DCC5DE08316F7BB7F5355929DD49AE28",
        "dateCreated": "2021-01-04T19:13:19.774Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        }
      },
      "extensions": {}
    },
    {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
      "type": "AssessmentItemEvent",
      "id": "54b54b42-dd02-42f8-88ed-07bd719bfb7c",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        }
      },
      "action": "Completed",
      "object": {
        "maxAttempts": 0,
        "maxSubmits": 0,
        "maxScore": 0,
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_9058464_1/questions/_9058487_1",
        "type": "AssessmentItem",
        "creators": [],
        "learningObjectives": [],
        "keywords": [],
        "isPartOf": {
          "dateToSubmit": "2020-12-23T07:59:00.000Z",
          "maxAttempts": 1,
          "maxSubmits": 0,
          "maxScore": 300,
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_9058464_1",
          "type": "Assessment",
          "name": "My Test",
          "extensions": {
            "bb:assessment.categoryId": "_12345_1",
            "bb:assessment.categoryName": "Test",
            "bb:assessment.catUserDefined": "false",
            "bb:assessment.gradeableItemId": "_12345_1"
          },
          "creators": [],
          "learningObjectives": [],
          "keywords": [],
          "items": []
        }
      },
      "generated": {
        "startedAtTime": "2021-01-04T19:13:19.774Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1/questions/_12345_1/attempts/_12345_1/response",
        "type": "MultipleResponseResponse",
        "extensions": {
          "bb:questionType": "MultipleAnswer"
        },
        "attempt": {
          "startedAtTime": "2021-01-04T19:13:19.774Z",
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1/questions/_12345_1/attempts/_12345_1",
          "type": "Attempt",
          "assignable": {
            "maxAttempts": 0,
            "maxSubmits": 0,
            "maxScore": 0,
            "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1/questions/_12345_1",
            "type": "AssessmentItem",
            "creators": [],
            "learningObjectives": [],
            "keywords": [],
            "isPartOf": {
              "dateToSubmit": "2020-12-23T07:59:00.000Z",
              "maxAttempts": 1,
              "maxSubmits": 0,
              "maxScore": 300,
              "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/assessments/_12345_1",
              "type": "Assessment",
              "name": "My Test",
              "extensions": {
                "bb:assessment.categoryId": "_12345_1",
                "bb:assessment.categoryName": "Test",
                "bb:assessment.catUserDefined": "false",
                "bb:assessment.gradeableItemId": "_12345_1"
              },
              "creators": [],
              "learningObjectives": [],
              "keywords": [],
              "items": []
            }
          },
          "assignee": {
            "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
            "type": "Person",
            "extensions": {
              "bb:user.id": "_12345_1",
              "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
            }
          },
          "count": 1
        },
        "values": []
      },
      "eventTime": "2021-01-04T19:13:19.774Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/applications/learn",
        "type": "SoftwareApplication"
      },
      "group": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/35983609b6084ef88407f98a2263e574",
        "type": "CourseOffering",
        "extensions": {
          "bb:course.id": "_12345_1"
        },
        "members": [],
        "courseNumber": "BIO-101"
      },
      "membership": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/35983609b6084ef88407f98a2263e574/members/1a26d8c5b4d44f1db491db1f24407715",
        "type": "Membership",
        "extensions": {
          "bb:course.id": "_12345_1",
          "bb:course.externalId": "BIO-101",
          "bb:user.id": "_12345_1",
          "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
        },
        "member": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_12345_1",
            "bb:user.externalId": "54b54b42-dd02-42f8-88ed-07bd719bfb7c"
          }
        },
        "organization": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/courses/35983609b6084ef88407f98a2263e574",
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
        "startedAtTime": "2021-01-04T19:13:19.774Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/sessions/DCC5DE08316F7BB7F5355929DD49AE28",
        "type": "LtiSession",
        "name": "DCC5DE08316F7BB7F5355929DD49AE28",
        "dateCreated": "2021-01-04T19:13:19.774Z",
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/54b54b42-dd02-42f8-88ed-07bd719bfb7c/users/1a26d8c5b4d44f1db491db1f24407715",
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
