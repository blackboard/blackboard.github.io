# LTI Events
*Author: Scott Hurrey*  
*Categories: ['Caliper']*  
*Tags: ['lti', 'developers', 'standards', 'caliper', 'ims', 'ims global', 'ltievent', 'developer']*  
<hr />
Blackboard Learn's Caliper Analytics stream emits an LTIEvent when any user:

  * **Clicks an LTI link**
  * **Returns from an LTI link**

Here is some of the key data that is associated with these events:

## LTIEvent

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

**object.launchUrl** - URL of the LTI Provider

**object.launchParameters** - name/value pairs passed

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**action** - …/action#LTILaunch _**or**_ …/action#LTILaunchReturn

## Sample Workflow

Here is a sample of what a workflow might look like:

  1. [User Clicks LTI Link](#1-user-clicks-lti-link)
  2. [User Returns From LTI Tool](#2-user-returns-from-lti-tool)

### 1. User Clicks LTI Link
```
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:31:13.439Z",  
         "data": [{  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/LTIEvent",  
              "actor": {  
                   "@id": "fake://cloud.bb/v1/sites/site1234/users/user1_uuid",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_1_2",  
                        "bb:user.externalId": "batchuid-user1"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#LTILaunch",  
              "object": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/LTILaunchInfo",  
                   "@id": "https://example.edu/launch/launch1234",  
                   "launchUrl": "https://example.edu/launch/launch1234",  
                   "launchParameters": {  
                        "resource_linkid": "link1234",  
                        "blah": "blah"  
                   },  
                   "customParameters": {  
                        "custom_foo": "foo",  
                        "custom_bar": "bar"  
                   }  
              },  
              "target": null,  
              "generated": null,  
              "eventTime": "2016-01-14T20:54:42.802Z",  
              "edApp": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "fake://cloud.bb/v1/sites/site1234",  
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
                   "@id": "fake://cloud.bb/v1/sites/site1234/courses/course123_uuid/members/user1_uuid",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "fake://cloud.bb/v1/sites/site1234/users/user1_uuid",  
                   "organization": "fake://cloud.bb/v1/sites/site1234/courses/course123_uuid",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "session123"  
         }]  
    }
```

[Return to top](#lti-events)

### 2. User Returns From LTI Tool
```
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:31:13.439Z",  
         "data": [{  
              "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
              "@type": "http://caliper.blackboard.com/caliper/v1/LTIEvent",  
              "actor": {  
                   "@id": "fake://cloud.bb/v1/sites/site1234/users/user1_uuid",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                        "bb:user.id": "_1_2",  
                        "bb:user.externalId": "batchuid-user1"  
                   },  
                   "dateCreated": null,  
                   "dateModified": null  
              },  
              "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#LTILaunchReturn",  
              "object": {  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/LTILaunchReturnInfo",  
                   "@id": "https://example.edu/launchReturnlaunch1234",  
                   "destinationUrl": "https://example.edu/linkIdlink1234",  
                   "linkId": "link1234",  
                   "launchTime": "2016-01-14T21:00:09.436Z"  
              },  
              "target": null,  
              "generated": null,  
              "eventTime": "2016-01-14T21:00:09.436Z",  
              "edApp": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "fake://cloud.bb/v1/sites/site1234",  
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
                   "@id": "fake://cloud.bb/v1/sites/site1234/courses/course123_uuid/members/user1_uuid",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                   "name": null,  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": null,  
                   "member": "fake://cloud.bb/v1/sites/site1234/users/user1_uuid",  
                   "organization": "fake://cloud.bb/v1/sites/site1234/courses/course123_uuid",  
                   "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                   "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
              },  
              "federatedSession": "session123"  
         }]  
    }
```

[Return to top](#lti-event)

