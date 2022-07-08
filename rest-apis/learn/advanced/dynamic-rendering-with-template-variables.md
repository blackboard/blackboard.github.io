---
layout: post
title: "Template Variables: Dynamic Rendering"
categories: Learn rest
id: rest_apis-learn-advanced-dynamic_rendering
author: Scott Hurrey
doctitle: "Dynamic Rendering with Template Variables"
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes: |
  \usepackage{fvextra}
  \usepackage[obeyspaces,spaces,hyphens]{xurl}
  \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
  \usepackage{hyperref}
---

{% assign sluggedName = page.name | replace: '.md' %}
# Dynamic Rendering with Template Variables <a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a> 

Using template variables you can create URLs to integrate with other systems by including information about the user's context.

Template variables are represented by a series of values given the special syntax: @X@object.attribute@X@. These variables are expanded when rendered into their corresponding values. Within the UI, they can be used in portal modules and within the body of content items in courses.

Note that not all of these variables will resolve on all pages. For example, if the page is not inside a course, there will be no course-related variables available.

## Using context variables

| Context item                                                             | Context variable                                                     | Example output                                                                                                                                                                                                                   |
|---|---|---|                                                     |
| User external person key                                                 | @X@user.batch_uid@X@                                                 | 123-45-6789                                                                                                                                                                                                                      |
| User username (user id)                                                  | @X@user.id@X@                                                        | jsmith                                                                                                                                                                                                                           |
| User student_id (student id)                                             | @X@user.student_id@X@                                                | jsmith                                                                                                                                                                                                                           |
| User full name                                                           | @X@user.full_name@X@                                                 | John Smith                                                                                                                                                                                                                       |
| User primary key identifier                                              | @X@user.pk_string@X@                                                 | \_521_1                                                                                                                                                                                                                          |
| User locale                                                              | @X@user.locale@X@                                                    | en_GB                                                                                                                                                                                                                            |
| User system role(s)                                                      | @X@user.role@X@                                                      | System Roles:<br />_ C- Course Administrator<br />_ U- Guest<br />_ N- None<br />_ O- Observer<br />_ Y- Community Administrator<br />_ R- Support<br />_ Z- System Admin<br />_ H- System Support<br />\* A- User Administrator |
| User primary institution role                                            | @X@user.institution_role@X@<br />@X@user.primary_institution_role@X@ | student                                                                                                                                                                                                                          |
| User secondary institution role(s)                                       | @X@user.secondary_institution_role@X@                                | student,faculty                                                                                                                                                                                                                  |
| User company (as of 3900.34)                                             | @X@user.company@X@                                                   | Anthology                                                            |
| User institution email (as of 3900.34)                                   | @X@user.email.institution_email@X@                                   | john.smith@anthology.com                                                            |
| User other name (as of 3900.34)                                          | @X@user.name.other@X@                                                | Johnie                                                            |
| User title (as of 3900.34)                                               | @X@user.name.title@X@                                                | Dr.                                                            |
| User mobile phone (as of 3900.34)                                        | @X@user.mobile_phone@X@                                              | 0-123-456-7890                                                            |
| User website (as of 3900.34)                                             | @X@user.website@X@                                                   | https://smithjohn.anthology.com                                                            |
| Course membership role                                                   | @X@membership.role@X@                                                | Course/Organization Roles:<br />_ B- Course Builder/Organization Builder<br />_ G- Grader/Grader<br />_ U- Guest/Guest<br />_ P- Instructor/Leader<br />_ S- Student/Participant<br />_ T- Teacher's Assistant/Assistant         |
| Course external course key                                               | @X@course.batch_uid@X@                                               | ABC123ABC                                                                                                                                                                                                                        |
| Course course id                                                         | @X@course.id@X@                                                      | BIO101                                                                                                                                                                                                                           |
| Course name                                                              | @X@course.course_name@X@                                             | Introduction to Concepts in Biology                                                                                                                                                                                              |
| Course primary key identifier                                            | @X@course.pk_string@X@                                               | \_12344_1                                                                                                                                                                                                                        |
| Course URL                                                               | @X@course.url@X@                                                     | /courses/1/BIO101/                                                                                                                                                                                                               |
| Course membership role                                                   | @X@course.role@X@                                                    | student                                                                                                                                                                                                                          |
| Course locale     (As of 3900.32)                                        | @X@course.locale@X@                                                  | en_US                                                            |    
| Institution hierarchy nodes (As of 3900.32 *use with caution. The output can be a long list that might affect an LTI launch.*)                          | @X@course.ih_nodes@X@                                                            | db75df7b-04e8-4d3c-b7f9-7f1371a3f325,fb11e84b-ff7f-44ab-bf77-89299b053232                                       |    
| Institution primary node	 (As of 3900.32)                               | @X@course.ih_primary_node@X@                                                            | fb11e84b-ff7f-44ab-bf77-89299b053232                                                           |    
| Is it an Ultra course?	 (As of 3900.32)                               | @X@course.ultra_status@X@                                                            | false                     |
| Content primary key identifier                                           | @X@content.id@X@<br />@X@content.pk_string@X@                        | \_23_1                                                                                                                                                                                                                           |
| Content URL                                                              | @X@content.url@X@                                                    | /courses/1/BOB101/content/\_221_1                                                                                                                                                                                                |
| Request [UUID](https://www.opengroup.org/onlinepubs/009629399/apdxa.htm) | @X@request.id@X@                                                     |
| Request locale                                                           | @X@request.locale@X@                                                 |
| Request return URL                                                       | @X@request.return@X@                                                 |
| System host name                                                         | @X@system.site_id@X@                                                 |


