---
layout: post
title: "SOAP to REST"
tipue-search-status: true
id: rest_apis-learn-advanced-soap_to_rest
categories: Learn soap
author: Scott Hurrey
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes:
    - \usepackage{fvextra}
    - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
    - \usepackage[obeyspaces,spaces,hyphens]{xurl}
---
<div>&nbsp;</div>
{% assign sluggedName = page.name | replace: '.md' %}
<div class="download-btn-placement"><br>modified: {{ page.last_modified_at | date: '%b-%d-%y' }} &nbsp;&nbsp; 
<a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a></div>

# SOAP to REST migration: Mapping

The purpose of this document is to provide a mapping from SOAP Web Service
calls to REST API Endpoints. This is meant to be a quick-start guide to the
migration process. With SOAP being deprecated in the near term future and
removed from Learn following the public API Deprecation Policy, it
is our intention to provide you the information you need in order to migrate
as painlessly as possible. This is a living document and will up updated as
the last few remaining gaps in functionality are closed.

New REST APIs are rolled out in new versions of Learn, but never
back-ported to previous releases. To be sure the endpoint you require is
available, be sure to visit the [Developer
Portal](https://developer.blackboard.com/portal/displayApi)
and check the individual endpoints you need.

## Announcements

| Use Case                            | SOAP WS Call                               | REST Endpoint                                                                 |
| ----------------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------- |
| Create Course Announcement          | AnnouncementWS.createCourseAnnouncements() | POST /learn/api/public/v1/courses/{courseId}/announcements                    |
| Read Course Announcement            | AnnouncementWS.getCourseAnnouncements()    | GET /learn/api/public/v1/courses/{courseId}/announcements/{announcementId}    |
| Read All Course Announcements       | AnnouncementWS.getCourseAnnouncements()    | GET /learn/api/public/v1/courses/{courseId}/announcements                     |
| Update Course Announcement          | AnnouncementWS.updateCourseAnnouncements() | PATCH /learn/api/public/v1/courses/{courseId}/announcements/{announcementId}  |
| Delete Course Announcement          | AnnouncementWS.deleteCourseAnnouncements() | DELETE /learn/api/public/v1/courses/{courseId}/announcements/{announcementId} |
| Create Organization Announcement    | AnnouncementWS.createOrgAnnouncements()    | POST /learn/api/public/v1/courses/{courseId}/announcements                    |
| Read Organization Announcement      | AnnouncementWS.getOrgAnnouncements()       | GET /learn/api/public/v1/courses/{courseId}/announcements/{announcementId}    |
| Read All Organization Announcements | AnnouncementWS.getOrgAnnouncements()       | GET /learn/api/public/v1/courses/{courseId}/announcements                     |
| Update Organization Announcement    | AnnouncementWS.updateOrgAnnouncements()    | PATCH /learn/api/public/v1/courses/{courseId}/announcements/{announcementId}  |
| Delete Organization Announcement    | AnnouncementWS.deleteOrgAnnouncements()    | DELETE /learn/api/public/v1/courses/{courseId}/announcements/{announcementId} |
| Create System Announcement          | AnnouncementWS.createSystemAnnouncements() | POST /learn/api/public/v1/announcements                                       |
| Read System Announcement            | AnnouncementWS.getSystemAnnouncements()    | GET /learn/api/public/v1/announcements/{announcementId}                       |
| Read All System Announcements       | AnnouncementWS.getSystemAnnouncements()    | GET /learn/api/public/v1/announcements                                        |
| Update System Announcement          | AnnouncementWS.updateSystemAnnouncements() | PATCH /learn/api/public/v1/announcements/{announcementId}                     |
| Delete System Announcement          | AnnouncementWS.deleteSystemAnnouncements() | DELETE /learn/api/public/v1/announcements/{announcementId}                    |

## Calendar

| Use Case                              | SOAP WS Call                                                                                 | REST Endpoint                                                                    |
| ------------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| Create a Course Calendar Item         | CalendarWS.createCourseCalendarItem()<br />CalendarWS.saveCourseCalendarItem()               | POST /learn/api/public/v1/calendars/items                                        |
| Read a Course Calendar Item           | CalendarWS.getCalendarItem()                                                                 | GET /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}      |
| Read all Course Calendar Items        | CalendarWS.getCalendarItem()                                                                 | GET /learn/api/public/v1/calendars<br />GET /learn/api/public/v1/calendars/items |
| Update a Course Calendar Item         | CalendarWS.updateCourseCalendarItem()<br />CalendarWS.saveCourseCalendarItem()               | PATCH /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}    |
| Delete a Course Calendar Item         | CalendarWS.deleteCourseCalendarItem()                                                        | DELETE /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}   |
| Create an Institutional Calendar Item | CalendarWS.createInstitutionalCalendarItem()<br />CalendarWS.saveInstitutionalCalendarItem() | POST /learn/api/public/v1/calendars/items                                        |
| Read an Institutional Calendar Item   | CalendarWS.getCalendarItem()                                                                 | GET /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}      |
| Read all Institutional Calendar Items | CalendarWS.getCalendarItem()                                                                 | GET /learn/api/public/v1/calendars<br />GET /learn/api/public/v1/calendars/items |
| Update an Institutional Calendar Item | CalendarWS.updateInstitutionalCalendarItem()<br />CalendarWS.saveInstitutionalCalendarItem() | PATCH /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}    |
| Delete an Institutional Calendar Item | CalendarWS.deleteInstitutionalCalendarItem()                                                 | DELETE /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}   |
| Create a Personal Calendar Item       | CalendarWS.createPersonalCalendarItem()<br />CalendarWS.savePersonalCalendarItem()           | POST /learn/api/public/v1/calendars/items                                        |
| Read a Personal Calendar Item         | CalendarWS.getCalendarItem()                                                                 | GET /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}      |
| Read all Personal Calendar Items      | CalendarWS.getCalendarItem()                                                                 | GET /learn/api/public/v1/calendars<br />GET /learn/api/public/v1/calendars/items |
| Update a Personal Calendar Item       | CalendarWS.updatePersonalCalendarItem()<br />CalendarWS.savePersonalCalendarItem()           | PATCH /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}    |
| Delete a Personal Calendar Item       | CalendarWS.deletePersonalCalendarItem()                                                      | DELETE /learn/api/public/v1/calendars/items/{calendar type}/{calendar item id}   |

