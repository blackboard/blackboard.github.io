---
layout: post
title: "cURL Demo for attachments"
id: rest_apis-learn-examples-curl_attach_demo
categories: Learn Rest
author: Mark O'Neil
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes:
 - \usepackage{fvextra}
 - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
 - \usepackage[obeyspaces,spaces,hyphens]{xurl}
---

{% assign sluggedName = page.name | replace: '.md' %}

<div class="download-btn-placement"><br>modified: {{ page.last_modified_at | date: '%b-%d-%y' }} &nbsp;&nbsp; 
<a href="/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/img/download.png" height="30px"></a></div>

# Using cURL to access content attachments

The Learn REST API supports accessing Content Item information and URLs for
downloading content attachments.

The following is a cookbook that covers the basics for discovering and
downloading attachments for both an Ultra and an Original Course.

Unless noted the steps are the same. Note that we will only comment on
iteration requirements and forego execution thereof in this demo.

Note that **\_36662_1** is an Ultra course and **\_60054_1** is an Original
Course.

### STEP ONE: Generate an Access Token

Request:

```bash
$ curl -k --user <appkey>:<appsecret> --data "grant_type=client_credentials" https://ultra-integ.int.bbpd.io/learn/api/public/v1/oauth2/token
```

Result:

```json
{“access_token”:"QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr","token_type":"bearer","expires_in":3599}
```

### STEP TWO: GET a list of top level content

Note this step is the same for both Ultra and Original courses

**Ultra**:

Request:

```bash
$ curl -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_36662_1/contents
```

Results:

```json
{
  "results": [
    {
      "parentId": "_216719_1",
      "position": 0,
      "availability": {
        "allowGuests": true,
        "available": "No",
        "adaptiveRelease": {}
      },
      "id": "_596394_1",
      "title": "SOAP Deprecation Announcement.pdf",
      "created": "2018-11-28T18:38:50.621Z",
      "contentHandler": {
        "id": "resource/x-bb-file",
        "file": {
          "fileName": "SOAP-Deprecation-20Announcement.pdf"
        }
      }
    },
    {
      "parentId": "_216719_1",
      "position": 1,
      "availability": {
        "allowGuests": true,
        "available": "Yes",
        "adaptiveRelease": {}
      },
      "id": "_435736_1",
      "title": "Download PDF",
      "hasChildren": true,
      "created": "2017-08-23T19:16:34.781Z",
      "contentHandler": {
        "id": "resource/x-bb-folder",
        "isBbPage": true
      }
    }
  ]
}
```

**Original**:

Request:

```bash
$ curl -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents
```

Results:

```json
{
  "results": [
    {
      "position": 1,
      "availability": {
        "allowGuests": true,
        "available": "Yes",
        "adaptiveRelease": {}
      },
      "id": "_382277_1",
      "title": "Information",
      "hasChildren": true,
      "created": "2017-06-09T12:41:07.019Z",
      "contentHandler": {
        "id": "resource/x-bb-folder"
      }
    },
    {
      "position": 2,
      "availability": {
        "allowGuests": true,
        "available": "Yes",
        "adaptiveRelease": {}
      },
      "id": "_382278_1",
      "title": "Content",
      "hasChildren": true,
      "created": "2017-06-09T12:41:07.021Z",
      "contentHandler": {
        "id": "resource/x-bb-folder"
      }
    }
  ]
}
```

### STEP THREE: Discover Downloadable Content

Here you will iterate over the result set and based on a set of criteria
identify downloadable content. The criteria is whether a content item has an
id of `resource/x-bb-folder` or `resource/x-bb-document`, has child items, and
whether an item has an id of `resource/x-bb-file`.

So in the above examples the Ultra course, `_36662_1`, has one top level
downloadable and a folder with child content, and the Original course has two
folders.

In each case we would iterate over the result set and take the appropriate
action based on the content item id and whether the item, if a type of folder
or document, has children.

```bash
Get children
If folder
  Get children
  If document and Ultra Course parse BBML for attachment URL
else if not Ultra Course get attachments
  get attachment Id
  get attachment download
```

In this example both the Ultra and the Original course have folders, with
children so we need to determine whether any of the children in either are
downloadable content:

**Ultra**:

