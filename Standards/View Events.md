# View Events
Blackboard Learn's Caliper Analytics stream sends ViewEvent messages to cover
four use cases:

  * **User clicks on an assignment link**
  * **User clicks on an external link**
  * **User clicks on a discussion board link**
  * **User clicks on a content file link**

Here is some of the key data that is associated with all ViewEvents:

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/content/id - the primary key for the content ID

**action** - …/action#Viewed

# Example Payload

    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-11T02:59:34.659Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/ViewEvent",  
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
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Viewed",  
              "object": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/content/_7124_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Frame",  
                   "name": null,  
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
                   "index": 0  
              },  
              "target": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/content/_7124_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Frame",  
                   "name": null,  
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
                   "index": 0  
              },  
              "generated": null,  
              "eventTime": "2015-12-11T02:47:23.903Z",  
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