## Content

| Use Case               | SOAP WS Call                                                                 | REST Endpoint                                                                                                                                                                     |
| ---------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Create Course TOC      | ContentWS.saveCourseTOC()                                                    | POST /learn/api/public/v1/courses/{courseId}/contents                                                                                                                             |
| Read Course TOC        | ContentWS.getTOCsByCourseId()                                                | GET /learn/api/public/v1/courses/{courseId}/contents/{content ID}                                                                                                                 |
| Read All Course TOC    | ContentWS.getTOCsByCourseId()                                                | GET /learn/api/public/v1/courses/{courseId}/contents                                                                                                                              |
| Update Course TOC      | ContentWS.saveCourseTOC()                                                    | PATCH /learn/api/public/v1/courses/{courseId}/contents                                                                                                                            |
| Delete Course TOC      | ContentWS.deleteCourseTOCs()                                                 | DELETE /learn/api/public/v1/courses/{courseId}/contents                                                                                                                           |
| Create Content Item    | ContentWS.saveContent()                                                      | POST /learn/api/public/v1/courses/{courseId}/contents/{content ID)/children                                                                                                       |
| Read Content Item      | ContentWS.getFilteredContent()                                               | GET /learn/api/public/v1/courses/{courseId}/contents/{content ID}                                                                                                                 |
| Read All Content Items | ContentWS.getFilteredContent()                                               | GET /learn/api/public/v1/courses/{courseId}/contents/{content ID)/children                                                                                                        |
| Update Content Item    | ContentWS.saveContent()                                                      | PATCH /learn/api/public/v1/courses/{courseId}/contents                                                                                                                            |
| Delete Content Item    | ContentWS.deleteContents()                                                   | DELETE /learn/api/public/v1/courses/{courseId}/contents                                                                                                                           |
| Attach File            | ContentWS.addContentFile()                                                   | POST /learn/api/public/v1/courses/{courseId}/contents/{content ID}/attachment                                                                                                     |
| Remove File            | ContentWS.deleteContentFiles()                                               | DELETE /learn/api/public/v1/courses/{courseId}/contents/{contentID}/attachment/{attachment ID}                                                                                    |
| Update File            | ContentWS.updateContentFileLinkName()                                        | DELETE /learn/api/public/v1/courses/{courseId}/contents/{contentID}/attachment/{attachment ID}<br />POST /learn/api/public/v1/courses/{courseId}/contents/{content ID}/attachment |
| Read Content File      | ContentWS.getContentFiles()                                                  | GET /learn/api/public/v1/courses/{courseId}/contents/{contentID}/attachment/{attachment ID}                                                                                       |
| Read All Content Files | ContentWS.getContentFiles()                                                  | GET /learn/api/public/v1/courses/{courseId}/contents/{content ID}/attachment                                                                                                      |
| Download Content File  | ContentWS.getContentFiles()                                                  | GET /learn/api/public/v1/courses/{courseId}/contents/{contentID}/attachment/{attachment ID}/downloads                                                                             |
| Create Link            | ContentWS.saveLink()                                                         | POST /learn/api/public/v1/courses/{courseId}/contents/{content ID}/children                                                                                                       |
| Read Link              | ContentWS.getLinksByReferredToType()<br />ContentWS.getLinksByReferrerType() | GET /learn/api/public/v1/courses/{courseId}/contents/{content ID}                                                                                                                 |
| Read All Links         | ContentWS.getLinksByReferredToType()<br />ContentWS.getLinksByReferrerType() | GET /learn/api/public/v1/courses/{courseId}/contents                                                                                                                              |
| Update Link            | ContentWS.saveLink()                                                         | PATCH /learn/api/public/v1/courses/{courseId}/contents/{content ID}                                                                                                               |
| Delete Link            | ContentWS.deleteLink()                                                       | DELETE /learn/api/public/v1/courses/{courseId}/contents/{content ID}                                                                                                              |
| Get Reviewed Status    | ContentWS.getReviewStatusByCourseId()                                        | GET /learn/api/public/v1/courses/{courseId}/contents/{contentId}/users/{userId}/reviewStatus                                                                                      |
| Set Reviewed Status    | ContentWS.setContentReviewed()                                               | PATCH /learn/api/public/v1/courses/{courseId}/contents/{contentId}/users/{userId}/reviewStatus                                                                                    |

