---
layout: post
title: "About the API Documentation"
id: rest_apis-ally-about_api_doc
categories: Ally
author: Scott Hurrey
---

# How to use the Ally as a Service API Document to Test API

The API documentation for Ally as a Service allows a developer to test the API real-time inline on the page. It is a quick and easy way to not only get high-level information about the API itself, but also see how it works. You can upload a file, check the status of processing, and retrieve the report when finished. Doing so and then testing your application with the same file is a quick, easy, and powerful way to validate your work.

To do this, you will need your client ID and your secret. See the [Getting Started Guide](getting-started) for information on how to request your credentials. At the top of the page you will see two text boxes, one for each of these values. Simply plug them in and you are all ready to.

At the bottom of the documentation for the `Upload a File to Ally` endpoint, there is a **Try it now** section, where you can select a file and click submit to upload that file to be processed.

Upon upload, you will see the results appear on the screen, which will include the content hash value. This content hash value is unique to a specific piece of content, and specifically, the piece of content you just uploaded. In your application, you will use this for all subsequent calls. In the API documentation, it will automatically capture that value and paste it into the subsequest endpoints.

The next section is the `Check the processing status of a file` endpoint. In the **Try it now** section, you will see a field for the Content hash already filled in and a Submit button. Click submit to see the result of this call.

Finally, at the bottom of the documentation for the `Retrieve the feedback for a file`, the **Try it now** section has a similar Content hash text box prefilled with the content hash value, and a Feedback radio button. Setting to true will retrieve the full report, while setting it to false or N/A, which indicates that you are not specifying the argument, will retrieve just the metadata.

For a walkthrough, check out this video:

<iframe class="embed-video" src="https://www.youtube.com/embed/mr72Q3eyCwc" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
