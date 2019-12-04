# Get Course Announcements with SOAP and Python
*Author: Scott Hurrey*
*Categories: ['Examples', 'SOAP Web Services']*
*Tags: ['web services', 'soap', 'python', 'blackboard learn', 'example', 'developer']*
---
This project will provide the Developer with sample code demonstrating how to
perform the following actions, as they pertain to Blackboard Learn 9.1 Web
Services:

  * Use the Python module SUDS to ingest Blackboard WSDLs and dynamically create code to use them.
  * Build a SOAP header with WS-Security utilizing Python and SUDS
  * Attach the SOAP header to a SOAP Envelope to prepare a Web Service call
  * Configure and make the following Web Service Calls:
    * ContextWS.initialize()
    * ContextWS.login(...)
    * ContextWS.getMyMemberships()
    * AnnouncementWS.initializeAnnouncementWS(...)
    * AnnouncementWS.getCourseAnnouncements(...)
    * ContextWS.logout()

This is not meant to be a Python tutorial. It will not teach you to write code
in Python. It will, however, give a Developer familiar with Python the
knowledge necessary to build a Web Services integration.

### Glossary

TermDefinition

Python

A powerful Web Development language

SUDS

A Python module that facilitates the use of SOAP Web Services

WSDL

Web Service Definition Language - and XML document describing the endpoints,
methods, and attributes associated with a given Web Service

### Assumptions

This help topic assumes the Developer:

  * is familiar with Python
  * has installed Python and Suds
  * has set up a Python development environment
  * has a Blackboard Learn instance with Web Services enabled and a Proxy Tool created and made available on the system.

### Why Python and SUDS?

Python is a scripting language that is very powerful. It enables a Developer
to perform complex operations in just a few lines of code. In addition, Python
is a widely-used Web Development language, and there are many Client and
Partner Developers using it today.

The SUDS Python module handles much of the complex SOAP processing for the
Developer. This module takes two lines of code with a URL argument and
dynamically creates all of the code necessary to interact with the Blackboard
Learn Web Services.

### Code Walkthrough

To build an integration with the Blackboard Web Services, regardless of the
programming language of choice, can really be summed up in four steps:

  1. Initialize the Web Services using WS-Security
  2. Login as a Proxy Tool or Blackboard user
  3. Initialize any other services you may require
  4. Perform actions against those services.

Before a Web Application can perform these actions, it is important to
understand the headers.

#### Headers

The most important piece of the Learn Web Service puzzle is the SOAP Header.
The header is attached to every Web Service call, and documents what method is
being called and authorizes that call against the WS-Security framework.

The format of the header is basically the same for every call. There is some
dynamic identifiers that change from call-to-call, and of course differences
in the method being called or the end-point address, but building this can
really be handled with re-usable code.

Specifically for this tutorial using Python with the SUDS module, this code
will be using the built-in tools to generate the XML.

The first step is to create the Soap Header XML. This is an example of what
that header might look like:

        <SOAP-ENV:Header>  
              <wsa:Action>initialize</wsa:Action>  
              <wsa:MessageID>uuid:98d134de-b7bc-11e4-af96-14109fe5b7e1</wsa:MessageID>  
              <wsa:ReplyTo>  
                  <wsa:Address>http://schemas.xmlsoap.org/ws/2004/0...role/anonymous</wsa:Address>  
              </wsa:ReplyTo>  
              <wsa:To>https://localhost:9887/webapps/ws/services/Context.WS</wsa:To>  
              <wsse:Security xmlns:wsu="http://docs.oasis-open.org/wss/2004/...tility-1.0.xsd"   
                                                                            SOAP-ENV:mustUnderstand="1">  
                   <wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/...tility-1.0.xsd"   
                                            wsu:Id="SecurityToken-98d247b5-b7bc-11e4-bb99-14109fe5b7e1">  
                      <wsse:Username>session</wsse:Username>  
                      <wsse:Password   
                  Type="http://docs.oasis-open.org/wss/2004/...0#PasswordText">nosession</wsse:Password>  
                      <wsse:Nonce>891246152278172331825375</wsse:Nonce>  
                      <wsu:Created>2015-02-18 22:22:17.361215</wsu:Created>  
                  </wsse:UsernameToken>  
                  <wsu:Timestamp wsu:Id="Timestamp-98d2457d-b7bc-11e4-a804-14109fe5b7e1"/>  
              </wsse:Security>  
          </SOAP-ENV:Header>

At first glance, it looks a bit daunting, but Python makes it pretty easy.

