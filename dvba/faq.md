---
layout: post
title: "DVBA FAQ"
status: deprecated
id: DBVA-faqs
categories: DVBA
author: Mark Kauffman
---

# DVBA FAQ
## Solution to a PostgreSQL Error in the Developer Virtual Machine

Recently I ran across an interesting issue while helping a Partner who uses the DVM exclusively for development. Changing some user’s Institution role resulted in a screen indicating a database error. Looking through the logs/bb- sqlerror-log.txt file we saw entries like the following:

~~~ shell 
2016-02-19 22:39:34 +0000 - { call user_roles_cr(users_pk1 := , institution_roles_pk1 := , row_status := , data_src_pk1 := , ) } failed. - org.postgresql.util.PSQLException: ERROR: cursor "

cursor0001" already in use

Where: PL/pgSQL function layout_module_group_trg_ins_tf() line 27 at FOR overcursor
~~~

It turns out that the DVMs have several Postgres procedures and triggers that are using the same cursor names, causing the “already in use” contention. This issue impacts April 2014, October 2014, and Q2 2015 DVMS. You can correct for for this now with the following procedure.

1. Create a backup image/snapshot of the system you’re going to work with. For example with Virtualbox I can click to create a snapshot that I can roll back to.

2. Open a terminal window that you can cut and paste code into. This is important for getting the SQL code provided below exactly right. On my Mac I opened a terminal.

3. From the terminal ssh into the DVM. However you get here doesn’t matter - we’re just after the cut/paste ability.

4. Switch to root.

~~~ shell 
$ sudo su -
~~~

5. Shutdown Learn.

~~~ shell 
cd /usr/local/blackboard/tools/admin
./ServiceController.sh services.stop
~~~

6. Tail the appropriate logs/tomcat/stdout-stderr file until the Learn app stops. Use ps -ef | grep java to ensure no Java code is running.

7. Switch to the postgres user. Start the psql command line interpreter. Connect to the BBLEARN database.

~~~ shell
sudo su - postgres
$ psql
postgres=# \connect BBLEARN
~~~

You are now connected to the database “BBLEARN” as user “postgres”. BBLEARN=#

8. Now run following SQL which should correct the issue.

First copy and paste the block of SQL below into the window you have open,
right after the # that is displayed, then hit enter. Copy and paste everything
up to and including the line $$ LANGUAGE plpgsql;

~~~ sql
CREATE OR REPLACE FUNCTION layout_module_group_trg_ins_tf() RETURNS trigger AS
$$
DECLARE
temp_pk1 bigint;
lmg_cur0 cursor for
SELECT new.layout_pk1 layout_pk1, defl.pk1 default_layout_pk1
FROM layout l, layout defl
WHERE new.layout_pk1=l.pk1
AND l.layout_family_pk1 = defl.layout_family_pk1
AND defl.default_ind='Y' AND defl.pk1 <> new.layout_pk1;
BEGIN
FOR currow IN lmg_cur0
LOOP
DECLARE
-- Renamed alias to position1 as it is a reserved word
lmg_cur1 cursor for
SELECT mmg.module_pk1 module_pk1,
ml.column_number column_number, ml.position position1
FROM module_module_group mmg, module_layout ml
WHERE mmg.module_group_pk1 = new.module_group_pk1
AND mmg.module_pk1 = ml.module_pk1
AND ml.layout_pk1 = currow.default_layout_pk1
AND mmg.module_pk1 NOT IN (
SELECT module_pk1
FROM module_layout
WHERE layout_pk1=currow.layout_pk1);
BEGIN
FOR currow1 in lmg_cur1
LOOP
temp_pk1 := module_layout_cr
(module_pk1 := currow1.module_pk1,
layout_pk1 := currow.layout_pk1,
column_number := currow1.column_number,
"position" := currow1.position1,
manually_added_ind := 'N',
minimized_ind := 'N'
);
END LOOP;
END;
END LOOP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

~~~

After you hit the Enter key, you should see CREATE FUNCTION displayed in the terminal window. You can check that you’ve actually changed the function with the following:

