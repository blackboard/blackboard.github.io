# Outcome Events
*Author: Scott Hurrey*
*Categories: ['Caliper']*
*Tags: ['developer', 'standards', 'caliper', 'ims', 'ims global']*
---
Blackboard Learn's Caliper Analytics stream emits an OutcomeEvent to cover the
following use cases:

  * **Student submits an assignment, a group assignment, or a test**
  * **Instructor enters a grade, comments, or feedback**
  * **Any user updates feedback**
  * **Instructor posts a manual grade**
  * **Instructor overrides a grade**
  * **Instructor clears an overridden grade**
  * **Instructor deletes an attempt**

OutcomeEvents are sent in bulk nightly. Here is some of the key data that is
associated with these events:

## OutcomeEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.assignable** - …/gradableItems/id - the primary key for the content ID

**action** - …/action#Graded

**actor.id** - contains a unique ID of the user (the ID is known to Bb)

**generated.normalScore** - score provided

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

# Sample Workflow

Here is a sample of what a workflow might look like:**

**
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:34:20.220Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/OutcomeEvent",  
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
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Graded",  
              "object": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_893_1/attempts/_9_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_893_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "count": 1,  
                   "startedAtTime": "2015-12-10T21:06:28.707Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_893_1/attempts/_9_1/result",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Result",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": "2015-12-10T21:06:28.707Z",  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_893_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "normalScore": 0.0,  
                   "penaltyScore": 0.0,  
                   "extraCreditScore": 0.0,  
                   "totalScore": 0.0,  
                   "curvedTotalScore": 0.0,  
                   "curveFactor": 0.0,  
                   "comment": null,  
                   "scoredBy": {  
                        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                        "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                        "name": null,  
                        "description": null,  
                        "extensions": {  
                               
                        },  
                        "dateCreated": null,  
                        "dateModified": null  
                   }  
              },  
              "eventTime": "2015-12-10T21:06:28.707Z",  
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
                   "roles": [],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": null  
         },  
         {  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/OutcomeEvent",  
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
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Graded",  
              "object": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_894_1/attempts/_10_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_894_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "count": 1,  
                   "startedAtTime": "2015-12-10T21:16:14.535Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_894_1/attempts/_10_1/result",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Result",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": "2015-12-10T21:16:14.535Z",  
                   "dateModified": null,  
                   "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/gradableItems/_894_1",  
                   "actor": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/c56ca36b2c004550b7df20606d3ce48b",  
                   "normalScore": 10.0,  
                   "penaltyScore": 0.0,  
                   "extraCreditScore": 0.0,  
                   "totalScore": 0.0,  
                   "curvedTotalScore": 0.0,  
                   "curveFactor": 0.0,  
                   "comment": null,  
                   "scoredBy": {  
                        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                        "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                        "name": null,  
                        "description": null,  
                        "extensions": {  
                               
                        },  
                        "dateCreated": null,  
                        "dateModified": null  
                   }  
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
                   "roles": [],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": null  
         }]  
    }

