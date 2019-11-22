# Proxy Tool XML Description
The following is a sample XML description that would be provided to the
registerTool method. Click the links for detailed information on the
particular element.

<?xml version="1.0" encoding="ISO-8859-1"?>

<tool-profile ltiVersion="2.0-July08" xmlns:locale="[http://www.ims.org/lti/lo
calization](https://community.blackboard.com/external-
link.jspa?url=http%3A%2F%2Fwww.ims.org%2Flti%2Flocalization)">

<vendor>

<code>[Vendor](https://community.blackboard.com/docs/DOC-1488)</code>

<name>Name Not Used</name>

<description>Description not used</description>

[<url>http://www.your.url</url>](https://community.blackboard.com/docs/DOC-148
9)

<contact><email>vendor contact not
used.John.q.Admin@proxy.server.host</email></contact>

</vendor>

<tool-info>

[<code>Program</code>](https://community.blackboard.com/docs/DOC-1478)

<name>Name Not Used</name>

[<version>1</version>](https://community.blackboard.com/docs/DOC-1490)

[<description>Text
Description</description>](https://community.blackboard.com/docs/DOC-1464)

<tool-info>

<tool-instance>

[<base-urls>](https://community.blackboard.com/docs/DOC-1446)

<base-url type="http">[http://your.server.com/proxyApp](https://community.blac
kboard.com/external-
link.jspa?url=http%3A%2F%2Fyour.server.com%2FproxyApp)</base-url>

<base-url type="https">[https://your.server.com/proxyApp](https://community.bl
ackboard.com/external-
link.jspa?url=https%3A%2F%2Fyour.server.com%2FproxyApp)</base-url>

<base-url type="server-to-server">[https://your.server.com/proxyApp](https://c
ommunity.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fyour.server.com%2FproxyApp)</base-url>

</base-urls>

[<contact><email>John.q.Admin@proxy.server.host</email></contact>](https://com
munity.blackboard.com/docs/DOC-1450)

[<security-profile>](https://community.blackboard.com/docs/DOC-1482)

<digest-algorithm>SHA</digest-algorithm>

</security-profile>

</tool-instance>

<required-webservices>

[<tool-login>](https://community.blackboard.com/docs/DOC-1486)

[<service name="Context.WS">](https://community.blackboard.com/docs/DOC-1483)

[<operation>logout</operation>](https://community.blackboard.com/docs/DOC-1476
)

... More <operation/> rows as required

</service>

... More <service ... elements as required for tool-authentication

</tool-login>

[<ticket-login>](https://community.blackboard.com/docs/DOC-1485)

[<service name="Context.WS">](https://community.blackboard.com/docs/DOC-1483)

[<operation>logout</operation>](https://community.blackboard.com/docs/DOC-1476
)

</service>

... More <service ... elements as required for ticket-authentication

</ticket-login>

</required-webservices>

[<http-actions>](https://community.blackboard.com/docs/DOC-1468)

[<action type="tool-provision" path="/tcProfileRegistration"/>](https://commun
ity.blackboard.com/docs/DOC-1487)

[<action type="bundle"
path="/getBundle"/>](https://community.blackboard.com/docs/DOC-1447)

[<action type="remove"
path="/removeAction"/>](https://community.blackboard.com/docs/DOC-1479)

[<action type="config"
path="/configAction"/>](https://community.blackboard.com/docs/DOC-1449)

[<action type="state-change"
path="/stateChangeAction"/>](https://community.blackboard.com/docs/DOC-1484)

[<action type="reregister"
path="/reregisterAction"/>](https://community.blackboard.com/docs/DOC-1481)

[<action type="ping"
path="/ping"/>](https://community.blackboard.com/docs/DOC-1477)

[<action type="course-deleted"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1460)

<param name="action" fixed="course-deleted"/>

</action>

[<action type="course-copied"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1459)

<param name="action" fixed="course-copied"/>

</action>

[<action type="course-exported"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1461)

<param name="action" fixed="course-exported"/>

</action>

[<action type="course-imported"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1462)

<param name="action" fixed="course-imported"/>

</action>

[<action type="group-copied"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1465)

<param name="action" fixed="group-copied"/>

</action>

[<action type="group-exported"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1466)

<param name="action" fixed="group-exported"/>

</action>

[<action type="group-imported"
path="/courseHandler">](https://community.blackboard.com/docs/DOC-1467)

<param name="action" fixed="group-imported"/>

</action>

</http-actions>

<links>

<content-handler>

[<name locale.key="resource/x-my.content.type.name">Content Type
Name</name>](https://community.blackboard.com/docs/DOC-1455)

[<handle value="resource/x-my.content.type"/>](https://community.blackboard.co
m/docs/DOC-1457)

<http-actions>

[<action type="create"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1463)

<param name="action" fixed="create">

</action>

[<action type="modify"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1475)

<param name="action" fixed="modify">

</action>

[<action type="remove"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1480)

<param name="action" fixed="remove">

</action>

[<action type="view"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1492)

<param name="action" fixed="view">

</action>

[<action type="viewattempt"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1491)

<param name="action" fixed="viewattempt">

</action>

[<action type="content-copied"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1451)

<param name="action" fixed="content-copied">

</action>

[<action type="content-exported"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1453)

<param name="action" fixed="content-exported">

</action>

[<action type="content-imported"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1458)

<param name="action" fixed="content-imported">

</action>

[<action type="content-deleted"
path="/contentHandler">](https://community.blackboard.com/docs/DOC-1452)

<param name="action" fixed="content-deleted">

</action>

</http-actions>

[<can-copy value="true"/>](https://community.blackboard.com/docs/DOC-1448)

<icons>

<icon>unused default lti icon</icon

[<icon platform="blackboard" style="toolbar" locale:key="icon.lang.key">/image
s/icon1_on.gif</icon>](https://community.blackboard.com/docs/DOC-1456)

[<icon platform="blackboard" style="listitem" locale:key="icon.lang.key">/imag
es/icon1_on.gif</icon>](https://community.blackboard.com/docs/DOC-1454)

</icons>

</content-handler>

... More <content-handler>...</content-handler> sections

<menu-link>

<category-choice>

<category>TBD - LTI defined generic category currently unused</category>

[<category platform="blackboard">course_tool</category>](https://community.bla
ckboard.com/docs/DOC-1473)

</category-choice>

[<name locale:key="course_tool.name.key">Link
Name</name>](https://community.blackboard.com/docs/DOC-1471)

<http-actions>

[<action type="menu-view"
path="/courseTool"/>](https://community.blackboard.com/docs/DOC-1474)

</http-actions>

[<description locale:key="course_tool.link.description.key">Link
Desription</description>](https://community.blackboard.com/docs/DOC-1469)

<icons>

<icon>unused default lti icon</icon

[<icon platform="blackboard" style="listitem" locale:key="icon.lang.key">/imag
es/icon1.gif</icon>](https://community.blackboard.com/docs/DOC-1470)

</icons>

</menu-link>

... More <menu-link>...</menu-link> sections

</links>

</tool-profile>

