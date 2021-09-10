---
layout: post
title: "Retrieve the feedback for a file"
id: rest_apis-ally-getting_feedback
categories: Ally
author: Scott Hurrey
---

# Retrieve the feedback for a file

Once the file is processed, the feedback can be retrieved

## Endpoint

```http
GET /api/v2/clients/:clientId/content/:contentHash
```

### Path Parameters

- **clientId** - Path parameter - Your Ally Client ID
- **contentHash** - Path parameter - The content hash from the previous endpoint

#### Body Parameters

- None

#### Query Parameters

- **feedback**
  - Query parameter - Whether feedback information should be returned. Should be true, false or omitted.
  - Requires the `content:getDetails:withFeedback` action to be granted in the JWT token before data is release
- **formats**
  - Query parameter - Whether alternative format information should be returned. Should be true, false or omitted.
  - Requires the `content:getDetails:withFormats` action to be granted in the JWT token before data is release

## Expected response

For more information on the contents of this JSON, visit the [feedback definitions page](/rest-apis/ally/feedback-definitions).

**feedback=true**

```json
    {
        "hash": "Mi4gSGVhZGluZ3NfdGFnZ2VkX2luY29ycmVjdGx5LnBkZjo4NkE3NEJGOTUxRDA2NEM4Qzk1ODUyMDI0NEQ0REJBNkM4RDdGRjJCOmFwcGxpY2F0aW9uL3BkZg==",
        "feedback": {
          "score": 0.4292113158749556,
          "visibility": "medium",
          "report": {
            "results": {
              "Scanned": {
                "score": 1
              },
              "Tagged": {
                "score": 1
              },
              "AlternativeText": {
                "snippets": [
                  {
                    "page": 3,
                    "y0": 397.45,
                    "x0": 72,
                    "y1": 720,
                    "x1": 526
                  },
                  {
                    "page": 4,
                    "y0": 394.81,
                    "x0": 72,
                    "y1": 720,
                    "x1": 476.8
                  },
                  ....
                ],
                "score": 0
              },
              "Contrast": {
                "snippets": [
                  {
                    "page": 0,
                    "y0": 588.6369,
                    "x0": 63.583138,
                    "y1": 612.7333,
                    "x1": 385.0053
                  },
                  {
                    "page": 1,
                    "y0": 688.4769,
                    "x0": 63.583138,
                    "y1": 712.5733,
                    "x1": 473.90308
                  },
                  ...
                ],
                "score": 0.9442992157651318
              },
              "HeadingsSequential": {
                "snippets": [
                  {
                    "page": 2,
                    "y0": 583.18,
                    "x0": 72.024,
                    "y1": 620.98,
                    "x1": 233.324
                  }
                ],
                "score": 0.9230769230769231
              },
              "HeadingsHigherLevel": {
                "snippets": [],
                "score": 1
              },
              "Title": {
                "score": 0
              },
              "TableHeaders": {
                "snippets": [
                  {
                    "page": 1,
                    "y0": 344.09,
                    "x0": 77.664,
                    "y1": 645.45996,
                    "x1": 517.17
                  }
                ],
                "score": 0
              },
              "LanguagePresence": {
                "score": 1
              },
              "HeadingsPresence": {
                "score": 1
              },
              "LanguageCorrect": {
                "detectedLanguage": "en",
                "score": 1
              },
              "HeadingsStartAtOne": {
                "snippets": [
                  {
                    "page": 0,
                    "y0": 586.06,
                    "x0": 72.024,
                    "y1": 620.26,
                    "x1": 376.75403
                  }
                ],
                "score": 0
              },
              "LibraryReference": {
                "score": 0
              }
            },
            "suggestions": {
              "HeadingsSequential": 0.4306552764930626,
              "Title": 0.4471530009744932,
              "TableHeaders": 0.47092573373138025,
              "HeadingsStartAtOne": 0.44798280391034667,
              "AlternativeText": 0.6169261962288668,
              "Contrast": 0.4515796153846155,
              "LibraryReference": 1
            }
          }
        },
        "formats": null,
        "metadata": {
          "name": "2. Headings_tagged_incorrectly.pdf",
          "decorative": null,
          "description": null,
          "fileType": "pdf",
          "mimeType": "application/pdf",
          "isVersioned": false,
          "isSeizureInducing": false,
          "libraryReference": null
        }
      }
```

**feedback=false or omitted**

```json
{
  "hash": "RGV2ZWxvcGVyIFJlbGF0aW9ucyBhbmQgU3RhbmRhcmRzIFRlYW0gRGVzaWduLnBwdHg6Qz",
  "feedback": null,
  "formats": null,
  "metadata": {
    "name": "Developer Relations and Standards Team Design.pptx",
    "decorative": null,
    "description": null,
    "fileType": "presentation",
    "mimeType": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
    "isVersioned": false,
    "isSeizureInducing": false,
    "libraryReference": null
  }
}
```

### Testing with cURL

```bash
curl \
  -H "Authorization: Bearer myJwtToken" \
  https://prod.ally.ac/api/v2/clients/:clientId/content/:contentHash
```