Request:

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_36662_1/contents/_435736_1/children
```

Response:

```json
{
  "results" : [
  {
    "parentId" : "_435736_1",
    "position" : 0,
    "availability" : {
      "allowGuests" : true,
      "available" : "Yes",
      "adaptiveRelease" : {
      }
    },
    "id" : "_435737_1",
    "title" : "ultraDocumentBody",
    "created" : "2017-08-23T19:16:38.848Z",
    "body" : "<!-- {\"bbMLEditorVersion\":1} --><a href=\"https:\/\/ultra-integ.int.bbpd.io\/bbcswebdav\/
    pid-435737-dt-content-rid-21916118_1\/xid-21916118_1?VxJw3wfC56=1543432981&Kq3cZcYS15=a253d31a6d36425
    c81aaa457ee9e2f04&3cCnGYSz89=f5CtU2s5tQcNJpZFO8tjCoIPZ9z6ZpOhzQpZ23SXyFk%3D\"data-bbfile=\"{&quot;
    render&quot;:&quot;attachment&quot;,&quot;alternativeText&quot;:&quot;SOAP Deprecation
    Announcement.pdf&quot;,&quot;linkName&quot;:&quot;SOAP Deprecation Announcement.pdf&quot;,&quot;
    mimeType&quot;:&quot;application\/pdf&quot;}\"data-bbid=\"bbml-editor-id_e18bbfe0-876c-448e-b178-
    0d8371738b86\">SOAP Deprecation Announcement.pdf<\/a>",
    "contentHandler" : {
      "id" : "resource\/x-bb-document"
    }
  }]
}
```

**Original**:

Request:

```bash
$ curl -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_382278_1/children
```

Response:

```json
{
  “results”:[{
    “id”:”_382277_1”,
    “title":"Information",
    “created":"2017-06-09T12:41:07.019Z",
    “position":1,
    “hasChildren":true,
    “availability”:{
      "available":"Yes",
      “allowGuests":true,
      “adaptiveRelease”:{}
    },
    “contentHandler":{
      “id":"resource/x-bb-folder"
    }
  },
  {
    “id":"_382278_1",
    “title”:"Content",
    “created":"2017-06-09T12:41:07.021Z",
    “position":2,
    “hasChildren":true,
    “availability”:{
      "available":"Yes",
      “allowGuests":true,
      "adaptiveRelease":{}
    },
    “contentHandler":{
      “id":"resource/x-bb-folder"
    }
  }]
}
```

Here we have a document and a folder - we can access the found document and
then continue iterating on requests until we had no folders and have walked
the folder tree.

### STEP FOUR: Accessing found documents

Here is where Ultra is handled differently than Original.

In Ultra the URL for the attachment is embedded in the BBML for the content
Item as shown in this snippet from the above example:

```html
"body" : "<!-- {\"bbMLEditorVersion\":1} --><a
href=\"**https:\/\/ultra-integ.int.bbpd.io\/bbcswebdav\/
pid-435737-dt-content-rid-21916118_1\/_xid-21916118_1_?VxJw3wfC56=1543432981&Kq3cZcYS15=a253d31a6d36425
c81aaa457ee9e2f04&3cCnGYSz89=f5CtU2s5tQcNJpZFO8tjCoIPZ9z6ZpOhzQpZ23SXyFk%3D**\"
data-bbfile=\"{&quot;
render&quot;:&quot;attachment&quot;,&quot;alternativeText&quot;:&quot;SOAP
Deprecation Announcement. pdf&quot;,&quot;linkName&quot;:&quot;SOAP Deprecation
Announcement.pdf&quot;,&quot;mimeType&quot;: &quot;application\/pdf&quot;}\"
data-bbid=\"bbml-editor-id_e18bbfe0-876c-448e-b178-0d8371738b86\"> SOAP
Deprecation Announcement.pdf<\/a>"
```

To access the document URL for downloading you must search the bbml and
extract any href string that contains a content item xid:

```html
https:\/\/ultra-integ.int.bbpd.io\/bbcswebdav\/pid-435737-dt-content-rid-21916118_1\/_xid-21916118_1_
?VxJw3wfC56=1543432981&Kq3cZcYS15=a253d31a6d36425c81aaa457ee9e2f04&3cCnGYSz89=f5CtU2s5tQcNJpZFO8tj
CoIPZ9z6ZpOhzQpZ23SXyFk%3D
```

These URL strings represent content item attachments in Ultra.

**Original**:

In the case of an Original course once you have identified a content item as
an attachment via the `"id" : "resource\/x-bb-document` tag you then may get
the attachment id. Thus you must iterate through the content Ids to discover
content which has the x-bb-document identifier :

**Request:**

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_382278_1
```

**Result:**

```json
{
  “id”:"_382278_1",**
  “title":"Information",
  “created":"2017-06-09T12 : 41 : 07.019Z”,
  “position":1,"hasChildren":true,
  “availability":{
    “available":"Yes",
    “allowGuests":true,
    "adaptiveRelease":{}
  },
  “contentHandler":{
    “id":"resource/x-bb-folder"
  }
}
```

We have a folder so get it’s children…

**Request:**

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_382278_1/children
```