In this code, building the header XML is handled with two methods. The first
is called createHeaders and takes an action, an endpoint, the username, and
the password as arguments.

**NOTE**: _This is not the Blackboard User login, but rather a specific login associated with WS-Security._

The first step is to add the action tag. This corresponds to the action
argument passed to the createHeaders() method. The value of this tag should be
set equal to the method this SOAP Envelope will be passed to. In the example
above, this SOAP-ENV will be passed to the ContextWS.initialize() Web Service,
so the action is set to 'initialize'.

        wsa_action = Element('Action', ns=wsa_ns).setText(action)  

The next tag we add is the MessageId. This is a unique identifier tied to this
specific SOAP envelope. To generate this identifier, the sample code uses the
built-in Python method uuid.uuid1().

        wsa_uuid = Element('MessageID', ns=wsa_ns).setText('uuid:' + str(uuid1()))

To add the ReplyTo and Address Tags, we must first build the address and then
add it to the ReplyTo tag. This is done in a straight-forward manner.

        wsa_address = Element('Address', ns=wsa_ns).setText('http://schemas.xmlsoap.org/ws/2004/0...role/anonymous')       wsa_replyTo = Element('ReplyTo', ns=wsa_ns).insert(wsa_address)

Adding the To tag is also straight-foward.

        wsa_to = Element('To', ns=wsa_ns).setText(url_header + endpoint)

Now we must add the WS-Security bits. This is the methodology that keeps each
session secure. The following code adds the wsse:Security tag at the same
level as the above elements.

        security = Element('Security', ns=wsse)  
        security.set('SOAP-ENV:mustUnderstand', '1')

The contents of the Security headers is what allows a Web Service call to be
authorized to take an action against the Learn API. It is imperative that this
section is formatted correctly and includes the appropriate information.

**NOTE**: _The rest of the Security headers must be included in a specific order. The Element.insert() method always inserts at the top of the list, so while the code creates the tags in the order it needs to be included, it actually inserts them in reverse order._

The first time the Web Services are called, the webapp must call
ContextWS.initialize() and the WS-Security header must include the username
'session' and the password 'nosession'. The result of this call will be a
session ID. From that point forward, the WS-Security header will contain
username 'session' and the password must be set to the session ID returned in
the initialize call. This must be included in all Web Service calls.

In addition, the webapp must include a timestamp tag. In this sample, the
Timestamp is left empty, but typically, it would include a created tag
containing the date and time the web service call is initiated, as well as an
expires tag, that contains the date and time the session should expire. If
included, this time must be within 5 minutes of the time set on the Learn
server, or the API call will fail. All times should be in UTC format.

