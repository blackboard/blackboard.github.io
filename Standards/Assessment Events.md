# Assessment Events
*Author: Scott Hurrey*  
*Categories: ['Caliper']*  
*Tags: ['developer', 'caliper', 'ims', 'ims global', 'assessmentevent', 'assessmentitemevent']*  
<hr />
Blackboard Learn's Caliper Analytics stream has two event types dedicated to
assessments:

  * **AssessmentEvent**
  * **AssessmentItemEvent**

These events work hand-in-hand. An AssessmentEvent is fired whenever a student
starts or submits a test, and the AssessmentItemEvent is fired whenever a
student starts or submits a question on an assessment.

Here is some of the key data that is associated with these events:

## AssessmentEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/assessments/id - the primary key for the assessment ID

**action** - …/action#Started

_**or**_** **

…/action#Completed

## AssessmentItemEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/questions/id - the primary key for the question ID

**object.ispartOf.@id** .../assessments/id - the primary key for the assessment this questions is a part of

**action** - …/action#Started

_**or**_** **

…/action#Completed

# Sample Workflow

Here is a sample of what a workflow might look like:

  1. Start a Test
  2. Start a Question
  3. Submit a Question
  4. Submit a Test

## 1. Start a Test

    {  
          "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
          "sendTime": "2016-03-17T18:08:09.817Z",  
          "data": [{  
               "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
               "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentEvent",  
               "actor": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.id": "_9_1",  
                         "bb:user.externalId": "jstudent"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Started",  
               "object": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/Assessment",  
                    "name": "Test 1",  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "objectType": [],  
                    "alignedLearningObjective": [],  
                    "keywords": [],  
                    "isPartOf": null,  
                    "datePublished": null,  
                    "version": null,  
                    "dateToActivate": null,  
                    "dateToShow": null,  
                    "dateToStartOn": null,  
                    "dateToSubmit": null,  
                    "maxAttempts": 1,  
                    "maxSubmits": 0,  
                    "maxScore": 25.0  
               },  
               "target": null,  
               "generated": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1690_1/attempts/_84_1",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1",  
                    "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "count": 1,  
                    "startedAtTime": "2016-03-17T18:07:07.896Z",  
                    "endedAtTime": null,  
                    "duration": null  
               },  
               "eventTime": "2016-03-17T18:07:07.896Z",  
               "edApp": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "group": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:course.id": "_173_1"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "courseNumber": "EVENT_TEST_002",  
                    "academicSession": null,  
                    "subOrganizationOf": null  
               },  
               "membership": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/members/c56ca36b2c004550b7df20606d3ce48b",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.externalId": "jstudent",  
                         "bb:user.id": "_9_1",  
                         "bb:course.id": "_173_1",  
                         "bb:course.externalId": "EVENT_TEST_002"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                    "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
               },  
               "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/3A1747CAC43F389806C29D111B94F0B0"  
          },

Return to top

## 2. Start a Question

         {  
               "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
               "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent",  
               "actor": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.id": "_9_1",  
                         "bb:user.externalId": "jstudent"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Started",  
               "object": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentItem",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "objectType": [],  
                    "alignedLearningObjective": [],  
                    "keywords": [],  
                    "isPartOf": {  
                         "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1",  
                         "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                         "@type": "http://purl.imsglobal.org/caliper/v1/Assessment",  
                         "name": "Test 1",  
                         "description": null,  
                         "extensions": {  
                                                   },  
                         "dateCreated": null  
                         "dateModified": null,  
                         "objectType": [],  
                         "alignedLearningObjective": [],  
                         "keywords": [],  
                         "isPartOf": null,  
                         "datePublished": null,  
                         "version": null,  
                         "dateToActivate": null,  
                         "dateToShow": null,   
                         "dateToStartOn": null,  
                         "dateToSubmit": null,  
                         "maxAttempts": 1,  
                         "maxSubmits": 0,  
                         "maxScore": 25.0  
                    },  
                    "datePublished": null,  
                    "version": null,   
                    "dateToActivate": null,  
                    "dateToShow": null,  
                    "dateToStartOn": null,  
                    "dateToSubmit": null,  
                    "maxAttempts": 0,  
                    "maxSubmits": 0,  
                    "maxScore": 0.0,  
                    "isTimeDependent": false  
               },  
               "target": null,  
               "generated": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1/attempts/_100_1",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1",  
                    "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "count": 1,  
                    "startedAtTime": "2016-03-17T18:07:22.224Z",  
                    "endedAtTime": null,  
                    "duration": null  
               },  
               "eventTime": "2016-03-17T18:07:22.224Z",  
               "edApp": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "group": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:course.id": "_173_1"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "courseNumber": "EVENT_TEST_002",  
                    "academicSession": null,  
                    "subOrganizationOf": null  
               },  
               "membership": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/members/c56ca36b2c004550b7df20606d3ce48b",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.externalId": "jstudent",  
                         "bb:user.id": "_9_1",  
                         "bb:course.id": "_173_1",  
                         "bb:course.externalId": "EVENT_TEST_002"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                    "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
               },  
               "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/3A1747CAC43F389806C29D111B94F0B0"  
          },

