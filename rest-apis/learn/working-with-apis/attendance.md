---
layout: post
title: "Using Attendance APIs"
id: rest_apis-learn-working_with_learn_apis-attendance
categories: Learn REST APIS Attendance
author: Davey Herrera
date: 21/10/2022
toc: True
permalink: /attendance
---

# Using Attedance APIs

> Tested Using Blackboard Learn Release 3900.50.0-rel.21+840a19d

## Introduction

Let's say you have several clases that require you to know if a student arrived at all to a class, was late, completely Absent and later student is excused because something happened.

Well, this API will allow you do so or to integrate it with your attendance system and add a grade to the mix in the grade center.

Many instructors use attendance data as part of their students' overall grades. Also, some institutions and programs have attendance policies that require instructors to track the number of class meetings students have missed.

Attendance data is also used in these ways:

- International students who must maintain visas may need to meet attendance requirements.
- Institutions may need to prove “seat time” for federal funding or accreditation.
- Many institutions and instructors use attendance as they focus on student retention.

Jumping ahead a bit, Attendance can be found within Ultra course view and Original course view, in different places, so here is a look on where to find them on each course view

![Image showing the location of attendance in original and Ultra course](/assets/img/docs-site_attendance-1.png)

Alright, that is how you find attendance but what about its components, what makes attendance... Attendance!:

1. User/Attendees
2. Meeting / Meetings
3. Attendance records
4. Attendance Report
5. Report CSV
6. The meeting itself

Other parts such grading or overall score, Average attendance score and other evaluation criteria are part of Attendance but we will not go deep since those are calculated based on the Configuration you have on your scores. Please review https://help.blackboard.com/Learn/Administrator/SaaS/Tools_Management/Attendance for more information on that.

Let's see those parts in the GUI:

![Image showing the parts of attendance](/assets/img/docs-site_attendance-2.png)

And compare it with a Original Course view:

![Image showing original course view of attendance](/assets/img/docs-site_attendance-3.png)

Did you spot the differences within Ultra Course View (**UCV**) and Original Course View (**OCV**)?

Neither did I! Since Attendance uses a Building block the functionality and look & feel is the same for both UCV and OCV. So I will continue my examples using ONLY Ultra course view, BUT before I talk about the endpoints itself, let's give them a bit of structure since there are 18 of them and things might get a bit confusing.

## Endpoints Structure

As I mentioned, there are 17 endpoints that compose this API, and reading them at first is kind of confusing, so I decided to break them down in 3 parts:

- Meeting
- User
- Report (The report is part of it but is not a part itself, but I figure maybe to let it be)

Every part (Meeting and user) can be considered as an object, and each object has methods that can be grouped the records it affects/returns:

- One
- Batch / Many

![Image showing original course view of attendance](/assets/img/docs-site_attendance-4.png)

Given this idea of objects and groups I have broken down the endpoints to make them easy to follow up in this nice image:

![Image showing A break down per object and method of attendance rest api endpoints](/assets/img/docs-site_attendance-5.png)

Hopefully this last image is helpful, if you have any questions, please contact us at developers@anthology.com

> A very important note to keep in mind: As of the date of creation of this document, If you create an attendance meeting using theREST API, the attendance status CANNOT be modified using the GUI, it can ONLY be modified using REST API. This does not apply to meetings created in the GUI, you can modify those using either the GUI or the REST API.

### Meeting related endpoints

#### One by one operations with meetings

#### Creating a meeting

When you use the GUI, you can click on the "Overall" button and click then on the "Plus (+) button next to the current meeting (or overall score).

![Image showing where you can create a new meeting](/assets/img/docs-site_attendance-6.png)

When you create a new column, it automatically takes in today's date as the column name. Then you will be able to mark the student's attendance status:

```json
["Present", "Absent", "Late", "Excused"]
```

you can learn even more about attendance here: https://help.blackboard.com/Learn/Administrator/SaaS/Tools_Management/Attendance

Now, when creating one using REST API is quite simple use:

- **POST** /learn/api/public/v1/courses/{courseId}/meetings

And in the body:

```json
{
  "courseId": "_912_1",
  "title": "Meeting title",
  "description": "Meeting Description",
  "start": "2022-10-18T16:25:47.416Z",
  "end": "2022-10-18T18:25:47.416Z",
  "externalLink": "This optional field can be an url"
}
```

When the api is succesful, it returns 200:

