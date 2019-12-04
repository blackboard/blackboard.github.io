# Use APIs to Work with Ultra Assignments
*Author: Ryan Haber*  
*Categories: []*  
*Tags: ['developer']*  
<hr />
**Contents**

  * Overview
  * Before You Begin
  * Create an Assignment
  * Upload a File to Blackboard Learn
  * Add Content to an Existing Assignment
  * Assignment-related Query Parameters

# Overview

Blackboard Learn Ultra experience offers a REST API for managing assessments.
In Ultra, an assessment is effectively the same thing as an assignment except
for how they are stored internally. In an assessment, there are questions of
various types. Each 'question' is a slot for content that may not actually
contain what you normally think of as a question. For more information about
assignments and questions and how Learn users experience them, see [Ultra:
Create an Assignment](https://community.blackboard.com/external-link.jspa?url=
https%3A//help.blackboard.com/Learn/Instructor/Assignments/Create_
and_Edit_Assignments) in Blackboard Help.

An assignment is made up of one or more questions. The following question
types are available for use with Ultra via REST API.

  * `EitherOr` - questions that allow one of two possible responses, such as "true or false"
  * `Essay` - questions that provide a WYSIWYG editor and allow long text response
  * `MultipleAnswer` - allow students to choose more than one answer
  * `Presentation` - represents a 'question' that only has text and/or attached files referenced from within question.text, but that has no actual answer, points, or evaluation associated with it

As of version 3300.9.0, you can use the public API to read any type of
question. You can use the public API to create, update, and delete methods
only with presentation-type questions.

# Before You Begin

  * To work with assignments, you need the entitlements listed for each endpoint in the API reference documents.
  * If you want to use a file with a new assignment, you must upload the file to Learn before you create the new assignment.

# Create an Assignment

Before you create an assignment, remember that you must first upload any files
that you intend to use to create the object.

  1. If you have not already uploaded any files that you need to use to create the assignment, use the steps in the following section to do so.
  2. Make a POST request to `/learn/api/public/v1/courses/{courseId}/contents/createAssignment`. See the reference below for more information about using the endpoint. Note that the response body of the request does not return the full assignment object. It returns an object of IDs, one for each of the various resources created by Learn.
  3. Use the response body to further manage the assignment.

Use these objects to further manage the assignment that you created.

# Upload a File to Blackboard Learn

Before you can use a file with a REST API call, you must use an API upload it
to Blackboard Learn.

  1. Make a POST request to /learn/api/public/v1/uploads.
  2. Use the ID number in the response to further access the uploaded file.

# Add Content to an Existing Assignment

As of 3300.9.0 you can add only presentation-type "questions" to assignments
using the public REST API.

  1. Make a POST request to /learn/api/public/v1/courses/{courseId}/assessments/{assessmentId}/questions/{questionId}

  2. You can validate the response body against your original response body.

# Assignment-related Query Parameters

All endpoints accept a query parameter fields that specifies the fields to be
included in the response object, if any. The fields to be included are given
as a comma-separated list. Specified fields are ignored if absent from the
response. If no fields are specified, all fields are returned in the response.
For example:

POST to /learn/api/public/v1/courses/{courseId}/assessments/{assessmentId}/que
stions/{questionId}?fields=id,title,status,message

returns the ID and title of questions if the request succeeds because only
those fields are included in the success response object. The method returns
status and message if the request fails because only those fields are included
in the error response object.