## Context

| Use Case                       | SOAP WS Call                        | REST Endpoint                                                                                 |
| ------------------------------ | ----------------------------------- | --------------------------------------------------------------------------------------------- |
| Register Tool                  | ContextWS.registerTool()            | N/A                                                                                           |
| Emulate a User                 | ContextWS.emulateUser()             | GET /learn/api/public/v1/oauth2/authorizationcode<br/>POST /learn/api/public/v1/oauth2/token  |
| Extend Session Life            | ContextWS.extendSessionLife()       | POST /learn/api/public/v1/oauth2/token                                                        |
| Get Memberships By UserID      | ContextWS.getMemberships()          | GET /learn/api/public/v1/users/{user id}/courses                                              |
| Get Current User's Memberships | ContextWS.getMyMemberships()        | GET /learn/api/public/v1/users/me/courses                                                     |
| Get System Installation ID     | ContextWS.getSystemInstallationId() | Use LTI                                                                                       |
| Login as User                  | ContextWS.login()                   | GET /learn/api/public/v1/oauth2/authorizationcode<br />POST /learn/api/public/v1/oauth2/token |
| Login with Access Ticket       | ContextWS.loginTicket()             | N/A                                                                                           |
| Login as Tool                  | ContextWS.loginTool()               | POST /learn/api/public/v1/oauth2/token                                                        |
| Logout                         | ContextWS.logout()                  | N/A                                                                                           |

## Courses

