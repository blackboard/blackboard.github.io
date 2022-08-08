---
layout: post
title: "First Steps with Collaborate API"
id: collab-api-first-steps
categories: Collaborate
tipue_search_active: true
toc: true
Author: Davey Herrera
---

# First Steps

Before we start with the whole document and you start developing your own application, We have noticed that sometimes the terminology can end up in a confusion, that is why we want to make sure that all the terminology is clean and ready for everyone to start developing using our API.

Please keep in mind that this only applies for Blackboard Collaborate Ultra

### Need credentials for a sandbox? We got you!

If you need credentials in order to start developing (wether you are a client or a partner), please write us an email to developers@anthology.com letting us know the following:

1. Institution or company you are writing us from
2. Introduce yourself! (Name, what do you do at the company)
3. Let us know what you need!

We will respond as soon as possible with the credentials!

> Please keep in mind that all credentials are reviewed first internally before being provided.

## Sandbox Limitations

1. This is a test environment, hence, it is completely empty (it is not possible to move information from one environment to another)
2. The environment has specific limitations (due to its nature, however collaborate in production has none of them)
3. There is no GUI available on this environment.

### About key, secret and url!

Please keep in mind that the credentials that you use for the scheduler are not the same to access using REST, they are completely different, when logging in into the scheduler you use username + password on a specific URL, on REST we use a KEY + SECRET on a specific URl.

If you need your key + secret + url from your instance to start developing, please create a behind the blackboard ticket in order to receive this information.

### Basic Concepts

This document is based on a presentation that we did to a client and we noticed that they vastly improved their questions and input on their own applications!

We will group these concepts on 3 parts:

- Where
- Who
- Optional attributes or characteristics

### Where

Here you will find a couple of terms that may be kind of confusing, but we will try to explain them as easy as possible:

We use **Sessions**, this is defined correctly [on this post](/rest-apis/collaborate/api-objects), however, there is another term, and this is **Instances**.

A Session can have multiple instances, a Session can exist without an instance, but there are no instances without a session, meaning Instances depend on Sessions to exist.

The way Sessions and Instances co-exist and depend in one another, is that, When you create a Session, but no one has ever joined to it, there are no instances. Let's say for example that you are an instructor on the Python 101 course, and you have 3 different groups:

1. Morning group - has class from 8:00 am to 9:00 am
2. Afternoon group - has class from 1:00 pm to 2:00 pm
3. Night group - has class from 6:00 pm to 7:00 pm

You have your course on learn with course id CS-PYTHON101 and you use the same course for all students, you also have a course room that is already setup on your course and ready to use.

![Course Room view](/assets/img/collab-first-steps-01.png)

From the course room, you can create new Sessions, this instructor decided to create only one session, open session for all the classes for all 3 groups. When the first student (or the instructor) joins to the session at 8:00 am (or before if early entry is enabled ) an instance of the session is created!, Then, when the last student leaves, there is a 5 minute "grace" period for the instance to be finished, then the instance is completed and stored.

![Course Room view](/assets/img/collab-first-steps-02.png)

### Who

For this part, we have 3 concepts that need to be reviewed:

1. Enrollment
2. User
3. Attendee

#### Enrollment

This happens ONLY when you use the integrated enrollment tool within Blackboard Ultra, when using a course room, all the students within the course are automatically enrolled.

![Course Room view](/assets/img/collab-first-steps-03.png)

#### User

This happens ONLY when you allow Guest Access, meaning that users will see a window asking for their name when using a guest link.

![Course Room view](/assets/img/collab-first-steps-04.png)

#### Attendee

When an Enrolled user or an User join a Collaborate session, they both become attendees.

![Course Room view](/assets/img/collab-first-steps-05.png)

### Optional attributes or characteristics

There are several attributes or characteristics (OAC) that apply for the Who and the Where.

### Where OAC

#### Contexts

When using collaborate, you may want to organize your Sessions per functional area if you are a company or per course if you are an institution.

This is possible by using Context!

Contexts allow you to group your sessions by a specific criteria, this is completely optional and when using Blackboard Collaborate integrated with Learn it is automatically populated with the course id data.

![Course Room view](/assets/img/collab-first-steps-06.png)

#### Recordings

The recordings are as easy to create by clicking a simple button when attending a collaborate session (instance), but how are they organized?

Well, it is quite simple, a Session can have multiple Instances, an instance can have multiple recordings!

Why? well, let's say you click on the record button on your current instance, but by mistake you clicked the stop recording button, well, the instance recording will be saved and if you hit the record button again, the new recording will be correlated to the current instance + session. Meaning that you will have two recordings on the same instance!

Recording is completely optional!

![Course Room view](/assets/img/collab-first-steps-07.png)

### Who OAC

#### extUserName

When an user is **enrolled** in a session\* it is possible to set a parameter for the user in order to link the user to an external source, for example, learn uses user_id, it is possible to send from learn (or grab from there) the user id and store it on the user enrollment for future queries.

> \*This applies only for REST API / LTI only, not available on the GUI.

## Video Resources

These are some video resources that we have been working on to explain how REST API works:

**English**

<iframe class="embed-video" src="https://youtube.com/embed/videoseries?list=PLlarB4q95gffO4fomFZ1hpH2h2nNjIB-t" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Spanish (Some of them)**

<iframe class="embed-video" src="https://youtube.com/embed/videoseries?list=PLlarB4q95gfesxtDRRhTmiMymesToKFkF" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Conclusion

Rest API in collaborate is quite easy to use once all this concepts are clear!

![Course Room view](/assets/img/collab-first-steps-08.png)