```json
{
  "id": 465,
  "courseId": "_912_1",
  "title": "Meeting title",
  "description": "Meeting Description",
  "start": "2022-10-18T16:25:47.416Z",
  "end": "2022-10-18T18:25:47.416Z",
  "externalLink": "https//google.com"
}
```

And this is how a meeting created using our API looks like and its parts:

![A new meeting created using REST API](/assets/img/docs-site_attendance-7.png)

#### Returning a meeting

We already know how to create a meeting, and in the same process we are seeing all the meetings, it is possible to get the same data on the api using

- **GET** /learn/api/public/v1/courses/:courseId/meetings/:meetingId

When 200:

```json
{
  "id": 465,
  "courseId": "_912_1",
  "title": "Meeting title",
  "description": "Meeting Description",
  "start": "2022-10-18T16:25:47.416Z",
  "end": "2022-10-18T18:25:47.416Z",
  "externalLink": "https//google.com"
}
```

#### Mapping the results

Here is a mapping of the results returned by the API and what we have in the GUI.

![Values returned by the API mapped to the GUI](/assets/img/docs-site_attendance-8.png)

#### Updating a meeting

- **PATCH** /learn/api/public/v1/courses/:courseId/meetings/:meetingId

Using the same body as POST

```json
{
  "courseId": "_912_1",
  "title": "Meeting title",
  "description": "Meeting Description",
  "start": "2022-10-18T16:25:47.416Z",
  "end": "2022-10-18T18:25:47.416Z",
  "externalLink": "This optional field can be an url"
}
```

#### Deleting a meeting

This endpoint deletes a meeting

- **DELETE** /learn/api/public/v1/courses/:courseId/meetings/:meetingId

#### Batch operations with Meetings

You can perform batch operations with meetings as well, however those are limited to Read and delete, meaning you can either read ALL the meetings in a course or you can remove ALL the meetings in a course. The delete all meetings in a course is a VERY powerful endpoint, use it carefully!

#### Return all meetings in a course

- **GET** /learn/api/public/v1/courses/{courseId}/meetings

Returns 200

```json
{
  "results": [
    {
      "id": 435,
      "courseId": "_912_1",
      "start": "2022-10-12T20:49:55.885Z",
      "end": null
    },
    {
      "id": 436,
      "courseId": "_912_1",
      "start": "2022-10-12T20:50:40.449Z",
      "end": null
    },
    {
      "id": 437,
      "courseId": "_912_1",
      "start": "2022-10-12T20:50:44.846Z",
      "end": null
    },
    {
      "id": 438,
      "courseId": "_912_1",
      "start": "2022-10-12T20:50:56.525Z",
      "end": null
    },
    {
      "id": 439,
      "courseId": "_912_1",
      "start": "2022-10-13T17:25:14.750Z",
      "end": null
    },
    {
      "id": 440,
      "courseId": "_912_1",
      "start": "2022-10-14T19:28:17.614Z",
      "end": null
    },
    {
      "id": 463,
      "courseId": "_912_1",
      "start": "2022-10-18T14:58:05.821Z",
      "end": null
    },
    {
      "id": 465,
      "courseId": "_912_1",
      "title": "Meeting title",
      "description": "Meeting Description",
      "start": "2022-10-18T16:25:47.416Z",
      "end": "2022-10-18T18:25:47.416Z",
      "externalLink": "https//google.com"
    }
  ]
}
```

#### Remove all meetings from the course

- **DELETE** /learn/api/public/v1/courses/{courseId}/meetings

When it is succesful returns 204

### User related endpoints

#### one by one operations

#### Creating an attendance record for one user in one meeting

We have this meeting that we need to add attendance records to:

![A meeting in Ultra course view with no attendance records](/assets/img/docs-site_attendance-9.png)

- **POST** {{baseUrl}}/learn/api/public/v1/courses/:courseId/meetings/:meetingId/users

Body

```json
{
  "meetingId": 465,
  "status": "Present",
  "userId": "_15104_1"
}
```

when it is succesful, it returns 201, it looks like this in the GUI:

![A meeting in Ultra course view with an attendance record](/assets/img/docs-site_attendance-10.png)

#### Returning an Attendance record for one user in one meeting

- **GET** /learn/api/public/v1/courses/:courseId/meetings/:meetingId/users/:userId

```json
{
  "id": 760,
  "meetingId": "465",
  "userId": "_15104_1",
  "status": "Present"
}
```

This basically returns the same information found in the previous image.

#### Updating an attendance record for one user in one meeting

