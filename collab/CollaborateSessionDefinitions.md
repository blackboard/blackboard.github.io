---
layout: collab
title: Blackboard Collaborate
---
# Collaborate Session Definitions

In Blackbard Collaborate, Sessions are what lies at the center of everything. This is the virtual room that you enroll users to, share content, and host your live course events. The purpose of this document is to define the settings available to you, the developer, when you create a new session through the [Collaborate REST API](https://app.swaggerhub.com/apis-docs/BBDN/collaborate-api/1.0.0).

For illustration, here is a sample session event that would be sent to `POST /sessions`.

```
{
  "name": "My Collab Room",
  "description": "The room I use for Collab meetings",
  "startTime": "2020-03-27T16:00:00.000Z,
  "endTime": "2020-03-27T17:00:00.000Z",
  "noEndDate": true,
  "createdTimezone": "America/New_York",
  "courseRoomEnabled": false,
  "boundaryTime": "15",
  "participantCanUseTools": true,
  "occurrenceType": "S",
  "recurrenceRule": {
    "recurrenceEndType": "on_date",
    "daysOfTheWeek": [
      "mo"
    ],
    "recurrenceType": "daily",
    "interval": "1",
    "numberOfOccurrences": 0,
    "endDate": "2020-03-27T17:00:00.000Z"
  },
  "allowInSessionInvitees": true,
  "allowGuest": true,
  "guestRole": "participant",
  "canAnnotateWhiteboard": true,
  "canDownloadRecording": true,
  "canPostMessage": true,
  "canShareAudio": true,
  "canShareVideo": true,
  "mustBeSupervised": true,
  "openChair": true,
  "raiseHandOnEnter": true,
  "showProfile": true,
  "sessionExitUrl": "https://myeventsurvey.school.edu"
}
```

The following table defines the available settings in the sample JSON package above:

Setting | Description | Example
---|---|---
name<br />**(Required)** | The name of the session, displayed in the header of the room | "My Collab Room"
description | A description of the room | "The room I use for Collab meetings"
startTime<br />**(Required)** | The ISO-formatted date to start the session as a string | "2020-03-27T16:00:00.000Z"
endTime | The ISO-formatted date to end the session as a string | "2020-03-27T17:00:00.000Z"
noEndDate | Boolean describing whether the room has an end date | true
createdTimezone | The time zone to create the room in | "America/New_York"
courseRoomEnabled | A Boolean specific to Blackboard Learn that describes whether this room is automatically associated with a course | false
boundaryTime | Number of minutes a user can join a session before the start time. Must be 0, 15, 30, 45, or 60. | 15
ParticipantCanUseTools | A Boolean that describes whether a use can use tools, such as application sharing, screen sharing, timer, and polls | true
occurrenceType | Single-Use or Perpetual session. Must be "S" or "P" | "S"
recurrenceRule | 	A JSON object describing recurrence rules for a session	| 
recurrenceEndType | The method to describe the end of the sessions recurrence. Must be "on_date" or "after_occurence_count" | "on_date"
daysOfTheWeek | The days of the week this session will occur. Must be "mo", "tu", "we", "th", "fr", "sa", or "su" | [ "mo", "we", "fr" ]
recurrenceType | How often to repeat your session. Must be "daily", "weekly", or "monthly" | "daily"
interval | The number of days, weeks, or months between occurrences, as defined by recurrenceType. | "1"
numberOfOccurrences | If recurrenceEndDate is set to "after_occurence_count," this is the number of occurrences to have | 5
endDate | If recurrenceEndDate is set to "on_date," The ISO-formatted date of the last session. | "2020-03-27T17:00:00.000Z"
allowInSessionInvitees | A Boolean describing whether a presenter can send invitations from within the session | true
allowGuest | A Boolean describing whether guests can attend a session | false
guestRole | The role to assign to guest attendees. Must be "participant", "presenter", or "moderator" | "participant"
canAnnotateWhiteboard | A Boolean that describes whether users can annotate the whiteboard | true
canDownloadRecording | A Boolean that describes whether users can download the recording | false
canPostMessage | A Boolean that describes whether users can post chat messages | true
canShareAudio | A Boolean that describes whether users can share their audio | true
canShareVideo | A Boolean that describes whether users can share their webcam | true
mustBeSupervised | A Boolean that describes whether users must be moderated in chat | true
openChair | A Boolean that describes whether users that join should be made moderator | false
raiseHandOnEnter | A Boolean that describes whether users will automatically raise their hands when they enter the session | false
showProfile | A Boolean that describes whether users can share their profiles with other users, including their avatar | true
sessionExitUrl | A url to redirect users to on session exit. This should be a string | "https://myeventsurvey.school.edu"

To learn more about the other object types, visit [Collaborate API Objects](Collaborate%20API%20Objects.html)