| Use Case                                   | SOAP WS Call                                           | REST Endpoint                                                                                                                                          |
| ------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Create Course                              | CourseWS.createCourse()<br />CourseWS.saveCourse()     | POST /learn/api/public/v2/courses                                                                                                                      |
| Read Course                                | CourseWS.getCourse()                                   | GET /learn/api/public/v2/courses/{courseId}                                                                                                            |
| Read All Courses                           | CourseWS.getCourse()                                   | GET /learn/api/public/v2/courses                                                                                                                       |
| Update Course                              | CourseWS.saveCourse()                                  | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Update Course BatchUID                     | CourseWS.changeCourseBatchUid()                        | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Update Course Category                     | CourseWS.changeCourseCategoryBatchUid()                | PATCH /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                              |
| Update Course Datasource                   | CourseWS.changeCourseDataSourceId()                    | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Delete Course                              | CourseWS.deleteCourse()                                | DELETE /learn/api/public/v2/courses/{courseId}                                                                                                         |
| Create Organization                        | CourseWS.createOrg()                                   | POST /learn/api/public/v2/courses                                                                                                                      |
| Read Organization                          | CourseWS.getOrg()                                      | GET /learn/api/public/v2/courses/{courseId}                                                                                                            |
| Read All Organizations                     | CourseWS.getOrg()                                      | GET /learn/api/public/v2/courses                                                                                                                       |
| Update Organization                        | CourseWS.saveCourse()                                  | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Update Organization BatchUID               | CourseWS.changeOrgBatchUid()                           | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Update Organization Category               | CourseWS.changeOrgCategoryBatchUid()                   | PATCH /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                              |
| Update Organization Datasource             | CourseWS.changeOrgDataSourceId()                       | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Delete Organization                        | CourseWS.deleteOrg()                                   | DELETE /learn/api/public/v2/courses/{courseId}                                                                                                         |
| Create Group                               | CourseWS.saveGroup()                                   | POST /learn/api/public/v1/courses/{courseId}/groups                                                                                                    |
| Read Group                                 | CourseWS.getGroup()                                    | GET /learn/api/public/v1/courses/{courseId}/groups/{group Id}                                                                                          |
| Read All Groups                            | CourseWS.getGroup()                                    | GET /learn/api/public/v1/courses/{courseId}/groups                                                                                                     |
| Update Group                               | CourseWS.saveGroup()                                   | PATCH /learn/api/public/v1/courses/{courseId}/groups/{group Id}                                                                                        |
| Delete Group                               | CourseWS.deleteGroup()                                 | DELETE /learn/api/public/v1/courses/{courseId}/groups/{group Id}                                                                                       |
| Create Term                                | CourseWS.saveTerm()                                    | POST /learn/api/public/v1/terms                                                                                                                        |
| Read Term                                  | CourseWS.loadTerm()<br />CourseWS.loadTermByCourseId() | GET /learn/api/public/v1/terms/{term id}                                                                                                               |
| Read All Terms                             | CourseWS.loadTerms()<br />CourseWS.loadTermsByName()   | GET /learn/api/public/v1/terms                                                                                                                         |
| Update Term                                | CourseWS.saveTerm()                                    | PATCH /learn/api/public/v1/terms/{term id}                                                                                                             |
| Delete Term                                | CourseWS.deleteTerm()                                  | DELETE /learn/api/public/v1/terms/{term id}                                                                                                            |
| Add Course to Term                         | CourseWS.addCourseToTerm()                             | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Get Courses in Term                        | CourseWS.loadCoursesInTerm()                           | GET /learn/api/public/v2/courses?termId={term id}                                                                                                      |
| Remove Course From Term                    | CourseWS.removeCourseFromTerm()                        | PATCH /learn/api/public/v2/courses/{courseId}                                                                                                          |
| Create Course Category                     | CourseWS.saveCourseCategory()                          | POST /learn/api/public/v1/catalog/categories/{categoryType}                                                                                            |
| Read Course Category                       | CourseWS.getCategories()                               | GET /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                                |
| Read All Course Categories                 | CourseWS.getCategories()                               | GET /learn/api/public/v1/catalog/categories/{categoryType}                                                                                             |
| Update Course Category                     | CourseWS.saveCourseCategory()                          | PATCH /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                              |
| Delete Course Category                     | CourseWS.deleteCourseCategory()                        | DELETE /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                             |
| Create Course Category Membership          | CourseWS.saveCourseCategoryMembership()                | PUT /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}                                                             |
| Read Course Category Membership            | CourseWS.getCourseCategoryMembership()                 | GET /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}<br />GET /learn/api/public/v1/courses/{courseId}/categories |
| Read All Course Category Memberships       | CourseWS.getCourseCategoryMembership()                 | GET /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses                                                                        |
| Update Course Category Membership          | CourseWS.saveCourseCategoryMembership()                | PUT /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}                                                             |
| Delete Course Category Membership          | CourseWS.deleteCourseCategoryMembership()              | DELETE /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}                                                          |
| Create Organization Category               | CourseWS.saveOrgCategory()                             | POST /learn/api/public/v1/catalog/categories/{categoryType}                                                                                            |
| Read Organization Category                 | CourseWS.getCategories()                               | GET /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                                |
| Read All Organization Categories           | CourseWS.getCategories()                               | GET /learn/api/public/v1/catalog/categories/{categoryType}                                                                                             |
| Update Organization Category               | CourseWS.saveOrgCategory()                             | PATCH /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                              |
| Delete Organization Category               | CourseWS.deleteOrgCategory()                           | DELETE /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}                                                                             |
| Create Organization Category Membership    | CourseWS.saveOrgCategoryMembership()                   | PUT /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}                                                             |
| Read Organization Category Membership      | CourseWS.getOrgCategoryMembership()                    | GET /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}<br />GET /learn/api/public/v1/courses/{courseId}/categories |
| Read All Organization Category Memberships | CourseWS.getOrgCategoryMembership()                    | GET /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses                                                                        |
| Update Organization Category Membership    | CourseWS.saveOrgCategoryMembership()                   | PUT /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}                                                             |
| Delete Organization Category Membership    | CourseWS.deleteOrgCategoryMembership()                 | DELETE /learn/api/public/v1/catalog/categories/{categoryType}/{categoryId}/courses/{courseId}                                                          |
| Create Cartridge                           | CourseWS.saveCartridge()                               | N/A                                                                                                                                                    |
| Read Cartridge                             | CourseWS.getCartridge()                                | N/A                                                                                                                                                    |
| Update Cartridge                           | CourseWS.saveCartridge()                               | N/A                                                                                                                                                    |
| Delete Cartridge                           | CourseWS.deleteCartridge()                             | N/A                                                                                                                                                    |
| Create StaffInfo                           | CourseWS.saveStaffInfo()                               | POST /learn/api/public/v1/users<br />PUT /learn/api/public/v1/courses/{course id}/users/{user id}                                                      |
| Read StaffInfo                             | CourseWS.getStaffInfo()                                | GET /learn/api/public/v1/users/{user id}                                                                                                               |
| Update StaffInfo                           | CourseWS.saveStaffInfo()                               | PATCH /learn/api/public/v1/users/{user id}                                                                                                             |
| Delete StaffInfo                           | CourseWS.deleteStaffInfo()                             | DELETE /learn/api/public/v1/users/{user id}                                                                                                            |
| Set Course Banner                          | CourseWS.setCourseBannerImage()                        | N/A                                                                                                                                                    |
| Get Group Tools                            | CourseWS.getAvailableGroupTools()                      | 2020 Roadmap                                                                                                                                           |
| Read Classification                        | CourseWS.getClassifications()                          | N/A                                                                                                                                                    |

