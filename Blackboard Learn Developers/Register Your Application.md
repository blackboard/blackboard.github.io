# Register Your Application
*Author: Ryan Haber*  
*Categories: []*  
*Tags: ['developer']*  
<hr />
For your application to work with Blackboard Learn, you must register it in
the developer portal. When you register your application, you receive a unique
key and secret. The key/secret combination is unique, identifies your
application, and cannot be retrieved. You must write them down someplace safe
and treat them as credentials. You use them as part of the process to
authenticate your application with Blackboard Learn instances.

To register your application:

  1. Log into [https://developer.blackboard.com/](https://developer.blackboard.com/). If you do not have a login, you must sign up for one first.
  2. With the _My Applications_ tab highlighted, select the **+** (add) icon.
  3. Complete the required fields. The default developer group for your application is your name. You can change this later. For more information about developer groups, see [Developer Groups, Site Quotas, and Rate Limits](https://community.blackboard.com/docs/DOC-4258-developer-groups-site-quotas-and-rate-limits). Learn displays your application's name and description to Learn administrators when they connect your application to their system. This helps them make sure they have found the intended application.  
The following fields are required:

    * for REST applications, provide only a **Name** and **Description** for your application and select a **Group** to work on the project.
    * for LTI 1.1 tools, provide **Name**, **Description**, **Domain(s)**, and **Group**.
    * for LTI 1.3 tools, complete all fields.
  4. Select **Save**. The portal displays your applications key and secret.
  5. Copy your key and secret and keep them safe.

You will use your key and secret to [authenticate your application with
Blackboard Learn](https://community.blackboard.com/docs/DOC-4457-use-
oauth-20-to-authenticate-with-blackboard-learn) to use REST API methods.

