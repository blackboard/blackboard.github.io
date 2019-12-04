# Content Events
*Author: Scott Hurrey*  
*Categories: ['Caliper']*  
*Tags: ['developers', 'standards', 'caliper', 'ims', 'ims global', 'forumevent', 'contentevent', 'developer']*  
<hr />
Blackboard Learn's Caliper Analytics stream emits a ContentEvent to cover a
plethora of use cases. Rather than list them, here is a chart that tells you
when a message is sent:

****

**Object type**
**ContentEvent when object is created**
**ContentEvent when object is updated (by member value)**
****ContentEvent when o**bject is deleted**

** ****Name****URL****Description****Available****Parms****Score****Due Date****Start Date****End Date****Conversation****Group****Instructions****Questions**** **

Folder

Yes

Yes

N/A

No

Yes

N/A

N/A

N/A

Yes

Yes

N/A

N/A

N/A

N/A

Yes

Link

Yes

Yes

Yes

No

Yes

N/A

N/A

N/A

Yes

Yes

N/A

N/A

N/A

N/A

Yes

LTI

Yes

Yes

Yes

No

Yes

Yes

No

No

Yes

Yes

ForumEvent

N/A

N/A

N/A

Yes

Assignment

Yes

Yes

N/A

N/A

Yes

N/A

No

No

Yes

Yes

ForumEvent

No

Yes

N/A

Yes

Forum

Yes

Yes

N/A

N/A

Yes

N/A

No

No

Yes

Yes

N/A

N/A

N/A

N/A

Yes

Content File Upload

Yes

Yes

N/A

N/A

Yes

N/A

N/A

N/A

Yes

Yes

N/A

N/A

Yes

N/A

Yes

Test

No

Yes

N/A

N/A

Yes

N/A

No

No

Yes

Yes

ForumEvent

No

No

No

Yes

Document

Yes

Yes

N/A

N/A

Yes

N/A

N/A

N/A

Yes

Yes

N/A

N/A

Yes

N/A

Yes

File Upload

Yes

Yes

N/A

N/A

Yes

N/A

N/A

N/A

Yes

Yes

N/A

N/A

Yes

N/A

Yes

OutcomeEvents are sent in bulk nightly. Here is some of the key data that is
associated with these events:

## ContentEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/content/id - the primary key for the content ID

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**membership.roles** - #Instructor

**action** - …/action#Created

_**or**_

…/action#Updated

_**or**_

…/action#Deleted

# Sample Payload

Here is a sample of what a payload might look like:**

**
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2016-03-16T17:23:46.224Z",  
         "data": [{  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/ContentEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/f902ceefcf8f41ae87570daa25158989",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_88_1",  
                        "bb:user.externalId": "perfadmin"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#Create",  
              "object": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/Content",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/content/_11206_1",  
                   "handler": "resource/x-bb-folder",  
                   "isLesson": false,  
                   "isFolder": true,  
                   "isGroupContent": false,  
                   "dataVersion": 3,  
                   "renderType": "REG",  
                   "packageSignature": null,  
                   "contentContext": null  
              },  
              "target": null,  
              "generated": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/UpdatedContentProperties",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/content/_11206_1/updatedProperties",  
                   "position": {  
                        "oldValue": null,  
                        "newValue": -1  
                   },  
                   "title": null,  
                   "mainData": {  
                        "oldValue": null,  
                        "newValue": ""  
                   },  
                   "startDate": null,  
                   "endDate": null,  
                   "launchInNewWindow": {  
                        "oldValue": null,  
                        "newValue": false  
                   },  
                   "isTracked": {  
                        "oldValue": null,  
                        "newValue": false  
                   },  
                   "isReviewable": {  
                        "oldValue": null,  
                        "newValue": false  
                   },  
                   "linkRef": null,  
                   "url": null,  
                   "allowGuests": {  
                        "oldValue": null,  
                        "newValue": true  
                   },  
                   "allowObservers": {  
                        "oldValue": null,  
                        "newValue": true  
                   },  
                   "parentId": null,  
                   "extendedData": {  
                        "oldValue": null,  
                        "newValue": {  
                               
                        }  
                   },  
                   "adaptiveReleaseStatus": null,  
                   "isPartiallyVisible": {  
                        "oldValue": null,  
                        "newValue": false  
                   },  
                   "isMetadataSet": {  
                        "oldValue": null,  
                        "newValue": true  
                   },  
                   "attachedFilesCount": {  
                        "oldValue": null,  
                        "newValue": 0  
                   },  
                   "removedFilesCount": {  
                        "oldValue": null,  
                        "newValue": 0  
                   }  
              },  
              "eventTime": "2016-03-16T17:18:00.767Z",  
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
              "group": null,  
              "membership": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/1c430b729888417399937d0bf02fa98b/members/f902ceefcf8f41ae87570daa25158989",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.externalId": "perfadmin",  
                        "bb:user.id": "_88_1",  
                        "bb:course.id": "_170_1",  
                        "bb:course.externalId": "xsmall_000000001"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/f902ceefcf8f41ae87570daa25158989",  
                   "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/courses/1c430b729888417399937d0bf02fa98b",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Instructor"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": null  
                   "federatedSession": null  
         }]  
    }