## Course Memberships

| Use Case                                                           | SOAP WS Call                                                | REST Endpoint                                                                  |
| ------------------------------------------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Create Course Membership CourseMembershipWS.saveCourseMembership() | PUT /learn/api/public/v1/courses/{courseId}/users/{user id} |
| Read Course Membership                                             | CourseMembershipWS.getCourseMembership()                    | GET /learn/api/public/v1/courses/{courseId}/users/{user id}                    |
| Read All Course Memberships                                        | CourseMembershipWS.getCourseMembership()                    | GET /learn/api/public/v1/courses/{courseId}/users                              |
| Update Course Memberships                                          | CourseMembershipWS.saveCourseMembership()                   | PATCH /learn/api/public/v1/courses/{courseId}/users/{userId}                   |
| Delete Course Memberships                                          | CourseMembershipWS.deleteCourseMembership()                 | DELETE /learn/api/public/v1/courses/{courseId}/users/{userId}                  |
| Create Organization Membership                                     | CourseMembershipWS.saveCourseMembership()                   | PUT /learn/api/public/v1/courses/{courseId}/users/{user id}                    |
| Read Organization Membership                                       | CourseMembershipWS.getCourseMembership()                    | GET /learn/api/public/v1/courses/{courseId}/users/{user id}                    |
| Read All Organization Memberships                                  | CourseMembershipWS.getCourseMembership()                    | GET /learn/api/public/v1/courses/{courseId}/users                              |
| Update Organization Memberships                                    | CourseMembershipWS.saveCourseMembership()                   | PATCH /learn/api/public/v1/courses/{courseId}/users/{userId}                   |
| Delete Organization Memberships                                    | CourseMembershipWS.deleteCourseMembership()                 | DELETE /learn/api/public/v1/courses/{courseId}/users/{userId}                  |
| Create Group Membership                                            | CourseMembershipWS.saveGroupMembership()                    | PUT /learn/api/public/v1/courses/{courseId}/groups/{groupId}/users/{userId}    |
| Read Group Membership                                              | CourseMembershipWS.getGroupMembership()                     | GET /learn/api/public/v1/courses/{courseId}/groups/{groupId}/users/{userId}    |
| Read All Group Memberships                                         | CourseMembershipWS.getGroupMembership()                     | GET /learn/api/public/v1/courses/{courseId}/groups/{groupId}/users             |
| Delete Group Memberships                                           | CourseMembershipWS.deleteGroupMembership()                  | DELETE /learn/api/public/v1/courses/{courseId}/groups/{groupId}/users/{userId} |
| Get Course Roles                                                   | CourseMembershipWS.getCourseRoles()                         | GET /learn/api/public/v1/courseRoles                                           |

