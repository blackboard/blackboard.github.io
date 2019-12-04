# Collaborate API Objects
*Author: Scott Hurrey*
*Categories: ['Getting Started']*
*Tags: ['rest', 'getting started', 'collaborate', 'api', 'developer']*
---
The Blackboard Collaborate API is built to allow a third-party application to
perform scheduler operations. To handle this, the API exposes several objects
that may or may not be familiar to you. In order to set the stage, here is a
glossary of the API Objects in play.

**Object****Definition**

Session

Sessions are the life-blood of Collaborate's API. A session is equivalent to a
meeting room. If you login to the scheduler and create a room, you are
creating a session.

Instance

An instance is an individual meeting in a session. An instance is created when
the first person logs into the Collaborate session, and is terminated when the
last person leaves the session.

Enrollment

An enrollment is a User that has been invited to a session. Enrolling a user
allows you to provide an individual URL to an individual user, such that when
they enter the room, Collaborate knows who the user is.

User

As you would expect, this object corresponds to a session attendee

Context

Context is a container for grouping sessions. Typically in an LMS integration,
the Context would correspond to a course or section, and all the sessions in
that course would belong to that context. Context is not required, and it can
be used for any logical grouping. It doesn't have to be a course.

Recording

A stored recording of a session instance.

