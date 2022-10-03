---
layout: post
title: "Using the calendar APIs with Ultra"
id: rest_apis-learn-getting-started-calendar-api
categories: Learn REST getting-started calendar
Author: Davey Herrera
permalink: /calendar
---

# Using the calendars API with Ultra

> Tested with Blackboard Learn version 3900.48.0

You can review the model in our [developer portal](https://developer.anthology.com/portal/displayApi) for details on each attribute on each endpoint:
![model of each endpoint](assets/img/calendar_api-model.png)

## Introduction

Let's say you are a student and let's say you want to keep track of your day to day, what do you do? Yes, a to-do list... Not quite, You can use the tools that already exist and a Calendar is more than enough to know your dues, create activites with a deadline or just to know what is today's date.

This also applies to administrators, developers and instructors, what if you want to create new items for your students based on gradebook columns, or reminders of meetings? What about an integration with third party tools such as Zoom or Collaborate where you can set the link of the meeting, the occurrency and how frequent the event is? Well, this API will help you do that!

To start, we have four different "types" of calendars

- Institutional
- Personal
- Course/gradebook
- Office Hours

### Where is the Institutional and Personal Calendar?

The Institutional/Personal calendar is marked as such in the calendar, Where can you see them? Well in Ultra, in the main menu, you may see a Schedule/Calendar on your main menu at login:

![Calendar api image in learn](assets/img/calendar-apis-calendar_index.png)

When you click in the gear in the top right of the page it will allow you to filter per calendar, You can select which calendars you want to see, Including Personal and institutional:

![Calendar api image in learn - submenu](assets/img/calendar-api-personal_calendar.png)

The course calendars show up automatically when you are enrolled in a course, those will show up here as well when enrolled.

> Want to learn even more about calendars? Please visit [Our calendar guide](https://help.blackboard.com/Learn/Administrator/SaaS/User_Interface_Options/Ultra_Experience/Base_Navigation/Calendar) to go above and beyond!

### What about in a course?

**For Students, Instructors and course builders**

All users that are part of a course see the same things, both calendar and the Course schedule.

![Calendar api image in learn in a course](assets/img/calendar-apis_calendar-instructors.png)

There are clearly several differences between users given each role capabilities:

![Course view for an instructor vs student](/assets/img/calendar-apis-student_view-vs-inst.png)

### Creating a new Item in Learn

As an Instructor, when you want to create a new item for the Course schedule, The UI looks like this:

![Calendar flow in the GUI](/assets/img/calendar-apis_instructor-calendar-schedule.png)

When the item is finally created, it looks then like a small card, you can edit it or delete it:

![Calendar event card](/assets/img/calendar-apis-event-card.png)

### Mapping a calendar Item to the API payload

This is an example of how a Course schedule item looks like in the GUI and in the payload when calling it using:

- GET /learn/api/public/v1/calendars/items?courseId=\_905_1

![Mapping between calendar an the API payload](/assets/img/calendar-apis-calendar-mapping.png)

## Calendar C.R.U.D

It is not possible to create, update or delete calendars, you can only read them, **this is because**, the calendars are either Personal or Institutional by default, the course schedules are added to Calendar once a person is enrolled.

#### Payload example

- **GET /learn/api/public/v1/calendars**

```json
{
  "results": [
    {
      "id": "string",
      "name": "string"
    }
  ],
  "paging": {
    "nextPage": "string"
  }
}
```

A little example of how this looks in real life, when you are enrolled in a course, a calendar is automatically generated, If you only have 1 course, then it will look something like this when you make an API call:

- **GET /learn/api/public/v1/calendars (example)**

```json
{
  "results": [
    {
      "id": "INSTITUTION",
      "name": "Institution"
    },
    {
      "id": "PERSONAL",
      "name": "Personal"
    },
    {
      "id": "_905_1",
      "name": "CalendarCourseLearning: Calendar Course Learning"
    }n
  ]
}
```

When looking at this on Learn, Instructors and Students have a pretty much identical view, the only difference is the Calendar capability to manage Course calendar items:

![Difference between instructor view and student view in calendars](/assets/img/calendar-apis-student_view-vs-inst.png)

## Calendar Items C.R.U.D

We are not able to create, update or delete Calendars **BUT** We can create new items on those calendars.

Please keep in mind that:

- All users can view their own institutional items in calendar
- Al users can view their own personal items in calendar

### Pre-requisites

In order to use calendar items you need the following:

- The user must be enrolled in the course
- The user must have 'course.calendar-entry.VIEW' entitlement
- The course calendar must be enabled for course calendar items associated with GradebookColumn

#### For office-hours

- The course calendar must be enabled for the course GradebookColumn associate with OfficeHours
- If OfficeHours are created for a course calendar (calendarId = a course_id)
- if OfficeHours are created for all courses (calendarId = PERSONAL) the user must be enrolled in any course that the user owning the OfficeHours is enrolled in

### About GET /calendar/items

- If **SINCE** and **UNTIL** are not provided, the endpoint will default to the upcoming two weeks timeframe from **NOW**.
- If only **SINCE** is provided, this endpoint will default the **UNTIL** parameter two weeks after **SINCE**
- If only **UNTIL** is provided the endpoint will default the **SINCE** parameter two weeks prior to **UNTIL**
- Maximum timespan between **SINCE** and **UNTIL** is 16 weeks
- CalendarItems of type GradebookColumn are a representation of a specific gradable item and there read-only. Modifications to GradebookColumn items performed via the GradebokColumn endpoints will be reflected iun the CalentarItems endoints.
- If you want to use the columnIds from Gradebook Column as a calendar Item id, you can get those from /learn/api/public/v2/courses/{courseId}/gradebook/columns/{columnId}
- You cannot read/create calendar items when there is no calendar.

#### Payload example

- **GET /learn/api/public/v1/calendars/items**

```json
{
  "results": [
    {
      "id": "string",
      "type": "Course",
      "calendarId": "string",
      "calendarName": "string",
      "title": "string",
      "description": "string",
      "location": "string",
      "start": "2022-09-29T19:14:37.520Z",
      "end": "2022-09-29T19:14:37.520Z",
      "modified": "2022-09-29T19:14:37.520Z",
      "color": "string",
      "disableResizing": true,
      "createdByUserId": "string",
      "dynamicCalendarItemProps": {
        "attemptable": true,
        "categoryId": "string",
        "dateRangeLimited": true,
        "eventType": "string",
        "gradable": true
      },
      "recurrence": {
        "count": 0,
        "frequency": "Monthly",
        "interval": 0,
        "monthRepeatDay": 0,
        "monthPosition": 0,
        "originalStart": "2022-09-29T19:14:37.520Z",
        "originalEnd": "2022-09-29T19:14:37.520Z",
        "repeatBroken": true,
        "repeatDay": "Sunday",
        "until": "2022-09-29T19:14:37.520Z",
        "weekDays": ["Sunday"]
      }
    }
  ],
  "paging": {
    "nextPage": "string"
  }
}
```

### About POST /calendar/items

This endpoint creates a calendar item, items can be single or recurring.

#### Personal and institutional calendars

- If you are using CalendarItems of type OfficeHours, those will be assigned to the current user.
- To create a Institutional calendar item you need 'system.calendar-item.EXECUTE' entitlement
- Any user can create their own Personal calendar items

#### Course calendars

- To create a calendar course item the user must be enrolled in the course and in order to do so, must have the 'course.calendar-entry.CREATE' entitlement
- The specified courseId must not be for an organization
- Course calendar must be enabled for the specified course

#### GradebookColumn calendar

- GradebookColumns must be created using the Gradebook API endpoint: POST /learn/api/public/v2/courses/{courseId}/gradebook/columns

#### OfficeHours

- The user must have the 'course.calendar-entry.CREATE' entitlement
- If calendarId == course_id the user must be enrolled in the course and the calendar must be enabled
- To create for all enrolled courses calendarId must be set to PERSONAL

#### Payload example

- **POST /learn/api/public/v1/calendars/items**

```json
{
  "type": "Course",
  "calendarId": "string",
  "title": "string",
  "description": "string",
  "location": "string",
  "start": "2022-09-29T20:30:04.346Z",
  "end": "2022-09-29T20:30:04.346Z",
  "disableResizing": true,
  "recurrence": {
    "count": 0,
    "frequency": "Monthly",
    "interval": 0,
    "monthRepeatDay": 0,
    "monthPosition": 0,
    "originalStart": "2022-09-29T20:30:04.346Z",
    "originalEnd": "2022-09-29T20:30:04.346Z",
    "repeatBroken": true,
    "repeatDay": "Sunday",
    "until": "2022-09-29T20:30:04.346Z",
    "weekDays": ["Sunday"]
  }
}
```

Now we can return specific items per calendar, remove them or update them:

### About GET {calendarItemType}/{calendarItemId}

- This endpoint returns a few more attributres such as:
  - CalendarName
  - modified
  - color
  - createdByUserId
  - DynamigCalendarItemProps
    - attemptable
    - categoryId
    - dateRangeLimited
    - eventType
    - gradable
- CalendarItems of type gradebook are a representation of a specific gradable items, therefore, read-only. Modifications to GradeBookColumn items performed via the gradebook column endpoints will be reflected in the CalendarItems endpoints.
- If you want to use the columnIds from Gradebook Column as a calendar Item id, you can get those from /learn/api/public/v2/courses/{courseId}/gradebook/columns/{columnId}

#### Personal and institutional calendars

- All users can view insitution calendar items
- Any user may view their own calendar items, not other's calendar items

#### Course calendars

- To create a calendar course item the user must be enrolled in the course and in order to do so, must have the 'course.calendar-entry.VIEW' entitlement
- Course calendar must be enabled for the specified course the calendar item is associated with

#### GradebookColumn calendar

- GradebookColumns must be created using the Gradebook API endpoint: POST /learn/api/public/v2/courses/{courseId}/gradebook/columns
- - Course calendar must be enabled for the specified course the GradebookColumn item is associated with

#### OfficeHours

- If the OfficeHours are created for a course calendar (calendarId = a course id) the user must be enrolled in the course
- If the OfficeHours are created for a all courses (calendarId = PERSONAL) the user must be enrolled in any course that the user owning the OfficeHours is also enrolled in
- In either case above the course calendar must be enabled

#### Payload example

- **GET /learn/api/public/v1/calendars/items/{calendarItemType}/{calendarItemId}**

```json
{
  "id": "string",
  "type": "Course",
  "calendarId": "string",
  "calendarName": "string",
  "title": "string",
  "description": "string",
  "location": "string",
  "start": "2022-09-30T15:58:25.082Z",
  "end": "2022-09-30T15:58:25.082Z",
  "modified": "2022-09-30T15:58:25.082Z",
  "color": "string",
  "disableResizing": true,
  "createdByUserId": "string",
  "dynamicCalendarItemProps": {
    "attemptable": true,
    "categoryId": "string",
    "dateRangeLimited": true,
    "eventType": "string",
    "gradable": true
  },
  "recurrence": {
    "count": 0,
    "frequency": "Monthly",
    "interval": 0,
    "monthRepeatDay": 0,
    "monthPosition": 0,
    "originalStart": "2022-09-30T15:58:25.082Z",
    "originalEnd": "2022-09-30T15:58:25.082Z",
    "repeatBroken": true,
    "repeatDay": "Sunday",
    "until": "2022-09-30T15:58:25.082Z",
    "weekDays": ["Sunday"]
  }
}
```

### About DELETE {calendarItemType}/{calendarItemId}

With this endpoint you can delete a calendar item or series, however, the following must be true in order to delete a calendar item:

#### Personal and institutional calendars

- The user must have the 'system.calendar-item.EXECUTE' entitlement
- Any user may delete their own calendar items

#### Course calendars

- The user must be enrolled in the course
- The user must have the 'course.calendar-entry.MODIFY' entitlement
- The course calendar must be enabled for the specified course

#### GradebookColumn calendar

- GradebookColumns must be deleted using the Gradebook API endpoint: DELETE /learn/api/public/v2/courses/{courseId}/gradebook/columns/{columnId}

#### OfficeHours

- The user must have the 'course.calendar-entry.MODIFY' entitlement
- The user must own the calendarItem
- The calendar must be enabled if the calendarItem is associated with a course calendar.

#### Payload example

When using DELETE {calendarItemType}/{calendarItemId} the endpoint returns:

- **DELETE {calendarItemType}/{calendarItemId} - Success**

```http
204 No content
```

### About PATCH {calendarItemType}/{calendarItemId}

With this endpoint you can update a calendar item or series, however, the following must be true in order to delete a calendar item:

> When updating the series the existing CalendarItems will be removed and a new set of CalendarItems will be created. This is the same behavior as experienced via the UI.

#### Personal and institutional calendars

- The user must have the 'system.calendar-item.EXECUTE' entitlement
- Any user may update their own calendar items

#### Course calendars

- The user must be enrolled in the course
- The user must have the 'course.calendar-entry.MODIFY' entitlement
- The course calendar must be enabled for the specified course

#### GradebookColumn calendar

- GradebookColumns must be updated using the Gradebook API endpoint: PATCH /learn/api/public/v2/courses/{courseId}/gradebook/columns/{columnId}

#### OfficeHours

- The user must have the 'course.calendar-entry.MODIFY' entitlement
- If calendarId = a course id the user must be enrolled in the course and the calendar must be enable

#### Payload example

- **PATCH {calendarItemType}/{calendarItemId} - Success**

```json
{
  "id": "string",
  "type": "Course",
  "calendarId": "string",
  "calendarName": "string",
  "title": "string",
  "description": "string",
  "location": "string",
  "start": "2022-09-30T16:36:40.313Z",
  "end": "2022-09-30T16:36:40.313Z",
  "modified": "2022-09-30T16:36:40.313Z",
  "color": "string",
  "disableResizing": true,
  "createdByUserId": "string",
  "dynamicCalendarItemProps": {
    "attemptable": true,
    "categoryId": "string",
    "dateRangeLimited": true,
    "eventType": "string",
    "gradable": true
  },
  "recurrence": {
    "count": 0,
    "frequency": "Monthly",
    "interval": 0,
    "monthRepeatDay": 0,
    "monthPosition": 0,
    "originalStart": "2022-09-30T16:36:40.313Z",
    "originalEnd": "2022-09-30T16:36:40.313Z",
    "repeatBroken": true,
    "repeatDay": "Sunday",
    "until": "2022-09-30T16:36:40.313Z",
    "weekDays": ["Sunday"]
  }
}
```