Return to top

## 3. Submit a Question

         {  
               "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
               "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent",  
               "actor": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.id": "_9_1",  
                         "bb:user.externalId": "jstudent"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed",  
               "object": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentItem",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "objectType": [],  
                    "alignedLearningObjective": [],  
                    "keywords": [],  
                    "isPartOf": {  
                         "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1",  
                         "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                         "@type": "http://purl.imsglobal.org/caliper/v1/Assessment",  
                         "name": "Test 1",  
                         "description": null,  
                         "extensions": {  
                                                   },  
                         "dateCreated": null,  
                         "dateModified": null,  
                         "objectType": [],  
                         "alignedLearningObjective": [],  
                         "keywords": [],  
                         "isPartOf": null,  
                         "datePublished": null,  
                         "version": null,  
                         "dateToActivate": null,  
                         "dateToShow": null,  
                         "dateToStartOn": null,  
                         "dateToSubmit": null,  
                         "maxAttempts": 1,  
                         "maxSubmits": 0,  
                         "maxScore": 25.0  
                    },  
                    "datePublished": null,  
                    "version": null,  
                    "dateToActivate": null,  
                    "dateToShow": null,  
                    "dateToStartOn": null,  
                    "dateToSubmit": null,  
                    "maxAttempts": 0,  
                    "maxSubmits": 0,  
                    "maxScore": 0.0,  
                    "isTimeDependent": false  
               },  
               "target": null,  
               "generated": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1/attempts/_100_1/response",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/FillinBlankResponse",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:questionType": "Essay"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1",  
                    "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "attempt": {  
                         "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                         "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1/attempts/_100_1",  
                         "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                         "name": null,  
                         "description": null,  
                         "extensions": {  
                                                   },  
                         "dateCreated": null,  
                         "dateModified": null,  
                         "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1/questions/_2514_1",  
                         "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                         "count": 1,  
                         "startedAtTime": "2016-03-17T18:07:22.224Z",  
                         "endedAtTime": null,  
                         "duration": null  
                    },  
                    "startedAtTime": "2016-03-17T18:07:22.224Z",  
                    "endedAtTime": null,  
                    "duration": null,  
                    "values": []  
               },  
               "eventTime": "2016-03-17T18:07:22.224Z",  
               "edApp": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "group": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:course.id": "_173_1"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "courseNumber": "EVENT_TEST_002",  
                    "academicSession": null,  
                    "subOrganizationOf": null  
               },  
               "membership": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/members/c56ca36b2c004550b7df20606d3ce48b",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.externalId": "jstudent",  
                         "bb:user.id": "_9_1",  
                         "bb:course.id": "_173_1",  
                         "bb:course.externalId": "EVENT_TEST_002"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                    "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
               },  
               "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/3A1747CAC43F389806C29D111B94F0B0"  
          },

Return to top

## 4. Submit a Test

         {  
               "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
               "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentEvent",  
               "actor": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.id": "_9_1",  
                         "bb:user.externalId": "jstudent"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Submitted",  
               "object": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/Assessment",  
                    "name": "Test 1",  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "objectType": [],  
                    "alignedLearningObjective": [],  
                    "keywords": [],  
                    "isPartOf": null,  
                    "datePublished": null,  
                    "version": null,  
                    "dateToActivate": null,  
                    "dateToShow": null,  
                    "dateToStartOn": null,   
                    "dateToSubmit": null,  
                    "maxAttempts": 1,  
                    "maxSubmits": 0,  
                    "maxScore": 25.0  
               },  
               "target": null,  
               "generated": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1690_1/attempts/_84_1",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/assessments/_2512_1",  
                    "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "count": 1,  
                    "startedAtTime": "2016-03-17T18:07:27.593Z",   
                    "endedAtTime": null,  
                    "duration": null  
               },  
               "eventTime": "2016-03-17T18:07:27.593Z",  
               "edApp": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                                         },   
                    "dateCreated": null,  
                    "dateModified": null  
               },  
               "group": {  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                    "name": null,  
                    "description": null,   
                    "extensions": {  
                         "bb:course.id": "_173_1"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "courseNumber": "EVENT_TEST_002",  
                    "academicSession": null,  
                    "subOrganizationOf": null  
               },  
               "membership": {  
                    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                    "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/members/c56ca36b2c004550b7df20606d3ce48b",  
                    "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                    "name": null,  
                    "description": null,  
                    "extensions": {  
                         "bb:user.externalId": "jstudent",  
                         "bb:user.id": "_9_1",  
                         "bb:course.id": "_173_1",  
                         "bb:course.externalId": "EVENT_TEST_002"  
                    },  
                    "dateCreated": null,  
                    "dateModified": null,  
                    "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                    "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                    "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                    "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
               },  
               "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/3A1747CAC43F389806C29D111B94F0B0"  
          }] }

Return to top

