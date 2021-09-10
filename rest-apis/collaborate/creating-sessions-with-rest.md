---
layout: post
title: "Creating a session with REST that shows up in scheduler"
id: rest_apis-collaborate-session_with_rest_scheduler
categories: Collaborate
tipue_search_active: true
---

# Creating a Collaborate session with REST API that shows up in the Collaborate scheduler in a Blackboard Learn course

We have receive requests about this plenty of times, however we think that when this happens it is better to just write a good article that will help everyone to perform this task.

The main issue is: "What if I need to create sessions using REST API but I need them to show up on a specific course+user(instructor) scheduler?"

We will view the steps to perform this and enable you, the developer on doing this as fast and easy as possible.

## What do you need?

1.  Collaborate PRODUCTION LTI credentials (The SAME that are configured on your collaborate building block in your production environment, unfortunately techpreview does not have access to a visual scheduler) if you need access to your credentials, please [review this link](https://help.blackboard.com/Collaborate/Ultra/Administrator/Integrations/Collaborate_in_Blackboard_Learn_SaaS#get-your-credentials_OTP-1)

> When requesting production credentials, please make sure to ask for the same credentials on your Production b2, this is VERY important, our collaborate team when described on the case as "REST API credentials" they provide different credentials than the ones used on the LTI integration.

2.  I am using POSTMAN but you can use any programming language that is ready for you to query
3.  (**Optional**) Learn REST API integration credentials **are NOT a must** since you should be able to use our API to query the information directly from your browser, however if you want to do this automatically, you need them.
4.  If you are like me and you are testing everything in POSTMAN then a notepad (I use Sublime 😬) would be helpful

## Start with Blackboard Learn

Please make sure that your integration between Blackboard Learn and Blackboard Collaborate are correct, you can review [this link](https://help.blackboard.com/Collaborate/Ultra/Administrator/Integrations/Collaborate_in_Blackboard_Learn_SaaS#configure-the-blackboard-collaborate-ultra-building-block_OTP-2) to make sure they are correct, make sure to test your connection and it returns a successful message.

Want to view the Learn api? [You may find it here](/rest-apis/learn/getting-started/api)

### Step 1: Create a course, on Blackboard Learn

This can be done using Blackboard Learn REST API (You cannot perform POST on browser [without a correct configuration](/rest-apis/learn/getting-started/registry)), but it is also valid if it is created using the GUI, if you are unfamiliar on how to create a course using the GUI, please [review this link](https://help.blackboard.com/Learn/Administrator/SaaS/Courses)

> The URLs used here is just an example and not a public instance, it may be decommissioned at any time without any notice. If you need an instance to play around with our API please review [this link](/rest-apis/learn/sandbox/developer-ami)

I already created my course and called it "CourseTest2" and performed a GET call on Learn to get the information about that specific course (Are you new to Learn REST API? Please review [this documentation](https://docs.blackboard.com/learn/rest/getting-started/first-steps))

- Using: POST /learn/api/public/v3/courses

Learn Server responds with 200:

```json
        {
            "id": "_4_1",
            "uuid": "5e2245e9928142a4ade61c474cd7345f",
            "externalId": "CourseTest2",
            "dataSourceId": "_2_1",
            "courseId": "CourseTest2",
            "name": "CourseTest2",
            "description": "CourseTest2",
            "created": "2021-08-24T21:23:51.795Z",
            "organization": false,
            "ultraStatus": "Classic",
            "allowGuests": true,
            "readOnly": false,
            "availability": {
                "available": "Yes",
                "duration": {
                    "type": "Continuous"
                }
            },
            "enrollment": { d
                "type": "InstructorLed"
            },
            "locale": {
                "force": false
            },
            "externalAccessUrl": "https://dave3900.hopto.org/webapps/blackboard/execute/courseMain?course_id=_4_1&sc=",
            "guestAccessUrl": "https://dave3900.hopto.org/webapps/blackboard/execute/courseMain?course_id=_4_1&sc="
        }
```

### Step 2: Let's create a user

The user can be created also on the Blackboard Learn GUI, when querying the API for the information it should return a message like this, this user can also be created using our Learn API.

- Using: POST ​/learn​/api​/public​/v1​/users

```json
{
            "id": "_8_1",
            "uuid": "bdb444a94feb49ce9582b2e201ec4014",
            "externalId": "davetest2",
            "dataSourceId": "_2_1",
            "userName": "davetest2",
            "educationLevel": "Unknown",
            "gender": "Unknown",
            "created": "2021-08-24T21:23:30.337Z",
            "modified": "2021-08-24T21:23:30.337Z",
            "institutionRoleIds": [
                "STAFF"
            ],
            "systemRoleIds": [
                "User"
            ],
            "availability": {
                "available": "Yes"
            },
            "name": {
                "given": "DaveSecond",
                "family": "HerreraSecond"
            },
            "avatar": {
                "viewUrl": "https://dave3900.hopto.org/public/v1/users/_8_1/avatar",
                "source": "Default"
            }
        },
```

### Step 3: Make the user an instructor in the course

You need to enroll the user that was created on the course that we just created.

- Using PUT /learn/api/public/v1/courses/{courseId}/users/{userId}

```json
{
  "results": [
    {
      "id": "_3_1",
      "userId": "_8_1",
      "courseId": "_4_1",
      "dataSourceId": "_2_1",
      "created": "2021-08-24T21:24:21.514Z",
      "modified": "2021-08-24T21:24:21.514Z",
      "availability": {
        "available": "Yes"
      },
      "courseRoleId": "Instructor",
      "lastAccessed": "2021-08-24T21:56:34.400Z"
    }
  ]
}
```

You can double check that the user is correctly enrolled in the Learn GUI or you can enroll the user on the GUI.

Up here everything should've been pretty normal/simple.

Let's summarize:

we have:

1.  Created a Course
2.  Created a User
3.  Enrolled the user in the course

## Let's now move on to Collaborate API

Now we need to perform several steps:

1.  Create a context with the Learn course information
2.  Create a user with the Learn user information
3.  Create a Session
4.  Relate the Session with the context
5.  Generate the URL
6.  Check Learn

Want to view the collaborate api? [You may find it here](/rest-apis/collaborate/api)

### Step 1: Create a Context on Collaborate REST API

What is a context? Well, it is more like a container, it is not a course BUT it can be a course, organization, etc. A context is just a way to group information.

How does the information from a course from Blackboard Learn map with Collaborate Context?

- using [POST /contexts](https://app.swaggerhub.com/apis-docs/BBDN/collaborate-api/1.0.0#/contexts/post_contexts)

**Like this**

> You can use this as a template on your body

```json
{
  "name": "<courseName>",
  "title": "<courseName>",
  "label": "<courseID>",
  "courseRoomEnabled": "<boolean>",
  "extId": "<CourseUUID>"
}
```

So, following our example, our request should look like this: please check that the extId maps to the Blackboard Learn UUID.

```json
{
  "name": "CourseTest2",
  "title": "CourseTest2",
  "label": "CourseTest2",
  "courseRoomEnabled": true,
  "extId": "5e2245e9928142a4ade61c474cd7345f"
}
```

Once you have sent the request, if everything is correct it should return 200 and a response like this:

```json
{
  "id": "b407697391c74daba90e4d78ef3e32ba",
  "name": "CourseTest2",
  "label": "CourseTest2",
  "title": "CourseTest2",
  "courseRoomEnabled": true,
  "extId": "5e2245e9928142a4ade61c474cd7345f"
}
```

### Step 2: Creating a user in Collaborate

Collaborate users are an interesting bit, those are users expected to be part of a session with a specific role, but they do not have any type of role within an admin scheduler, the user needs to be created in order to know who can _view_ the sessions and manage them.

> There has always been a confusion about users in Collaborate, the users created here are NOT admins, supervisors and have NOTHING to do with the Collaborate scheduler. If you are having issues and need for example to remove massively admin users from your scheduler, please feel free and create a behind the Blackboard ticket

So we sent a request that looks like this (You can use this a body template):

- using: [POST /users](https://app.swaggerhub.com/apis-docs/BBDN/collaborate-api/1.0.0#/users/post_users)

```json
{
  "firstName": "firstName",
  "lastName": "lastName",
  "displayName": "firstName + lastName",
  "role": "none", // Default
  "deleted": false, // Default
  "created": "2021-08-24T20:37:21.231Z",
  "modified": "2021-08-24T20:37:21.231Z",
  "attributes": {
    "extUsername": "username"
  },
  "extId": "learnUserUUID",
  "userType": "LTI",
  "asrSupported": false
}
```

Example with our data:

```json
{
  "firstName": "DaveSecond",
  "lastName": "HerreraSecond",
  "displayName": "DaveSecond HerreraSecond",
  "role": "none",
  "deleted": false,
  "created": "2021-08-24T20:37:21.231Z",
  "modified": "2021-08-24T20:37:21.231Z",
  "attributes": {
    "extUsername": "davetest2"
  },
  "extId": "bdb444a94feb49ce9582b2e201ec4014",
  "userType": "LTI",
  "asrSupported": false
}
```

If the request was correct, it may return 200:

```json
{
  "firstName": "DaveSecond",
  "lastName": "HerreraSecond",
  "displayName": "DaveSecond HerreraSecond",
  "role": "none",
  "deleted": false,
  "created": "2021-08-24T21:40:23.156Z",
  "modified": "2021-08-24T21:40:23.156Z",
  "attributes": {
    "extUsername": "davetest2"
  },
  "id": "65e0af54f79b4156bfe463053ca91b30",
  "extId": "bdb444a94feb49ce9582b2e201ec4014",
  "userType": "LTI",
  "asrSupported": false
}
```

### Step 3: Creating a session

A session is pretty straight forward with the API, you may [review this link](/rest-apis/collaborate/session-definitions) for more information

- using [POST /Sessions](https://app.swaggerhub.com/apis-docs/BBDN/collaborate-api/1.0.0#/sessions/post_sessions)

```json
{
  "name": "newSession-2",
  "startTime": "2021-08-24T22:15:00.000Z",
  "endTime": "2021-08-24T23:15:00.000Z",
  "boundaryTime": 15,
  "allowGuest": true,
  "noEndDate": false,
  "showProfile": false,
  "participantCanUseTools": true,
  "canShareVideo": true,
  "canShareAudio": true,
  "canPostMessage": true,
  "canAnnotateWhiteboard": true,
  "mustBeSupervised": false,
  "openChair": false,
  "raiseHandOnEnter": false,
  "allowInSessionInvitees": true,
  "canDownloadRecording": false,
  "createdTimezone": "America/Bogota",
  "occurrenceType": "S",
  "sessionCategory": "default",
  "courseRoomEnabled": false,
  "ownerName": "davey_test_site-lti-development",
  "ltiParticipantRole": "participant",
  "guestRole": "participant",
  "privateChatRestricted": false,
  "telephonyEnabled": true,
  "editingPermission": "reader",
  "active": true,
  "joined": false,
  "bpdsSupported": true,
  "persistentPinsEnabled": true,
  "messagingStreamEnabled": false,
  "turnGlobalAccelerator": false,
  "largeSessionEnable": false,
  "canEnableLargeSession": true,
  "anonymizeRecordings": false,
  "integrationAttendance": {
    "enabled": false
  },
  "profanityFilterEnabled": false,
  "launchComponent": "cla_cloud"
}
```

Once this was sent, this is the response when 200 is the message:

```json
{
  "id": "836e63663dd149fe881f14538c4adca4",
  "name": "newSession-2",
  "startTime": "2021-08-24T22:15:00.000Z",
  "endTime": "2021-08-24T23:15:00.000Z",
  "boundaryTime": 15,
  "guestUrl": "https://us.bbcollab.com/guest/4bf6dd3704ff471abdb79677f0d72578",
  "allowGuest": true,
  "noEndDate": false,
  "showProfile": false,
  "participantCanUseTools": true,
  "canShareVideo": true,
  "canShareAudio": true,
  "canPostMessage": true,
  "canAnnotateWhiteboard": true,
  "mustBeSupervised": false,
  "openChair": false,
  "raiseHandOnEnter": false,
  "allowInSessionInvitees": true,
  "canDownloadRecording": false,
  "createdTimezone": "America/Bogota",
  "occurrenceType": "S",
  "created": "2021-08-24T21:45:01.631Z",
  "modified": "2021-08-24T21:45:01.631Z",
  "sessionCategory": "default",
  "courseRoomEnabled": false,
  "ownerName": "davey_test_site-lti-development",
  "ltiParticipantRole": "participant",
  "guestRole": "participant",
  "privateChatRestricted": false,
  "telephonyEnabled": true,
  "telephonyPhoneNumber": "+1-571-392-7650",
  "editingPermission": "reader",
  "active": false,
  "joined": false,
  "bpdsSupported": true,
  "persistentPinsEnabled": true,
  "messagingStreamEnabled": false,
  "turnGlobalAccelerator": false,
  "largeSessionEnable": false,
  "canEnableLargeSession": true,
  "anonymizeRecordings": false,
  "integrationAttendance": {
    "enabled": false
  },
  "profanityFilterEnabled": false,
  "launchComponent": "cla_cloud"
}
```

### Step 4: Relate the session to the context

This method returns 200 ONLY if the request was correct, it does not return anything else.

- Using: [POST /contexts/:contextId/sessions](https://app.swaggerhub.com/apis-docs/BBDN/collaborate-api/1.0.0#/contexts/post_contexts__contextId__sessions)

```json
{
  "Contextid": "b407697391c74daba90e4d78ef3e32ba",
  "Sessionid": "836e63663dd149fe881f14538c4adca4"
}
```

### Step 5: Launch URL

This is the last step! we need to generate the launch url so learn can grab it and display it

- Using: [POST /sessions/{sessionId}/url](https://app.swaggerhub.com/apis-docs/BBDN/collaborate-api/1.0.0#/sessions/post_sessions__sessionId__url)

This is an example of the body, however it may be overwhelming (But those are all the options available at the moment)

```json
{
  "returnUrl": "<string>",
  "reconnectUrl": "<string>",
  "locale": "<string>",
  "launchingRole": "<string>",
  "editingPermission": "<string>",
  "originDomain": "<string>",
  "user": {
    "id": "<string>",
    "lastName": "<string>",
    "firstName": "<string>",
    "displayName": "<string>",
    "extId": "<string>",
    "email": "<string>",
    "avatarUrl": "<string>",
    "created": {
      "equalNow": "<boolean>",
      "centuryOfEra": "<long>",
      "era": "<long>",
      "hourOfDay": "<long>",
      "afterNow": "<boolean>",
      "millis": "<long>",
      "beforeNow": "<boolean>",
      "dayOfYear": "<long>",
      "yearOfEra": "<long>",
      "chronology": {
        "zone": {
          "id": "<string>",
          "fixed": "<boolean>"
        }
      },
      "minuteOfHour": "<long>",
      "dayOfMonth": "<long>",
      "monthOfYear": "<long>",
      "secondOfDay": "<long>",
      "minuteOfDay": "<long>",
      "weekyear": "<long>",
      "year": "<long>",
      "yearOfCentury": "<long>",
      "zone": {
        "id": "<string>",
        "fixed": "<boolean>"
      },
      "dayOfWeek": "<long>",
      "weekOfWeekyear": "<long>",
      "millisOfSecond": "<long>",
      "millisOfDay": "<long>",
      "secondOfMinute": "<long>"
    },
    "modified": {
      "equalNow": "<boolean>",
      "centuryOfEra": "<long>",
      "era": "<long>",
      "hourOfDay": "<long>",
      "afterNow": "<boolean>",
      "millis": "<long>",
      "beforeNow": "<boolean>",
      "dayOfYear": "<long>",
      "yearOfEra": "<long>",
      "chronology": {
        "zone": {
          "id": "<string>",
          "fixed": "<boolean>"
        }
      },
      "minuteOfHour": "<long>",
      "dayOfMonth": "<long>",
      "monthOfYear": "<long>",
      "secondOfDay": "<long>",
      "minuteOfDay": "<long>",
      "weekyear": "<long>",
      "year": "<long>",
      "yearOfCentury": "<long>",
      "zone": {
        "id": "<string>",
        "fixed": "<boolean>"
      },
      "dayOfWeek": "<long>",
      "weekOfWeekyear": "<long>",
      "millisOfSecond": "<long>",
      "millisOfDay": "<long>",
      "secondOfMinute": "<long>"
    }
  }
}
```

I used instead this:

```json
{
  "returnUrl": "<string>",
  "reconnectUrl": "<string>",
  "locale": "<string>",
  "launchingRole": "<string>",
  "editingPermission": "<string>",
  "originDomain": "<string>",
  "user": {
    "id": "<string>",
    "lastName": "<string>",
    "firstName": "<string>",
    "displayName": "<string>",
    "extId": "<string>",
    "email": "<string>",
    "avatarUrl": "<string>"
  }
}
```

And this is what I sent:

```json
{
  "returnUrl": "dave3900.hopto.org",
  "reconnectUrl": "dave3900.hopto.org",
  "launchingRole": "moderator",
  "editingPermission": "writer",
  "originDomain": "dave3900.hopto.org",
  "user": {
    "id": "65e0af54f79b4156bfe463053ca91b30",
    "lastName": "HerreraSecond",
    "firstName": "DaveSecond",
    "displayName": "DaveSecond HerreraSecond",
    "extId": "bdb444a94feb49ce9582b2e201ec4014",
    "email": "davetest2test.com",
    "avatarUrl": "https://dave3900.hopto.org/public/v1/users/_8_1/avatar"
  }
}
```

When the request is correct, it returns 200 and a url:

```json
{
  "url": "https://us.bbcollab.com/launch/eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJiYkNvbGxhYkFwaSIsInN1YiI6ImJiQ29sbGFiQXBpIiwiZXhwIjoxNjI5ODQyMzI0LCJyZXNvdXJjZUFjY2Vzc1RpY2tldCI6eyJyZXNvdXJjZUlkIjoiMzBlYWVkYjVkMGIxNDYxN2JiZTc1NGU4YmYwZjU1OTIiLCJjb25zdW1lcklkIjoiODhmMWFmNmZmNDE4NGYyNzhkZDY4YmFkMzNmZDFlNzciLCJ0eXBlIjoiU0VTU0lPTl9DTEEiLCJyZXN0cmljdGlvbiI6eyJ0eXBlIjoiVElNRSIsImV4cGlyYXRpb25Ib3VycyI6MCwiZXhwaXJhdGlvbk1pbnV0ZXMiOjUsIm1heFJlcXVlc3RzIjowfSwiZGlzcG9zaXRpb24iOiJMQVVOQ0giLCJsYXVuY2hUeXBlIjoiRU5ST0xMRUUiLCJsYXVuY2hDb21wb25lbnQiOm51bGwsImxhdW5jaFBhcmFtS2V5IjpudWxsfSwiaWF0IjoxNjI5ODQyMDI0fQ.Q9hocX57QFAfYUmXIBh0K7e_FbUkKE87YhPnHUnzjUo"
}
```

### Step 6: Checking Learn

When all of the steps are correctly done, the session should be displayed on the user's specific course when going to Course tools > Blackboard collaborate ultra.

And Ta-Da! it should show up there!

![Session showing up on the instructor's course scheduler](/assets/img/collab-session-created-api.png)

If you are unable to follow this or find anything weird, please do not hesitate and contact us! (Email in the footer)