- **PATCH** /learn/api/public/v1/courses/:courseId/meetings/:meetingId/users/:userId

Body

```json
{
  "meetingId": 465,
  "userId": "_15104_1",
  "status": "Excused"
}
```

Returns when 200:

```json
{
  "id": 760,
  "meetingId": "465",
  "userId": "_15104_1",
  "status": "Excused"
}
```

![A meeting in Ultra course view with an attendance record updated](/assets/img/docs-site_attendance-11.png)

#### Deleting an attendance record for one user in one meeting

- **DELETE** /learn/api/public/v1/courses/:courseId/meetings/:meetingId/users/:userId

When succesful, returns 204 NO CONTENT

![A meeting in Ultra course view with an attendance record removed](/assets/img/docs-site_attendance-12.png)

#### Batch operations

#### Creating attendance status for all users in one meeting

Even though the endpoint documentation marks user_id and meeting_id as mandatory fields (in the body), you only need to send in the body the status like this:

```json
{
  "status": "Excused"
}
```

This basically updates all students' attendance status to the same for **ALL OF THEM.**
![A meeting in Ultra course view all users with the same attendance status](/assets/img/docs-site_attendance-13.png)

#### Return ALL users and their attendance status to one meeting

![A meeting in Ultra course view with all students attendance marked](/assets/img/docs-site_attendance-14.png)

- **GET** /learn/api/public/v1/courses/:courseId/meetings/:meetingId/users

When 200 returns:

```json
{
  "results": [
    {
      "id": 761,
      "meetingId": "465",
      "userId": "_15104_1",
      "status": "Present"
    },
    {
      "id": 762,
      "meetingId": "465",
      "userId": "_15913_1",
      "status": "Late"
    }
  ]
}
```

#### Return ALL attendance status of one user to all meetings in one course

Now, let's say you want to have all the attendance records of one user, with this endpoint, you will get all the attendance status if all the available meetings for one specific user

- **GET** /learn/api/public/v1/courses/:courseId/meetings/users/:userId

![A meeting in Ultra course view all the meetings and attendance for one user marked with their status](/assets/img/docs-site_attendance-15.png)

When 200, returns:

```json
{
  "results": [
    {
      "id": 714,
      "meetingId": "435",
      "userId": "_15104_1",
      "status": "Present"
    },
    {
      "id": 716,
      "meetingId": "436",
      "userId": "_15104_1",
      "status": "Late"
    },
    {
      "id": 718,
      "meetingId": "437",
      "userId": "_15104_1",
      "status": "Absent"
    },
    {
      "id": 731,
      "meetingId": "438",
      "userId": "_15104_1",
      "status": "Late"
    },
    {
      "id": 737,
      "meetingId": "439",
      "userId": "_15104_1",
      "status": "Present"
    },
    {
      "id": 761,
      "meetingId": "465",
      "userId": "_15104_1",
      "status": "Present"
    },
    {
      "id": 763,
      "meetingId": "440",
      "userId": "_15104_1",
      "status": "Present"
    },
    {
      "id": 764,
      "meetingId": "463",
      "userId": "_15104_1",
      "status": "Late"
    },
    {
      "id": 765,
      "meetingId": "466",
      "userId": "_15104_1",
      "status": "Present"
    }
  ]
}
```

#### Removing all attendance records in a meeting

- **DELETE** /learn/api/public/v1/courses/:courseId/meetings/:meetingId/users

![A meeting in Ultra course view all the meetings and attendance for one user marked with their status](/assets/img/docs-site_attendance-16.png)

When completed, returns 204 NO CONTENT:

![A meeting in Ultra course view all the meetings and attendance for one user marked with their status](/assets/img/docs-site_attendance-17.png)

#### Removing all attendance records in one course for one user

This endpoint is very powerful, be careful when using it since it will remove ALL attendance records of a specific user in a course.

- **DELETE** / learn/api/public/v1/courses/{courseId}/meetings/users/{userId}

When succesful, returns 204 NO CONTENT.

#### Remove all attendance records in ALL COURSES for one user

This endpoint is very powerful, be careful when using it since it will remove ALL attendance records of a specific user in ALL courses

- **DELETE** / learn/api/public/v1/courses/{courseId}/meetings/users/{userId}

#### CSV Export endpoint

Unfortunately at the moment of writing, this endpoint is not working properly so, I am unable to tell you how it works, however, once this is fixed I will update this, for now, the GUI is the best place to get the information.
