---
layout: post
title: "Caliper Metric Profiles"
categories: Standards
id: caliper-gs-metric_profiles
author: Scott Hurrey
---

# Caliper Metric Profiles

Caliper Metric Profiles provide a basic, consistent format for emitting and
consuming learning events regardless of the Learning Management System or
Educational Tool. These profiles leverage other IMS Global standards like LTI
in order to mesh interoperable tools and interoperable event data to allow for
the use of common tools across platforms with the added ability to analyze the
usage of that tool for all students regardless of the environment that student
originates from.

We also have documentation on the [specific events sent](/caliper/events/event-guide) by Learn,

The metric profiles are realized in the form of JSON for Linked Data (JSON-LD)
payloads containing a set of common objects, each with the ability to add
application-specific extended data objects. The profile defines a context for
the data and establishes the relationships between entities to define the
event and all of its supporting data. The specification defines these payloads
in such a way to allow for transport-compliant custom events like the
Learn-specific ForumEvent, allowing any event store to be able to
accept and interpret these events, even if they are strictly defined in the
specification itself.

The overarching goal of these profiles is to encapsulate events and context in
a shared semantic model so there is consistency from event to event.

![Caliper Outcome Profile](/assets/img/caliper-metric-profiles-1.png)

Learn supports the following defined metric profiles:

- Session
- Assessment
- Assignable
- Grade

The specification defines a number of tool-specific profiles as well. An
example of this is the MediaEvent, which Anthology worked closely with
Kaltura to implement in the context of the Kaltura LTI integration.

## JSON Syntax

A Caliper event is essentially a large JSON document, built in a defined
format, containing a specific set of data. The top level of this document
contains 9 defined objects and two Linked Data elements to illustrate what
data is expected.

### Objects

| Object           | Description                                                                                                                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| @context         | Defines the short-hand names used throughout the Caliper event.                                                                                                                                 |
| type             | Defines the type of event being sent.                                                                                                                                                           |
| actor            | The entity performing the event.                                                                                                                                                                |
| action           | What the actor actually did.                                                                                                                                                                    |
| object           | What the action was performed on.                                                                                                                                                               |
| target           | An entity that represents a particular segment or location within the object.                                                                                                                   |
| generated        | The result of the action.                                                                                                                                                                       |
| eventTime        | The ISO-compliant date and time that the event happened.                                                                                                                                        |
| edApp            | The application reporting the event.                                                                                                                                                            |
| group            | The environment that the event took place in, e.g. a course. Can be nested.                                                                                                                     |
| membership       | Information about the relationship between the actor and the group.                                                                                                                             |
| federatedSession | A unique identifier used to determine what system/tool is reporting data. If the event occurs within the context of an LTI Tool Launch, the actor's tool consumer LtiSession may be referenced. |
| session          | The user's current session                                                                                                                                                                      |

### Sample Caliper Event

```json
{
  "sensor": "a118bba8-5378-4533-899b-8862ac59db03",
  "sendTime": "2020-12-24T17:38:16.580Z",
  "dataVersion": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "data": [
    {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
      "type": "SessionEvent",
      "id": "53d8542f-c4ff-4100-b2a4-1f8e035f0439",
      "actor": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
        "type": "Person",
        "extensions": {
          "bb:user.id": "_1_1",
          "bb:user.externalId": "administrator"
        }
      },
      "action": "LoggedIn",
      "object": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/applications/learn",
        "type": "SoftwareApplication",
        "extensions": {
          "bb:request.headers.agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36",
          "bb:request.headers.ipAddress": "186.28.208.123"
        }
      },
      "target": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03",
        "type": "DigitalResource",
        "creators": [],
        "learningObjectives": [],
        "keywords": []
      },
      "eventTime": "2020-12-24T17:38:09.076Z",
      "edApp": {
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/applications/learn",
        "type": "SoftwareApplication",
        "extensions": {
          "bb:request.headers.agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36",
          "bb:request.headers.ipAddress": "186.28.208.123"
        }
      },
      "federatedSession": {
        "startedAtTime": "2020-12-24T17:38:09.076Z",
        "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/sessions/0356052DAA966AA071787F54DBFEB1B1",
        "type": "LtiSession",
        "name": "0356052DAA966AA071787F54DBFEB1B1",
        "dateCreated": "2020-12-24T17:38:09.076Z",
        "extensions": {
          "bb:request.headers.agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
        },
        "user": {
          "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
          "type": "Person",
          "extensions": {
            "bb:user.id": "_1_1",
            "bb:user.externalId": "administrator"
          }
        }
      },
      "extensions": {}
    }
  ]
}
```

### Caliper Event Envelopes

As one might imagine, there can be a huge amount of events being triggered and
reported at any given time, and so the Caliper specification includes the
concept of an event envelope. This envelope contains three entities:

- sensor - The sensor is the library creating and sending the events.
- sendTime - This is the ISO-compliant date and time the envelope was sent.
- data - an array containing one or more Caliper events.
