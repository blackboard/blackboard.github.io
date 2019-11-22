# Running code from the command line
# Overview

This example allows you to run code which makes calls to the Blackboard APIs
from the command line.

This is the sort of thing you would need to do if you were writing your own
command line snapshot utility. Writing a new snapshot utility is an involved
and very localised task, so here a much more modest example that anyone should
be able to build on - loading details of the specified user. The end result
looks like this:

[![cmdline.png](https://community.blackboard.com/servlet/JiveServlet/downloadI
mage/102-1398-1-61081/cmdline.png)](https://community.blackboard.com/servlet/J
iveServlet/showImage/102-1398-1-61081/cmdline.png)

The impressive thing here is near the bottom of the screenshot - that by
running a command on my laptop, I've discovered that a user dfred on the
server isidore.dur.ac.uk is called Fred Bloggs. I've established this by
calling a UserDbLoader object . The trick is that this code could be running
anywhere*, rather than with a normal building block where it is executed in
Tomcat on one of your servers running Blackboard.

* Depending on how locked down your system is of course

The code uses the humble **UserDbLoader** class, and the method
**loadByUserName()**. Before we can use these though, we need to initialise a
whole swarm of Blackboard services to correctly initialise a Blackboard
context object - this includes parsing your licence file. When I began looking
at this I wasn't sure whether or not I'd be able to manage this. George Kroner
pointed me towards a key file [env.sh] and also the somewhat overwhelming
**service-config-snapshot-jdbc.properties file**. I had a look, but ended up
[posting](https://community.blackboard.com/external-link.jspa?url=http%3A%2F%2
Fforums.edugarage.com%2Fthread.jspa%3FthreadID%3D164%26tstart%3D0) a question
about this in the edugarage forums. Peter Fokkinga, from the University of
Groningen in the Netherlands came to my aid and posted details of a [custom
BlackboardContext class](https://community.blackboard.com/external-link.jspa?u
rl=http%3A%2F%2Fwww.edugarage.com%2Fdownload%2Fattachments%2F23855389%2FBlackb
oardContext.java%3Fversion%3D2%26modificationDate%3D1273652295650) (new:
[version for 9.x](https://community.blackboard.com/external-link.jspa?url=http
%3A%2F%2Fwww.edugarage.com%2Fdownload%2Fattachments%2F23855389%2FBlackboardCon
text9.java%3Fversion%3D1%26modificationDate%3D1276594754277)) he'd written to
help. Have a look at his code before attempting to run this - note that the
code is currently written expecting an ORACLE database connection - Windows
users be warned! Following Peter's instructions and using the files from
George, I managed to write some code that ran from the command line. Here's
what I did.

# Java Code

The code is simple.

I created a new NetBeans project (Java Application) called **LoadUser**.

[![project.png](https://community.blackboard.com/servlet/JiveServlet/downloadI
mage/102-1398-1-61082/project.png)](https://community.blackboard.com/servlet/J
iveServlet/showImage/102-1398-1-61082/project.png)

This has two Java classes:

  1. **Main.java** this runs when the class is called from the command line and processes any command line arguments (in this case the username and Blackboard server we want to use). It then calls a second class:

  2. **WorkHorse.java** which performs the required task - loading details about the user on the specified server.

The listings for each class are given below:

# Main.java

1 package loaduser;

2

3 /**

4 * This class is called at runtime, processes the command line arguments

5 * then creates a new WorkHorse object to load the details about the user

6 * @author Dr Malcolm Murray, Durham University

7 */

