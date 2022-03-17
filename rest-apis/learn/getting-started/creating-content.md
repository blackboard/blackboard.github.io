---
layout: post
title: "Creating content witn REST-API"
id: rest_apis-learn-getting_started-creating_content_with_API
categories: Learn REST API Content
toc: True
---

# Managing content with REST API in ULTRA (C.R.U.D)

> This guide was created using Blackboard Learn Release 3900.37.0-rel.2+bf4004cd

We do talk about original at the end, however, the main process is the same, we focus a bit more in Ultra since there is a bit of difference.

## Returning content

Let's first get the available content available in the root of the course, this is how it looks like in the GUI:

![Returning content with the api](/assets/img/manage-content-1.png)

The ROOT is where content such "This is a folder", "This is a test" and "This is another folder" lives. 

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents

Returns when 200:
```json
{
    "results": [
        {
            "id": "_121047_1",
            "parentId": "_120893_1",
            "title": "This is a folder",
            "body": "content body",
            "description": "This is the folder description",
            "created": "2022-01-21T18:03:37.076Z",
            "modified": "2022-03-14T21:01:57.411Z",
            "position": 0,
            "hasChildren": true,
            "launchInNewWindow": false,
            "reviewable": false,
            "availability": {
                "available": "Yes",
                "allowGuests": true,
                "allowObservers": true,
                "adaptiveRelease": {}
            },
            "contentHandler": {
                "id": "resource/x-bb-folder"
            },
            "links": [
                {
                    "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_121047_1&parentId=_120893_1",
                    "rel": "alternate",
                    "title": "User Interface View",
                    "type": "text/html"
                }
            ]
        },
        {
            "id": "_120905_1",
            "parentId": "_120893_1",
            "title": "This is a test",
            "created": "2022-01-19T20:22:03.605Z",
            "modified": "2022-03-14T20:56:15.194Z",
            "position": 1,
            "hasGradebookColumns": true,
            "launchInNewWindow": true,
            "reviewable": false,
            "availability": {
                "available": "Yes",
                "allowGuests": true,
                "allowObservers": true,
                "adaptiveRelease": {}
            },
            "contentHandler": {
                "id": "resource/x-bb-asmt-test-link",
                "assessmentId": "_109303_1",
                "gradeColumnId": "_89584_1",
                "proctoring": {
                    "secureBrowserRequiredToTake": false,
                    "secureBrowserRequiredToReview": false,
                    "webcamRequired": false
                },
                "originalityReportingTool": {
                    "id": "safeAssign",
                    "checkSubmission": false,
                    "studentViewReports": false,
                    "excludeSubmissionsFromDatabases": false
                }
            },
            "links": [
                {
                    "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_120905_1&parentId=_120893_1",
                    "rel": "alternate",
                    "title": "User Interface View",
                    "type": "text/html"
                }
            ]
        },
        {
            "id": "_120902_1",
            "parentId": "_120893_1",
            "title": "This is another folder",
            "description": "This is the folder description",
            "created": "2022-01-19T20:20:27.429Z",
            "modified": "2022-03-14T21:02:03.619Z",
            "position": 2,
            "hasChildren": true,
            "launchInNewWindow": true,
            "reviewable": false,
            "availability": {
                "available": "Yes",
                "allowGuests": true,
                "allowObservers": true,
                "adaptiveRelease": {}
            },
            "contentHandler": {
                "id": "resource/x-bb-folder"
            },
            "links": [
                {
                    "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_120902_1&parentId=_120893_1",
                    "rel": "alternate",
                    "title": "User Interface View",
                    "type": "text/html"
                }
            ]
        }
    ]
}
```

We can also get content of one specific content_id:
![Returning content with the api](/assets/img/manage-content-2.png)
- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId

