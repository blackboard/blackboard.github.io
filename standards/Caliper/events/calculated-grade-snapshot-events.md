---
layout: post
title: "Calculated grade snapshot events" 
categories: Standards
id: standards-caliper-events-calculated-grade-snapshots
author: Scott Hurrey
---

# Calculated grade snapshot events

Blackboard Learn's Caliper Analytics stream emits a CalculatedGradeSnapshotEvent nightly for any grade that is recalculated.

Here is some of the key data that is associated with these events:

### CalculatedGradeSnapshotEvent

**object.course.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**object.itemId** - the primary key for the calculated grade column

**user.id** - contains a unique ID of the user (the ID is known to Bb)

**object.score** - score provided

**object.isCourseGrade** - true if final grade

**user.extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

**action** - …/action#GradeCalculated

### Sample Payload

Here is a sample of what a payload might look like:

~~~ json
    {  
         "sensor": "df1b6234-73e8-45a4-b953-4066760dfbda",  
         "sendTime": "2015-12-10T21:31:13.439Z",  
         "data": [{  
                   "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                   "@type": "http://caliper.blackboard.com/caliper/v1/CalculatedGradeSnapshotEvent",  
                   "actor": {  
                        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/applications/learn",  
                        "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",  
                        "name": null,  
                        "description": null,  
                        "extensions": {  
                               
                        },  
                        "dateCreated": null,  
                        "dateModified": null  
                   },  
                   "action": "http://caliper.blackboard.com/vocab/caliper/v1/action#GradeCalculated",  
                   "object": {  
                        "@context": "http://caliper.blackboard.com/ctx/caliper/v1/Context",  
                        "@type": "http://caliper.blackboard.com/caliper/v1/CalculatedGrade",  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/gradableItems/_1360_1/calculatedGrade/156525",  
                        "itemId": "_1360_1",  
                        "scorePossible": 0.0,  
                        "score": null,  
                        "isCourseGrade": true,  
                        "synVersion": 156525,  
                        "user": {  
                             "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/users/1ea8c4bd28424309a0ef5c04298af019",  
                             "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                             "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",  
                             "name": null,  
                             "description": null,  
                             "extensions": {  
                                  "bb:user.id": "_8510_1",  
                                  "bb:user.externalId": "tbrady"  
                             },  
                             "dateCreated": null,  
                             "dateModified": null  
                        },  
                        "course": {  
                             "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/courses/47739d59c68444a98856210a8f36f6f1",  
                             "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                             "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",  
                             "name": null,  
                             "description": null,  
                             "extensions": {  
                                  "bb:course.id": "_491_1"  
                             },  
                             "dateCreated": null,  
                             "dateModified": null,  
                             "courseNumber": "CS-101",  
                             "academicSession": null,  
                             "subOrganizationOf": null  
                        }  
                   },  
                   "target": null,  
                   "generated": null,  
                   "eventTime": "2016-01-12T09:00:00.358Z",  
                   "edApp": {  
                        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",  
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/applications/learn",  
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
                        "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/courses/47739d59c68444a98856210a8f36f6f1/members/1ea8c4bd28424309a0ef5c04298af019",  
                        "@type": "http://purl.imsglobal.org/caliper/v1/lis/Membership",  
                        "name": null,  
                        "description": null,  
                        "extensions": {  
                               
                        },  
                        "dateCreated": null,  
                        "dateModified": null,  
                        "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/users/1ea8c4bd28424309a0ef5c04298af019",  
                        "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/b56c1e20-78eb-4a50-941e-9658d93464ae/courses/47739d59c68444a98856210a8f36f6f1",  
                        "roles": ["http://purl.imsglobal.org/vocab/lis/v2/membership#Learner"],  
                        "status": "http://purl.imsglobal.org/vocab/lis/v2/status#Active"  
                   },  
                   "federatedSession": null  
              }  
         ]  
    }
~~~