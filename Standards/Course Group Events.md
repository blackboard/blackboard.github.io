# Course Group Events
*Author: Scott Hurrey*
*Categories: ['Caliper']*
*Tags: ['developers', 'standards', 'caliper', 'ims', 'ims global', 'coursegroupevent', 'developer']*
---
Blackboard Learn's Caliper Analytics stream emits a CourseGroupEvent whenever
an instructor creates, updates, or deletes a group in a course.

Here is some of the key data that is associated with these events:

## CourseGroupEvent

**extensions** - contains bb:group.users with list of course membership ids in the group

# Sample Payload

Here is a sample of what a payload might look like:**

**
         {  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/CourseGroupEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/701cbe9a4acd4c31a91af84f25b2f19f",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_7_1",  
                        "bb:user.externalId": "jwiseman"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#Create",  
              "object": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/3fbbc28ce97a430ca0f51b5ecd2db557/groups/_122_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Group",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:group.name": "New Group 2",  
                        "bb:group.users": "[{\"courseMembershipId\":\"_1126_1\"},{\"courseMembershipId\":\"_1127_1\"}]"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "subOrganizationOf": {  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/3fbbc28ce97a430ca0f51b5ecd2db557",  
                        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                        "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                        "name": null,  
                        "description": null,  
                        "extensions": {  
                             "bb:course.id": "_687_1"  
                        },  
                        "dateCreated": null,  
                        "dateModified": null,  
                        "courseNumber": "NEW_EVENTTEST_001",  
                        "academicSession": null,  
                        "subOrganizationOf": null  
                   }  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/MiniUser",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/minimalUser/Some(_201_1)",  
                   "uuid": "ea99406786f149fe8c5accb738895738",  
                   "batchUid": "jstudent7",  
                   "courseMembershipId": "_1127_1"  
              },  
              "eventTime": "2017-01-31T04:06:45.458Z",  
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
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/3fbbc28ce97a430ca0f51b5ecd2db557/groups/_122_1",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Group",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:group.name": "New Group 2",  
                        "bb:group.users": "[{\"courseMembershipId\":\"_1126_1\"},{\"courseMembershipId\":\"_1127_1\"}]"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "subOrganizationOf": {  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/3fbbc28ce97a430ca0f51b5ecd2db557",  
                        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                        "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                        "name": null,  
                        "description": null,  
                        "extensions": {  
                             "bb:course.id": "_687_1"  
                        },  
                        "dateCreated": null,  
                        "dateModified": null,  
                        "courseNumber": "NEW_EVENTTEST_001",  
                        "academicSession": null,  
                        "subOrganizationOf": null  
                   }  
              },  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/3fbbc28ce97a430ca0f51b5ecd2db557/members/701cbe9a4acd4c31a91af84f25b2f19f",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "jwiseman",  
                        "bb:user.id": "_7_1",  
                        "bb:course.id": "_687_1",  
                        "bb:course.externalId": "NEW_EVENTTEST_001"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/701cbe9a4acd4c31a91af84f25b2f19f",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/3fbbc28ce97a430ca0f51b5ecd2db557",  
                   "roles": [],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/5076C35A57C7222B3327BD455FA57FAE"  
         }

