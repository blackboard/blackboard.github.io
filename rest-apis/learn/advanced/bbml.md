---
layout: post
title: "BbML"
id: rest_apis-learn-advanced-bbml
categories: Learn REST
author: Scott Hurrey
doctitle: "BbML: Blackboard Markup Language"
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes: |
  \usepackage{fvextra}
  \usepackage[obeyspaces,spaces,hyphens]{xurl}
  \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
  \usepackage{hyperref}
---

{% assign sluggedName = page.name | replace: '.md' %}
# BbML: Blackboard Markup Language <a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a> 

### Overview

BbML is a subset of HTML. The parameters of some methods accept BbML-formatted
text. For more information about particular Learn REST endpoints, see the
[REST API documentation](https://developer.anthology.com/portal/displayApi){:target="\_blank"}

### BbML specification - version 1

A BbML field accepts text containing either:

- Ultra experience courses: BbML
- Original experience: safe HTML
- Either experience outside of the context of courses: safe HTML

Valid BbML uses only following HTML elements and only the attributes accepted
for each element. You can use attributes marked _Internal use only_ as part of
a REST API GET method when you are patching/updating an existing resource. Do
not use them to create a resource from scratch.

- a
- br
- del
- div
- em
- h4
- h5
- h6
- img
- li
- ol
- p
- span
- strong
- sub
- sup
- ul

For more information about each accepted element, see below.

##### a

| Attribute     | Comment                                                                                                                                                                             |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| data-bbid     | **Deprecated** Internal use only.                                                                                                                                                   |
| data-bbfile   | Rendering control for use with Ultra UI. `data-bbfile="{&quot;render&quot;:&quot;inline&quot;,&quot;linkName&quot;:&quot;1.jpg&quot;,&quot;mimeType&quot;:&quot;image/jpeg&quot;}"` |
| data-bbtype   | Internal use only.                                                                                                                                                                  |
| data-mce-href | Internal use only.                                                                                                                                                                  |
| href          |                                                                                                                                                                                     |
| rel[nofollow] |                                                                                                                                                                                     |

##### br

| Attribute      | Comment            |
| -------------- | ------------------ |
| data-mce-bogus | Internal use only. |

##### del

##### div

| Attribute | Comment            |
| --------- | ------------------ |
| data-bbid | Internal use only. |

##### em

##### h4

##### h5

##### h6

##### img

| Attribute    | Comment                                                |
| ------------ | ------------------------------------------------------ |
| align        |                                                        |
| alt          |                                                        |
| class        |                                                        |
| data-mathml  | MathML from which the image was created if applicable. |
| data-mce-src | Internal use only.                                     |
| src          |                                                        |

##### li

##### ol

| Attribute                 | Comment            |
| ------------------------- | ------------------ |
| data-mce-style            | Internal use only. |
| style[list-style-type: *] |                    |

##### p

##### span

| Attribute                                             | Comment            |
| ----------------------------------------------------- | ------------------ |
| data-mce-bogus                                        | Internal use only. |
| data-mce-style                                        | Internal use only. |
| style[font-style: *,font-weight: *,text-decoration:*] |                    |

##### strong

##### sub

##### sup

##### ul

| Attribute                 | Comment            |
| ------------------------- | ------------------ |
| data-mce-style            | Internal use only. |
| style[list-style-type: *] |                    |

### Examples

If one were to use the following as the input to a BbML field of a resource
within an Ultra course context, such as an Ultra Document:

```html
<!-- {"bbMLEditorVersion":1} -->

<div data-bbid="bbml-editor-id_9c6a9556-80a5-496c-b10d-af2a9ab22d45">
  <h2>Header Large</h2>

  <h5>Header Medium</h5>

  <h6>Header Small</h6>

  <p>
    <strong>Bold </strong
    ><em
      >Italic
      <span
        style="text-decoration:
  underline;"
        >Italic Underline</span
      ></em
    >
  </p>

  <ul>
    <li>
      <span style="text-decoration: underline;"><em></em></span>Bullet 1
    </li>

    <li>Bullet 2</li>
  </ul>

  <p><img /></p>

  <p>
    <span
      >"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris."</span
    >
  </p>

  <p><span>&lt;braces test="values" other="encoded values"&gt;</span></p>

  <p>Header Small</p>

  <ol>
    <li>Number 1</li>

    <li>Number 2</li>
  </ol>

  <p>
    Just words followed by a formula
    <img
      align="middle"
      alt="3 divided by 4 2
  root of 7"
      class="Wirisformula"
      data-mathml="Â«math

  xmlns=Â¨[http://www.w3.org/1998/Math/MathMLÂ¨Â»Â«mnÂ»3Â«/mnÂ»Â«moÂ»/Â«/moÂ»Â«m
  nÂ»4Â«/mnÂ»Â«mrootÂ»Â«mnÂ»7Â«/mnÂ»Â«mnÂ»2Â«/mnÂ»Â«

  /mrootÂ»Â«/mathÂ»](https://community.blackboard.com/external-link.jspa?url=htt
  p%3A//www.w3.org/1998/Math/MathML%25C2%25A8%25C2%25BB%25C2%25ABmn%25
  C2%25BB3%25C2%25AB/mn%25C2%25BB%25C2%25ABmo%25C2%25BB/%25C2%25AB/mo%25C2
  %25BB%25C2%25ABmn%25C2%25BB4%25C2%25AB/mn%25C2%25BB%25C2%25ABmroot%25C2%25BB
  %25C2%25ABmn%25C2%25BB7%25C2%25AB/mn%25C2%25BB%25C2%25ABmn%25C2%25BB2%25C2%2
  5AB/mn%25C2%25BB%25C2%25AB/mroot%25C2%25BB%25C2%25AB/math%25C2%25BB)"
    />
  </p>

  <p>
    <a
      href="[http://www.blackboard.com](https://community.blackboard.com/external-
  link.jspa?url=http%3A//www.blackboard.com/)"
      >Blackboard</a
    >
  </p>
</div>
```

### Render

It would render as follows in Ultra UI:

![BbMLrender.png](/assets/img/bbmlrender.png)

### Uploaded files

When creating content using the Learn Public REST API, it is expected that any
related file content be uploaded prior to creation. Uploading files can be
done using the upload file endpoint documented at
https://developer.anthology.com/portal/displayApi

Once a file has been uploaded, the upload file endpoint will have provided an
Id which will be used to reference the associated file.

Using the upload file id withing the Learn Public REST API, any BbML anchor
tag href attribute can be used to associate the uploaded file using the
following notation:

```html
<a href="bbupload://<uploadFileId>">filename.ext</a>
```

For proper formatting and rendering within the ULTRA environment, it is
recommened to also include a data-bbfile attribute. An example value of this
can be seen above in the BbML specification section. However, to describe it a
bit more, the data-bbfile attribute's value is an HTML encoded json string:

```html
HTML encoded:
`{"render":"inline","linkName":"1.jpg","mimeType":"image/jpeg"}`<br />
HTML decoded:
`{"render":"inline","linkName":"filename.ext","mimeType":"image/jpeg"}`
```

- render: At this time, it is recommended to only use 'inline.'
- linkName: The filename of the uploaded file.
- mimeType: The MIME type of the uploaded file.`

The end result of all this would be as follows:

```html
<a
  href="bbupload://<uploadFileId>"
  data-bbfile='{"render":"inline","linkName":"filename.ext","mimeType":"image/jpeg"}'
>
       filename.ext
</a>
```

You can also use files that are already uploaded to the content collection by
referencing the id of the file you want to attach to the BbML.

Once the file has been uploaded into the content collection, the upload endpoint will
return an id that will be used to associate the respective file.

Similar to the anchor tag with the “bbupload” notation and adding a `data-bbfile`
attribute as seen above, the anchor tag should look like this:

```html
<a
  href="bbresource://<resourceFileId>"
  data-bbfile='{"render":"inline","linkName":"filename.ext","mimeType":"image/jpeg"}'
>
       filename.ext
</a>
```

Be careful with the `resourceFileId`, it should match one of the next formats `_1234_1` or 
`xid-1234_1` any other format will not be received

### File Type Documentation

The editor recognizes the following values for data-bbfile, with the arguments
it accepts for data-bbtype. For each plugin, the bbml element is given
(usually `a`); the value of `data-bbtype` which selects that plugin; and the
fields of `data-bbfile` which are expected. (`data-bbfile` is a JSON-encoded
object.)

For example, for the Attachment plugin, the generated bbml is as follows
(minus unneccessary whitespace I've added for easy viewing):

```html
<a
  href="https://ultra-integ.int.bbpd.io/bbcswebdav/pid-486306-dt-content-rid-13383141_1/xid-13383141_1"
  data-bbtype="attachment"
  data-bbfile='{"extension":"pdf","linkName":"1-23MB","render":"inline","alternativeText":"1-23MB.pdf","mimeType":"application/pdf","isDecorative":false'
>
  1-23MB
</a>
```

Tags without a `data-bbfile` attribute, or with an unrecognized value for
`data-bbfile`, are displayed normally.

<hr />

**Plugin Name**: Attachment  
**element**: `<a href="${link}">`  
**data-bbtype**: `attachment`  
**data-bbfile**:

- **linkName** - the name of the file
- **render** -
  - "inline" to render images/video/audio/etc inline
  - "attachment" to show as a block
- **alternativeText** - alt text for accessibility
- **mimeType** - the mime type of the file
- **isDecorative** - a flag indicating whether the image is decorative. Currently always false for images generated in Ultra.

**Notes:**

1. The `href` attribute is the download url for the document.
2. Attachments can be add from the local file system or the cloud (via Kloudless). After the item has been added, there is no way of distinguishing this.
3. Attachments, whether displayed inline or not, are full-width.

<hr />

**Plugin Name**: Block Images  
**element**: `<a href="${src}">`  
**data-bbtype**: `image`  
**data-bbfile**: `alt` - the image alt text

Notes:

1. Displays an image as a full-width block (instead of inline.)
2. All images generated by Ultra are full-width blocks, but images converted from Learn are regular `<img>` elements.
3. The `href` attribute in the bbml tag becomes the `src` attribute of the `img` tag.
4. Mathml images (as generated by Wiris) are regular `img` elements that have the `data-mathml` attribute. It is beyond the scope of this document to describe the wiris service; however, no additional processing beyond that of a regular `img` tag is required to render mathml images.

<hr />

**Plugin Name**: Custom Class  
**element**: `<a>`  
**data-bbtype**: `customClass`  
**data-bbfile**: `className`

**Notes:**

1. Transforms into `<span class="${className}">`.
2. This type will never be encountered in saved bbml; it is generated at runtime to modify the editor display.

<hr />

**Plugin Name**: Embedded Video  
**element**: `<a>`  
**data-bbtype**: `video`  
**data-bbfile**: `src` - The link for the embedded video

**Notes:**

1. Links to an embedded video from Youtube or Video which is shown in an iframe.
2. Only links from Youtube or Vimeo are allowed.

<hr />

**Plugin Name**: LTI Content Market  
**element**: `a`  
**data-bbtype**: `lti`  
**data-bbfile**:`Placement`

- **linkType** - 'resource/x-bb-bltiplacement'
- **linkRefId** - The PK of the placement record
- **Partner Cloud**
  - "linkType" - 'resource/x-bbgs-partner-cloud'
  - "linkRefId" - The partner tool ID. Usually some concatenation of partner ID + the tool ID
- **LTI Link**
  - "linkType" - 'resource/x-bb-blti-link'
  - "linkRefId" - The PK of the parent IMS Deep Linking placement. Used to look up key/secret at launch
  - "url" - LTI Tool Url
  - "launchInNewWindow" - Whether to launch in an iframe or new window
  - "customParameters" - Custom parameters to pass with the launch as JSON

**Notes:**

1. It is beyond the scope of this document to describe LTI links.

<hr />

**Plugin Name**: Video Everywhere (aka Collab Integration; aka Collab Video; aka Video Integration)  
**element**: `<img title="description" alt="alt text">`  
**data-bbtype**: `collab_video`  
**data-bbfile**: `video_uuid` - The uuid of the collab video.

**Notes:**

1. `src` is a relative image link returned by the collab service.
2. `title` is the description of the video.
3. `alt` is the alt text of the image.
4. It is beyond the scope of this document to describe the collab service api.