## Gradebook

| Use Case                 | SOAP WS Call                       | REST Endpoint                                                                                              |
| ------------------------ | ---------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Create an Attempt        | GradebookWS.saveAttempts()         | POST /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts                          |
| Read an Attempt          | GradebookWS.getAttempts()          | GET /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts/{attempt id}              |
| Read All Attempts        | GradebookWS.getAttempts()          | GET /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts                           |
| Update an Attempt        | GradebookWS.saveAttempts()         | PATCH /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts/{attempt id}            |
| Delete an Attempt        | GradebookWS.deleteAttempts()       | PATCH /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts/{attempt id} (set to 0) |
| Create a Column          | GradebookWS.saveColumns()          | POST /learn/api/public/v2/course/{courseId}/gradebook/columns                                              |
| Read a Column            | GradebookWS.getGradebookColumns()  | GET /learn/api/public/v2/course/{courseId}/gradebook/columns/{column id}                                   |
| Read All Columns         | GradebookWS.getGradebookColumns()  | GET /learn/api/public/v2/course/{courseId}/gradebook/columns                                               |
| Update a Column          | GradebookWS.saveColumns()          | PATCH /learn/api/public/v2/course/{courseId}/gradebook/columns/{column id}                                 |
| Delete a Column          | GradebookWS.deleteColumns()        | DELETE /learn/api/public/v2/course/{courseId}/gradebook/columns/{column id}                                |
| Create a Gradebook Type  | GradebookWS.saveGradebookTypes()   | POST /learn/api/public/v2/course/{courseId}/gradebook/columns                                              |
| Read a Gradebook Type    | GradebookWS.getGradebookTypes()    | GET /learn/api/public/v2/course/{courseId}/gradebook/columns/{column id}                                   |
| Read All Gradebook Types | GradebookWS.getGradebookTypes()    | GET /learn/api/public/v2/course/{courseId}/gradebook/columns                                               |
| Update a Gradebook Type  | GradebookWS.saveGradebookTypes()   | PATCH /learn/api/public/v2/course/{courseId}/gradebook/columns/{column id}                                 |
| Delete a Gradebook Type  | GradebookWS.deleteGradebookTypes() | DELETE /learn/api/public/v2/course/{courseId}/gradebook/columns/{column id}                                |
| Create a Grade           | GradebookWS.saveGrades()           | POST /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts                          |
| Read a Grade             | GradebookWS.getGrades()            | GET /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts/{attempt id}              |
| Read All Grades          | GradebookWS.getGrades()            | GET /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts                           |
| Update a Grade           | GradebookWS.saveGrades()           | PATCH /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts/{attempt id}            |
| Delete a Grade           | GradebookWS.deleteGrades()         | PATCH /learn/api/public/v2/course/{courseId}/gradebook/columns/{columnid}/attempts/{attempt id} (set to 0) |
| Create a Grading Schema  | GradebookWS.saveGradingSchemas()   | POST /learn/api/public/v1/courses/{course id]/gradebook/schemas                                            |
| Read a Grading Schema    | GradebookWS.getGradingSchemas()    | GET /learn/api/public/v1/courses/{course id]/gradebook/schemas/{schema id}                                 |
| Read All Grading Schemas | GradebookWS.getGradingSchemas()    | GET /learn/api/public/v1/courses/{course id]/gradebook/schemas                                             |
| Update a Grading Schema  | GradebookWS.saveGradingSchemas()   | PATCH /learn/api/public/v1/courses/{course id]/gradebook/schemas/{schema id}                               |
| Delete a Grading Schema  | GradebookWS.deleteGradingSchemas() | DELETE /learn/api/public/v1/courses/{course id]/gradebook/schemas/{schema id}                              |

