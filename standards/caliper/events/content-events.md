---
layout: post
title: "Content Events" 
categories: Standards
id: standards-caliper-events-content
author: Scott Hurrey
---

# Content Events

Blackboard Learn's Caliper Analytics stream emits a ContentEvent to cover a
plethora of use cases. Here is when a message will be sent:


### Content Item Created

| Object | Message Sent |
| ------ |:------------:|
| Folder | :heavy_check_mark: |
| Link | :heavy_check_mark: |
| LTI | :heavy_check_mark: |
| Assignment | :heavy_check_mark: |
| Forum |:heavy_check_mark:  |
| Content File Upload | :heavy_check_mark: |
| Test | :heavy_multiplication_x: |
| Document | :heavy_check_mark: |
| File Upload | :heavy_check_mark: |

### Content Item Updated (by member value)

The columns contain attributes of the Content Item. 

**Legend**

<i class="material-icons">done</i> - Changing this value emits a caliper event<br />
<i class="material-icons">close</i> - Changing this value does not emit a caliper event<br />
<i class="material-icons">remove</i> - This value is not applicable for this attribute<br />
<i class="material-icons">radio_button_unchecked</i> - This results in a ForumEvent<br />

|  Object               |  Name                                  |  URL                                     |  Des                                     |  Avl                                   |  Parm                                    |  Score                                   |  Due   Date                              |  Start Date                            |  End   Date                            |  Disc                                                    |  Grp                                     |  Inst                                    |  Qs                                      |
|-----------------------|----------------------------------------|------------------------------------------|------------------------------------------|----------------------------------------|------------------------------------------|------------------------------------------|------------------------------------------|----------------------------------------|----------------------------------------|----------------------------------------------------------|------------------------------------------|------------------------------------------|------------------------------------------|
|  Folder               |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">close</i>                   |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |                                          |
|  Link                 |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>    |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">close</i>                   |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |                                          |
|  LTI                  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>    |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>    |  <i   class="material-icons">close</i>   |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">radio_button_unchecked</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |
|  Assignment           |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">close</i>   |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">radio_button_unchecked</i>  |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>    |  <i   class="material-icons">remove</i>  |
|  Forum                | <i class="material-icons">done</i>     |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">close</i>   |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">close</i>                   |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |
|  Content File Upload  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">close</i>                   |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>    |  <i   class="material-icons">remove</i>  |
|  Test                 |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">close</i>   |  <i   class="material-icons">close</i>   |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">radio_button_unchecked</i>  |  <i   class="material-icons">close</i>   |  <i   class="material-icons">close</i>   |  <i   class="material-icons">close</i>   |
|  Document             |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">close</i>                   |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>    |  <i   class="material-icons">remove</i>  |
|  File Upload          |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">done</i>  |  <i   class="material-icons">close</i>                   |  <i   class="material-icons">remove</i>  |  <i   class="material-icons">done</i>    |  <i   class="material-icons">remove</i>  |
{: .striped}

### Content Item Deleted

| Object | Message Sent |
| ------ |:------------:|
| Folder | <i   class="material-icons">done</i>  |
| Link | <i   class="material-icons">done</i> |
| LTI | <i   class="material-icons">done</i>  |
| Assignment | <i   class="material-icons">done</i>  |
| Forum |<i   class="material-icons">done</i>   |
| Content File Upload | <i   class="material-icons">done</i>  |
| Test | <i   class="material-icons">done</i> |
| Document | <i   class="material-icons">done</i>  |
| File Upload | <i   class="material-icons">done</i>  |

OutcomeEvents are sent in bulk nightly. Here is some of the key data that is
associated with these events:

### ContentEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/content/id - the primary key for the content ID

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**membership.roles** - #Instructor

**action** - …/action#Created _**or**_ …/action#Updated _**or**_ …/action#Deleted

### Sample Payload

Here is a sample of what a payload might look like:

~~~ json
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
~~~