# Solution to Unconnected sockets not implemented in a Q4 2015 DVM
*Author: Mark Bykerk Kauffman*
*Categories: ['Building Blocks', 'Examples']*
*Tags: ['dvm', 'patch', 'developer']*
---
You've run into the "Unconnected sockets not implemented error" in a Q4 2015
Developer Virtual Machine. What can you do? This article will help. There is a
patch that fixes the error, LRNSI-21817, but the Q4 2015 DVM is built from a
slightly different version of Learn than what went GA. Hence an attempt to
apply the patch will fail, telling you that the patch isn't meant for the
version of Learn you are running. What I did, and it worked for me, is to
download the patch, unzip it, modify the bbpatch.mf file so that the DVM
version is included in the list of compatible versions, re-build the patch,
and apply it. Because there are no database changes involved, just inserting a
couple of class files, BbPatch.sh ran without a hitch with this modified file.
Following are the details. Hope this helps another developer!

$ vagrant up

$ vagrant ssh

# yum install zip

# yum install unzip

# cd /usr/local/blackboard/tools/admin

# ./ServiceController.sh services.stop

# ./BbPatch.sh download LRNSI-21817

# mkdir tmp

# mv ./LRNSI-21817-1.bbp tmp/

# cd tmp

# mkdir zipdir

# cp LRNSI-21817-1.bbp zipdir/LRNSI-21817-1.zip

# cd zipdir

# unzip LRNSI-21817-1.zip

# rm LRNSI-21817-1.zip

# vi bbpatch.mf

**Change: ** Compatible: 9.1.201510/9.1.201510.1171621-9.1.201510.1171621 

**To: **Compatible: 9.1.201510/9.1.201510.1171621-9.1.201510.1171702 

#  zip -r foo.zip .

# mv foo.zip LRNSI-21817_4DVM.bbp

# cp LRNSI-21817_4DVM.bbp ../..

# cd ../..

[root@localhost admin]# ./BbPatch.sh apply ./LRNSI-21817_4DVM.bbp

[root@localhost admin]# ./BbPatch.sh apply LRNSI-21817_4DVM.bbp

Blackboard Patch Client version 2.2.7

apply

Blackboard Learn, Version 9.1.201510.1171702, /usr/local/blackboard

Package repository /usr/local/blackboard/content/bbpatch/repository, remote [h
ttps://bbprepo.blackboard.com/content/repositories/packages](https://community
.blackboard.com/external-link.jspa?url=https%3A//bbprepo.blackboard.com/
content/repositories/packages)

Identifier : LRNSI-21817

Description : Fixing issue with B2s that rely on outbound encrypted data

Resolves bug(s) : LRN-106224

Date built : 2016-01-24 18:51:49 +0000

Compatible with : 9.1.201510.1171621 - 9.1.201510.1171702

Platform : Any

Operations :

Jar operations:

File systemlib/bb-tomcatboot.jar:

Update blackboard/tomcat/startup/StrictSSLSocketFactory.class

File systemlib/bb-tomcat-bootstrap.jar:

Add/Update blackboard/tomcat/startup/StrictSSLSocketFactory.class

Package deployment guidance:

Package scope: Host-only. Apply/rollback on all hosts

Downtime requirement: Current host. Stop application before apply and rollback
on the current host

Validating package LRNSI-21817 for apply...

Retrieving Blackboard Learn service status...

File systemlib/bb-tomcatboot.jar is on the Tomcat classpath. Including file
copy operation to apps/tomcat/lib/bb-tomcatboot.jar.

File systemlib/bb-tomcat-bootstrap.jar is on the Tomcat classpath. Including
file copy operation to apps/tomcat/lib/bb-tomcat-bootstrap.jar.

Performing pre-apply validation...

Are you sure you want to perform this operation? [Y/N]: Y

Applying package LRNSI-21817...

Preparing to update jar /usr/local/blackboard/systemlib/bb-tomcatboot.jar

Checking/extracting file
blackboard/tomcat/startup/StrictSSLSocketFactory.class

Performing jar update...

Copying bb-tomcatboot.jar to /usr/local/blackboard/apps/tomcat/lib/bb-
tomcatboot.jar

Preparing to update jar /usr/local/blackboard/systemlib/bb-tomcat-
bootstrap.jar

Checking/extracting file
blackboard/tomcat/startup/StrictSSLSocketFactory.class

Performing jar update...

Copying bb-tomcat-bootstrap.jar to /usr/local/blackboard/apps/tomcat/lib/bb-
tomcat-bootstrap.jar

Package LRNSI-21817 applied successfully.

[SUCCESS] Apply operation succeeded.

