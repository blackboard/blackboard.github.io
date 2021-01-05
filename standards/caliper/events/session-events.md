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

**action** - LoggedIn _**or**_ …/action#LoggedOut

### SessionEvent -Timeout

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called bb:user.externalId with the batch_uid for the user

**object.actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**action** - TimedOut

### Sample Payload

~~~ json
{
  "@context": "http://purl.imsglobal.org/ctx/caliper/v1p1",
  "type": "SessionEvent",
  "id": "f8c984e2-de73-4c0b-8183-779ab4149422",
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
      "bb:request.headers.ipAddress": "98.10.178.27"
    }
  },
  "target": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03",
    "type": "DigitalResource",
    "creators": [],
    "learningObjectives": [],
    "keywords": []
  },
  "eventTime": "2020-12-24T21:38:05.645Z",
  "edApp": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/applications/learn",
    "type": "SoftwareApplication",
    "extensions": {
      "bb:request.headers.agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36",
      "bb:request.headers.ipAddress": "98.10.178.27"
    }
  },
  "federatedSession": {
    "startedAtTime": "2020-12-24T21:38:05.645Z",
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/sessions/B287CEC440C99337012096F677684697",
    "type": "LtiSession",
    "name": "B287CEC440C99337012096F677684697",
    "dateCreated": "2020-12-24T21:38:05.645Z",
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