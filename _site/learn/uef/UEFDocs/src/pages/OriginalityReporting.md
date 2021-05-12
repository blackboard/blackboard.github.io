# Originality Reporting

The Ultra Extension Framework allows an integration to provide Originality
Reporting for assignments in Learn Ultra in conjunction with Learn's Submission
Services framework.

## Learn Submission Services Framework

The Submission Services framework in Learn exposes extension points for custom
Building Blocks (B2s) to be notified of new gradable content in a course and
students' submissions against those content items. UEF builds on that with APIs
to support UI integration into Learn Ultra so that those custom extensions from
Learn B2s can be configured and displayed in Ultra courses. Details about how
to implement the Learn side of a Submission Services tool in a custom B2 via the
`SubmissionService`, `SubmittableItemEventHandler`, and `ItemSubmissionEventHandler`
interfaces is outside the scope of this document.

## UEF

Each UEF originality reporting extension is linked to its corresponding Submission
Services extension in Learn by specifying the same unique handle in both places.
All Submission Services extensions must provide a unique handle, and any UEF
extension designed to work with that Learn B2 extension must have the same handle.

```javascript
sendMessage({
  type: 'submission-tool:register',
  submissionServicesUniqueHandle: '<your_unique_handle>',
});
```

Learn Ultra discovers available Submission Services tools via its own internal API
to Learn, and the unique handles provided by Learn are the source of record. UEF
originality reporting extensions will only show up in Ultra UI if Learn reports
that a Submission Services tool of the same unique handle is available for use on
that content item, subject to Learn's built-in mechanisms for B2/tool availability.

### Originality Report Configuration

A UEF portal has been added to the Assessment settings panel, in which an
extension can render its own settings after Originality Reporting is enabled by
an instructor. The portal's selector is
`course.content.assessment.settings.originalityReport.panel.settings`,
and will pass along the `courseId` and `contentId` as parameters:

```json
{
  "courseId": "<course_id>",
  "contentId": "<content_id>"
}
```

#### Saving Configuration

When the instructor saves the Assessment settings, a UEF message will be passed
to the extension notifying it that it should save the settings changes made by
the instructor, and Ultra will wait for the extension to respond, indicating
that the save succeeded or failed. When a successful response is received from
the integration, Learn will notify the corresponding B2 of the new Originality
enablement state for the current content item.

The message from Ultra will provide a `correlationId` that will need to be
provided when responding to the message, as well as the `contentId` of the item
being saved and its `contentHandle` that indicates its content type. It will also
include the enabled state of the originality report setting:

```json
{
  "data": {
    "eventType": "submission-tool:settings-saved",
    "correlationId": "<uuid>",

    "contentId": "<content_id>",
    "contentHandle": "<content_handle>",
    "enabled": <boolean>
  }
}
```

After sending that message to the extension, UEF expects an extension to check
its rendered DOM and save off the corresponding settings by whatever mechanism
it communicates to its tool implementation, e.g. via a Rest API provided by the
custom Learn B2 that does the Submission Services implementation in Learn.

The UEF extension must respond with a success or failure message within 5 seconds:

```javascript
sendMessage({
  type: 'submission-tool:settings-saved:response',
  correlationId: '<uuid>',
  success: true,
});

sendMessage({
  type: 'submission-tool:settings-saved:response',
  correlationId: '<uuid>',
  success: false,
  // you may supply a human readable error message to display to the user
  error: 'There was an error saving the configuration',
});
```

If 5 seconds isn't enough time to save the configuration changes, the extension
can request more processing time by responding with a
`submission-tool:settings-saved:processing` message:

```javascript
sendMessage({
  type: 'submission-tool:settings-saved:processing',
  correlationId: '<uuid>',
});
```

### Displaying Originality Results

UEF provides two different portals for displaying Originality information.

#### Overall Status

The first portal is for an icon indicating the overall status of each
submission in the submission list and will appear in each submission's row. The
portal's selector is
`components.directives.grade.submission-list-row.originality`.

#### Report

Two portals are provided for displaying the results of the Originality report,
one from the grader's perspective and one from the student's. An assignment's
grader will see a portal with the selector
`components.directives.attempt-grading.originality-report`,
and a student will see one with
`components.directives.attempt-review.originality-report`.

