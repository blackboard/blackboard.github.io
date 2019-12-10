# Content Events
*Author: Scott Hurrey*  
*Categories: ['Caliper']*  
*Tags: ['developers', 'standards', 'caliper', 'ims', 'ims global', 'forumevent', 'contentevent', 'developer']*  
<hr />
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

**Legend**<br />
:heavy_check_mark: - Changing this value emits a caliper event<br />
:heavy_multiplication_x: - Changing this value does not emit a caliper event<br />
:heavy_minus_sign: - This value is not applicable for this attribute<br />
:curly_loop: - This results in a ForumEvent<br />

| Object | Name | URL | Desc | Avl | Parm | Score | Due Date | Start Date | End Date | Disc | Group | Inst | Qs |
| ------ |:----:|:---:|:----:|:---:|:----:|:-----:|:-------:|:---------:|:-------:|:----:|:-----:|:----:|:---------:|
| Folder | :heavy_check_mark: | :heavy_minus_sign: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_minus_sign: | :heavy_minus_sign: |
| Link | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_minus_sign: | :heavy_minus_sign: |
| LTI | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :curly_loop: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_minus_sign: |
| Assignment | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :curly_loop: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_minus_sign: |
| Forum |:heavy_check_mark:  | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_minus_sign: |
| Content File Upload | :heavy_check_mark: | :heavy_minus_sign:| :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign:  | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: |
| Test | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_check_mark: | :curly_loop: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_multiplication_x: |
| Document | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: |
| File Upload | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_minus_sign: | :heavy_check_mark: | :heavy_minus_sign: |

### Content Item Deleted

| Object | Message Sent |
| ------ |:------------:|
| Folder | :heavy_check_mark: |
| Link | :heavy_check_mark: |
| LTI | :heavy_check_mark: |
| Assignment | :heavy_check_mark: |
| Forum |:heavy_check_mark:  |
| Content File Upload | :heavy_check_mark: |
| Test | :heavy_check_mark: |
| Document | :heavy_check_mark: |
| File Upload | :heavy_check_mark: |

OutcomeEvents are sent in bulk nightly. Here is some of the key data that is
associated with these events:

## ContentEvent

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.@id** - …/content/id - the primary key for the content ID

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**membership.roles** - #Instructor

**action** - …/action#Created _**or**_ …/action#Updated _**or**_ …/action#Deleted

## Sample Payload

Here is a sample of what a payload might look like:
```
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
```
