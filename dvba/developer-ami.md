---
layout: post
title: "Developer AMI"
tipue_search_active: true
id: DBVA-dev-ami
categories: DVBA
---

# Using the Blackboard Learn AMI for REST and LTI Development

This document outlines usage of the Blackboard REST and LTI Developer AMI made available via the Amazon AWS Marketplace.

## Overview

The Blackboard REST and LTI Developer Amazon Machine Image (“AMI”) is an image of a Blackboard Learn server available in the Amazon Marketplace. The AMI allows a developer to spin up a copy of Blackboard Learn for building applications that use the REST APIs and/or Learning Tool Interoperability (“LTI”) to integrate with Learn. This image is a standalone copy of the SaaS deployment of Blackboard Learn that allows development and testing against the Ultra user experience. Once the developer spins up the copy of Learn, it lives in his or her AWS account and the developer has full control over the instance of Learn. All instances are pre-licensed with a developer license. New developer AMIs will be made available in the same cadence as SaaS releases. Please note that there is often a delay of 5-14 days before the AMI is available due to AMI and AWS processing time.

This program allows a developer to build an integration for Blackboard Learn without a formal paid partnership. Anyone who wants to test the Ultra experience can create copy. Note that you cannot deploy a custom building block to this AMI. It is meant only for REST and LTI development.

**NOTE:** Building Block installation is NOT supported on the AMIs.

### Get the Blackboard REST and LTI Developer AMI

The easiest way to find the Developer AMI is by searching the Amazon Marketplace for Blackboard Learn. The results show all of the currently available AMIs. Given the cadence or releases, you should locate the Learn instance you want.

Use the Blackboard REST and LTI Developer AMI
Before you begin, you must have an Amazon AWS account. If you do not have an AWS account you will need to create one. The steps to set up an AMI are typically as follows.

- Subscribe to the AMI
- Configure the specific instance
- Spin it up and code!
- When configuring the instance, it is completely up to you how you set up the server. We do have a few recommendations, however.

1. We recommend using the Large Tier instance type. This gives you enough storage and power to run Blackboard Learn effectively and build your cool widget.

- If you see 502 Gateway errors, you may need to increase the size of your AMI. Additionally, you may periodically see a 502 Gateway error during use - keeping in mind EC2s based on this AMI are NOT intended for use as a Production service, you may simply issue a reboot to restart the server maintaining your AWS provisioned public IP and DNS settings.

2. We recommend you adjust the security settings to allow:
- SSH from your IP only
- Enable HTTPS access

3. You must configure VPC for the EC2 to properly function. You do this by going to the VPC Console from the AWS Console:
4. Under Services open VPC under Networking and Content Delivery
5. Open Your VPCs
6. select the VPC connected to your EC2 and
7. select Actions => Edit DNS Hostnames —> Change DNS hostnames: to YES
8. Startup time: The startup time for your EC2 will vary and may take as long as 15 minutes before you may access the site via your browser. SSH access may be available in 3 minutes or less.
9. On initial startup the Original UX login screen appears. Note the messaging on that page as it informs you when the license expires. You will need to subscribe to a new AMI release prior to license expiration if you wish to migrate data from the old EC2 to the new. Licenses on AMIs are not extendible.

### Support for Let’s Encrypt SSL Certificates

Starting with version 3300.6.0 the Learn for REST and LTI Developers AMI supports free Let’s Encrypt SSL Certificates. At this time we do not support alternative SSL certificate processes.

**NOTE:** Per the Let’s Encrypt FAQ certificates are valid for only 90 days. In order to update your Let’s Encrypt certificate you must perform a server reboot per below instructions.

- You may read about Let’s Encrypt at Let’s Encrypt - Free SSL/TLS Certificates

- You may read about certbot at Certbot

- You may read about how to get a free DNS at Free Dynamic DNS - No-IP.com - Managed DNS Services

#### Setup
After starting your AMI there are a few steps to installing and using Let’s Encrypt Certificates. After installing the certificate, management of the Let’s Encrypt SSL certificate is automatic.

1. Register the AWS provided EC2 public IP to your DNS as an A-record. The best practice as an introduction is to use a free DNS service such as freeddns.no-ip.com to provide the FQDN used for your Learn EC2.

2. Use the EC2 Security controls to open HTTP as an inbound security rule - you should have HTTP, HTTPS, and SSH (from your console IP) enabled at this point.

3. SSH to your EC2 instance and create a file containing your FQDN from freeddns.no-ip.com and your email address and save to /home/ubuntu/my_ssl_config. The format of this file is important and should follow the example below. The file contains only two lines specifying the key and value pairs used to configure the Let’s Encrypt process, e.g.:

