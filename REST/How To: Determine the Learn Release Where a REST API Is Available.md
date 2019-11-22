# How To: Determine the Learn Release Where a REST API Is Available
The question keeps coming up. This document explains how you can determine the
release of Learn where a REST API is available. The key is to take the release
name, like Q4 2017, and convert it to a build number, like 3300.0. Here's an
example Q & A:

We need to verify that the APIs referenced below is supported in Bb Learn 9.1,
at the least Q2 2017, Q4 2017. If not what version of Bb is supported by these
APIs. Any help you can provide would be greatly appreciated.

API End-point - GET : [/learn/api/public/v1/courses/{courseId}/contents](https
://community.blackboard.com/external-link.jspa?url=https%3A%2F%2Fna01.safelink
s.protection.outlook.com%2F%3Furl%3Dhttps%253A%252F%252Furldefense.proofpoint.
com%252Fv2%252Furl%253Fu%253Dhttps-3A__developer.blackboard.com_assets_lib_swa
gger-2Dui_swagger-2Dindex.html-3Furl-3D_portal_docs_apis_learn-2Dswagger.json-
23-2521_content_get-5Flearn-5Fapi-5Fpublic-5Fv1-5Fcourses-5FcourseId-5Fcontent
s%2526d%253DDwMFaQ%2526c%253D0YLnzTkWOdJlub_y7qAx8Q%2526r%253Dvk-
YV1CquFfN1xUe_3xO2w6t1-ATYxzeDuT44BUpiT8%2526m%253De_-Qh8vnEE22RkULs_any6WTHSs
RxVpk9hoi_GPighk%2526s%253DccNXb4pRih0iuUs9AgovYNyNztSIRVIoYyn64Ij0qok%2526e%2
53D%26data%3D02%257C01%257CMark.Kauffman%2540blackboard.com%257C74b81a27cac546
83f80108d588fd4f54%257Cbf0b29a25e5c4aaaba4dac988df15ea6%257C0%257C0%257C636565
543899875381%26sdata%3DqC%252BiC%252BTiONIqE6%252F%252BEuzJ2EW2QYygdZ61tMqCM81
hnFs%253D%26reserved%3D0)

API End-point - POST :
/learn/api/public/v1/courses/{courseId}/contents/{contentId}/children

API end-point - POST : /learn/api/public/v1/lti/domains

Video solution:

[Dropbox - DetermineLearnReleaseRESTapiIsIn.mp4](https://community.blackboard.
com/external-link.jspa?url=https%3A%2F%2Fwww.dropbox.com%2Fs%2Fjlrbotrrt2yxhyf
%2FDetermineLearnReleaseRESTapiIsIn.mp4%3Fdl%3D0)

Referenced links:

[Learn Release Names, Build Numbers, Versions - The Rosetta Stone/Secret
Decoder Ring](https://community.blackboard.com/community/developers/learn/blog
/2017/09/06/learn-release-names-build-numbers-versions-the-rosetta-
stonesecret-decoder-ring)

[How To: Determine Whether a REST API Is Available in Learn Release Qn YYYY](h
ttps://community.blackboard.com/community/developers/learn/blog/2018/01/04/how
-to-determine-whether-a-rest-api-is-available-in-learn-release-qn-yyyy)

