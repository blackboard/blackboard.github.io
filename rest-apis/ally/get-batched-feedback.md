---
layout: post
title: "Retrieve the feedback for multiple files"
id: rest_apis-ally-getting_batched_feedback
categories: Ally
author: Simon Gaeremynck
---

# Retrieve the feedback for multiple files

The batch endpoint allows you to retrieve content for more than one content hash

## Endpoint

```http
GET /api/v2/clients/:clientId/content/batch
```

### Path Parameters

- **clientId** - Path parameter - Your Ally Client ID

#### Body Parameters

The request body is a JSON encoded request of the form:

```json
{
  "references": [
    { "hash": "a1b2c3d..." },
    { "hash": "QWxseSs..." },
    { "hash": "e1f2123..." }
  ]
}
```

#### Query Parameters

- **feedback**
  - Query parameter - Whether feedback information should be returned. Should be true, false or omitted.
  - Requires the `content:getDetails:withFeedback` action to be granted in the JWT token before data is release
- **formats**
  - Query parameter - Whether alternative format information should be returned. Should be true, false or omitted.
  - Requires the `content:getDetails:withFormats` action to be granted in the JWT token before data is release

## Expected response

The values in the JSON array will follow the same order as in the submitted request. If no information could be
retrieved for a content reference, the `null` value will be returned.

**formats=true**

```json
{
  "reports": [
    null,
    {
      "hash": "QWxseSs...",
      "feedback": null,
      "formats": {
        "availableFormats": ["Beeline", "Tts", "Epub", "Braille", "Html"],
        "canToggleAvailability": false,
        "available": true,
        "visibility": true
      },
      "metadata": {
        "name": "Ally+-+One+Pager+-+Higher+Ed+-+General.pdf",
        "decorative": null,
        "description": null,
        "fileType": "pdf",
        "mimeType": "application/pdf",
        "isVersioned": false,
        "isSeizureInducing": false,
        "libraryReference": null
      }
    },
    null
  ]
}
```

### Testing with cURL

```bash
curl \
  -H "Authorization: Bearer myJwtToken" \
  -H "Content-Type: application/json" \
  -d '{"references": [{"hash": "a1b2c3d..."},{"hash": "QWxseSs..."},{"hash": "e1f2123..."}]}' \
  https://prod.ally.ac/api/v2/clients/:clientId/content/bash
```