~~~ bash
BBLEARN=# select proname,prosrc from pg_proc where
proname='layout_module_group_trg_ins_tf';
~~~

Second copy and paste the block of SQL below into the window you have open, right after the #, then hit enter. Copy and paste everything up to and including the line $$ LANGUAGE plpgsql;

~~~ sql
CREATE OR REPLACE FUNCTION users_portal_trg_upd_tf() RETURNS trigger AS $$
DECLARE
lmg_pk1 bigint;
v_old_ir_pk1 bigint;
v_users_pk1 bigint;
v_count int;
cursor0001 cursor for
SELECT l.pk1 layout_pk1, img.pk1 new_mg_pk1, dmg.pk1 old_mg_pk1, l.users_pk1
v_users_pk1 , old.institution_roles_pk1 v_old_ir_pk1
FROM layout l, module_group img, module_group dmg
WHERE l.users_pk1=new.pk1
AND img.institution_roles_pk1=new.institution_roles_pk1
AND dmg.institution_roles_pk1=old.institution_roles_pk1
AND new.pk1=old.pk1
AND new.institution_roles_pk1 <>old.institution_roles_pk1;
BEGIN
FOR currow1 IN cursor0001
LOOP
v_count =0;
SELECT count(*) INTO v_count FROM layout_module_group
where layout_pk1=currow1.layout_pk1 and module_group_pk1=currow1.new_mg_pk1;
IF(v_count=0) THEN
lmg_pk1 := layout_module_group_cr
(layout_pk1 := currow1.layout_pk1,
module_group_pk1 := currow1.new_mg_pk1
);
END IF;
v_count =0;
SELECT count(*) INTO v_count FROM user_roles
where users_pk1=currow1.v_users_pk1 and
institution_roles_pk1=currow1.v_old_ir_pk1;
IF(v_count=0) THEN
perform layout_module_group_rm
(layout_pk1 := currow1.layout_pk1,
module_group_pk1 := currow1.old_mg_pk1
);
END IF;
END LOOP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
~~~

1. Quit Postgres
~~~ bash
BBLEARN=#\q
~~~
2. Exit back to root.
~~~ bash
$ exit
~~~
3. Start Learn. Tail the appropriate logs/tomcat/stdout-stderr file to ensure Learn is really started, then test.

## Solution to Unconnected sockets not implemented in a Q4 2015 DVM

You’ve run into the “Unconnected sockets not implemented error” in a Q4 2015 Developer Virtual Machine. What can you do? This article will help. There is a patch that fixes the error, LRNSI-21817, but the Q4 2015 DVM is built from a slightly different version of Learn than what went GA. Hence an attempt to apply the patch will fail, telling you that the patch isn’t meant for the version of Learn you are running. What I did, and it worked for me, is to download the patch, unzip it, modify the bbpatch.mf file so that the DVM version is included in the list of compatible versions, re-build the patch, and apply it. Because there are no database changes involved, just inserting a couple of class files, BbPatch.sh ran without a hitch with this modified file. Following are the details. Hope this helps another developer!

~~~ bash
$ vagrant up
$ vagrant ssh
$ yum install zip
$ yum install unzip
$ cd /usr/local/blackboard/tools/admin
$ ./ServiceController.sh services.stop
$ ./BbPatch.sh download LRNSI-21817
$ mkdir tmp
$ mv ./LRNSI-21817-1.bbp tmp/
$ cd tmp
$ mkdir zipdir
$ cp LRNSI-21817-1.bbp zipdir/LRNSI-21817-1.zip
$ cd zipdir
$ unzip LRNSI-21817-1.zip
$ rm LRNSI-21817-1.zip
$ vi bbpatch.mf
  
  **Change: ** Compatible: 9.1.201510/9.1.201510.1171621-9.1.201510.1171621 
  **To: **Compatible: 9.1.201510/9.1.201510.1171621-9.1.201510.1171702 

$  zip -r foo.zip .
$ mv foo.zip LRNSI-21817_4DVM.bbp
$ cp LRNSI-21817_4DVM.bbp ../..
$ cd ../..
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
~~~