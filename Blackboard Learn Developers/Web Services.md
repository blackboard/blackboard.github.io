# Web Services
*Author: Kelley MacEwen*  
*Categories: ['Tutorials']*  
*Tags: ['developer']*  
<hr />
Administrators can view installed Web Services, render them available or
unavailable for use, and manage the IP addresses that access a specific web
services.

# Find the Web Services page

On the Administrator Panel, under Building Blocks, click Web Services.

# Manage the Web Services internal secret

This secret is used by the web service framework to validate the security of
the web service session between calls. It must be between 6 and 128 characters
long. Changes are applied immediately. Any connected _Proxy Tools_ must
reconnect before continuing.

  1. Click _Manage Web Services_.
  2. In the _Internal Secret_ field, make the necessary changes.
  3. Click _Submit_.

# Manage availability

  1. Select the check boxes for the appropriate _Web Services_.
  2. Point to _Availability_ and click _Available_ or _Unavailable_.

# Manage discoverability

The _Discoverability_ setting determines whether the Web Services Description
Language (WSDL) renders upon request. It does not affect the normal operation
of the web service.

  1. Select the check boxes for the appropriate _Web Services_.
  2. Point to _Discoverability_ and click _Make Discoverable_ or _Make Not Discoverable_.

# Manage logging type

  1. Access a web services's contextual menu and click _Edit_.
  2. In the _Select Logging Type_, click _Off_, _Common_, or _Individual _
  3. Click _Submit_.

**Note:** The common logging sends information to a single file that contains log information for all the web services that use the common logging type. Individual logging sends information to a specific log file for this web service.

# Manage IP filters

IP filters are a list of individual IP addresses or IP address ranges to block
or allow. These filters are applied for all access to this web service. These
are applied before any per-proxy-tool filters are applied.

  1. Access a web service's contexual menu and click _Edit_.
  2. In the _IP Filters_ field, type individual IP addresses or a range of IP addresses. Type one address per line.

Type BLOCK a.b.c.d to block an IP address or range of addresses.

Type ALLOW a.b.c.d to allow an IP address or range of addresses.

Wildcards (*) are allowed in any position of the IP address.

IP address ranges are specified using a slash as follows: a.b.c.d/e.f.g.h

  3. Click _Submit_.

# Manage web service operations

Administrators can control the level of access for each operation associated
with a web service.

  1. Access a web service's contextual menu and click _Operations_.
  2. Select the appropriate level of access :
    * _Permit Any Authorized Access_: Select the check boxes for an operation and select this option from the _Change Access_ list. Or select this option in the contextual menu in the _Restriction _column for the appropriate operation.
    * _Permit Tool-Authorized Access_: Only web service sessions that were authenticated using the _loginTool_ method are allowed to call the method. Select the check boxes for an operation and select this option from the _Change Access_ list.
    * _Block Access_: All calls to this method will fail. Select the check boxes for an operation and select this option from the _Change Access_ list. Or select this option in the contextual menu in the _Restriction _column for the appropriate operation.

# View permissions

Access a web service's contextual menu and click _Permissions_. To learn more,
go to [http://www.blackboard.com/Support/Extensions.aspx](https://community.bl
ackboard.com/external-
link.jspa?url=http%3A//www.blackboard.com/Support/Extensions.aspx).

# Download documentation

Access a web service's contextual menu and click _Download Documentation_.
Click _OK_ to download a ZIP file containing the javadocs for this web
service.

**Note:** This documentation is in the javadoc format for the sake of convenience. The javadocs are provided to describe logical operations and arguments, not to declare an exact method of coding. Client programs can be written in any WSDL enabled language. Use the language-specific syntax to invoke the methods based on the WSDL contract.

