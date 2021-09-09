---
layout: post
title: "LTI Advantage - Sample Deep Linking JSON"
id: lti-deep_linking_two
categories: Standards
author: Scott Hurrey
tipue_search_active: true
toc: false
---

# LTI Advantage - Sample JSON

### Overview

This document documents sample JSON between the Blackboard Learn LMS and an
LTI Advantage Tool Provider. We'll be using https://github.com/blackboard/BBDN-LTI-Tool-Provider-Node for our examples. One use case we're often asked
about is doing video embeds in Blackboard Learn content. That will be our first, and for now, only example.

#### How to Embed LTI Link Items into the editor via Deep Linking

**When adding content back from the internal tool for LTI 1.1/Deep Linking 1.0, you can specify custom JSON, use:**

```json
{
  "@context": "http://purl.imsglobal.org/ctx/lti/v1/ContentItem",
  "@graph": [
    {
      "@type": "LtiLinkItem",
      "@id": ":item1",
      "title": "LTI embedded-app test",
      "mediaType": "text/html",
      "url": "https://lti-tool.dev.bbpd.io/lti",
      "placementAdvice": {
        "displayWidth": 147,
        "displayHeight": 184,
        "presentationDocumentTarget": "iframe"
      }
    }
  ]
}
```

**For LTI 1.3+/Deep Linking 2.0+ use:**

```json
{
  "type": "ltiResourceLink",
  "title": "An Embedded Resource",
  "text": "A description",
  "url": "https://lti-tool-jwt.dev.bbpd.io/lti13",
  "iframe": {
    "width": 500,
    "height": 800
  }
}
```
