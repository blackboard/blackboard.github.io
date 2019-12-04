# REST Demo Using cURL
*Author: Mark Bykerk Kauffman*
*Categories: []*
*Tags: ['rest', 'blackboard learn', 'example', 'sample code', 'saas', 'api', 'curl', 'demo', '3lo', 'three-legged oauth', 'developer']*
---
  * Introduction
  * Assumptions
  * Walkthrough
    * Authorization and Authentication
      * OAuth2 Basic (Two Legged)
      * OAuth2 (Three Legged) - 3LO
    * Calling Services
      * COMMON ERROR: You used 3LO to get an Access Token. You forgot to set the scope correctly and are getting permission denied errors. 404 etc.
      * SOLUTION: Go back through the 3LO process and specify the scope necessary to make your REST calls.
      * DATASOURCES
      * USERS
      * COURSE GRADES
      * ACCESS CONTENT
      * COURSE COPY
      * ADD CONTENT
      * CREATE ASSIGNMENT, WITH ATTACHMENT - Currently Only Available For Ultra Courses
      * SUBMIT ASSIGNMENT ATTEMPT, WITH ATTACHMENT - Currently Only Available For Presentation-0nly Assignments

# Introduction

The rest demo script demonstrates authenticating a REST application,
management and use of the authorization token, and creating, updating,
discovering, and deleting the Data Source and User Learn objects. A video
presentation using this material plus an explanation of how to register your
REST application on the Developer Portal, and how to configure your
application's REST integration on your Learn development system, is available
here [http://bit.ly/RestTechDeepDive4Partners](https://community.blackboard.co
m/external-link.jspa?url=http%3A%2F%2Fbit.ly%2FRestTechDeepDive4Partners) Here
is the slide deck [2016.06.22.RestTechnicalDeepDiveForPartners.pptx](https://c
ommunity.blackboard.com/docs/DOC-1854)

_Before running the example code you must register a developer account and
application as described on the Developer Community [What is the Developer
Portal: Developer Registration and Application
Management](https://community.blackboard.com/docs/DOC-1579-register-as-a-
developer-and-manage-your-applications-with-the-developer-portal)[Register as
a Developer and Manage Your Applications with the Developer
Portal](https://community.blackboard.com/docs/DOC-1579-register-as-a-
developer-and-manage-your-applications-with-the-developer-portal) and
[Managing REST Integrations in Learn: The REST Integrations Tool for System
Administrators](https://community.blackboard.com/docs/DOC-1580-managing-rest-
integrations-in-learn-the-rest-integrations-tool-for-system-
administrators)[Managing REST Integrations in Learn: The REST Integrations
Tool for System
Administrators](https://community.blackboard.com/docs/DOC-1580-managing-rest-
integrations-in-learn-the-rest-integrations-tool-for-system-administrators)
pages. You must also configure the script as outlined in the below Configure
the Script section._

This cURL command-line demonstration shows you how to:

  * Authenticate
  * Create a Data Source
  * Create, Read, and Update a User
  * Delete created objects in reverse order of create - user, datasource.
  * Create a grade column and add a grade.
  * Upload a file to a content area.

All generated output is sent to the terminal.

This is not meant to be a cURL tutorial. It will not teach you to use cURL. It
will, however, give a Developer familiar with cURL the knowledge necessary to
make a complete set of CRUD operations to the Learn REST endpoints.

# Assumptions