8 public class Main {

9

10 /**

11 * Demonstration command line utility that uses the Blackboard APIs

12 * Should be invoked by typing java -jar "LoadUser.jar" [username] [server]

13 * @param args 2 Strings indicating the username and server from which we
want to load their details

14 */

15 public static void main(String[] args) {

16 System.out.println("-------------------------------------------------------
-----");

17 System.out.println("Loader process starting...");

18 WorkHorse dobbin = new WorkHorse();

19 dobbin.processArguments(args);

20 if(dobbin.isExceptionCaught()){

21 // halt and warn the user

22 System.out.println(dobbin.getErrorMessage());

23 System.out.println("System halting.");

24 System.out.println("-------------------------------------------------------
-----");

25 return;

26 }

27

28 // now try and do something useful

29 System.out.println(dobbin.getUserDetails());

30

31 if(!dobbin.isExceptionCaught()){

32 System.out.println("Loader process completed successfully - system
halting.");

33 System.out.println("-------------------------------------------------------
-----");

34 }

35 }

36

37 }

Main is a very simple class which basically just creates a new WorkHorse
object hands any supplied arguments over to it, then reports back the
findings. It doesn't need any special JARS.

# WorkHorse.java

1 package loaduser;

2

3 import blackboard.data.user.User;

4 import blackboard.persist.user.UserDbLoader;

5 import org.apache.log4j.Logger;

6 import org.apache.log4j.BasicConfigurator;

7 import nl.rug.lib.blackboard.BlackboardContext;

8

9 /**

10 * This class actually does the work of initialising the

11 * BlackboardContext and then trying to load details of

12 * the specified user. It makes use of Peter Fokkinga's

13 * custom BlackboardContext class

14 * @author Dr Malcolm Murray, Durham University

15 */

16 public class WorkHorse {

17 private String userName; /** Name of the user to load details for - note
this should exist on the specified server */

18 private String targetService; /** Name of the blackboard server e.g.
bboard.dur.ac.uk */

19 private boolean exceptionCaught;

20 private StringBuffer errorLog;

21

22 // set up the logging

23 // Define a static logger variable so that it references the

24 // Logger instance named "loaduser".

25 static Logger logger = Logger.getLogger(WorkHorse.class);

26

27 /**

28 * Create a new instance of WorkHorse

29 * initialising the logger

30 * needed later by the custom BlackboardContext class

31 */

32 public WorkHorse() {

33 setExceptionCaught(false);

34 setErrorLog(new StringBuffer(""));

35 // Set up a simple configuration that logs on the console.

36 BasicConfigurator.configure();

37 logger.info("WorkHorse object initiated...");

38 }

39

40 /**

41 * Convenience method for processing

42 * the command line arguments supplied by the user

43 * @param args Array of zero or more Strings - hopefully just one

44 */

45 public void processArguments(String[] args) {

46 if(args == null){

47 // called without parameters

48 setExceptionCaught(true);

49 errorLog.append("Sorry you did not supply valid command line
arguments").append(System.getProperty("line.separator"));

50 errorLog.append("Please indicate the user you wish to load details for and
the name of the service, such
as:").append(System.getProperty("line.separator"));

51 errorLog.append("LoadUser bill
bboard1.dur.ac.uk").append(System.getProperty("line.separator"));

52 errorLog.append("or...").append(System.getProperty("line.separator"));

53 errorLog.append("LoadUser ben
bboard2.dur.ac.uk").append(System.getProperty("line.separator"));

54 return;

55 }

56 try {

57 String uName = trapNulls(args[0]);

58 setUserName(uName);

59 String tService = trapNulls(args[1]);

60 setTargetService(tService);

61 } catch (java.lang.IndexOutOfBoundsException iE) {

62 // no argument supplied

63 setExceptionCaught(true);

64 errorLog.append("Sorry you did not supply valid command line
arguments").append(System.getProperty("line.separator"));

65 errorLog.append("Please indicate the user you wish to load details for and
the name of the service, such
as:").append(System.getProperty("line.separator"));

66 errorLog.append("LoadUser bill
bboard1.dur.ac.uk").append(System.getProperty("line.separator"));

67 errorLog.append("or...").append(System.getProperty("line.separator"));

68 errorLog.append("LoadUser ben
bboard2.dur.ac.uk").append(System.getProperty("line.separator"));

69 return;

70 }

71 }

72

73 /**

74 * Test method to try and use a UserDbLoader at the command line

75 * @return String (for testing, indicating how we got on)

76 */

77 public String getUserDetails(){

78 StringBuffer sBuffer = new StringBuffer("");

79 sBuffer.append("-----------------------------------------------------------
-").append(System.getProperty("line.separator"));

80 sBuffer.append("Attempting to load details of the user '");

81 sBuffer.append(getUserName());

82 sBuffer.append("'");

83 sBuffer.append(System.getProperty("line.separator"));

84

85 // ok let's get the Bb stuff - if you are running this on your Bb box you
could use this:

86 // String configFileLocation = "/local/bboard/blackboard/config/service-
config-snapshot-jdbc.properties";

87 // But from the command line we need to point at a special subfolder:

88 String configFileLocation = "../Stuff/service-config-snapshot-
jdbc.properties";

89

90 try {

91 BlackboardContext.init(configFileLocation, getTargetService());

92 // ------------------------------------------------------------------

93 // now back to the UserLoader

94 UserDbLoader uLoader = null;

95 try {

96 uLoader = UserDbLoader.Default.getInstance();

97 User user = uLoader.loadByUserName(getUserName());

98 sBuffer.append("SUCCESS - loaded the user '").append(getUserName()).append(
"'").append(System.getProperty("line.separator"));

99 sBuffer.append("They are ").append(user.getGivenName()).append("
").append(user.getFamilyName()).append(System.getProperty("line.separator"));

100

101 } catch(blackboard.persist.KeyNotFoundException kE){

102 setExceptionCaught(true);

103 sBuffer.append("ERROR: No match for the user
").append(getUserName()).append(System.getProperty("line.separator"));

104
sBuffer.append(kE.toString()).append(System.getProperty("line.separator"));

105 // temporary ugly exposure of full error:

106 kE.printStackTrace();

107 sBuffer.append("Method halting after error
:-)").append(System.getProperty("line.separator"));

108 sBuffer.append("----------------------------------------------------------
--");

109 return sBuffer.toString();

110 } catch(blackboard.persist.PersistenceException pE){

111 setExceptionCaught(true);

112 sBuffer.append("ERROR: Failed to get a user loader
:-(").append(System.getProperty("line.separator"));

113
sBuffer.append(pE.toString()).append(System.getProperty("line.separator"));

114 // temporary ugly exposure of full error:

115 pE.printStackTrace();

116 sBuffer.append("Method halting after error
:-)").append(System.getProperty("line.separator"));

117 sBuffer.append("----------------------------------------------------------
--");

118 return sBuffer.toString();

119 } catch (java.lang.NullPointerException nE){

120 setExceptionCaught(true);

121 sBuffer.append("ERROR: Failed to get a user loader
:-(").append(System.getProperty("line.separator"));

122 // temporary ugly exposure of full error:

123 nE.printStackTrace();

124 sBuffer.append("Method halting after error
:-)").append(System.getProperty("line.separator"));

125 sBuffer.append("----------------------------------------------------------
--");

126 return sBuffer.toString();

127 }

128 // ---------------------------------------

129

130 } catch (blackboard.base.InitializationException iE){

131 System.out.println("Sorry there was an error initiating the
BlackboardContext object");

132 iE.printStackTrace();

133 } finally {

134 BlackboardContext.shutdown();

135 logger.info("WorkHorse object finished - out to pasture");

136 }

137

138 sBuffer.append("Method halting normally
:-)").append(System.getProperty("line.separator"));

139 sBuffer.append("----------------------------------------------------------
--");

140

141 return sBuffer.toString();

142 }

143

144

145 /**

146 * Convenience method for ensuring no errors

147 * arise from getting nulls when you expected a String

148 * @param string the String to test (can be null)

149 * @return a String of zero or more characters in length

150 */

151 private String trapNulls(String string) {

152 if (string == null) {

153 return "";

154 } else {

155 return string.trim();

156 }

157 }

158

159 /**

160 * Indicates whether an exception was thrown and

161 * caught during method calls in this class.

162 * Default is false.

163 * @return true if an exception was caught.

164 */

165 public boolean isExceptionCaught() {

166 return exceptionCaught;

167 }

168

169 /**

170 * Private setter used within this class

171 * @param exceptionCaught Set to true if one has

172 */

173 private void setExceptionCaught(boolean exceptionCaught) {

174 this.exceptionCaught = exceptionCaught;

175 }

176

177 /**

178 * Internal method for getting the ErrorLog.

179 * Outside the class use @see getErrorMessage

180 * to display the details to a user.

181 * @return StringBuffer containing details of any exceptions

182 */

183 private StringBuffer getErrorLog() {

184 return errorLog;

185 }

186

187 /**

188 * Provides details of the error to display to the user

189 * @return HTML paragraph object

190 */

191 public String getErrorMessage() {

192 if(getErrorLog().length() == 0){

193 return "";

194 } else {

195 return "<p>" + getErrorLog().toString() + "</p>";

196 }

197 }

198

199 /**

200 * Private setter (normally only called

201 * when the class is initiated).

202 * @param errorLog

203 */

204 private void setErrorLog(StringBuffer errorLog) {

205 this.errorLog = errorLog;

206 }

207

208 /**

209 * Returns the username of the User

210 * we want to load details about

211 * @return String representation of the username

212 */

213 private String getUserName() {

214 return userName;

215 }

216

217 /**

218 * Set the username of the User

219 * we want to load details about

220 * @param userName String representation of the username

221 */

222 private void setUserName(String userName) {

223 this.userName = userName;

224 }

225

226 /**

227 * Returns the Blackboard server to query

228 * @return full name of server e.g. bboard1.dur.ac.uk

229 */

230 private String getTargetService() {

231 return targetService;

232 }

233

234 /**

235 * Sets the Blackboard server to query

236 * Note you might want to add more validation to

237 * this method before inflicting it on a

238 * production server

239 * @param targetService - full name of server e.g. bboard1.dur.ac.uk

240 */

241 private void setTargetService(String targetService) {

242 this.targetService = targetService;

243 }

244

245 }

WorkHorse requires the following JARS:

  * **bb-platform.jar** provides access to the User and UserDbLoader objects and any of the Persistence exceptions thrown
  * **log4j-1.2.15.jar** (or later) This is used to provide the logging required by Peter's BlackboardContext class. You can download it from [http://logging.apache.org/log4j/](https://community.blackboard.com/external-link.jspa?url=http%3A%2F%2Flogging.apache.org%2Flog4j%2F)
  * **BlackboardContext.jar** - Peter's custom class posted by him to the forum, which I turned into a JAR. It is very well commented and creates nice JavaDocs

# Other required files

In order for this to work, the class WorkHorse has to be able to find all the
Blackboard JARs needed (stored in the lib folder) plus all the licence files,
etc. which it expects to find in a folder called config.

## Determining which JAR files you need

The JARS are required by the process of initialising a Blackboard Context
object. To give you an idea of what this might involve, this process includes
a license check to see if you can still run Blackboard (and which bits...).
The license is stored as an xml file, so it needs to be able to access the XML
parsing library xerces.jar. There are loads of other dependencies like this.
Happily the file env.sh (env.bat on a Windows install) provides a definitive
list of the JARS needed and gives you pointers to their location. It can be
found here on a linux install:
/local/bboard/blackboard/apps/snapshot/config/env.sh

For example my copy of env.sh contains lines like these when it's setting the
classpath:

CP=$BBLIB/activation.jar

CP = $CP:$BBLIB/axis.jar

... [bits missed out]

...

CP=$CP:$TOMCATLIB/bin/commons-logging-api.jar

Thus we need to add any of the JAR files listed (such as activation.jar,
axis.jar and commons-logging-api.jar) to the lib folder. The text at the start
of the file (not shown in my snippet) gives a clue where to find these files
on your Blackboard server. The variables $BBLIB and $TOMCATLIB are defined
earlier in env.sh (in my case they pointed to
/local/bboard/blackboard/systemlib and /local/bboard/blackboard/apps/tomcat
respectively, thus activation.jar should be found at
local/bboard/blackboard/systemlib/activation.jar, but check your env file for
details). Download copies of these JARS to a sensible location accessible to
your IDE.

The exact method for linking these JAR files to your project depends on how
you write your java code. In NetBeans I created a new Library called
**multipleJARSforBbContext** and added all the JARS I downloaded to it. I then
added the Library **multipleJARSforBbContext** to the NetBeans project and the
33 JARS were all added for me. Thus when I build this project it automatically
creates a lib folder, containing these JARs.

## Locating the config files

The **config** folder is used to provide the information about you needed to
initialise your BlackboardContext object.

NOTE:

It needs to be copied into in the **dist** folder of your project _**AFTER**_
you have compiled it, so that **config** is a subfolder of the directory
containing the JAR file **LoadUser.jar**. This gives a file structure like
this:

[![folder.png](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-1398-1-61083/folder.png)](https://community.blackboard.com/servlet/Jiv
eServlet/showImage/102-1398-1-61083/folder.png)

Basically you need to copy ALL the files from the **config** folder on your
server into a subfolder of the dist folder called **config**. As this is
rewritten everytime you compile your source code, it makes sense to keep a
copy elsewhere too, to save you scp-ing the files across each time you
recompile.

It can be found here on a linux install: **/local/bboard/blackboard/config**

After that you should be in business!

# Running the file

To test your code. having written it and copied the config folder into your
dist folder open a command prompt and navigate to the dist folder of your Java
code.

Invoke it using the command:

**java -jar "LoadUser.jar" _user service_**

Specifying the username and Blackboard server you want to use (note it will
need to be one that is specified in your license file)

_e.g. in my case:**java -jar "LoadUser.jar" dfred isidore.dur.ac.uk**_

Hopefully you'll be rewarded with a result like this:

[![cmdline.png](https://community.blackboard.com/servlet/JiveServlet/downloadI
mage/102-1398-1-61081/cmdline.png)](https://community.blackboard.com/servlet/J
iveServlet/showImage/102-1398-1-61081/cmdline.png)

- Malcolm