~~~ yaml
  ssldomain : devmen.hopto.org
  sslemail : developers@blackboard.com
~~~

4. SSH to your EC2 instance and from the command line reboot the instance using the command:

~~~ shell
$ sudo reboot now
~~~


**On reboot the server will generate your Let’s Encrypt SSL certificate, on future reboots or restarts the server will check whether the certificate requires renewal. If renewal is required reboot the server to renew the Let’s Encrypt certificate. If your certificate is past expiration, because you ignored the renewal notices, sudo mv the /etc/letsencrypt directory to your home directory for safe keeping and reboot.**

**Warning:** When you stop and start an existing EC2 instance, AWS resets the public domain name and IP - you must update your DNS entry to reflect the new IP.

**Warning:** Let’s Encrypt has a limit of 20 certificate requests on a domain per week. Repeated stop and starts of an AMI using the same domain may exceed the Let’s Encrypt request limit, requiring you to provide a new domain name. **

#### What does the Blackboard REST and LTI Developer AMI cost?

The Open Innovation Initiative was created to lower the cost of entry for developing software solutions on the Blackboard Learn platform. This is accomplished by removing the previous Partner program costs and replacing those partner program costs with low hourly AMI usage costs. This enables you the developer to control your costs for prototyping your applications and entering the education software market.

Use of the Developer AMI will result in two charges being made to your account:

1. An AWS Infrastructure charge
This charge is based on the EC2 instance type selected to run the AMI and varies based on the instance type size and region. An example is $0.0464/hr for a t2.medium instance served from

2. Software charge
A Software charge of $0.05/hr (US dollars) is added to the AWS infrastructure charge.

If you have any questions, feel free to ask in this space or email us at developers@blackboard.com.

#### Log into the Blackboard Learn Application on the AMI
The username is administrator. The password is the instance ID, e.g., i-234234234234. If you look at the log created when you spin it up it is also printed there. You can find the log from the EC2 console.

The first time you go to login, you will see text on the page like the following. NOTE: There is no way to upgrade an AMI. You will need to get the latest AMI, and transfer any necessary data, BEFORE the expiration date shown on the page you see.

<<<<<<<<< IMAGE >>>>>>>>>

Landing page seen the first time you login to the developer AMI

### Configure Your AMI-based Blackboard Learn Instance
When you set up your instance of Blackboard Learn, you can configure different options. These options are discussed in Enable Learn Tool Interoperability (LTI) Links and Text.

#### Triage Your AMI-based Blackboard Learn Instance
Note that not stopping your EC2 when you encounter an error will continue to incur EC2 charges and we do not issue refunds.Always stop your EC2 if you encounter an error or do not require a 24x7 development instance.

1. For General Learn System Administration you may visit: [Blackboard Learn SaaS Deployments](https://help.blackboard.com/Learn/Administrator/SaaS)
2. 504 Gateway Error
3. Visiting https:// displays a 504 error in your browser: 1. Shutdown the instance to stop accumulating charges and try again 2. Or reboot the instance:

    1. Ssh into the instance

    2. Issue this command: 
    ~~~ shell  
    $ sudo reboot now 
    ~~~
    
    3. Issue a reboot from the AWS console

The above restarts the instance and will typically correct the 504 error.

### Migration Cookbook - Recreating Data between AMIs

Currently, there is no formal migration/transfer tool to port Blackboard Learn data between AMI (EC2) instances. However, there are several existing administrative tools that can be leveraged to capture the bulk of T&L (teaching/learning data) like courses, users, institutional roles, and enrollments, etc. from an existing (source) EC2 and reinstate/recreate the data onto a (new) EC2. The resources linked below will guide you through this data transfer process:

1. Bb Learn EC2 Data Transfer.docx: A Word doc outlining a comprehensive step-by-step overview of the migration/transfer process between a source and destination EC2.
2. EC2 Migration SQL Scripts and Feed Files.zip: A zip file containing all the SQL scripts (PostgreSQL format) and example feed files referenced in the Data Transfer overview document (above).

#### Notice - AVG on Windows Systems
While using the AVG antivirus product on a Windows system and attempting to create a course using Blackboard Learn, AVG may manifest what we believe is a false positive dialog regarding CVE-2014-0286-A. This can occur while using any browser, though the error message is specific to now unsupported versions of Microsoft Internet Explorer 6 through 11. Our security team has indicated that this is an issue with the AVG software. Blackboard will be reaching out to AVG to discuss. See the AVG website for questions about configuring the AVG software, and for their contact information.