Returns: 
```json
{
    "id": "_121047_1",
    "parentId": "_120893_1",
    "title": "This is a folder",
    "body": "content body",
    "description": "This is the folder description",
    "created": "2022-01-21T18:03:37.076Z",
    "modified": "2022-03-14T21:01:57.411Z",
    "position": 0,
    "hasChildren": true,
    "launchInNewWindow": false,
    "reviewable": false,
    "availability": {
        "available": "Yes",
        "allowGuests": true,
        "allowObservers": true,
        "adaptiveRelease": {}
    },
    "contentHandler": {
        "id": "resource/x-bb-folder"
    },
    "links": [
        {
            "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_121047_1&parentId=_120893_1",
            "rel": "alternate",
            "title": "User Interface View",
            "type": "text/html"
        }
    ]
}
```

## Creating and Updating content

We can create new content or update existing content in the ROOT of the course using:

- POST {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents
- PATCH {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId

And in the body:
```json
{
    "title": "This is a new folder for content created using REST API",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "position": 1,
    "launchInNewWindow": false,
    "reviewable": true,
    "availability": {
        "available": "PartiallyVisible",
        "allowGuests": true,
        "allowObservers": true,
        "adaptiveRelease": {
            "start": "2003-06-12T02:12:48.505Z",
            "end": "2011-01-04T06:08:38.119Z"
        }
    },
    "contentHandler": {
        "id": "resource/x-bb-folder"
    }
}
```
It returns when 201:
```json
{
    "id": "_126266_1",
    "parentId": "_120893_1",
    "title": "This is a new folder for content created using REST API",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "created": "2022-03-14T21:31:32.552Z",
    "modified": "2022-03-14T21:31:32.611Z",
    "position": 1,
    "hasChildren": true,
    "launchInNewWindow": false,
    "reviewable": false,
    "availability": {
        "available": "PartiallyVisible",
        "allowGuests": true,
        "allowObservers": true,
        "adaptiveRelease": {
            "start": "2003-06-12T02:12:48.505Z",
            "end": "2011-01-04T06:08:38.119Z"
        }
    },
    "contentHandler": {
        "id": "resource/x-bb-folder"
    },
    "links": [
        {
            "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_126266_1&parentId=_120893_1",
            "rel": "alternate",
            "title": "User Interface View",
            "type": "text/html"
        }
    ]
}
```
And it looks in the gui, It has adaptive release, however, you can set it like this to avoid any type of adaptive release:

You can Learn more about adaptive release here: https://docs.blackboard.com/rest-apis/learn/getting-started/adaptive-release

![Creating content with the api](/assets/img/manage-content-3.png)

```json
{
    "title": "This is a new folder for content created using REST API, without adaptive release",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "position": 1,
    "launchInNewWindow": false,
    "reviewable": true,
    "availability": {
        "available": "Yes",
        "allowGuests": true,
        "allowObservers": true
    },
    "contentHandler": {
        "id": "resource/x-bb-folder"
    }
}
```
Looks like this:

![Creating content with the api](/assets/img/manage-content-4.png)

### Deleting content

- DELETE {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId

Returns
```json
204 - No content
```

## Children content (C.R.U.D)
### Returning children content
Let's say I want to check the content within my folder:

![Creating content with the api](/assets/img/manage-content-5.png)

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/children

Returns when 200:
```json
{
    "results": [
        {
            "id": "_121048_1",
            "parentId": "_121047_1",
            "title": "ut dolor ipsum labore",
            "body": "CONTENT",
            "created": "2022-01-21T18:08:56.086Z",
            "modified": "2022-01-21T18:08:56.138Z",
            "position": 0,
            "hasChildren": true,
            "launchInNewWindow": true,
            "reviewable": false,
            "availability": {
                "available": "Yes",
                "allowGuests": true,
                "allowObservers": true,
                "adaptiveRelease": {}
            },
            "contentHandler": {
                "id": "resource/x-bb-folder",
                "isBbPage": true
            },
            "links": [
                {
                    "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_121048_1&parentId=_121047_1",
                    "rel": "alternate",
                    "title": "User Interface View",
                    "type": "text/html"
                }
            ]
        }
    ]
}
```
## Creating Children content

Please review the types of content you can create based on the contentHandler, please review: https://docs.blackboard.com/rest-apis/learn/advanced/contenthandler-datatypes

### Creating a folder within a folder
- POST {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/children

And in the body (Please notice the parentId attribute AND contentHandler):
```json
{
    "title": "This is a child of a folder, a folder within a folder",
    "parentId": "_121047_1",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "position": 1,
    "launchInNewWindow": false,
    "reviewable": true,
    "availability": {
        "available": "Yes",
        "allowGuests": true,
        "allowObservers": true
    },
    "contentHandler": {
        "id": "resource/x-bb-folder"
    }
}
```
Returns with 201:
```json
{
    "id": "_127321_1",
    "parentId": "_121047_1",
    "title": "This is a child of a folder, a folder within a folder",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "created": "2022-03-17T17:03:13.686Z",
    "modified": "2022-03-17T17:03:13.761Z",
    "position": 1,
    "hasChildren": true,
    "launchInNewWindow": false,
    "reviewable": false,
    "availability": {
        "available": "Yes",
        "allowGuests": true,
        "allowObservers": true,
        "adaptiveRelease": {}
    },
    "contentHandler": {
        "id": "resource/x-bb-folder"
    },
    "links": [
        {
            "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_127321_1&parentId=_121047_1",
            "rel": "alternate",
            "title": "User Interface View",
            "type": "text/html"
        }
    ]
}
```
And looks: 

![Creating content with the api](/assets/img/manage-content-6.png)

### Creating content within a folder
- POST {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId/children

And in the body (Please notice the parentId attribute AND contentHandler):
```json
{
    "title": "This is a child of a folder, This is content",
    "parentId": "_121047_1",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "position": 1,
    "launchInNewWindow": false,
    "reviewable": true,
    "availability": {
        "available": "Yes",
        "allowGuests": true,
        "allowObservers": true
    },
    "contentHandler": {
        "id": "resource/x-bb-folder",
        "isBbPage": true
    }
}
```
When 201 returns:
```json
{
    "id": "_127322_1",
    "parentId": "_121047_1",
    "title": "This is a child of a folder, This is content",
    "body": "Body can be created using BBML, please review developers.blackboard.com for more information and docs.blackboard.com https://docs.blackboard.com/rest-apis/learn/advanced/bbml",
    "description": "Content description",
    "created": "2022-03-17T17:28:29.688Z",
    "modified": "2022-03-17T17:28:29.796Z",
    "position": 1,
    "hasChildren": true,
    "launchInNewWindow": false,
    "reviewable": false,
    "availability": {
        "available": "Yes",
        "allowGuests": true,
        "allowObservers": true,
        "adaptiveRelease": {}
    },
    "contentHandler": {
        "id": "resource/x-bb-folder",
        "isBbPage": true
    },
    "links": [
        {
            "href": "/ultra/redirect?redirectType=nautilus&courseId=_13969_1&contentId=_127322_1&parentId=_121047_1",
            "rel": "alternate",
            "title": "User Interface View",
            "type": "text/html"
        }
    ]
}
```
And it looks:

![Creating content with the api](/assets/img/manage-content-7.png)

### Updating children content

This is the same as:
- PATCH {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId

Which was reviewed (and is the same) in the previous segment.

### Deleting children content

This is the same as:
- DELETE {{baseUrl}}/learn/api/public/v1/courses/:courseId/contents/:contentId

Returns
```json
204 - No content
```
## Some notes on Original
The main difference about managing content in original is that you will always find two specific items created by default on toc:
Information and content, those become the parents of content and you may create children content under those, you may create new parents and those should be reflected under the TOC, however those items cannot display information but contain it:
![Creating content with the api](/assets/img/manage-content-8.png)
