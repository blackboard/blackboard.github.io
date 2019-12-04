# Assignable Events
*Author: Scott Hurrey*  
*Categories: ['Caliper']*  
*Tags: ['developer', 'standards', 'caliper', 'ims', 'ims global', 'assignableevent', 'submit an assignment', 'submit a group assignment']*  
<hr />
Blackboard Learn's Caliper Analytics stream emits an AssignableEvent in four
cases:

  * **A student starts an assignment**
  * **A student submits an assignment**
  * **A student starts a group assignment**
  * **A student submits a group assignment**

Here is some of the key data that is associated with these events:

## AssignableEvent - Assignment

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/gradableItems/id - the primary key for the content ID

**action** - …/action#Started

_**or**_** **

…/action#Completed

## AssignableEvent - Group Assignment

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/gradableItems/id - the primary key for the content ID

**extensions.bb:group.users** - an array of users in the group. The batchUId field will contain the batch_uid for the user

**action** - …/action#Started

_**or**_** **

…/action#Completed

For a completed group assignment, the course information is located one level
lower in group.subOrganizationOf

# Sample Workflow

Here is a sample of what a workflow might look like:

**Assignment**

  1. Start an Assignment
  2. Submit an Assignment

**Group Assignment**

  1. Start a Group Assignment
  2. Submit a Group Assignment

## 1. Start an Assignment

    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:28:21.759Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/AssignableEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions":{    
                        "bb:user.id":"_8510_1",  
                        "bb:user.externalId":"123-456-789-123"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Started",  
              "object": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_7121_1",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource",  
                   "name": "Assignment 3",  
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
                   "dateToSubmit": "2015-12-11T21:11:24.000Z",  
                   "maxAttempts": 0,  
                   "maxSubmits": 0,  
                   "maxScore": 10.0  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_7121_1/attempts/_10_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                                        },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_7121_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "count": 1,  
                   "startedAtTime": "2015-12-10T21:16:14.535Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "eventTime": "2015-12-10T21:16:14.535Z",  
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
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/5bd2e1842197458196bed7ae58835c81",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                                        },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "courseNumber": "JOHN_TEST_002",  
                   "academicSession": null,  
                   "subOrganizationOf": null  
              },  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/5bd2e1842197458196bed7ae58835c81/members/c56ca36b2c004550b7df20606d3ce48b",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                                        },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/5bd2e1842197458196bed7ae58835c81",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": null  
         },

Return to top

## 2. Submit an Assignment

    {  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/AssignableEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions":{    
                        "bb:user.id":"_8510_1",  
                        "bb:user.externalId":"123-456-789-123"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed",  
              "object": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_7121_1",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource",  
                   "name": "Assignment 3",  
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
                   "dateToSubmit": "2015-12-11T21:11:24.000Z",  
                   "maxAttempts": 0,  
                   "maxSubmits": 0,  
                   "maxScore": 10.0  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",                "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_7121_1/attempts/_10_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                                        },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_7121_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "count": 1,  
                   "startedAtTime": "2015-12-10T21:16:14.535Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "eventTime": "2015-12-10T21:16:14.535Z",  
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
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/5bd2e1842197458196bed7ae58835c81",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                                        },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "courseNumber": "JOHN_TEST_002",  
                   "academicSession": null,  
                   "subOrganizationOf": null  
              },  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/5bd2e1842197458196bed7ae58835c81/members/c56ca36b2c004550b7df20606d3ce48b",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                                        },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/5bd2e1842197458196bed7ae58835c81",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": null  
         }]  
    }

Return to top

## 1. Start a Group Assignment

    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2016-03-17T18:13:16.268Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/AssignableEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_20_1",  
                        "bb:user.externalId": "jstudent2"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Started",  
              "object": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1689_1",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource",  
                   "name": "Group Assignment 1",  
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
                   "maxScore": 10.0  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1689_1/attempts/_15_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1689_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "count": 1,  
                   "startedAtTime": "2016-03-17T18:09:41.506Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "eventTime": "2016-03-17T18:09:41.506Z",  
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
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/groups/_15_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Group",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:group.users": "[{\"id\":\"_9_1\",\"uuid\":\"c56ca36b2c004550b7df20606d3ce48b\",\"batchUid\":\"jstudent\"},{\"id\":\"_20_1\",\"uuid\":\"e0b3faa6b6d64e9f965cb1930a86d147\",\"batchUid\":\"jstudent2\"}]"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "subOrganizationOf": {  
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
                   }  
              },  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/members/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "jstudent2",  
                        "bb:user.id": "_20_1",  
                        "bb:course.id": "_173_1",  
                        "bb:course.externalId": "EVENT_TEST_002"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/7FE848A87F1021034F32BCDDE7F1F797"  
         },

Return to top

## 2. Submit a Group Assignment

    {  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/AssignableEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_20_1",  
                        "bb:user.externalId": "jstudent2"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed",  
              "object": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1689_1",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource",  
                   "name": "Group Assignment 1",  
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
                   "maxScore": 10.0  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1689_1/attempts/_15_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_1689_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "count": 1,  
                   "startedAtTime": "2016-03-17T18:09:41.506Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "eventTime": "2016-03-17T18:09:41.506Z",  
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
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/groups/_15_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Group",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:group.users": "[{\"id\":\"_9_1\",\"uuid\":\"c56ca36b2c004550b7df20606d3ce48b\",\"batchUid\":\"jstudent\"},{\"id\":\"_20_1\",\"uuid\":\"e0b3faa6b6d64e9f965cb1930a86d147\",\"batchUid\":\"jstudent2\"}]"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "subOrganizationOf": {  
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
                   }  
              },  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a/members/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "jstudent2",  
                        "bb:user.id": "_20_1",  
                        "bb:course.id": "_173_1",  
                        "bb:course.externalId": "EVENT_TEST_002"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/e0b3faa6b6d64e9f965cb1930a86d147",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/58778a44c366467e8c85c537155b2a8a",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/7FE848A87F1021034F32BCDDE7F1F797"  
         }]  
    }

Return to top

