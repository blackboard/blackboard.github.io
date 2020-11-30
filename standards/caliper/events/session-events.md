---
layout: post
title: "Session Events" 
categories: Standards
id: standards-caliper-events-sessions
author: Scott Hurrey
---
# Session Events

Blackboard Learn's Caliper Analytics stream emits a SessionEvent to cover
three use cases:

  * **User logs in**
  * **User logs out**
  * **User's session times out**

Here is some of the key data that is associated with these events:

### SessionEvent - Login/Logout

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**action** - …/action#LoggedIn _**or**_ …/action#LoggedOut

### SessionEvent -Timeout

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**action** - …/action#TimedOut

### Sample Workflow

Here is a sample of what a workflow might look like:

  1. [User Logs In](#1-user-logs-in)
  2. [User Logs Out](#2-user-logs-out)
  3. [Session Times Out](#3-session-times-out)

### 1. User Logs In

~~~ json
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:31:13.439Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/SessionEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/701cbe9a4acd4c31a91af84f25b2f19f",  
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
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#LoggedIn",  
              "object": {  
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
              "target": {  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/DigitalResource",  
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
                   "version": null  
              },  
              "generated": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/CE26A89D1ED944324EBD52E0E6192490",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Session",  
                   "name": "CE26A89D1ED944324EBD52E0E6192490",  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": "2015-12-10T21:18:57.358Z",  
                   "dateModified": null,  
                   "actor": {  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/701cbe9a4acd4c31a91af84f25b2f19f",  
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
                   "startedAtTime": "2015-12-10T21:18:57.358Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "eventTime": "2015-12-10T21:18:57.358Z",  
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
              "membership": null,  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/CE26A89D1ED944324EBD52E0E6192490"  
         }]  
    }
~~~

[Return to top](#session-events)

### 2. User Logs Out

~~~ json
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:32:44.239Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/SessionEvent",  
              "actor": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/701cbe9a4acd4c31a91af84f25b2f19f",  
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
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#LoggedOut",  
              "object": {  
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
              "target": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/CE26A89D1ED944324EBD52E0E6192490",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Session",  
                   "name": "CE26A89D1ED944324EBD52E0E6192490",  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": "2015-12-10T21:20:29.826Z",  
                   "actor": {  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/701cbe9a4acd4c31a91af84f25b2f19f",  
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
                   "startedAtTime": "2015-12-10T21:20:29.826Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "generated": null,  
              "eventTime": "2015-12-10T21:20:29.826Z",  
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
              "membership": null,  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/CE26A89D1ED944324EBD52E0E6192490"  
         }]  
    }  
~~~

[Return to top](#session-events)

### 3. Session Times Out
~~~ json
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T19:35:44.159Z",  
         "data": [{  
              "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
              "@type": "http://purl.imsglobal.org/caliper/v1/SessionEvent",  
              "actor": {  
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
              "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#TimedOut",  
              "object": {  
                   "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/62AF2230B2921CCE4E7AA17139839CB1",  
                   "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                   "@type": "http://purl.imsglobal.org/caliper/v1/Session",  
                   "name": "62AF2230B2921CCE4E7AA17139839CB1",  
                   "description": null,  
                   "extensions": {  
                          
                   },  
                   "dateCreated": null,  
                   "dateModified": "2015-12-10T19:23:34.424Z",  
                   "actor": {  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/users/326fea77d4c441fc876022e6c951b774",  
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
                   "startedAtTime": "2015-12-10T19:23:34.424Z",  
                   "endedAtTime": null,  
                   "duration": null  
              },  
              "target": null,  
              "generated": null,  
              "eventTime": "2015-12-10T19:23:34.424Z",  
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
              "membership": null,  
              "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/df1b6234-73e8-45a4-b953-4066760dfbda/sessions/62AF2230B2921CCE4E7AA17139839CB1"  
         }]  
    }
~~~

[Return to top](#session-events)
