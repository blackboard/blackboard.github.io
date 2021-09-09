---
layout: post
title: "Developer Virtual Machine - DVM"
status: deprecated
id: rest_apis-learn-sandbox-dev_test_site
categories: DVBA
---

# Developer Virtual Machine (DVM)

The DVM is only available to clients and partners with Behind the Blackboard access. You _can_ gain access to a developer instance of Blackboard for developing LTI and RESTful applications using our Amazon Web Services Developer AMI, available in the Amazon Marketplace. If you prefer the Virtual Machine, or you wish to develop Building Blocks, you must first be a contracted client or partner. For more information about becoming a Blackboard Partner, see Become a Blackboard Partner and Gain Access To Behind the Blackboard and Partner SaaS Systems.

Blackboard provides a preconfigured VirtualBox developer virtual machine (DVM) to help developers quickly test and validate Building Blocks and REST integrations. This article will help you set up the DVM.

#### License

You are downloading a Blackboard Learn Developer Virtual Machine instance (the “Bb Virtual Machine”) containing the Blackboard Learn™ developer software. The Bb Virtual Machine shall be deemed a part of the Blackboard Developer Software provided to you pursuant to the terms of your developer license agreement with Blackboard. All terms and conditions of your developer license agreement to the Blackboard Learn™ software shall remain in full force and effect and shall apply in all respects to the Bb Virtual Machine and your use thereof. The Bb Virtual Machine and the Blackboard Learn™ developer software contained therein are provided “as is”. Except as expressly stated in your developer license agreement, Blackboard disclaims all warranties and liability associated with the Bb Virtual Machine and your use thereof. By clicking ‘Accept’ below and/or by downloading or accessing the Bb Virtual Machine, you re-affirm your agreement to the terms of your developer license agreement for the Blackboard Learn™ software and further agree that your use of the Bb Virtual Machine shall be subject to the terms and conditions of your developer license agreement. If you do not agree to the foregoing terms, you may not download or use the Bb Virtual Machine.

#### Prerequisites

- Developer-class workstation or laptop that supports Linux virtual machines.
- VirtualBox 5.0.14 must be installed and operational.
- Vagrant 1.74 or later must be installed and operational.
- Behind the Blackboard Access - Read Become a Blackboard Partner and Gain Access To Behind the Blackboard and Partner SaaS Systems.

#### Installation

1. Create a directory on your computer for your Vagrant VM. For example:

```shell
$HOME/Vagrant/Learn
```

2. Download the Vagrant virtual machine and Vagrantfile from Behind the Blackboard and place them in the directory listed in Step 1.

- 9.1 Q4 2018 (3500) or greater: Install a recent version and see Upgrade Your DVM <<<<link here>>>>if you need the latest version.
- 9.1 Q2 2018 (3400)
- 9.1 Q4 2017 (3300)
- 9.1 Q2 2017 (3200)
- 9.1 Q4 2016 (3100)
- 9.1 Q2 2016 (3000)

3. Run the following commands in that directory:

```shell
vagrant up
vagrant ssh
```

4. If you are on a Windows host machine, you may experience issues logging into the VM because of Windows’ management of SSH. Alternatively, you can log into the VM using any SSH client you want by connecting to localhost:2222 and using the credentials vagrant/vagrant. Additionally, help is available on the Vagrant site.

5. Blackboard Learn should automatically start when the machine is booted up.

#### Using the Virtual Machine

You can now access your developer instance of Learn at http://localhost:9876 or https://localhost:9877. The Learn administrator login credentials are administrator/password.

#### Developer License

This virtual machine is pre-licensed with a developers license, and is not intended to be re-licensed with your institution’s license or personal developer license. Because a Developer license is in use, there are certain limitations:

- 150 Users
- 100 Courses
- 1000 Enrollments

#### Starting Block

This Building Block allows you to deploy your Building Block remotely, and is already installed and configured on this virtual machine.

#### bb-config.properties

You can modify this VM to mimic either a SaaS-like configuration or an Enterprise 9.1 configuration. In the bb-config.properties file, there is a variable to control whether the Building Block uses the standard content directory or a local cached copy. SaaS uses a local cached copy of the Building Block directory on each app server. Toggling this value to true mimics this behavior.

```properties
bbconfig.plugins.cache.enabled=false // Default behavior, just like Learn 9.1
```

-OR-

```properties
bbconfig.plugins.cache.enabled=true //Mimics B2 behavior of Learn SaaS
```

You will also need to shutdown Learn and copy the content directory that is being used to the new location when making the switch. For example, the Q2 2016 DVM ships with bbconfig.plugins.cache.enabled=true. When you switch to bbconfig.plugins.cache.enabled=false you will need to shutdown Learn and then

```shell
cp -r /usr/local/blackboard/cache/vi/BBLEARN/plugins/* /usr/local/blackboard/content/vi/BBLEARN/plugins/
```

This copies the cache directory content to the standard content directory.

As with any configuration change, a PushConfigUpdates is required in order to have the change take affect.

See the Shared Content Folder section of Preparing Your Building Blocks For Learn SaaS and Newer Learn Versions <<<<< LINK >>>>> for a detailed explanation of the differences between the SaaS-like configuration and the Enterprise 9.1 configuration.

#### Attaching to the Tomcat Debugger

The tomcat debugger may be attached via port 9878.

#### Accessing the Virtual Machine Users

The user which is by default logged onto the virtual machine is named vagrant and has the password of vagrant.

After you have ssh’d to the virtual machine you have the need to perform root privileged operations:

```shell
    vagrant ssh
    su - root #the root password for the virtual machine is _vagrant_
```

#### Accessing the Database Directly

To access the database directly (for running SQL), you must be logged in as the postgres user:

```shell
    vagrant ssh
    sudo su - postgres -c "psql BBLEARN"
```

The user and password for accessing the database when not logged in as the postgres user is postgres/postgres.

Port 5432 is forwarded to your host machine at 9879, so you can set up a “remote” connection using pgadminIII or your preferred database tool.

#### Tomcat Wrapper Timeout

The tomcat wrapper timeout value has been set to 0 to avoid the timing out of the Java Debugger. The memory allocation is initially set to 4gb in the Vagrantfile, as well. Simply modify the entry in Vagrantfile to adjust this value.

#### Register VM With the Cloud

The DVM must register with the cloud in order to use the API Gateway. Learn more about this process here.

#### Common Issues

Postgres Error
Unconnected Sockets
To share comments and feedback on the developer virtual machine, please email developers (at) blackboard (dot) com.