SUDS does include a WS-Security module, but it is not flexible enough to allow
this script to format things as needed, so the security headers are built
dynamically

        usernametoken = Element('UsernameToken', ns=wsse)  
        usernametoken.set('xmlns:wsu', 'http://docs.oasis-open.org/wss/2004/...tility-1.0.xsd')  
        usernametoken.set('wsu:Id', 'SecurityToken-' + str(uuid1()))  
          
        uname = Element('Username', ns=wsse).setText(username)  
        passwd = Element('Password', ns=wsse).setText(password)  
        passwd.set('Type', 'http://docs.oasis-open.org/wss/2004/...0#PasswordText')  
        nonce = Element('Nonce', ns=wsse).setText(str(generate_nonce(24)))  
        created = Element('Created', ns=wsu).setText(str(datetime.utcnow()))  
        usernametoken.insert(created  
        usernametoken.insert(nonce)  
        usernametoken.insert(passwd)  
        usernametoken.insert(uname)  
        security.insert(usernametoken)  
        timestamp = Element('Timestamp', ns=wsu)  
        timestamp.set('wsu:Id','Timestamp-' + str(uuid1()))  
        security.insert(timestamp)

The SOAP headers have now been created dynamically in just a few lines of re-
usable code. The only thing left to do is to add the headers to our Web
Service Client, by calling the SoapClient's set_options() method. The headers
are passed as the soapheaders option, and the default port is set to one of
the available ports identified in the Web Service WSDL file provided by
Blackboard. There are four ports, mapped to the version of SOAP and the
protocol being used. This sample code assumes SOAP 1.2 and SSL.

#### Initialize the Web Services Using WS-Security

Thanks to the inclusion of SUDS and the introduction of re-usable code to
handle the header generation, a web application really only needs four lines
of code to make a service call.

        # returns [wsa_action, wsa_uuid, wsa_replyTo, wsa_to, security]  
        headers = createHeaders('initialize', 'session', 'nosession', 'Context.WS')  
        contextWS.set_options(soapheaders=headers, port='Context.WSSOAP12port_https')

The last thing to do is to call the method. The SUDS Python module does all
the work for the application automatically. All the this Python script has to
do is call the service method.

        sessionId = contextWS.service.initialize()

In just a handful lines of code, the application has authenticated against the
Blackboard Learn Web Services and created a secure session.

From this point forward, the code will just use this same code pattern to call
additional services and send and receive messages.

#### Login as a Proxy Tool or Blackboard User

The ContextWS.initialize() method returns the sessionID, as demonstrated in
the previous section. The next step in the process is to login as either a
Blackboard user or a Proxy Tool. In this sample code, the application logs in
as the Administrator user on the Developer Virtual Machine.

        headers = createHeaders('login', 'session', sessionId, 'Context.WS')  
        contextWS.set_options(soapheaders=headers, port='Context.WSSOAP12port_https')  
        loggedIn = contextWS.service.login("administrator", "password", "bb", "blackboard", "", 3600)

One important thing to note is the in the createHeaders() call is two-fold:
the action is set to 'login' to denote the new method call being made, and the
password is no longer 'nosession'. It is now set to sessionId, the return
value from the initialize call.

If logging in as user, it is important to note that the Blackboard Learn Web
Services only support RDBMS authentication. If the Learn system is configured
to authenticate against an external services, such as Active Directory, LDAP,
or CAS, the application should login as a Proxy Tool

#### Initialize Any Other Services Required

In this case, the application is pulling Course Announcements. As such, the
AnnouncementWS service must be initialized.

        headers = createHeaders('initializeAnnouncementWS', 'session', sessionId, 'Announcement.WS')  
        announcementWS.set_options(soapheaders=headers, port='Announcement.WSSOAP12port_https')  
        annInit = announcementWS.service.initializeAnnouncementWS(False)

This application has now initialized the ContextWS and the AnnouncementWS
SoapClients. These two Web Service end points can now be called successfully.

#### Perform Actions Against Those Services

For the purposes of this tutorial, the application must retrieve a list of
courses for the logged in user, and then pull course announcements for each
course. As has been the case throughout this tutorial, Python and SUDS combine
to make this very simple.

First, the application needs the Course Memberships.

        headers = createHeaders('getMyMemberships', 'session', sessionId, 'Context.WS')  
        contextWS.set_options(soapheaders=headers, port='Context.WSSOAP12port_https')  
        myMemberships = contextWS.service.getMyMemberships()

The getMyMemberships() method returns a list containing Course and
Organization IDs, in the form of the pk1. This is the value needed going
forward, so the next step is to retrieve each pk1 and retrieve the
announcements for that course.

        headers = createHeaders('getCourseAnnouncements', 'session', sessionId, 'Announcement.WS')  
        announcementWS.set_options(soapheaders=headers, port='Announcement.WSSOAP12port_https')  
        for membership in myMemberships:  
             externalId = membership.externalId  
             annFilter = announcementWS.factory.create('ns4:AnnouncementAttributeFilter')  
             annFilter.filterType = '2'  
             annFilter.startDate = '0'  
             annFilter.userId = ""  
             announcements = announcementWS.service.getCourseAnnouncements(str(externalId),annFilter)

The annFilter variable above looks a little different. The
getCourseAnnouncements() method requires a Complex data type. The SUDS module
provides a utility for creating that type called <SoapClient>.factory, as
listed in the sample code. Once it has been created, using it is as simple as
<datatype>.<property = <value>.

The application has now looped through the course list and pulled back all
announcements. These could be displayed in a new portal, added to a queue to
be sent to an archive, or anything else one might require.

The last step is to logout to invalidate the sessionId currently in use and
prevent Cross-Site Scripting or Session hijacking. This will look familiar.

        headers = createHeaders( 'logout' , 'session' , sessionId)  
        contextWS.set_options(soapheaders=headers, port= 'Context.WSSOAP12port_https' )  
        loggedOut = contextWS.service.logout()

###

### Conclusion

All of the code snippets included in this document are included in a sample
Python module available on [GitHub](https://community.blackboard.com/external-
link.jspa?url=https%3A//github.com/blackboard/BBDN-Web-Service-Python-
Sample-Code). There is a README.md included that talks more specifically about
building and running the code. Feel free to review the code and run it against
a test or development Learn instance to see how it works.

