# Data Types for contentHandler
*Author: Ryan Haber*
*Categories: []*
*Tags: ['developer']*
---
Blackboard Learn's /contents/ endpoints accommodate different types of content
by using different handlers. Use the contentHandler field of requests and
responses to indicate which content handler should be used. Available
contentHandlers their uses are summarized below.

Supported handlers include:

contentHandler IDDescriptionSupported since

resource/x-bb-document

(Original) base document type, consists of rich text with an associated title

(Ultra) basic content item

3000.1.0

resource/x-bb-externallink

external link

3000.1.0

resource/x-bb-folder

document that has child documents

3000.1.0

resource/x-bb-courselink

link to a Blackboard course

3100.5.0

resource/x-bb-forumlink

link to a discussion object

3100.6.0

resource/x-bb-blti-link

link to an LTI object

3200.6.0

resource/x-bb-file

represents a file object within Learn

3200.6.0

resource/x-bb-asmt-test-link

(Ultra only) Ultra assignment or test object

3300.5.0

resource/x-bb-assignment

(Original only)

3400.9.0

## resource/x-bb-document

**Original experience**: Base content type consisting of rich text with an associated title.  

**Ultra**: represents the body of an Ultra document object. It must be the child of a resource/x-bb-folder content item for which isBbPage=true.

## resource/x-bb-externallink

Link to an external resource. It has the following properties:

  * id (string, read-only) of the object in Blackboard Learn
  * url (string) of the external resource

## resource/x-bb-folder

Content item that contains child content items. It has the following
properties:

  * id (string, read-only) of the object in Blackboard Learn
  * isBbPage (boolean) whether the object represents a page in its own right

## resource/x-bb-courselink

Content item with a link to other objects within Blackboard Learn. It has the
following properties:

  * id (string, read-only) of the object in Blackboard Learn
  * targetId (string) of the linked Blackboard Learn object
  * targetType (string) is the Blackboard object type of the linked object. Possible values include:
    * Unset, CourseAssessment, CourseTOC, Forum, Tool, CollabSession (deprecated since 3000.1.0), Group, BlogJournal, StaffInfo, ModulePage

## resource/x-bb-forumlink

Content item with a link to a discussion object. It has the following
properties:

  * id (string, read-only) of the object in Blackboard Learn
  * discussionId (string) for the discussion object in Blackboard Learn

## resource/x-bb-blti-link

Representation of an LTI link within course content. It has the following
properties:

  * id (string, read-only) of the object in Blackboard Learn
  * url (string) of the the LTI link
  * customParameters is a map of custom parameters to POST to the specified launch URL. Learn serializes the entire custom parameters map, so you should specify all custom parameters when the map is changed.

## resource/x-bb-file

Representation of a file uploaded to course content.

  * id (string, read-only) of the object in Blackboard Learn
  * file is an object with the following properties:
    * uploadId (string, read-only) is the system-assigned ID of the uploaded file
    * fileName (string) is the name of the file
    * mimeType (string, read-only) is the MIME type. Blackboard Learn uses IANA standards to assign MIME type based on the filename extension.
    * duplicateFileHandling (string, optional) used to describe behavior when a file is uploaded that duplicates an existing filename. Options include:
      * Rename (default) causes the new file with the duplicate name to be renamed.
      * Replace causes the new file to replace the earlier file with the same name.
      * ThrowError causes Learn to throw an error.

## resource/x-bb-asmt-test-link

(Ultra experience only) Representation of an assignment/test link object

  * id (string, read-only) of the object in Blackboard Learn
  * assessmentId (string) is the ID of the associated assessment
  * gradeColumnId (string) is the ID of the associated grade column

## resource/x-bb-assignment

(Original experience only)

  * id (string, read-only) of the object in Blackboard Learn
  * gradeColumnId (string, read only) ID of the associated grade column
  * groupContent (boolean) specifies whether or not the content is group content.

##

