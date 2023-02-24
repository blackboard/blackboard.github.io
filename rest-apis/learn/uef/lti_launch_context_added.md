---
layout: post
title: "LTI Launch context added in new Window Launches"
categories: Learn UEF
id: rest_apis-learn-uef-launch_context_added_nwl
author: Subitha Muniasamy
toc: true
---

# LTI Launch context added in new Window Launches

## Introduction

This enhancement to the UEF integration framework provides the ability for an integration to send a newEvent **lti:launch** even when the route is directed to new window launch from the LTI service, which inclujdes toolHref (launchUrl) and the placementId along with it.

### Updated response for existing EventTypes

Currently when navigation to the LTI laumch inside the same page, the route event type we subscribe to is eventType: **"route","route:changing"**. As expected the LTI launch in the same window, will have the previously defined events and the launch URL is added as toolHref and the placementId in the same url as the **blti_placement_id**.

#### Sample Response:

> Existing - Subscribing Events

```json
{
  type: "event:event",
  eventType: "route",
   routeData: {
    "coursesOrOrganizations": "courses",
    "courseId": "_3_1",
    "isLaunchedInNewWindow": true/false,
    "toolHref": "https://mylearn.int.bbpd.io/webapps/blackboard/execute/blti/launchPlacement?blti_placement_id=_12_1&content_id=_35_1&course_id=_3_1&wrapped=true&from_ultra=true"
    }   ...
}
```

### New response for new EventTypes

This is when we select new window options while creating placements in LTI.
As expected the LTI launch in a new window will have the new mentioned events and launch url is added as toolHref and placementId in the same irl as **blti_placement_id**.

#### Sample response:

> New - Subscribing Events - eventType: "lti:launch"

```json
{
  type: "event:event",
  eventType: "lti:launch",
   launchData: {
    "coursesOrOrganizations": "courses",
    "courseId": "_3_1",
    "isLaunchedInNewWindow": true/false,
    "toolHref": "https://mylearn.int.bbpd.io/webapps/blackboard/execute/blti/launchPlacement?blti_placement_id=_12_1&content_id=_35_1&course_id=_3_1&wrapped=true&from_ultra=true"
    }   ...

}
```

![LTI launch context added](/assets/img/lti_launch_context_added_1.png)