## Users

| Use Case                                      | SOAP WS Call                         | REST Endpoint                                                                                            |
| --------------------------------------------- | ------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| Create a User                                 | UserWS.saveUser()                    | POST /learn/api/public/v1/users                                                                          |
| Read a User                                   | UserWS.getUser()                     | GET /learn/api/public/v1/users/{userId}                                                                  |
| Read All Users                                | UserWS.getUser()                     | GET /learn/api/public/v1/users                                                                           |
| Update a User                                 | UserWS.saveUser()                    | PATCH /learn/api/public/v1/users/{userId}                                                                |
| Delete a User                                 | UserWS.deleteUser()                  | DELETE /learn/api/public/v1/users/{userId}                                                               |
| Update a User's BatchUid                      | UserWS.changeUserBatchUid()          | PATCH /learn/api/public/v1/users/{userId}                                                                |
| Update a User's DataSource ID                 | UserWS.changeUserDataSourceId()      | PATCH /learn/api/public/v1/users/{userId}                                                                |
| Delete User by Role                           | UserWS.deleteUserByInstitutionRole() | N/A                                                                                                      |
| Create a User's Address Book Entry            | UserWS.saveAddressbookEntry()        | POST /learn/api/public/v1/users                                                                          |
| Read a User's Address Book Entry              | UserWS.getAddressbookEntry()         | GET /learn/api/public/v1/users/{userId}                                                                  |
| Read All a User's Address Book Entries        | UserWS.getAddressbookEntry()         | GET /learn/api/public/v1/users                                                                           |
| Update a User's Address Book Entry            | UserWS.saveAddressBbookEntry()       | PATCH /learn/api/public/v1/users/{userId}                                                                |
| Delete a User's Address Book Entry            | UserWS.deleteAddressBookEntry()      | DELETE /learn/api/public/v1/users/{userId}                                                               |
| Read All Institution Roles                    | UserWS.getInstitutionRoles()         | GET /learn/api/public/v1/institutionRoles                                                                |
| Read All System Roles                         | UserWS.getSystemRoles()              | GET /learn/api/public/v1/systemRoles                                                                     |
| Read All Institution Roles Assigned to a User | UserWS.getUserInstitutionRoles()     | GET /learn/api/public/v1/users/{userId}                                                                  |
| Create Observer Association                   | UserWS.saveObserverAssociation()     | PUT /learn/api/public/v1/users/{userId}/observers/{observerId}                                           |
| Read Observer Association                     | UserWS.getObservee()                 | GET /learn/api/public/v1/users/{userId}/observees<br />GET /learn/api/public/v1/users/{userId}/observers |
| Read All Observer Association                 | UserWS.getObservee()                 | GET /learn/api/public/v1/users/{userId}/observees<br />GET /learn/api/public/v1/users/{userId}/observers |
| Update Observer Association                   | UserWS.saveObserverAssociation()     | PUT /learn/api/public/v1/users/{userId}/observers/{observerId}                                           |
| Delete Observer Association                   | UserWS.deleteOverserverAssociation() | DELETE /learn/api/public/v1/users/{userId}/observers/{observerId}                                        |

## Util

| Use Case                            | SOAP WS Call                     | REST Endpoint                        |
| ----------------------------------- | -------------------------------- | ------------------------------------ |
| Read All Datasources                | UtilWS.getDataSources()          | GET /learn/api/public/v1/dataSources |
| Get Required Entitlements By Method | UtilWS.getRequiredEntitlements() | N/A                                  |
| Check a User's Entitlements         | UtilWS.checkEntitlement()        | N/A                                  |
| Create a Setting                    | UtilWS.saveSetting()             | N/A                                  |
| Load a Setting                      | UtilWS.loadSetting()             | N/A                                  |
| Update a Setting                    | UtilWS.saveSetting()             | N/A                                  |
| Delete a Setting                    | UtilWS.deleteSetting()           | N/A                                  |
