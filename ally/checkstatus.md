---
layout: ally
title: Check the processing status of a file
parent: ally
category: resources
tags: ['developer', 'rest', 'getting started', 'ally', 'api', 'jwt','json web token']
author: scott
---
# Check the processing status of a file

Ally processes files asynchronously. We aim to process files in near-realtime, but some delays might be present. This endpoint can be used to poll for status updates.

---

## Endpoint
```
GET /api/v2/clients/:clientId/content/:contentHash/status
```

### Path Parameters
* **clientId** - Path parameter - Your Ally Client ID
* **contentHash** - Path parameter - The content hash from the previous endpoint

### Body Parameters
* None

### Query Parameters
* None

---

## Expected response
This endpoint will always return a 200 status code for existing content hashes regardless of whether the file was processed successfully.
```
{
    "hash": "MS4gQWxsI...",
    "status": "success",
    "statusUrl": "/api/v2/clients/:clientId/content/MS4gQWxsIH.../status",
    "resourceUrl": "/api/v2/clients/:clientId/content/MS4gQWxsIH..."
}
```

Parameter | Definition
--- | ---
hash | the content hash used to reference the file by Ally as a Service
status | the stage of processing the file is in*
statusUrl | the endpoint to call to check the status
resourceUrl | the endpoint to retrieve the report or metadata

*The following status values can be identified:
* success
* pending
* inprogress
* failed

--- 

## Testing with cURL
```
curl \
  -H "Authorization: Bearer myJwtToken" \
  https://prod.ally.ac/api/v2/clients/:clientId/content/:contentHash/status
```