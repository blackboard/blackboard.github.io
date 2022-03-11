---
layout: post
title: "Working with Adaptive Release"
id: rest_apis-learn-getting_started-adaptive_release
categories: Learn REST groups
toc: True
---

# Adaptive Release

> Using Bb Learn 3900.34.0-rel.24+41a9160

## Ultra courses
First we need to see how this is displayed in the GUI, the release criteria or Release conditions is set when clicking under the button that usually says "Visible to students"

![Adaptive release conditions button in the GUI](/assets/img/adaptive-release-1.png)

When clicked, this displays several conditions:

![Adaptive release conditions button in the GUI](/assets/img/adaptive-release-2.png)

For all members, you can use additional conditions such as Date/Time and Performance, this also allows you to pick when will the content appear:

![Adaptive release conditions button in the GUI](/assets/img/adaptive-release-3.png)

It is also possible to release the content to specific members of the course or groups. 

Note: We are aware that there is a known issue where, if you just enrolled a user (and haven't reloaded the page) the roster is not updated on adaptive release -> Specific memebers or groups -> Individual members and search for the user that has just been enrolled, the user does not show up, groups are correctly updated. To solve this, you can just reload the page and roster will be updated.

Now let's move on to the REST API part

## Rules (C.R.U.D)

First thing is first!

A rule must be born. 

Yes, we need to create a rule that will contain our criteria (We assume the course and content has already been created), all rules depend on content, you need to create first content, then the rule, then criteria(optional) and define who will receive these rules.

For specific messages that may be returned by the api, please review: https://developer.blackboard.com/portal/displayApi

Also, please make sure to always review the entitlements required for each endpoint, you can check this document to get more information about entitlements: https://docs.blackboard.com/rest-apis/learn/getting-started/bookmarklet

For the rules you need course_id and Content_id

![Adaptive release conditions button in the GUI](/assets/img/adaptive-release-4.png)

You can create 1 rule per content_id!

### Creating a Rule
To create a rule on a specific content id:

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules

And in the body:

```json
{
    "title": "New rules"
}
```

### Returning a Rule
To obtain the rule that exist on a specific content id: 

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules

### Updating a Rule
To update a rule you can use (you need to know the rule id first): 

- PATCH {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId

and in the body: 


```json
{
    "title": "New rules"
}
```

If everything goes well, you should see a 201:
```json
{
    "id": "_349_1",
    "title": "New rules"
}
```

if you see a 409 conflict:
```json
{
    "status": 409,
    "message": "A rule already exists for content [_121047_1]"
}
```
Means the rule already exists, as I mentioned, one contentID can only have one rule.

### Deleting a rule
You can also delete a rule easlily:

- DELETE /learn/api/public/v1/courses/{courseId}/contents/{contentId}/adaptiveRelease/rules/{ruleId}

## Criteria (C.R.U.D)
You can get all the criteria associated to a content_id using:

### Returning criteria
- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria

You should get a result like this (may vary depending on the criteria that has already been setup):
```json
{
    "results": [
        {
            "type": "GradeRange",
            "id": "_386_1",
            "gradeColumnId": "_89584_1",
            "maxScore": 10.00,
            "minScore": 10.00
        },
        {
            "type": "DateRange",
            "id": "_387_1",
            "endDate": "2021-03-12T22:00:00.000Z"
        }
    ]
}
```

### Using GradeRange
This criteria specifies a gradable item, a maximun and a minimum score. When the item has been graded and the score is within the range, the content becomes available. A GradeRange criterion can be converted to a GradePercentage criterion by setting the Type to GradePercentage and 

You can get the gradeColumn id using (you need the course_id):

- GET {{baseUrl}}/learn/api/public/v2/courses/:courseId/gradebook/columns

It returns the following when 200:

```json
{
    "results": [
        {
            "id": "_89584_1",
            "name": "Test for adaptive release - GradeRange",
            "created": "2022-01-19T20:22:03.728Z",
            "contentId": "_120905_1",
            "score": {
                "possible": 10.00000
            },
            "availability": {
                "available": "Yes"
            },
            "grading": {
                "type": "Attempts",
                "due": "2022-01-20T05:00:00.000Z",
                "attemptsAllowed": 1,
                "scoringModel": "Last",
                "schemaId": "_78778_1",
                "anonymousGrading": {
                    "type": "None"
                }
            },
            "gradebookCategoryId": "_149469_1",
            "includeInCalculations": true,
            "showStatisticsToStudents": false,
            "scoreProviderHandle": "resource/x-bb-assessment"
        }
    ]
}
```

This endpoint needs the following data:

1. Type -> ["GradeRange", "GradePercentage"], mandatory to pick one
2. GradeColumnId -> (string id from a specific grade column), mandatory
3. maxScore -> (float, nullable)
4. minScore ->  (float, nullable)
    
Explaining the parameters a little bit further:

**GradeColumnId:** Mandatory. Id referencing the gradebook column of another gradable content. The content cannot be the one in which the criteria has been created. The referenced content must belong to the same course. 
 
**maxScore:** Can be null. Should respect the grade scale chosen by the referenced gradebook column. Less than or equal to the max score set in the grade item. 
 
**minScore:** Can be null. Only one of the scores can be set to null in a particular request. Cannot be negative. 

Now, lets create the criteria:

### Creating new criteria
You can create it using (You need course_id, contentId and ruleId):

- POST {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria

And on the body:
```json
{ 
  "type": "GradeRange", 
  "gradeColumnId": "_89584_1", 
  "maxScore": 10.00, 
  "minScore": 10.00 
} 
```

If everything goes well, you should see a 201 with an id:

```json
{
    "type": "GradeRange",
    "id": "_386_1",
    "gradeColumnId": "_89584_1",
    "maxScore": 10.00,
    "minScore": 10.00
}
```
Please be aware that maxScore and minScore can be set to null, for both POST and PATCH requests. This will be understood as "minScore or Higher" without setting a maximum score directly:

```json
{ 
  "type": "GradeRange", 
  "id": "_11_1", 
  "gradeColumnId": "_22_1", 
  "maxScore": null, 
  "minScore": 70.00 
} 
```
If we do not declare the maxScore in the request while using POST, it will have a value assigned during the request corresponding to the maximum score possible by the gradable item, in this example, "maxScore" would be set to 100. For the PATCH, because it handles partial updates, if the field is omitted then the previous value will not change, being either null or 100. This behaviour also applies to GradePercentage criteria
```json
{ 
  "type": "GradeRange", 
  "id": "_11_1", 
  "gradeColumnId": "_22_1", 
  "minScore": 70.00 
} 
```

### Using GradePercentage
Specifies a gradable item, a maximum and a minimum percentage value from the maximum score possible. When the item has been graded and the score is within the range, the content becomes available. A GradePercentage criterion can be converted to a GradeRange criterion by setting the Type to GradeRange and other fields to acceptable values for GradeRange criteria. 
So, this is basically the same as GradeRange, except that maxScore and minScore expect a number between 0 and 100 (Float).

```json
{ 
  "type": "GradeRange", 
  "gradeColumnId": "_89584_1", 
  "maxScore": 100.00, 
  "minScore": 70.00 
} 
```

### Using DateRange
Specifies a start and end dates. The content becomes available during the given date range.  

This endpoint needs the following data:

1. Type -> ["DateRange"], inmutable 
2. startDate -> ISODate, Nullable
3. endDate -> ISODate, Nullable & endDate > startDate

Explaining the parameters a little bit further:

**startDate:** ISODate. Can be null. Can be a past date. Must be prior to due date. 
 
**endDate:** ISODate. Can be null. Must be after startDate, and prior to due date. Only one of the dates can be set to null in a particular request. 

You can create this using:

- POST {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria

And the body looks like this:

```json
{ 
  "type": "DateRange", 
  "startDate": null, 
  "endDate": "2021-03-12T22:00:00Z" 
} 
```

Similar to Grade criteria, any date can be explicitly set to null in the request body for both POST and PATCH requests. If “startDate” is set to null, it will be understood as “before endDate”. Similarly, if “endDate” is set to null that means “after startDate” with no particular limit. This comes useful particularly for PATCH requests, as one of the dates can be changed to null without recreating the object. If the value is omitted during creation, it will be set to null instead of having a default value. 

If you send a request as in the example, the API returns 201 and:
```json
{
    "type": "DateRange",
    "id": "_387_1",
    "endDate": "2021-03-12T22:00:00.000Z"
}
```
To make the text a little bit more simple:

This basically means that the content will be hidden after that specific end date, but has always been visible prior that date:

![Adaptive release conditions button in the GUI](/assets/img/adaptive-release-5.png)

If we send this body:
```json
{
    "type": "DateRange",
    "startDate": "2021-03-12T22:00:00.000Z",
    "endDate": "null" 
}
```
This means that content will be shown starting that date with no end date.

![Adaptive release conditions button in the GUI](/assets/img/adaptive-release-6.png)


## Memberships
### About memberships
By default, all members are selected to be affected by the criteria, however, it is possible to select specific Members or groups of the course to apply these rules on, Before we start talking about the membership criteria, if you've already applied membership criteria to the content and you call:

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria

Returns:
```json
{
    "results": [
        {
            "type": "GradeRange",
            "id": "_386_1",
            "gradeColumnId": "_89584_1",
            "maxScore": 10.00,
            "minScore": 10.00
        },
        {
            "type": "DateRange",
            "id": "_387_1",
            "endDate": "2021-03-12T22:00:00.000Z"
        },
        {
            "type": "Memberships",
            "id": "_389_1"
        }
    ]
}
```

The "Memberships" part of the returned values from this endpoint, indicates that the content has specific membership criteria and has the id of the membership criteria that describes the members, this id is a way of grouping the "memberships" without describing them, if we want to know who are the members… 

We can query the membership id only if required using: 

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria/:criterionId

Returns: 
```json
{
    "type": "Memberships",
    "id": "_389_1"
}
```

## Users
### Getting the adaptive release users
To get the users you need to now:

1. Course_id
2. Content_id
3. Rule_id
4. Criterion_id (Membership)

You can query using:

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria/:criterionId/users

Returns:

```json
{
    "results": [
        {
            "id": "_230_1",
            "criterionId": "_389_1",
            "userId": "_13584_1"
        },
        {
            "id": "_229_1",
            "criterionId": "_389_1",
            "userId": "_13613_1"
        }
    ]
}
```

### Posting adaptive release users 

To POST a list of users, you need to know the user_id which can be retrieved using: 

> Please keep in mind the user needs to be enrolled first in the course in order for all of this to work!

- GET {{baseUrl}}/learn/api/public/v1/users

Returns: 
```json
{
    "results": [
        {
            "id": "_47939_1",
            "uuid": "3bdfc74364d643a29c5baa8c79608c6c",
            "externalId": "636012",
            "dataSourceId": "_127_1",
            "userName": "tirum",
            "educationLevel": "Unknown",
            "gender": "Unknown",
            "created": "2021-11-11T04:45:14.562Z",
            "modified": "2022-02-18T17:08:02.940Z",
            "institutionRoleIds": [
                "STUDENT"
            ],
            "systemRoleIds": [
                "User"
            ],
            "availability": {
                "available": "Yes"
            },
            "locale": {
                "id": "en-US"
            },
            "avatar": {
                "viewUrl": "https://a-testing-url.com/withsomeIDinfo",
                "source": "Default"
           }
        }
	],
}
```

The ID that you might need to grab is "id": "_47939_1"

Now to post it, we use PUT.

You need to pass the same information:

- PUT {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria/:criterionId/groups

1. Course_id
2. Content_id
3. Rule_id
4. Criterion_id (Membership)
    
Now, you need to use the following body format:

 ```json
[
    {
        "userId": "anim labore in nulla est"
    },
    {
        "userId": "sunt labore ve"
    }
]
```
Using our previous example:
```json
[
    {
        "userId": "_47939_1"
    }
]
 ```
If the user is NOT enrolled in the course the API returns 400:

Returns:

```json
{
    "status": 400,
    "message": "User _47939_1 is not enrolled in the course _13969_1 ",
    "extraInfo": "1f34fc3eba27478abdea01ed7134c2e4"
}
```
If the user IS enrolled in the course:

Returns:
```json
{
    "results": [
        {
            "id": "_231_1",
            "criterionId": "_389_1",
            "userId": "_47939_1"
        }
    ]
}
```
## Groups
Since this guide has become a little bit longer than desired, you can check our approach on groups here: https://docs.blackboard.com/rest-apis/learn/getting-started/groups-and-rest-api

Basically, you can create groups and associate them to adaptive release content, please keep in mind you cannot reference a group set, but groups within the set:

### Put Groups as criteria:
- PUT {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/adaptiveRelease/rules/:ruleId/criteria/:criterionId/groups

And the body:
```json
[
    {
        "groupId": "_873_1"
    }
]
```

This returns:

```json
{
    "results": [
        {
            "id": "_206_1",
            "criterionId": "_389_1",
            "groupId": "_873_1"
        }
    ]
}
```
> Please keep in mind that this will update and replace any current groups that are part of the criterion, you need to pass as many child groups as needed to avoid issues:

Like this:

```json
[
    {
        "groupId": "_867_1"
    },
    {
        "groupId": "_873_1"
    },
    {
        "groupId": "_872_1"
    },
    {
        "groupId": "_871_1"
    }
]
```
This returns:

```json
{
    "results": [
        {
            "id": "_208_1",
            "criterionId": "_389_1",
            "groupId": "_867_1"
        },
        {
            "id": "_209_1",
            "criterionId": "_389_1",
            "groupId": "_871_1"
        },
        {
            "id": "_207_1",
            "criterionId": "_389_1",
            "groupId": "_872_1"
        },
        {
            "id": "_210_1",
            "criterionId": "_389_1",
            "groupId": "_873_1"
        }
    ]
}
```

Notice that we are using the same criterionId, here is why:

When you retrieve all the criterion related to a rule, you get the following:

```json
{
    "results": [
        {
            "type": "GradeRange",
            "id": "_386_1",
            "gradeColumnId": "_89584_1",
            "maxScore": 10.00,
            "minScore": 10.00
        },
        {
            "type": "DateRange",
            "id": "_387_1",
            "endDate": "2021-03-12T22:00:00.000Z"
        },
        {
            "type": "Memberships",
            "id": "_389_1"
        }
    ]
}
```

As you can see, the membership criteria has id _389_1, meaning that there is where all the membership criteria will be stored.

## Read Only Messages you might see
### ContentComplete (Ultra Only)
This is a Special type of criteria only assigned to the child contents of a learning module, where the “Sequence” release condition can be activated. Each type of content has its own definition of what “complete” means. This behavior is not supported via public API.
```json
{
  "type": "ContentComplete",
  "id": "_11_1",
  "contentId": "_22_1"
}
```
### GradeCompleted (Original Only)
Specifies a gradable item associated to a different content in the same course. Regardless of scores, if the grade item is deemed as completed, the content will become available.
```json
{
  "type": "GradeCompleted",
  "id": "_11_1",
  "gradeColumnId": "_10_1"
}
```

### ContentReviewed (Original Only)
Specifies a content of the same course. The referenced content must be set to a “reviewed” status from entitled users for the content to become available.
```json
{
  "type": "ContentReviewed",
  "id": "_2_2",
  "reviewedContentId": "_2_1"
}
```
