# Caliper Metric Profiles
Caliper Metric Profiles provide a basic, consistent format for emitting and
consuming learning events regardless of the Learning Management System or
Educational Tool. These profiles leverage other IMS Global standards like LTI
in order to mesh interoperable tools and interoperable event data to allow for
the use of common tools across platforms with the added ability to analyze the
usage of that tool for all students regardless of the environment that student
originates from.

We also have documentation on the [specific events sent
](https://community.blackboard.com/docs/DOC-4408-blackboard-caliper-event-
guide)by Blackboard Learn,

The metric profiles are realized in the form of JSON for Linked Data (JSON-LD)
payloads containing a set of common objects, each with the ability to add
application-specific extended data objects. The profile defines a context for
the data and establishes the relationships between entities to define the
event and all of its supporting data. The specification defines these payloads
in such a way to allow for transport-compliant custom events like the
Blackboard Learn-specific ForumEvent, allowing any event store to be able to
accept and interpret these events, even if they are strictly defined in the
specification itself.

The overarching goal of these profiles is to encapsulate events and context in
a shared semantic model so there is consistency from event to event.

[![](https://community.blackboard.com/servlet/JiveServlet/downloadImage/102-29
62-4-100509/pastedImage_0.png)](https://community.blackboard.com/servlet/JiveS
ervlet/showImage/102-2962-4-100509/pastedImage_0.png)

Blackboard Learn was certified against the Caliper 1.0 specification in
October of 2015 for 5 metric profiles:

  * Session
  * Assessment
  * AssessmentItem
  * Assignable
  * Outcome

The specification defines a number of tool-specific profiles as well. An
example of this is the MediaEvent, which Blackboard worked closely with
Kaltura to implement in the context of the Kaltura LTI integration.

## JSON Syntax

A Caliper event is essentially a large JSON document, built in a defined
format, containing a specific set of data. The top level of this document
contains 9 defined objects and two Linked Data elements to illustrate what
data is expected.

**Object****Definition**

@context

Defines the short-hand names used throughout the Caliper event.

@type

Defines the type of event being sent.

actor

The entity performing the event.

action

What the actor actually did.

object

What the action was performed on.

generated

The result of the action.

eventTime

The ISO-compliant date and time that the event happened.

edApp

The application reporting the event.

group

The environment that the event took place in, e.g. a course. Can be nested.

membership

Information about the relationship between the actor and the group.

federatedSession

A unique identifier used to determine what system/tool is reporting data.

### Sample Caliper Event

    {
        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@type": "http://purl.imsglobal.org/caliper/v1/AssignableEvent",
        "actor":{
            "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/users/fd6adc5678514c25bd2569c266c9bf65",
           "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
           "@type":"http://purl.imsglobal.org/caliper/v1/lis/Person",
           "extensions":{
              "bb:user.id":"_50_1",
              "bb:user.externalId":"demo-39"
           },
        },
        "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed",
        "object":{
            "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/gradableItems/_7219_1",
           "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
           "@type”: "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource",
           "name": ”Chapter 1 Test",
           "dateToSubmit":"2016-07-28T13:04:50.963Z",
           "maxAttempts":0,
           "maxSubmits":0,
           "maxScore":25
        },
        "generated”:{
           "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
           "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/gradableItems/_7219_1/attempts/_13000_1",
           "@type":"http://purl.imsglobal.org/caliper/v1/Attempt",
          "assignable": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/gradableItems/_7219_1",
           "actor":"https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/users/fd6adc5678514c25bd2569c266c9bf65",
           "count":1,
           "startedAtTime":"2016-06-02T15:25:47.815Z"
        },
        "eventTime":"2016-06-02T15:25:47.815Z",
        "edApp":{
            "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
           "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/applications/learn",
           "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication”
        },
        "group":{
           "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/courses/f85ce1b9dfc740968fd91a38d4b20817",
          "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
          "@type": "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering",
          "extensions":{
              "bb:course.id":"_2972_1"
           },
          "courseNumber":"GAT-1"
        },
        "membership":{
           "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
           "@id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/courses/f85ce1b9dfc740968fd91a38d4b20817/members/fd6adc5678514c25bd2569c266c9bf65",
           "@type":"http://purl.imsglobal.org/caliper/v1/lis/Membership",
           "extensions":{
              "bb:user.externalId":"demo-39",
              "bb:user.id":"_50_1",
              "bb:course.id":"_2972_1",
              "bb:course.externalId":"GAT-1"
           },
           "member": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/users/fd6adc5678514c25bd2569c266c9bf65",
           "organization": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/courses/f85ce1b9dfc740968fd91a38d4b20817",
           "roles": [http://purl.imsglobal.org/vocab/lis/v2/membership#Learner],
           "status":"http://purl.imsglobal.org/vocab/lis/v2/status#Active"
        },
        "federatedSession": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/881b88b1-bd43-41b1-a38e-6c643f1fe54b/sessions/21622015C7998FEA7A7824F053D514C8"
     } 

## Caliper Event Envelopes

As one might imagine, there can be a huge amount of events being triggered and
reported at any given time, and so the Caliper specification includes the
concept of an event envelope. This envelope contains three entities:

  * sensor - The sensor is the library creating and sending the events.
  * sendTime - This is the ISO-compliant date and time the envelope was sent.
  * data - an array containing one or more Caliper events.