**Response:**

```json
{
  “results”:[{
    “id":"_596395_1",
    “parentId":"_382278_1",
    "title":"FOLDER OF PDFs”,
    "body":"<p>Folder containing downloadable content</p>”,
    “created":"2018-11-28T20:01:00.691Z",
    “position":0,
    “hasChildren":true,
    “availability":{
      “available":"Yes",
      “allowGuests":true,
      “adaptiveRelease”:{}
    },
    “contentHandler":{
      “id":"resource/x-bb-folder"
    }
  }]
}
```

**Request:**

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_596395_1
```

**Response:**

```json
{
  “id":"_596395_1",
  “parentId":"_382278_1",
  "title":"FOLDER OF PDFs”,
  "body":"<p>Folder containing downloadable content</p>”,
  “created":"2018-11-28T20:01:00.691Z",
  “position":0,
  “hasChildren":true,
  “availability":{
    “available":"Yes",
    “allowGuests":true,
    “adaptiveRelease”:{}
  },
  “contentHandler":{
    “id":"resource/x-bb-folder"
  }
}
```

**Request:**

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_596395_1/children
```

**Response:**

```json
{
  “results":[{
    “id":"_596397_1",
    “parentId":"_596395_1",
    "title":"SOAP Deprecation PDF”,
    ”created”:"2018-11-28T20:02:13.612Z",
    “position":0,
    “availability":{
      “available":"Yes",
      “allowGuests":true,
      “adaptiveRelease":{}
    },
    “contentHandler":{
      “id":"resource/x-bb-document"
    }
  }]
}
```

Now we have a document - check to see if there are any attachments…

Note that there may be multiple file attachments - in this case there is only
one.

**Request:**

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/cotsses/_60054_1/contents/_596397_1/attachments
```

**Response:**

```json
{
  "id":"_42588_1",
  "fileName":"SOAP Deprecation Announcement.pdf”,”mimeType":"application/pdf"
}
```

**Request:**

```bash
$ curl -k -X GET -H "Authorization: Bearer 8vHQpudSKbIx68jC6M5rykN66R2p048Z"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_596397_1/attachments/_42588_1
```

**Response:**

```json
{
  "id":"_42588_1",
  "fileName":"SOAP Deprecation Announcement.pdf”,"mimeType":"application/pdf"
}
```

Once you have the Attachment Id you may request the download URL:

Note that the download URL is contained in the response header’s Location
element so you have to add the -i|—include flag to the curl command to display
the response headers:

**Request:**

```bash
$ curl -i -k -X GET -H "Authorization: Bearer QvWicpu3kMA9coWMv7TKLPzYnq4nUnfr"
https://ultra-integ.int.bbpd.io/learn/api/public/v1/courses/_60054_1/contents/_596397_1/attachments/_42588_1/download
```

**Response:**

```http
HTTP/1.1 302
Cache-Control: private
Cache-Control: max-age=0
Cache-Control: no-store
Cache-Control: must-revalidate
Content-Security-Policy: frame-ancestors 'self'
Content-Type: application/octet-stream
Date: Wed, 28 Nov 2018 23:40:32 GMT
Expires: Tue, 28 Nov 2017 23:40:32 GMT
Last-Modified: Sat, 28 Nov 1998 23:40:32 GMT
Location: https://ultra-integ.int.bbpd.io/bbcswebdav/xid-21916142_1?VxJw3wfC56=1543449332&Kq3cZcYS15=
a253d31a6d36425c81aaa457ee9e2f04&3cCnGYSz89=A9bgt2bWD7NXyIzsI5kHPQQKBCpZ/qnQZ6XM2cqmZPI%3D
P3P: CP="CAO PSA OUR"
Pragma: private
Server: openresty/1.9.3.1
Set-Cookie: JSESSIONID=96003AD1BF73967D9CE359D5037BDECE; Path=/learn/api;
Secure
X-Blackboard-appserver: ip-10-145-23-249.ec2.internal
X-Blackboard-product: Learn &#8482; 3500.7.0-ci.4055+6a82373
X-Frame-Options: SAMEORIGIN
Content-Length: 0
Connection: keep-alive
```

### STEP FIVE:

Rinse-repeat for additional folder or document content items.

## Uploading files to content

You can do so by following this guide: https://docs.blackboard.com/rest-apis/learn/advanced/bbml#uploaded-files ![image](https://user-images.githubusercontent.com/2322778/158894421-3eaf4125-ff17-4bff-8a1f-55d10101e30e.png)

