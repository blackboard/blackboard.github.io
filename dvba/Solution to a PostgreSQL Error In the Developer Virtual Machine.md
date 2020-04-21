---
layout: dvba
---
# Solution to a PostgreSQL Error In the Developer Virtual Machine
*Author: Mark Bykerk Kauffman*  
*Categories: []*  
*Tags: ['postgresql', 'developer virtual machine', 'dvm', 'developer']*  
<hr />
Recently I ran across an interesting issue while helping a Partner who uses
the DVM exclusively for development. Changing some user's Institution role
resulted in a screen indicating a database error. Looking through the logs/bb-
sqlerror-log.txt file we saw entries like the following:

```bash
2016-02-19 22:39:34 +0000 - { call user_roles_cr(users_pk1 := , institution_roles_pk1 := , row_status := , data_src_pk1 := , ) } failed. - org.postgresql.util.PSQLException: ERROR: cursor "

cursor0001" already in use

Where: PL/pgSQL function layout_module_group_trg_ins_tf() line 27 at FOR over
cursor
```

It turns out that the DVMs have several Postgres procedures and triggers that
are using the same cursor names, causing the "already in use" contention. This
issue impacts April 2014, October 2014, and Q2 2015 DVMS. You can correct for
for this now with the following procedure.

1. Create a backup image/snapshot of the system you're going to work with. For
example with Virtualbox I can click to create a snapshot that I can roll back
to.

2. Open a terminal window that you can cut and paste code into. This is
important for getting the SQL code provided below exactly right. On my Mac I
opened a terminal.

3. From the terminal ssh into the DVM. However you get here doesn't matter -
we're just after the cut/paste ability.

4. Switch to root.
```bash
$ sudo su -
```

5. Shutdown Learn.
```bash
cd /usr/local/blackboard/tools/admin
./ServiceController.sh services.stop
```

6. Tail the appropriate logs/tomcat/stdout-stderr file until the Learn app
stops. Use `ps -ef | grep java` to ensure no Java code is running.

7. Switch to the postgres user. Start the psql command line interpreter.
Connect to the BBLEARN database.
```bash
# sudo su - postgres
$ psql

postgres=# \connect BBLEARN

You are now connected to the database “BBLEARN” as user “postgres”.
BBLEARN=#
```

8. Now run following SQL which should correct the issue.

First copy and paste the block of SQL below into the window you have open,
right after the # that is displayed, then hit enter. Copy and paste everything
up to and including the line $$ LANGUAGE plpgsql;

```sql
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
--Renamed alias to position1 as it is a reserved word
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
```
After you hit the Enter key, you should see CREATE FUNCTION displayed in the
terminal window. You can check that you've actually changed the function with
the following:
```sql
BBLEARN=# select proname,prosrc from pg_proc where
proname='layout_module_group_trg_ins_tf';
```

Second copy and paste the block of SQL below into the window you have open,
right after the #, then hit enter. Copy and paste everything up to and
including the line $$ LANGUAGE plpgsql;
```sql
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
```

9. Quit Postgres
```sql
BBLEARN=#\q
```

10. Exit back to root.
```bash
$ exit
```

11. Start Learn. Tail the appropriate logs/tomcat/stdout-stderr file to ensure
Learn is really started, then test.