This help topic assumes the Developer:

  * is familiar with cURL.
  * has a REST-enabled Blackboard Learn instance, like the [Developer Virtual Machine](https://behind.blackboard.com%2FSystem-Administrator%2FLearn%2FDownloads%2Fdownload.aspx%3Fd%3D1746). This requires Behind the Blackboard access.

# Walkthrough

To build an integration with the Blackboard REST Web Services, regardless of
the programming language of choice, can really be summed up in two steps:

  1. Use the Application Key and Secret to obtain an **OAuth 2.0 access token**, as described in the [Basic Authentication](https://community.blackboard.com/docs/DOC-1644-authorization-and-authentication) document.

OR

  1. Use the authorizationcode endpoint to log into Learn with a given user's credentials, then obtain an **OAuth 2.0 access token**, using the application key/secret, that only allows access to the system based on that particular user's entitlements as described in the [Three-Legged OAuth](https://community.blackboard.com/docs/DOC-3976-three-legged-oauth) document.
  2. Call the appropriate REST endpoint with the **OAuth 2.0 access token** and necessary data to perform a given action.

Every example is shown in bold face, the JSON result is shown in italics.

## Authorization and Authentication

### OAuth2 Basic (Two Legged)

The REST Services rely on OAuth 2.0 Bearer Tokens for authentication. A
request is made to the token endpoint with a Basic Authorization header
containing the base64-encoded key:secret string as its key. The token service
returns a JSON object containing the Access Token, the Token Type, and the
number of seconds until the token expires. The token is set to expire after
one hour, and subsequent calls to retrieve the token will return the same
token with an updated expiry time until such time that the token has expired.
There is no refresh token and currently no revoke token method.

You can do this with cURL with the following command line. We use the -k
parameter to ignore issues caused by the self-signed certificate.

curl -k --user <key>:<secret> --data "grant_type=client_credentials"
[https://](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2F%25200B%2F)<Learn
Host>/learn/api/public/v1/oauth2/token

Example:

**curl -k --user d128e50d-c91e-47d3-a97e-9d0c8a87fb5d:kLpiuq34320jqreaiJIRoareASELERREv56 --data "grant_type=client_credentials" [https://localhost:9877/learn/api/public/v1/oauth2/token](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Foauth2%2Ftoken)**

_{"access_token":"ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz","token_type":"bearer","exp
ires_in":3444}_

The JSON response is serialized into the Token object as shown above, and you
may then retrieve those values from that object by using copy and paste. You
will use the value given for the access_token when calling the services as
shown in the **Calling Services** section.

### OAuth2 (Three Legged) - 3LO

To work with 3LO you will need both a browser, to log into Learn and retrieve
a code, and a terminal window for your cURL commands. Note: In step 1 the
client_id is NOT the Application ID. It IS the Application Key.

**Step 1. GET a code using your browser - CAUTION: You MUST set the scope parameter.**

Put the GET request in your browser's address field. Craft a URL in the
following format:

[https://](/external-link.jspa?url=https%3A%2F%2F)<Learn
Host>//learn/api/public/v1/oauth2/authorizationcode?redirect_uri=<REST APP
URI>&response_type=code&client_id=<your **app key**>&scope=read

Example:

Place the URI below in your browser address field:

**[https://bd-partner-a-original.blackboard.com/learn/api/public/v1/oauth2/authorizationcode?redirect_uri=http](https://community.blackboard.com/bd-partner-a-original.blackboard.com/learn/api/public/v1/oauth2/authorizationcode?redirect_uri=http)s://localhost&response_type=code&client_id=d128e50d-c91e-47d3-a97e-9d0c8a77fb5d&scope=read**

At this point you are requested to log in. As of 2018.04.19 there is a bug
with the cookie-acceptance pop up that will require you to accept the pop-up
and do the above a second time. Once your browser has the cookie-acceptance
cookie set for a given Learn system the work flow will carry on as follows.

For this example, after you log in your browser will be directed to:
https://localhost/?code=XYTdmQcSGrggzujJm2Ccf8C7dKyqKc7Q (The code will be
different every time.) If you provided some other host name in the
redirect_uri, then that host name would be shown instead of localhost. Now you
have the code that you will use to retrieve the access token for all
additional REST calls.

NOTE regarding scope: developer.blackboard.com an example scope parameter as
"read write offline". Using curl this would be &scope=read%20write%20offline

We have to URL encode the space character.

**Step 2. POST to get the OAuth2 Access Token**

You will use your application's key and secret, and the access code from step
1. Notice that the grant_type is authorization_code in this case. Also note
that the redirect_uri value MUST match the value provided in Step 1. For our
Example we will use
[https://localhost](https://community.blackboard.com/localhost).

curl -k --user <key>:<secret> --data "grant_type=authorization_code"
[https://](https://community.blackboard.com/ 0B)<Learn
Host>/learn/api/public/v1/oauth2/token

Example:

curl -k --user
d128e50d-c91e-47d3-a97e-9d0c8a77fb5d:kLpiuq34320jqreaiJIRoareASELERREv56
--data "grant_type=authorization_code" https://bd-partner-a-original-new.black
board.com/learn/api/public/v1/oauth2/token?code=ItmqfxQiA9dzIDNwNoNYseM5GNRHHl
fa\&redirect_uri=https://localhost

{"access_token":"Cdf83I0dwRoweXuY1dZDbbW0f0WmDmuF","token_type":"bearer","expi
res_in":3599,"scope":"read","user_id":"7ac650e5bd0d467882943ed06fbfe72c"}

The JSON response is serialized into the Token object as shown above, and you
may then retrieve those values from that object by using copy and paste. You
will use the value given for the access_token when calling the services as
shown in the **Calling Services** section.

## Calling Services

The individual service calls are handled in succession here. We'll use copy
and paste to create the JSON object in the form of a string, use cURL for
generating the appropriate HTTP Request, and shipping it to Learn. We'll see
the JSON response come back to stdout on the console.

End points are generally defined as /learn/api/public/v1/<object
type>/<objectId>. Object ID can be either the pk1, like _1_1, or as the
batchuid. This value should be prepended by externalId:, like
externalId:test101.

For example, to retrieve a course by the pk1 _1_1, you would call **GET
/learn/api/public/v1/courses/_1_1**. To retrieve by the batchuid test101, you
would call **GET /learn/api/public/v1/courses/externalId:test101.**

Create is sent to Learn as a HTTP POST message with a JSON body that defines
the object. The endpoint should omit the objectId, as this will be generated
on creation.

Read is sent to Learn as a HTTP GET message with an empty body. The endpoint
should include the objectId being retrieved.

Update is sent to Learn as a HTTP PATCH message with a JSON body that defines
the object. The endpoint should include the objectId being updated.

Delete is sent to Learn as a HTTP DELETE message with empty body. The endpoint
should include the objectId being deleted.

Every example is shown in bold face, the JSON result is shown in italics.

### COMMON ERROR: You used 3LO to get an Access Token. You forgot to set the
scope correctly and are getting permission denied errors. 404 etc.

### SOLUTION: Go back through the 3LO process and specify the scope necessary
to make your REST calls.

### DATASOURCES

**Create**

curl -k -X POST -H "Authorization: Bearer <Access Token>" -H "Content-Type:
application/json" --data '{"externalId":"<String>","description":"<String>"}'
[https://](https://community.blackboard.com/)<Learn
Host>/learn/api/public/v1/dataSources

Bearer will be the access_token value we got from the oauth2/token call above.

Example:

**curl -k -X POST -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" -H "Content-Type: application/json" --data '{"externalId":"CURLDSK","description":"cURL Demo DSK"}' [https://localhost:9877/learn/api/public/v1/dataSources](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2FdataSources)**

_{"id":"_5_1","externalId":"CURLDSK","description":"cURL Demo DSK"}_

**Read**

curl -k -X GET -H "Authorization: Bearer <Access Token>"
[https://](https://community.blackboard.com/)<Learn
Host>/learn/api/public/v1/dataSources/externalId:<externalId from create>

Example:

**curl -k -X GET -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" [https://localhost:9877/learn/api/public/v1/dataSources/externalId:CURLDSK](https://localhost%3A9877%2Flearn%2Fappublic%2Fv1%2FdataSources%2FexternalId%3ACURLDSK)**

_{"id":"_7_1","externalId":"CURLDSK","description":"cURL Demo DSK"}_

**Update**

curl -k --request PATCH -H "Authorization: Bearer <Access Token>" -H "Content-
Type: application/json" --data
'{"externalId":"<String>","description":"<String>"}'
[https://](https://community.blackboard.com/)<Learn
Host>/learn/api/public/v1/dataSources/[<primary id>|externalId:<String>]

Examples:

**curl -k --request PATCH -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" -H "Content-Type: application/json" --data '{"externalId":"CURLDSK","description":"cURL DEMONSTRATION DSK"}' [https://localhost:9877/learn/api/public/v1/dataSources/_7_1](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2FdataSources%2F_7_1)**

_{"id":"_7_1","externalId":"CURLDSK","description":"cURL DEMONSTRATION DSK"}_

**curl -k --request PATCH -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" -H "Content-Type: application/json" --data '{"externalId":"CURLDSK","description":"cURL REST DEMO DSK"}' [https://localhost:9877/learn/api/public/v1/dataSources/externalId:CURLDSK](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2FdataSources%2FexternalId%3ACURLDSK)**

_{"id":"_7_1","externalId":"CURLDSK","description":"cURL REST DEMO DSK"}_

**Delete (If you are going to run the following examples, do so now before deleting your demo DSK.)**

curl -k -X DELETE -H "Authorization: Bearer <Access Token>"
[https://](https://community.blackboard.com/)<Learn
Host>/learn/api/public/v1/dataSources/[<primary id>|externalId:<String>]

Examples:

**curl -k -X DELETE -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" [https://localhost:9877/learn/api/public/v1/dataSources/externalId:CURLDSK](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2FdataSources%2FexternalId%3ACURLDSK)**

With delete, you don't see anything back on the command line to indicate your
delete was successful. You can run it again and you'll see that the DSK is
truly gone.

**curl -k -X DELETE -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" [https://localhost:9877/learn/api/public/v1/dataSources/externalId:CURLDSK](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2FdataSources%2FexternalId%3ACURLDSK)**

_{"status":404,"message":"Could not find object with ID:
externalId:CURLDSK","extraInfo":"416d7b944a58482aaed2df50f301861b"}_

### USERS

**Create**

curl -k -X POST -H "Authorization: Bearer <Authorization Token>" -H "Content-
Type: application/json" --data '<JSON to create a User>' [https://localhost:98
77/learn/api/public/v1/users/](https://community.blackboard.com/external-link.
jspa?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F
)

Remember, you can always find the JSON specification for these calls at
[Explore APIs](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fdeveloper.blackboard.com%2Fportal%2FdisplayApi)

Example:

**curl -k -X POST -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" -H "Content-Type: application/json" --data '{"externalId":"restdemouser","dataSourceId":"_7_1","userName":"restdemouser","password":"xyzzy","availability":{"available":"Yes"},"name":{"given":"demo","family":"user","title":"Mr"},"contact":{"email":"no.one@ereh.won"}}' [https://localhost:9877/learn/api/public/v1/users/](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)**

_{"id":"_7_1","uuid":"de2198a86c6645cbafaab13e79529e05","externalId":"restdemo
user","dataSourceId":"_7_1","userName":"restdemouser","educationLevel":"Unknow
n","gender":"Unknown","created":"2016-05-11T21:39:11.518Z","systemRoleIds":["U
ser"],"availability":{"available":"Yes"},"name":{"given":"demo","family":"user
","title":"Mr"},"job":{},"contact":{"email":"no.one@ereh.won"},"address":{},"l
ocale":{}}_

By sheer coincidence this user's ID, _7_1, came out to be the same as the DSK
ID, _7_1.

Note the availability of query parameters in the documentation at
[https://developer.blackboard.com](/external-
link.jspa?url=https%3A%2F%2Fdeveloper.blackboard.com). Examples:

**curl -k -X GET -H "Authorization: Bearer bsdcojzT9i4qTaNE0T8ugEBcXE2U8jtu" [https://bd-partner-a-ultra.blackboard.com/learn/api/public/v1/users?dataSourceId=_2_1\&fields=externalId,userName,studentId](/external-link.jspa?url=https%3A%2F%2Fbd-partner-a-ultra.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%3FdataSourceId%3D_2_1%5C%26fields%3DexternalId%2CuserName%2CstudentId)**

{"results":[{"externalId":"[abcd001@examity.com](mailto:abcd001@examity.com)",
"userName":"[abcd001@examity.com](mailto:abcd001@examity.com)","studentId":"AB
CD001"},{"externalId":"[abcd002@examity.com](mailto:abcd002@examity.com)","use
rName":"[abcd002@examity.com](mailto:abcd002@examity.com)","studentId":"[ABCD0
02@examity.com](mailto:ABCD002@examity.com)"},...

On a Windows system, use ^ to escape the &.

curl -k -X GET -H "Authorization: Bearer bsdcojzT9i4qTaNE0T8ugEBcXE2U8jtu"
[https://bd-partner-a-
ultra.blackboard.com/learn/api/public/v1/users?dataSourceId=_220_1](/external-
link.jspa?url=https%3A%2F%2Fbd-partner-a-ultra.blackboard.com%2Flearn%2Fapi%2F
public%2Fv1%2Fusers%3FdataSourceId%3D_220_1)**^&fields**=externalId,userName,s
tudentId

**Read**

curl -k -X GET -H "Authorization: Bearer <Authorization Token>" [https://local
host:9877/learn/api/public/v1/users/](https://community.blackboard.com/externa
l-link.jspa?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fu
sers%2F)[<primary id>|externalId:<String>]

Examples:

**curl -k -X GET -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" [https://localhost:9877/learn/api/public/v1/users/externalId:restdemouser](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2FexternalId%3Arestdemouser)**

_{"id":"_7_1","uuid":"de2198a86c6645cbafaab13e79529e05","externalId":"restdemo
user","dataSourceId":"_7_1","userName":"restdemouser","educationLevel":"Unknow
n","gender":"Unknown","created":"2016-05-11T21:39:11.518Z","systemRoleIds":["U
ser"],"availability":{"available":"Yes"},"name":{"given":"demo","family":"user
","title":"Mr"},"job":{},"contact":{"email":"no.one@ereh.won"},"address":{},"l
ocale":{}}_

**curl -k -X GET -H "Authorization: Bearer ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz" [https://localhost:9877/learn/api/public/v1/users/_7_1](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F_7_1%25200B)**

_{"id":"_7_1","uuid":"de2198a86c6645cbafaab13e79529e05","externalId":"restdemo
user","dataSourceId":"_7_1","userName":"restdemouser","educationLevel":"Unknow
n","gender":"Unknown","created":"2016-05-11T21:39:11.518Z","systemRoleIds":["U
ser"],"availability":{"available":"Yes"},"name":{"given":"demo","family":"user
","title":"Mr"},"job":{},"contact":{"email":"no.one@ereh.won"},"address":{},"l
ocale":{}}_

**Update**

curl -k --request PATCH -H "Authorization: Bearer <Access Token>" -H "Content-
Type: application/json" --data '<JSON Data for a User>'
[https://](https://community.blackboard.com/)<Learn
Host>/learn/api/public/v1/users/[<primary id>|externalId:<String>]

Example:

**curl -k --request PATCH -H "Authorization: Bearer **ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz**" -H "Content-Type: application/json" --data '{"externalId":"restdemouser","dataSourceId":"_7_1","userName":"restdemouser","availability":{"available":"Yes"},"name":{"given":"Jane","family":"Demo","title":"Ms"},"contact":{"email":"no.one@ereh.won"}}' [https://localhost:9877/learn/api/public/v1/users/_7_1](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F_7_1)**

_{"id":"_7_1","uuid":"de2198a86c6645cbafaab13e79529e05","externalId":"restdemo
user","dataSourceId":"_7_1","userName":"restdemouser","educationLevel":"Unknow
n","gender":"Unknown","created":"2016-05-11T21:39:11.518Z","systemRoleIds":["U
ser"],"availability":{"available":"Yes"},"name":{"given":"Jane","family":"Demo
","title":"Ms"},"job":{},"contact":{"email":"no.one@ereh.won"},"address":{},"l
ocale":{}}_

**Delete**

curl -k -X DELETE -H "Authorization: Bearer <Access Token>"
[https://](https://community.blackboard.com/)<Learn
Host>/learn/api/public/v1/users/[<primary id>|externalId:<String>]

Example:

**curl -k -X DELETE -H "Authorization: Bearer **ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz**" [https://localhost:9877/learn/api/public/v1/users/externalId:restdemouser](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2FexternalId%3Arestdemouser)**

As with the DSK delete there is no output to the console when the delete is
successful. But, you can see that the user is gone by running the delete
again:

**curl -k -X DELETE -H "Authorization: Bearer **ti3EVMVQO4RqdAgcpmODZdvjvHuuBHDz**" [https://localhost:9877/learn/api/public/v1/users/externalId:restdemouser](https://localhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2FexternalId%3Arestdemouser)**

_{"status":404,"message":"Could not find object with ID:
externalId:restdemouser","extraInfo":"e709f6982af744dfae18d42f68e73fb1"}_

### COURSE GRADES

(Only in SaaS, Not in the Q2 2016 DVM)

**Create Grade Column**

curl -k -X POST -H "Authorization: Bearer <Authorization Token>" -H "Content-
Type: application/json" --data '<JSON to create a Grade Column>' [https://sash
ost.blackboard.com/learn/api/public/v1/courses/](https://community.blackboard.
com/external-link.jspa?url=https%3A%2F%2Fsashost.blackboard.com%2Flearn%2Fapi%
2Fpublic%2Fv1%2Fcourses%2F){courseId}/gradebook/columns

Example:

curl -k -X POST -H "Authorization: Bearer uFMWyuwgItXL0UzMo6AHG0zOhm0yvfys" -H
"Content-Type: application/json" --data '{"id": "7","externalId": "co7extId",
"name": "co7name","description": "co7desc","externalGrade": true,"created":
"2016-06-30T05:34:56.497Z","score": {"possible": 77,"decimalPlaces":
0},"availability": {"available": "Yes"},"grading": {"type":
"**Manual**","due": "2016-07-01T05:34:56.498Z", "attemptsAllowed":
0,"scoringModel": "Last","anonymousGrading": { "type": "None","releaseAfter":
"2016-07-11T05:34:56.498Z"}}}' [https://partner-smoke-test-a.blackboard.com/le
arn/api/public/v1/courses/](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fpartner-smoke-test-a.blackboard.com%2Flearn%2Fapi%
2Fpublic%2Fv1%2Fcourses%2F)**_50_1**/gradebook/columns

{"id":"**_129_1**","externalId":"co7extId","name":"co7name","description":"co7
desc","externalGrade":true,"created":"2016-07-01T05:45:37.730Z","score":{"poss
ible":77.0,"decimalPlaces":0},"availability":{"available":"Yes"},"grading":{"t
ype":"Manual","due":"2016-07-01T05:34:56.498Z"}}

**Add/Update Column Grade**

(PATCH will create a grade where there isn't one.)

curl -k --request PATCH -H "Authorization: Bearer <Access Token>" -H "Content-
Type: application/json" --data '<JSON Data for a Column Grade>'
[https://](https://community.blackboard.com/)<Learn Host>/learn/api/public/v1/
courses/{courseId}/gradebook/columns/{columnId}/users/{userId}

Example:

curl -k --request PATCH -H "Authorization: Bearer
uFMWyuwgItXL0UzMo6AHG0zOhm0yvfys" -H "Content-Type: application/json" --data
'{"text": "A","score": 77,"notes": "Great","feedback": "GoodWork!", "exempt":
true}' https://partner-smoke-test-a.blackboard.com/learn/api/public/v1/courses
/**_50_1**/gradebook/columns/**_129_1**/users/**_66_1**

{"userId":"**_66_1**","columnId":"**_129_1**","status":"Graded","score":77.0,"
notes":"Great","feedback":"GoodWork!","exempt":true}

### ACCESS CONTENT

  * See [Access Content Attachments](https://community.blackboard.com/docs/DOC-5357-rest-demo-using-curl-to-access-content-attachments)

### COURSE COPY

curl -k -X POST -H "Authorization: Bearer <Authorization Token>" -H "Content-
Type: application/json" --data '<JSON for the course to copy into>'
https://sashost.blackboard.com/learn/api/public/v1/courses/{courseId}/copy

Example:

curl -k -X POST -H "Authorization: Bearer RcHoSkh8EH9UKo6iCHWXDpCKrmCyOIwr" -H
"Content-Type: application/json" --data '{"courseId":"mbk-test-
copied201910111502"}' [https://partner-smoke-
test-a.blackboard.com/learn/api/public/v1/courses/courseId:mbk-
test/copy](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fpartner-smoke-
test-a.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Fcourses%2FcourseId%3Ambk-
test%2Fcopy)

A new course with courseId: mbk-test-copied201910111502 is created. The
contents of mbk-test are copied into it.

NOTE: You can NOT copy contents into an already existing course. For example
we used the GUI to create a course with a courseId: mbk-test-
copied201910111508. Then we attempted to run the following:

curl -k -X POST -H "Authorization: Bearer RcHoSkh8EH9UKo6iCHWXDpCKrmCyOIwr" -H
"Content-Type: application/json" --data '{"courseId":"mbk-test-
copied201910111508"}' [https://partner-smoke-test-a.blackboard.com/learn/api/p
ublic/v1/courses/_863_1/copy](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fpartner-smoke-
test-a.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Fcourses%2F_863_1%2Fcopy)

**{"status":409,"message":"A course with the provided courseId already exists"}**

You can only use the copy endpoint to take an existing course and create and
copy into a new, never before created, course.

### ADD CONTENT

(Remember to Check Availability of the APIs in the Learn Version)

Preconditions - You know the courseId, you've gotten an access token, and you
have a local file to upload.

FIRST - Get a course's contents.

curl -k -X GET -H "Authorization: Bearer TwniVbrjLoQnNVWexAGBgQEyMaw7GT0P"
[https://bd-partner-a-original.blackboard.com/learn/api/public/v1/](https://co
mmunity.blackboard.com/external-link.jspa?url=https%3A%2F%2Flocalhost%3A9877%2
Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2FexternalId%3Arestdemouser)courses/courseI
d:mbk-rest-contents/contents

{"results":[{"id":"_12906_1","title":"Information","created":"2017-12-06T18:50
:24.625Z","position":1,"hasChildren":true,"availability":{"available":"Yes","a
llowGuests":true,"adaptiveRelease":{}},"contentHandler":{"id":"resource/x-bb-f
older"}},{"id":"**_12907_1**","title":"Content","created":"2017-12-06T18:50:24
.628Z","position":2,"hasChildren":true,"availability":{"available":"Yes","allo
wGuests":true,"adaptiveRelease":{}},"contentHandler":{"id":"resource/x-bb-
folder"}}]}

In the THIRD step we’ll place our file in the Content folder we see in the
above response. Every new Learn Original course has a Content folder by
default.

SECOND - Upload a file.

curl -X POST -H "Authorization: Bearer TwniVbrjLoQnNVWexAGBgQEyMaw7GT0P"
[https://bd-partner-a-original.blackboard.com/learn/api/public/v1](https://com
munity.blackboard.com/external-link.jspa?url=https%3A%2F%2Flocalhost%3A9877%2F
learn%2Fapi%2Fpublic%2Fv1%2Fusers%2FexternalId%3Arestdemouser)[/uploads](https
://mylearn.int.b
bpd.io%2Flearn%2Fapi%2Fpublic%2Fv1%2Fuploads) -F "[file=@/Users/mbk/Documents/
2016.09.BlackboardPartnerUpdate.pdf](mailto:file=@/Users/mbk/Documents/2016.09
.BlackboardPartnerUpdate.pdf)"

{"id":"4B6281344DFDD9B1F36A5719BDB10708-38295ef0c6a74954a1055e1045bcfeeb"}

THIRD - Create the content item using bbXML and the id from the prior step.

{

"title": "Sept 2016 Partner Update",

"contentHandler": {

"id": “resource/x-bb-file",

"file": {

"uploadId":
"4B6281344DFDD9B1F36A5719BDB10708-38295ef0c6a74954a1055e1045bcfeeb",

"fileName": "2016.09.BlackboardPartnerUpdate.pdf",

"duplicateFileHandling": "Rename"

}

}

}

curl -k -X POST -H "Authorization: Bearer TwniVbrjLoQnNVWexAGBgQEyMaw7GT0P" -H
"Content-Type: application/json" --data '{"title": "Sept 2016 Partner
Update","contentHandler": {"id": "resource/x-bb-file","file": {"uploadId": "4B
6281344DFDD9B1F36A5719BDB10708-38295ef0c6a74954a1055e1045bcfeeb","fileName":
"2016.09.BlackboardPartnerUpdate.pdf", "duplicateFileHandling": "Rename"}}}'
[https://bd-partner-a-
original.blackboard.com/learn/api/public/v1/courses/courseId:mbk-rest-contents
/contents/_12907_1/children](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fbd-partner-a-original.blackboard.com%2Flearn%2Fapi
%2Fpublic%2Fv1%2Fcourses%2FcourseId%3Ambk-rest-
contents%2Fcontents%2F_12907_1%2Fchildren)

{"id":"_12908_1","parentId":"_12907_1","title":"Sept 2016 Partner Update","cre
ated":"2017-12-06T19:22:59.536Z","position":0,"availability":{"available":"Yes
","allowGuests":true,"adaptiveRelease":{}},"contentHandler":{"id":"resource/x-
bb-file","file":{"fileName":"2016.09.BlackboardPartnerUpdate.pdf"}}}

You can, of course, use the id returned in the above to fetch the content item
using the appropriate GET. Read the documentation at developer.blackboard.com.

### CREATE ASSIGNMENT, WITH ATTACHMENT - Currently Only Available For Ultra
Courses

**(Remember to check the Learn version for availably of the APIs @ [https://developer.blackboard.com](https://community.blackboard.com/developer.blackboard.com))**

FIRST - Get a course's content root. root will only work with the _abc_xyz ID
format. It will not work for courseId:<course_id> format.

curl -k -X GET -H "Authorization: Bearer <Access Token> "
[https://](https://community.blackboard.com/https:)<Learn
Host>/learn/api/public/v1/courses/<ID>/contents/root

Example:

curl -k -X GET -H "Authorization: Bearer N75W0ceKowxtlMUZtuIqwwvPQtxvx3L5"
[https://bd-partner-a-ultra.blackboard.com/learn/api/public/v1/courses/_691_1/
contents](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fbd-partner-a-
ultra.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Fcourses%2FcourseId%3Ambk-
ultra-course%2Fcontents)/root

{"id":"_5108_1","title":"ROOT","created":"2018-04-08T15:57:34.188Z","position"
:0,"hasChildren":true,"availability":{"available":"Yes","allowGuests":false,"a
daptiveRelease":{}},"contentHandler":{"id":"resource/x-bb-folder"}}

SECOND - Upload the file to be attached to the assignment.

Note: The file is uploaded to temporary storage so we must attach it to an
assignment shortly after the upload

curl -X POST -H "Authorization: Bearer N75W0ceKowxtlMUZtuIqwwvPQtxvx3L5"
[https://bd-partner-a-ultra.blackboard.com/learn/api/public/v1](/external-link
.jspa?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2
FexternalId%3Arestdemouser)[/uploads](/external-link.jspa?url=https%3A%2F%2Fmy
learn.int.bbpd.io%2Flearn%2Fapi%2Fpublic%2Fv1%2Fuploads) -F "[file=@/Users/mbk
/Documents/2016.06.BlackboardPartnerUpdate.pdf](mailto:file=@/Users/mbk/Docume
nts/2016.09.BlackboardPartnerUpdate.pdf)"

{"id":"D1-D1165F42C7E11286BDAFDCCD2E2BE935-56c7b14aa4cb499b9a9a2a8cc3156290"}

We use this id to indicate the file that is to be attached to the assignment.

THIRD - Create the assignment with the file attached:

(The file must be attached soon after being uploaded as it is uploaded to a
temporary location and goes away sometime after being uploaded. Also, there is
a bug in the following where if attempts allowed is too large it will fail.
I've not experimented to find the limit.)

Reference: [POST](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fdeveloper.blackboard.com%2Fassets%2Flib%2Fswagger-
ui%2Fswagger-index.html%3Furl%3D%2Fportal%2Fdocs%2Fapis%2Flearn-swagger.json%2
3%21%2Fcontent%2Fpost_learn_api_public_v1_courses_courseId_contents_createAssi
gnment) [/learn/api/public/v1/courses/{courseId}/contents/createAssignment](ht
tps://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fdeveloper.blackboard.com%2Fassets%2Flib%2Fswagger-
ui%2Fswagger-index.html%3Furl%3D%2Fportal%2Fdocs%2Fapis%2Flearn-swagger.json%2
3%21%2Fcontent%2Fpost_learn_api_public_v1_courses_courseId_contents_createAssi
gnment)

Example:

curl -k -X POST -H "Authorization: Bearer N75W0ceKowxtlMUZtuIqwwvPQtxvx3L5" -H
"Content-Type: application/json" --data '{"parentId": "_5108_1", "title":
"Assignment Created by REST createAssignment", "instructions": "Simple
Instructions", "description": "Assignment with Attachment", "position": 0,
"fileUploadIds": ["D1-D1165F42C7E11286BDAFDCCD2E2BE935-56c7b14aa4cb499b9a9a2a8
cc3156290"],"availability": {"available": "Yes", "allowGuests": true,
"adaptiveRelease": { "start": "2018-04-05T18:35:20.050Z", "end":
"2018-09-02T18:35:20.050Z" } }, "grading": { "due":
"2018-09-02T18:35:20.050Z", "attemptsAllowed": 10 }, "score": { "possible":
100 } }' [https://bd-partner-a-
ultra.blackboard.com/learn/api/public/v1/courses/courseId:mbk-ultra-
course/contents/createAssignment](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fbd-partner-a-
ultra.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Fcourses%2FcourseId%3Ambk-
ultra-course%2Fcontents%2FcreateAssignment)

{"contentId":"_6282_1","gradeColumnId":"**_3297_1**","assessmentId":"_11701_1"
,"questionIds":["_11703_1","_11704_1"]}

We will use the gradeColumnId when submitting a student attempt to the
assignment.

### SUBMIT ASSIGNMENT ATTEMPT, WITH ATTACHMENT - Currently Only Available For
Presentation-0nly Assignments

**(Reference for all APIs used and the Learn version they are available in is @ [https://developer.blackboard.com](https://community.blackboard.com/developer.blackboard.com))**

FIRST - Use 3LO to get an access code for the student account that will submit
the attempt to the assignment. 3LO MUST be used for this process.

NOTES: 1) Use Status read write, write is required to POST the assignment. 2)
LOG OUT of any browser session with the Learn system you've been working with
before doing the next step where you will log in with the student account.

a. Put the following URL in a browser's address field. Use the FQDN of the
Learn system you are working with. The client_id is the REST Application Key.
(Not the ID.)

[https://bd-partner-a-ultra.blackboard.com/learn/api/public/v1/oauth2/authoriz
ationcode?redirect_uri=http](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fbd-partner-a-original-new.blackboard.com%2Flearn%2
Fapi%2Fpublic%2Fv1%2Foauth2%2Fauthorizationcode%3Fredirect_url%3Dhttps%3A%2F%2
Flvh.me%2Fcallback)s://localhost&response_type=code&client_id=d128e50d-c91e-47
d3-a97e-9d0c8a77fb5d&scope=read write&state=xyzzy

Your browser should take you to the Learn login page. If you see the dialog to
accept cookies, accept the dialog. Then repeat a. There is a bug that won't
take you past b. if you've not previously accepted the cookie disclosure
dialog.

b. Log in with the student account that will be submitting the assignment
attempt. Accept any dialog that pops up.

Your browser's address field will be redirected to a URL like the following.
You SHOULD see something about being unreachable in the browser. That's OK.

[https://localhost/?code=g84Xx0YaEz1iqS6HFRq0X9MdRTnQ48FT&state=xyzzy](https:/
/localhost%2F%3F
code%3Dg84Xx0YaEz1iqS6HFRq0X9MdRTnQ48FT%26state%3Dxyzzy)

**Our code is: g84Xx0YaEz1iqS6HFRq0X9MdRTnQ48FT This is the code we use in the next step to get an access token.**

SECOND - Use the 2nd-leg of 3LO to get an access token - POST using the code,
our application key, and secret to the oauth2/token endpoint.

Note: the redirect_uri must match the redirect_uri we used when we got the
code.

curl -k --user d128e50d-c91e-47d3-a97e-9d0c8a77fb5d:sorryyoucanthavemysecret
--data "grant_type=authorization_code" [https://bd-partner-a-ultra.blackboard.
com/learn/api/public/v1/oauth2/token?code=g84Xx0YaEz1iqS6HFRq0X9MdRTnQ48FT](ht
tps://bd-
partner-a-original-new.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Foauth2%2Ft
oken%3Fcode%3DIN5SC0fCMqm7Zn9SKqB2HEVgGWYsVPKW)\&redirect_uri=[https://localho
st](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Flocalhost%2F)

We get an access token back to use for submitting the students assignment
attempt.

{"access_token":"**4mgoFlQoi4Jq4biKpU4R264wugsKF9R1**","token_type":"bearer","
expires_in":3599,"scope":"read
write","user_id":"507ba08376e1498cba8c6cd35b003aa2"}

THIRD - Upload the file to be attached to the attempt into temporary storage.
It's temporary and needs to be used quickly

curl -X POST -H "Authorization: Bearer **4mgoFlQoi4Jq4biKpU4R264wugsKF9R1**"
[https://bd-partner-a-ultra.blackboard.com/learn/api/public/v1/uploads](https:
//bd-partner-a-
ultra.blackboard.com%2Flearn%2Fapi%2Fpublic%2Fv1%2Fuploads) -F**"**[file=@/Use
rs/mbk/Documents/2016.03.BlackboardPartnerUpdate.pdf](mailto:file=@/Users/mbk/
Documents/2016.03.BlackboardPartnerUpdate.pdf)**"**

We get back an ID that we use to attach the file to the attempt.

{"id":"**BD-
BD9C08679892561211D99DB4C817FE68-67545ce854b54d3fb062e38aefeee47c**"}

FOURTH - Submit the attempt. We're using the gradeColumnId":"**_3297_1**" that
we got when we created the assignment.

The "studentSubmision" is in bbML format. Reference: [Blackboard Markup
Language - BbML](https://community.blackboard.com/docs/DOC-3851-blackboard-
markup-language-bbml)

curl -k -X POST -H "Authorization: Bearer 4mgoFlQoi4Jq4biKpU4R264wugsKF9R1" -H
"Content-Type: application/json" --data '{"studentComments":"this is the
student commment","studentSubmission": "<!-- {\"bbMLEditorVersion\":1} --> <a
href=\"bbupload://BD-
BD9C08679892561211D99DB4C817FE68-67545ce854b54d3fb062e38aefeee47c\" data-bbfil
e=\"{&quot;render&quot;:&quot;inline&quot;,&quot;linkName&quot;:&quot;2016.03.
BlackboardPartnerUpdate.pdf&quot;,&quot;mimeType&quot;:&quot;application/pdf&q
uot;}\">2016.03.BlackboardPartnerUpdate.pdf<_/a>"}:_' [https://bd-partner-a-
ultra.blackboard.com/learn/api/](https://community.blackboard.com/external-lin
k.jspa?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%
2F)[public/v2/courses/courseId:mbk-ultra-
course/gradebook/columns/](https://community.blackboard.com/external-link.jspa
?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)**[
_3297_1](https://community.blackboard.com/external-link.jspa?url=https%3A%2F%2
Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)**[/attempts](https:/
/localhost%3A987
7%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)

We get back an attempt ID for an InProgress student submission. We use the
attempt ID in the next step to set the attempt to needs grading so that the
instructor sees the attempt. Attempts that are InProgress are not available to
the instructor in the GUI.

{"id":"**_528_1**","userId":"_649_1","status":"InProgress","studentSubmission"
:"<!-- {\"bbMLEditorVersion\":1} -->\n<a href=\"[https://bd-partner-a-ultra.bl
ackboard.com/bbcswebdav/xid-23611_1](https://community.blackboard.com/external
-link.jspa?url=https%3A%2F%2Fbd-partner-a-
ultra.blackboard.com%2Fbbcswebdav%2Fxid-23611_1)\" data-bbfile=\"{&quot;render
&quot;:&quot;inline&quot;,&quot;linkName&quot;:&quot;2016.03.BlackboardPartner
Update.pdf&quot;,&quot;mimeType&quot;:&quot;application/pdf&quot;}\">2016.03.B
lackboardPartnerUpdate.pdf</a>","exempt":false,"created":"2018-05-18T02:48:18.
329Z"}

FIFTH - Set the attempt to "NeedsGrading"

curl -k -X PATCH -H "Authorization: Bearer 4mgoFlQoi4Jq4biKpU4R264wugsKF9R1"
-H "Content-Type: application/json" --data '{"status":"NeedsGrading"_}:_'
[https://bd-partner-a-
ultra.blackboard.com/learn/api/](https://community.blackboard.com/external-lin
k.jspa?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%
2F)[public/v2/courses/courseId:mbk-ultra-
course/gradebook/columns/](https://community.blackboard.com/external-link.jspa
?url=https%3A%2F%2Flocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)[_3
297_1](https://l
ocalhost%3A9877%2Flearn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)[/attempts](https://com
munity.blackboard.com/external-link.jspa?url=https%3A%2F%2Flocalhost%3A9877%2F
learn%2Fapi%2Fpublic%2Fv1%2Fusers%2F)/**_528_1**

{"id":"**_528_1**","userId":"_649_1","status":"NeedsGrading","studentSubmissio
n":"<!-- {\"bbMLEditorVersion\":1} -->\n<a href=\"[https://bd-partner-a-ultra.
blackboard.com/bbcswebdav/xid-23611_1](https://community.blackboard.com/extern
al-link.jspa?url=https%3A%2F%2Fbd-partner-a-
ultra.blackboard.com%2Fbbcswebdav%2Fxid-23611_1)\" data-bbfile=\"{&quot;render
&quot;:&quot;inline&quot;,&quot;linkName&quot;:&quot;2016.03.BlackboardPartner
Update.pdf&quot;,&quot;mimeType&quot;:&quot;application/pdf&quot;}\">2016.03.B
lackboardPartnerUpdate.pdf</a>","exempt":false,"created":"2018-05-18T02:48:18.
329Z"}

Now, logged in as the instructor, we can see that there has been 1 submission.
And we see the student's submission with the attachment.

Conclusion

We hope that the above demonstration gives you a helpful peek under the hood
as to what is going on when you make REST calls to a Learn system. You can
take these cURL commands and use them to make all of the REST calls documented
here: [Explore APIs](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fdeveloper.blackboard.com%2Fportal%2FdisplayApi)

