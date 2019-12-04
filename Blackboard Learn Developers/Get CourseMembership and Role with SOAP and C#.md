# Get CourseMembership and Role with SOAP and C#
*Author: Scott Hurrey*
*Categories: ['Examples', 'SOAP Web Services']*
*Tags: ['web services', 'soap', 'c#', 'blackboard learn', 'example', '.net', 'csharp', 'developer']*
---
This project will provide the Developer with sample code demonstrating how to
perform the following actions, as they pertain to Blackboard Learn 9.1 Web
Services:

  * Use the .NET Sample Library code included in Blackboard Learn 9.1 to write a custom integration with C#.
  * Configure and make the following Web Service Calls:
    * ContextWS.initialize()
    * ContextWS.registerTool(...)
    * ContextWS.loginTool(...)
    * ContextWS.login(...)
    * ContextWS.getMyMemberships()
    * ContextWS.logout()
    * CourseWS.initializeCourseWS(...)
    * CourseWS.loadCourses(...)
    * CourseMembershipWS.initializeCourseMembershipWS(...)
    * CourseMembershipWS.loadCourseMembership(...)
    * UserWS.initializeUserWS(...)
    * UserWS.getUser(...)

This is not meant to be a C# tutorial. It will not teach you to write code in
.NET. It will, however, give a Developer familiar with C# the knowledge
necessary to build a Web Services integration.

### Assumptions

This help topic assumes the Developer:

  * is familiar with C#
  * has installed built the .NET Sample Library and has access to BbWsClient.dll
  * has set up a Visual Studio development environment
  * has a Blackboard Learn instance with Web Services enabled.

### Code Walkthrough

To build an integration with the Blackboard Web Services, regardless of the
programming language of choice, can really be summed up in four steps:

  1. Initialize the Web Services using WS-Security
  2. Login as a Proxy Tool or Blackboard user
  3. Initialize any other services you may require
  4. Perform actions against those services.

#### Initialize the Web Services using WS-Security

The most complicated part of the entire process is the authentication process.
Essentially, the Web Service client must call ContextWS.initialize() and in
the headers of that call, create a WS-Security (wsse) envelope. In the wsse
envelope, the username must be set to session and the password must be set to
nosession. This will return a session id, that is then added into all
subsequent calls until the session ends.

The .NET sample library handles all of this for you in two lines of code:

    // Initialize and configure web service wrapper   
    ws = new WebserviceWrapper(host, vendor, program, EXPECTED_LIFE);    
    // Context.WS initialize to establish session and get session Id   
    ws.initialize_v1();

At this point, the Web Service client will need a proxy tool in Blackboard
Learn and it must be set as available by the Blackboard Learn System
Administrator. The System Administrator can register a Proxy Tool through the
User Interface, or the application developer can register the Proxy Tool via
the ContextWS.registerTool() method as seen below:

    RegisterToolResultVO result = ws.registerTool("Blackboard Developer Experience C-Sharp Sample Tool",   
                                              regpass, secret, tools, tickets);

See the registerTool() method in Program.cs for more details.

#### Login as a Proxy Tool or Blackboard User

Logging in either as a Blackboard User or a registered proxy tool is equally
simple, with the sample library performing all the heavy lifting on your
behalf.

    if(logintype.Equals("tool")) {  
         // Login as proxy Tool  
         loggedIn = ws.loginTool(secret);  
    } else {  
         // Login as user  
         loggedIn = ws.loginUser(username,userpass);   
    }

One important thing to note is behind the scenes, the wsse password is no
longer 'nosession'. It is now set to sessionId, the return value from the
initialize call.

**NOTE**: _If logging in as user, it is important to note that the Blackboard Learn Web Services only support RDBMS authentication. If the Learn system is configured to authenticate against an external services, such as Active Directory, LDAP, or CAS, the application should login as a Proxy Tool_

#### Initialize Any Other Services Required

In this sample code, all Web Services are initialized at once in a method
called initWrappers(). Initializing the wrapper objects in the .NET sample
library calls the web services' initialize SOAP methods.

    static void initWrappers() {  
         // Initialize the wrappers used for this sample.  
         ctx = ws.getContextWrapper();  
         crs = ws.getCourseWrapper();  
         crm = ws.getCourseMembershipWrapper();  
         usr = ws.getUserWrapper();  
    }

This application has now initialized the ContextWS, CourseWS,
CourseMembershipWS, and UserWS Web Services. These two Web Service end points
can now be called successfully.

#### Perform Actions Against Those Services

For the purposes of this tutorial, the application must retrieve a list of
courses for the specified user, and then pull the user object for that
specified user, and then use that data to load each course and course
membership. .

First, the application needs the Course Memberships.

    CourseIdVO [] courses = ctx.getMemberships(courseuser);

The getMyMemberships() method returns a list containing Course and
Organization IDs, in the form of the pk1. In addition to the course pk1 value,
the code also needs to retrieve the user object so the user pk1 is also
available.

    // Initialize a user filter, set to get user by username and availability.  
    UserFilter uf = new UserFilter();  
    uf.filterType = 6;                            // Load user by user name  
    uf.filterTypeSpecified = true;  
    uf.name = new string[] { courseuser };  
    // Get the user object   
    UserVO [] user = usr.getUser(uf);

Once the course and user pk1 values have been created, the code can loop
through the courses array and load the course object based on course pk1.

    CourseFilter cf = new CourseFilter();  
    cf.filterType = 3;                            // Load courses by course pk1   
    cf.filterTypeSpecified = true;   
    cf.ids = new string[] { courseId };    
    CourseVO[] course = crs.loadCourses(cf);

With the course object returned, the application now requests the course
membership object based on the course pk1 and user pk1.

    MembershipFilter mf = new MembershipFilter();    
    mf.filterType = 6;                                    // Load by course pk1 and user pk1   
    mf.filterTypeSpecified = true;   
    mf.userIds = new string[] { user[0].id };   
    mf.courseIds = new string[] { courseId };    
    CourseMembershipVO[] memberships = crm.loadCourseMembership(courseId, mf);

### Conclusion

All of the code snippets included in this document at included in a sample C#
application available on[GitHub](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fgithub.com%2Fblackboard%2FBBDN-CSharp-WS-Sample).
There is a README.md included that talks more specifically about building and
running the code. Feel free to review the code and run it against a test or
development Learn instance to see how it works.

