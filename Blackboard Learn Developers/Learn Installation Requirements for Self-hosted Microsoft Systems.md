# Learn Installation Requirements for Self-hosted Microsoft Systems
*Author: Mark Bykerk Kauffman*  
*Categories: ['Getting Started']*  
*Tags: ['ms-sql-servrer-2012', 'sql-server', 'installation', 'microsoft', 'requirements', 'supported', 'developer']*  
<hr />
This page documents several requirements for those who are installing Learn on
the Microsoft platform. The individual doing the install MUST read, complete
any required action, and check off each item on this page. The only issues
we've seen with these installations are because the person doing the install
missed one or more of these items. You can not skip any of it.

(**If you are having issues updating your Blackboard Learn License on an
existing Windows installation read this **[License Update For Windows Servers)
](https://community.blackboard.com/community/developers/learn/blog/2018/06/08/
license-update-for-windows-servers)

ATTENTION -

  * Only SQL Server 2014 is supported with Learn releases Q2 2107 and after. Microsoft is ended support for SQL Server 2012 in Q2 2017.
  * Windows Server 2012 R2 is not supported in Learn Q2 2018 and later. Q2 2018 is compatible with Windows Server 2016
  * Always refer to the supported technologies page at help.blackboard.com for the Learn version your are installing or upgrading.

  1. As of this writing, **Q2 2017** Learn only installs and runs on MS SQL Server 2014 Standard or Enterprise editions. **Q4 2016 and prior** only install on MS SQL Server 2012 Standard or Enterprise editions. We know **Learn does not work on MS SQL Web Edition or Express**. Your milage may vary on other editions. See the self-hosted requirements listed here for all current releases: [https://help.blackboard.com/Learn/Administrator/Hosting/Release_Notes/Release_Notes_All_91_Releases](https://help.blackboard.com/Learn/Administrator/Hosting/Release_Notes/Release_Notes_All_91_Releases)
  2. **JAVA_HOME should not contain any spaces.** Install Java into a directory such that the path to the directory is space free. C:\Program Files will FAIL.
  3. Turn off virus protection during the install.
  4. Turn off firewalls during an install/upgrade.
  5. Turn off User Access control, or set it to a minimum. (run MSCONFIG > Tools tab > select the UAC line > launch > set the slider to a minimum) 
  6. The command line prompt used to run the installer script and other Learn scripts should be elevated. "Run as Administrator"
  7. Use the sa account, and its password, for the Database Administrator (DBA) account.

# MS SQL Server SA user password is configured with the Q2 2016 or later
installer.properties line below.

bbconfig.database.server.systemuserpassword=LessThan12 # THIS MEANS IT MUST BE
LESS THAN 12 CHARACTERS!

8. The account running the installation needs ALTER ANY SQL permission on the
DB. See [https://msdn.microsoft.com/en-us/library/ms191291(v=sql.120).aspx](ht
tps://community.blackboard.com/external-
link.jspa?url=https%3A//msdn.microsoft.com/en-
us/library/ms191291%28v%3Dsql.120%29.aspx)

9. A JRE will not work. Make certain you have a JDK installed.

10. The system you install on needs to be part of a domain or look like it is
part of a domain. The simple way to do this is as follows:

Let's say you want to use the name: blackboard.localdomain. Add these lines to
your windows\system32\drivers\etc\hosts file:

127.0.0.1 blackboard.localdomain

127.0.0.1 blackboard

Microsoft SQL Server Installation and Configuration Requirements:

  1. Install SQL Server at the drive level, for example, C:\SQL Server.
  2. Use Mixed Mode Security Authentication.
  3. Make sure SQL Server is installed using a local account.
  4. Blackboard recommends using the default instance name. If the default instance name is not used, the instance name must not include any underscores, spaces, or punctuation. Use only alphanumeric characters.
    1. If an instance other than the default is used, make sure that the instance is not case sensitive.
  5. The SQL Server Client Tools must be installed on each application server.
  6. SQL Server will not enable TCP/IP configuration by default. Turn it on.
    1. Sql Server Configuration Manager > SQL Server Network Configuration > Protocols for MSSQLSERVER > TCP/IP  

    2. Restart SQL Server.

Q2 2016 and Later Specific Requirements

1. Use Unix-style path names in the installer.properties file, unless the
property name contains .win.

Examples:

bbconfig.basedir.win=c:\\blackboard

or

bbconfig.basedir=c:/blackboard

bbconfig.java.home=c:/java/jdk1.8.0_172 # See note below for a change in Java
version for Q4 2018 and later.

2. Create the data directory specified by bbconfig.database.datadir before
starting the install.

3. Ensure that you remove any non-default password policies against MSSQL.

4. If installing for the first time, ensure that the password given for the
BBLEARN accounts meets the MS SQL password requirements.

5. Gradle, which the installer uses, has a 12-character password limit.

** Ensure that the SA password has 11 or fewer characters and NO special characters. (#!% etc. cause issues.)**

6. MS SQL Server 2008 and MS Server 2008 are NOT supported. Upgrade before
attempting the Learn Q2 2016 upgrade/install

**Q4 2018 and Later Specific Requirements, In Addition to the Above**

  1. Java JDK 1.8.0_172 or higher MUST be used.

Video Overview: [Dropbox -
2017.10.01.WinInstallSetup.mov](https://community.blackboard.com/external-link
.jspa?url=https%3A//www.dropbox.com/s/3hggaumngbtsvb8/2017.10.01.Win
InstallSetup.mov%3Fdl%3D0)

