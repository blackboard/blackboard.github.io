---
layout: post
title: "Using Table of Contents in Original course view"
id: rest_apis-learn-working_with_learn_apis-course_toc
categories: Learn REST toc
toc: True
---

# Using Table of Contents in Original course view

This guide is only intended to be used in courses that use the original course view.

> Tested with Blackboard Learn Release 3900.48.0-rel.18+c7edfda

For now, it is possible to **GET** and **PATCH** the Table of contents (TOC) **ONLY** in Courses that use the original course view, if you try to make API calls on Ultra course view, you will receive the following message:

- GET /learn/api/public/v1/courses/:courseId/tocItems

```json
{
  "status": 400,
  "message": "Ultra course is not supported"
}
```

## What is TOC?

TOC or Table of contents is the menu that everyone sees on the top left of the page, like this:

![Image of the course toc within Learn](/assets/img/course_toc-first-image.png)

Now if you do the same call, you will receive this:

- GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/tocItems

```json
{
  "results": [
    {
      "id": "_10223_1",
      "courseId": "_907_1",
      "contentId": null,
      "label": "Home Page",
      "targetType": "Module",
      "position": 0,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": true,
      "allowGuests": true,
      "allowObservers": true
    },
    {
      "id": "_10222_1",
      "courseId": "_907_1",
      "contentId": "_6674_1",
      "label": "Information",
      "targetType": "Content",
      "position": 1,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": false,
      "internalHandle": "content",
      "allowGuests": true,
      "allowObservers": true
    },
    {
      "id": "_10221_1",
      "courseId": "_907_1",
      "contentId": "_6673_1",
      "label": "Content",
      "targetType": "Content",
      "position": 2,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": false,
      "internalHandle": "content",
      "allowGuests": true,
      "allowObservers": true
    },
    {
      "id": "_10220_1",
      "courseId": "_907_1",
      "contentId": null,
      "label": "Discussions",
      "targetType": "Application",
      "position": 3,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": false,
      "internalHandle": "discussion_board_entry",
      "allowGuests": false,
      "allowObservers": false
    },
    {
      "id": "_10219_1",
      "courseId": "_907_1",
      "contentId": null,
      "label": "Groups",
      "targetType": "Application",
      "position": 4,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": false,
      "internalHandle": "groups",
      "allowGuests": false,
      "allowObservers": false
    },
    {
      "id": "_10218_1",
      "courseId": "_907_1",
      "contentId": null,
      "label": "Tools",
      "targetType": "Application",
      "position": 5,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": false,
      "internalHandle": "course_tools_area",
      "allowGuests": false,
      "allowObservers": false
    },
    {
      "id": "_10217_1",
      "courseId": "_907_1",
      "contentId": null,
      "label": "Help",
      "targetType": "Application",
      "position": 6,
      "launchInNewWindow": false,
      "isEnabled": true,
      "isEntryPoint": false,
      "internalHandle": "student_manual",
      "allowGuests": false,
      "allowObservers": false
    }
  ]
}
```

Basically, when using this endpoint it "Returns a list of Course TOC entries associated to a course.".

### Required entitlements

In order to use:

- GET /learn/api/public/v1/courses/:courseId/tocItems
- PATCH /learn/api/public/v1/courses/{courseId}/tocItems/{tocId}

You will need:

- course.configure-areas.EXECUTE -> Entitlement

### Mapping the returned values with the GUI

![Image of the mapping between course toc and get payload](/assets/img/course_toc-second-image.png)

Please remember you can always check in our documentation the model to understand the meaning of each attribute in the payload in our [Developer Portal](https://developer.anthology.com/portal/displayApi)

![Image of the model](/assets/img/course_toc-third_image.png)

### Using PATCH Course TOC

It is very important to remember that this patch method can only update two attributes:

- allowGests -> Defines whether or not Guests can view this TOC
- allowObservers -> Defines whether or not observers can view this TOC

The payload looks like this:

```json
}
  "allowGuests": true,
  "allowObservers": true
}
```

Also, please keep in mind the following guideline:

"Updates a specific TOC entry. Only allowGuests and allowObservers flags are modifiable, the remaining fields are read-only. User should keep in mind that in order to modify such TOC fields, Course's allowGuest and allowObservers configuration must be enabled. Also, if user wants to update a TOC register's allowGuest flag and TOC is associated to a CONTENT or APPLICATION target type, Course Tool Settings must have allowGuests flag enabled. If user wants to update a TOC register's allowObserver flag and TOC is associated to an APPLICATION target type, Course Tool Settings must have allowObservers flag enabled."
