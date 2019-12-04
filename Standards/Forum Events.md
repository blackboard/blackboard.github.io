# Forum Events
*Author: Scott Hurrey*
*Categories: ['Caliper']*
*Tags: ['developer', 'standards', 'caliper', 'ims', 'ims global', 'forumevent']*
---
Blackboard Learn's Caliper Analytics stream emits a ForumEvent to cover five
use cases:

  * **User posts a non-gradable thread  
**
  * **User posts a gradable thread**
  * **User posts an assignment conversation comment**
  * **User posts a non-gradable thread for group discussion**
  * **User posts a group conversation comment**

Here is some of the key data that is associated with these events:

## ForumEvent - Non-Gradable Thread

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**action** - …/action#Create

_**or**_

…/action#Update

_**or**_

…/action#Draft

## ForumEvent - Gradable Thread

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.forumPointsPossible** - number of possible points

**action** - …/action#Create

_**or**_

…/action#Update

_**or**_

…/action#Draft

## ForumEvent - Assignment Conversation Comment

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.forumPointsPossible** - number of possible points

**action** - …/action#Create

_**or**_

…/action#Update

_**or**_

…/action#Draft

## ForumEvent - Non-Gradable Group Thread

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**group.subOrganizationOf - **course information

**action** - …/action#Create

_**or**_

…/action#Update

_**or**_

…/action#Draft

## ForumEvent - Group Conversation Comment

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.forumPointsPossible** - number of possible points

**group.subOrganizationOf - **course information

**action** - …/action#Create

_**or**_

…/action#Update

_**or**_

…/action#Draft

# Sample Payloads

Here are two sample payloads to illustrate the difference between a gradable
and non-gradable ForumEvent:

  1. Non-Gradable Thread
  2. Gradable Thread

## 1. Non-Gradable Thread

    {  
         "sensor": "d29571de-6527-410a-a26f-ff7416e16512",  
         "sendTime": "2016-03-14T22:26:21.638Z",  
         "data": [{  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/ForumEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/users/09d03cfd94b14c6ebe4ed20ba3d35b41",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_121053_1",  
                        "bb:user.externalId": "c25e40b5-fd77-40bd-8058-d851bbf34bc0"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#Create",  
              "object": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/Forum",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/discussion/_46_1",  
                   "name": "Test Forum-Group discussion",  
                   "forumPointsPossible": null,  
                   "threadPointsPossible": null,  
                   "dueDate": null  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/ForumPost",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/discussion/_46_1/post/_68_1",  
                   "parentId": null,  
                   "threadId": "_68_1",  
                   "fileAttached": false,  
                   "length": 165,  
                   "anonymous": false,  
                   "linkRefId": null,  
                   "firstPost": false  
              },  
              "eventTime": "2016-03-14T22:26:08.051Z",  
              "edApp": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/applications/learn",  
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
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/courses/35ac88b1eecc4a458f6819e6b379799e/members/09d03cfd94b14c6ebe4ed20ba3d35b41",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "c25e40b5-fd77-40bd-8058-d851bbf34bc0",  
                        "bb:user.id": "_121053_1",  
                        "bb:course.id": "_519_1",  
                        "bb:course.externalId": "SDW:13379064"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/users/09d03cfd94b14c6ebe4ed20ba3d35b41",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/courses/35ac88b1eecc4a458f6819e6b379799e",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/sessions/F134BF7AC8648E9DEE822876CCE17AAE"  
         }]  
    }

Return to top

## 2. Gradable Thread

    {  
         "sensor": "d29571de-6527-410a-a26f-ff7416e16512",  
         "sendTime": "2016-03-14T22:26:21.638Z",  
         "data": [{  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/ForumEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/users/09d03cfd94b14c6ebe4ed20ba3d35b41",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_121053_1",  
                        "bb:user.externalId": "c25e40b5-fd77-40bd-8058-d851bbf34bc0"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#Create",  
              "object": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/Forum",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/discussion/_46_1",  
                   "name": "Test Forum-Group discussion",  
                   "forumPointsPossible": null,  
                   "threadPointsPossible": null,  
                   "dueDate": null  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/ForumPost",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/discussion/_46_1/post/_68_1",  
                   "parentId": null,  
                   "threadId": "_68_1",  
                   "fileAttached": false,  
                   "length": 165,  
                   "anonymous": false,  
                   "linkRefId": null,  
                   "firstPost": false  
              },  
              "eventTime": "2016-03-14T22:26:08.051Z",  
              "edApp": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/applications/learn",  
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
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/courses/35ac88b1eecc4a458f6819e6b379799e/members/09d03cfd94b14c6ebe4ed20ba3d35b41",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "c25e40b5-fd77-40bd-8058-d851bbf34bc0",  
                        "bb:user.id": "_121053_1",  
                        "bb:course.id": "_519_1",  
                        "bb:course.externalId": "SDW:13379064"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/users/09d03cfd94b14c6ebe4ed20ba3d35b41",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/courses/35ac88b1eecc4a458f6819e6b379799e",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/d29571de-6527-410a-a26f-ff7416e16512/sessions/F134BF7AC8648E9DEE822876CCE17AAE"  
         }]  
    }

Return to top

