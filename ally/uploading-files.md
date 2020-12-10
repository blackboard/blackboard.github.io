---
layout: post
title: "Upload a file to Ally" 
id: ally-uploading-files
categories: Ally
author: Scott Hurrey
---
# Upload a file to Ally
Start the process by uploading the file you would like to get feedback for.  This is a multipart POST request. The response will contain the statusUrl  that you can poll to check whether the file has been processed. If the file was processed previously, a resourceUrl will be provided through which you can fetch the feedback information immediately.

## Supported content types

* PDF files
* Microsoft® Word files
* Microsoft® PowerPoint® files
* OpenOffice/LibreOffice files
* Uploaded HTML files
* Image files (JPG, JPEG, GIF, PNG, BPM, TIFF)

---

### Endpoint
~~~ http
POST /api/v2/clients/:clientId/content
~~~

### Path Parameters

* **clientId** - Path parameter - Your Ally Client ID

### Body Parameters

* **file** - Post parameter - The binary file data

### Query Parameters

* None

## Expected response
There are two potential outcomes:

1. The file is new and will be processed asynchronously. The endpoint will return with a 202 Accepted response and the following response body:

    ~~~ json
    {
        "hash": "UkVBRE1FLm1k...",
        "status": "pending",
        "statusUrl": "/api/v2/clients/:clientId/content/UkVBRE1FLm1k.../status,
        "resourceUrl": null
    }
    ~~~

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

2. The file has been processed before. The endpoint will return a `303 See Other` with a `Location` header to the feedback URL

### Testing with cURL

~~~ bash
curl \
  -H "Authorization: Bearer myJwtToken" \
  -F"file=@test.pdf" https://prod.ally.ac/api/v2/clients/:clientId/content
~~~

## Frequently Asked Questions

This section contains answers to many of the common questions we field as developers are on-boarding to the Ally as a Service API. 

### Upload - input

* **Q: I have questions about the version support for each of these.  For instance, which versions of Office are supported?**
  * Office 365, Office 2016, LibreOffice 5.2, LibreOffice 5.4
* **Q: What image file formats are supported?** 
  * Most image types whose mimetype starts with image/
* **Q: Are there constraints on images: sizes, resolution?**  
  * No
* **Q: Are there any restrictions on HTML files? What about external references in the HTML files?**
  * External references will be resolved and included for the HTML accessibility check, but the files themselves will not be checked.
* **Q: Is there support for HTML archive formats?**
  * No
* **Q: Is there any support for archive format: zip, tar?**  
  * No

### Upload - mechanics

* **Q: We’re posting into an end-point protected with TLS 1.2 or higher, right?**  
  *  Yes. We use standard AWS security practices (ELBSecurityPolicy-TLS-1-2-2017-01)
* **Q: Related to the archive question, are we posting the raw file, or is it organized in a multipart/form-data?**  
  *  Raw Files are uploaded through a multipart upload. One file at a time.
* **Q: What’s the maximum file size?**  
  *  There is a 50MB file size limit. We're gathering feedback on how large this limit should be to support our customers.
* **Q: Does the endpoint require a particular encoding?**  
  * UTF-8 is recommended
* **Q: Does the POST have to have an accurate Content-Length: header?**  
  * Yes
* **Q: Do the authentication tokens expire?**  
  *  No
* **Q: If we had N writers submitting to this API, would each have to have a separate authentication token?**  
  *  No
* **Q: Can we submit compressed files?  No If so, what compression does Ally support?**  
  * None
* **Q: For the 303/See Other response, if we mistakenly permitted two writers to submit the same file in some brief period, would that automatically be caught?  How long is that window?**  
  * Yes

### Upload - output

* **Q: I’m especially surprised to see the (x0,y0,x1,y) notation for errors.  Can you tell me more about that?**  
  * These are coordinates for areas in the document that contain some accessibility issue. They are coordinates that correspond to our PDF preview version.
* **Q: The output meta data contains “isVersioned”.  Is there a standard way to present versions of documents when we post them?**  
  * No, see next answer.
* **Q: The meta data contains a “name”, “description” and other parameters.  But these are not reflections of arguments in the initial POST.  Is this just an indication that there’s a richer set of arguments for the submission phase?**  
  *  These parameters are artifacts from our LMS API. They will be removed shortly as they carry no function in a standalone function.