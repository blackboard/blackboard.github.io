# Building Block Security
This page describes how to restrict access to a page in your building block.

# Entitlements

The primary means of restricting access to a building block is through the use
of entitlements. These intitlements are simply strings with the form
**functional-area.ACTION**

For example,

  * The **course.enrollment.MODIFY** entitlement grants a user rights to modify an enrollment in a course.
  * The **course.assessment.results.VIEW** entitlement grants a user rights to view results in a course.
  * The **course.content.CREATE** entitlement grants a user rights to create content in a course.

The list of available entitlements can be seen by looking at the
bb_bb60.entitlement table.

Every role in Blackboard has a set of entitlements attached to it. All the
entitlements for particular roles can be viewed and modified on the Privileges
page in the System Admin panel. However, for development purposes, it's easier
to look directly in the database.

# Enforcing entitlements

The easiest way to check entitlements is by using the static methods on the
[SecurityUtil](https://community.blackboard.com/external-link.jspa?url=http%3A
%2F%2Flibrary.blackboard.com%2Fref%2F15c9ac3f-f10f-44bc-91f9-1556e05cc5b6%2Fbl
ackboard%2Fplatform%2Fsecurity%2FSecurityUtil.html) class.

For example, to check whether a user has rights to modify an enrollment in a
course, you could write.

if(SecurityUtil.userHasEntitlement("course.enrollment.MODIFY")) {

...

...

}

If you wish to check a set of permissions in one go, you can use the method [S
ecurityUtil.userHasAllEntitlements(java.lang.String[])](https://community.blac
kboard.com/external-link.jspa?url=http%3A%2F%2Flibrary.blackboard.com%2Fref%2F
15c9ac3f-f10f-44bc-91f9-1556e05cc5b6%2Fblackboard%2Fplatform%2Fsecurity%2FSecu
rityUtil.html%23userHasAllEntitlements%28java.lang.String%5B%5D%29)

if (SecurityUtil.userHasAllEntitlements(new
String[]{"course.assessment.results.DELETE",

"course.assessment.results.MODIFY", "course.assessment.results.VIEW"})) {

...

...

}

**The PlugInUtil class also has several methods you can use to check permissions, such as PlugInUtil.authorizeForCourseControlPanel(request, response). However, these methods will also generate a redirect to the front page if the check fails, which may interfere with your application logic.**

# Ensuring that a user is authenticated

To check that a user is authenticated, you can call the isAuthenticated()
method on the user's [BbSession](https://community.blackboard.com/external-lin
k.jspa?url=http%3A%2F%2Flibrary.blackboard.com%2Fref%2F15c9ac3f-f10f-44bc-91f9
-1556e05cc5b6%2Fblackboard%2Fplatform%2Fsession%2FBbSession.html) object.

BbSession bbSession = BbSessionManagerServiceFactory.getInstance().getSession(
ctx.getActionBeanContext().getRequest());

if (!bbSession.isAuthenticated()) {

.... REDIRECT THE USER TO THE LOGIN PAGE ....

}

If this code is in a JSP, you can redirect the user by calling
HttpAuthManager.sendLoginRedirect(request,response)

JSP example:

BbSession bbSession = BbSessionManagerServiceFactory.getInstance().getSession(
ctx.getActionBeanContext().getRequest());

if (! bbSession.isAuthenticated())

{

HttpAuthManager.sendLoginRedirect(request,response);

return;

}

However, if you are using a framework like
[Spring](https://community.blackboard.com/external-
link.jspa?url=http%3A%2F%2Fwww.springsource.org%2F) or
[Stripes](https://community.blackboard.com/external-
link.jspa?url=http%3A%2F%2Fwww.stripesframework.org%2F) calling
HttpAuthManager.sendLoginRedirect may interfere with your application logic,
and you may wish to just redirect to the root of your blackboard install.

Stripes example:

BbSession bbSession = BbSessionManagerServiceFactory.getInstance().getSession(
ctx.getActionBeanContext().getRequest());

if (! bbSession.isAuthenticated())

{

return new RedirectResolution("/", false);

}

