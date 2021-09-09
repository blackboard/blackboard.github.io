---
layout: post
title: "Preparing Your B2 for Blackboard Learn 9.1 Q2 2016"
categories: Learn b2
id: archive-b2-resources-prep_learn_q2
author: Mark Bykerk Kauffman
status: deprecated
---

# Preparing Your B2 for Blackboard Learn 9.1 Q2 2016

Attached is the PowerPoint deck for the 3/16/2016 Webinar recording:
[Preparing Your Building Block for Blackboard Learn 9.1.Q2 2016](https://sas.elluminate.com/collab/ui/scheduler/resource/recording/279AEBB7C60BDE9E0B7CC9B07120BB17). In this Webinar we reviewed the changes in the
upcoming Learn 9.1 Q2 2016 release and how to prepare your Building Block for
the release. Topics covered include - Java 8, Learn Versioning, B2 Versioning,
New Installer, and Development Resources. **Another must-read is** [Preparing
Your Building Blocks For Learn SaaS and Newer Learn
Versions](preparing-for-saas-and-new-learn-versions) by Scott Hurrey.

The recording for the 3/22/2016 Webinar is
[here](https://sas.elluminate.com/collab/ui/scheduler/resource/recording/DB2503BFA4E9FF402B31858655506AD8). During the 3/22/2016 presentation one of the
participants had questions around setting the minimum and maximum version in
the bb-manifest, and setting the B2 version. I've updated the slide deck based
on that conversation and further internal conversations. The slide on B2
Versioning now states that creating 2 versions of your B2, one for SaaS and
one for 9.1 is bad practice, not second-best. If you write a B2 so that it
works in SaaS, it will also work in 9.1 Q2 2016 and future releases of Learn.
There is no reason to create two versions. Further discussion on B2 versioning
and setting the Learn minimum and maximum version # in the bb-manifest follows
in the comments section below. How to set Java compatibility settings is
discussed in [the attached powerpoint slide deck.](attachments/2016.03.27.PreparingYourBuildingBlockForLearnQ2-2016.pptx)

Regarding setting the minimum and maximum version of Learn in the bb-manifest
file, and setting the version of your B2, there are many different possible
scenarios. Following are a few, starting with a few simple cases, and becoming
more complex.

#### Case 0:

You've tested v1.0 of your B2 in 9.1, SP8. You've set the minimum Learn version in the manifest to 9.1, SP8 accordingly. You have not set a maximum version of your B2 because as each release of Learn comes out you find
that your B2 continues to work. With the release of 9.1 Q2 2016 you find that
your B2 continues to work without changes, and you find that it meets all of
the requirements for deployment in SaaS and works in the current Learn SaaS
release. You don't need to do anything.

#### Case 1:

As above except that you find that you need to release a new version,
v2 of the B2 for the 9.1 Q2 2016 Release to run with Java 8. You also design
the new v2 B2 is to work in the Learn SaaS environment. This is the best
practice as it gives you only one version to maintain - and you eliminate any
possibility of a B2 that doesn't work in SaaS getting installed into a SaaS
environment. Now you need to end-of-life B2 v1 by setting its maximum Learn
version in the bb-mainfest to the most recent version of Learn that v1 was
tested on, assume Q4 2015. With the new v2 B2 you will test, then set, the
minimum Learn version in the bb-manifest to 3000.x.x (whatever we end up with
in the GA release). You do not yet set a maximum because you do not know yet
whether the v2 B2 will continue to work on future releases of Learn. Because
Learn SaaS and Learn 9.1 will both have the same Learn version numbering
scheme rolling forward, starting with this release, the minimum Learn version
that you've specified in the bb-manifest correctly specifies the minimum SaaS
and 9.1 Learn version that the v2 B2 has been tested with.

A key point of Case 1 is that by architecting your B2 to work in Learn SaaS,
you also guarantee that it will work in the Q2 2016 release, provided of
course that if you create and use any custom DB tables you continue to code
for MS SQL, and Oracle, as well as Postgres.

#### Case 2:

Blackboard releases a newer version of Learn, say Q2 2017. You find
that that your B2 continues to work in both 9.1 and SaaS environments. You
don't need to do anything.

#### Case 3:

Blackboard releases a newer version of Learn, say Q2 2017. You find
that you need to make changes to your v2 B2 so that it will work with this
newer version of Learn. You now must set the max version of Learn in the v2 B2
so that it can not be installed in this new version of Learn. You create a new
version of your B2, v3, and set the min version of Learn in the bb-manifest.
B2 v3 does not yet need to have a max version of Learn set in the manifest.
