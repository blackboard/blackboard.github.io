---
layout: post
title: "Blog Events" 
categories: Standards
id: standards-caliper-events-blogs
author: Scott Hurrey
---

# Blog Events

Blackboard Learn's Caliper Analytics stream emits a BlogEvent whenever a
student submits a blog entry in an original experience course. Here is some of
the key data that is associated with these events:

### BlogEvent

**object.id** - the primary key for the Blog

**action** - …/action#Create

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

### Sample Payload

Here is a sample of what an event payload might look like:

~~~ json
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2018-04-04T13:52:50.316Z",  
         "data": [{  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/BlogEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/92aa2365758c498db8d66b08f244d7e6",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_367_1",  
                        "bb:user.externalId": "jstudent9"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#Create",  
              "object": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/Blog",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/blog/_91_1",  
                   "name": "A Blog",  
                   "blogType": "INDIVIDUAL",  
                   "journal": false,  
                   "pointsPossible": null,  
                   "dueDate": null  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/BlogPost",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/blog/_91_1/post/_75_1",  
                   "anonymous": false,  
                   "attachedFilesCount": 0,  
                   "length": 17  
              },  
              "eventTime": "2018-04-04T13:52:43.607Z",  
              "edApp": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/applications/learn",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "group": null,  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/98743b77aaa94862b6fd8e2132b7b19d/members/92aa2365758c498db8d66b08f244d7e6",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "jstudent9",  
                        "bb:user.id": "_367_1",  
                        "bb:course.id": "_142_1",  
                        "bb:course.externalId": "LTI_TEST_CLASSIC_001"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/92aa2365758c498db8d66b08f244d7e6",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/98743b77aaa94862b6fd8e2132b7b19d",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/4549E0F1C88B7ABB2393B09DE166C1A7"  
         }]  
    }
~~~