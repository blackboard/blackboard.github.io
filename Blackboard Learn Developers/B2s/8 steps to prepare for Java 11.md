---
layout: learn
parent: b2s
category: resources-b2
---

# 8 steps to prepare for Java 11

(Updated 21 Nov with clarifications and status updates)

 

Over the past several months we have communicated that we plan to update your Blackboard Learn environment to Java 11. This important update can impact custom and third-party add-on tools leveraging the Building Blocks (B2) integration framework. This update is planned to be deployed into SaaS production environments in February 2020. For Self- and Managed Hosting clients, 9.1 Q4 2019 is targeted to be released in December 2019.

 

As you know, Java are the libraries on which the Learn application runs and also the libraries that power Building Blocks, the add-on tools and features you may use in your environment. This update to Java 11 improves security and performance. Staying on recently updated libraries is crucial to staying ahead of those who may try to compromise your learning environment.

 

Our testing shows that numerous Building Blocks in use today will no longer be compatible with Java 11 when we update SaaS production environments to release 3800.0 in February. Without action, these Building Blocks may stop working in your environment. Self- and Managed Hosting clients will also need to plan for this change as part of an upgrade to 9.1 Q4 2019.

 

Planned schedule for SaaS updates including Java 11, Learn version 3800.0:
 

Test/stage – 12 December 2019
Production, Continuous Delivery – early February 2020*
Production, FDO options – 29 January 2020, 12 February 2020, 26 February 2020
* Exact date pending. See the SaaS release schedule for updates.

 

Planned schedule for Self- and Managed Hosting for Java 11, Learn version 9.1 Q4 2019:
Start of Technical Preview program – 20 November 2019
General Availability – mid-December 2019
 

What you should do to prepare for this change:
 

 

1. Clean up. You should inactivate or remove Building Blocks (B2s) from your environments you no longer use or support. If the tool contains data you may need to retain for data retention purposes, you should make it inactive; if you know you no longer have any need for the B2 it can be removed. Depending on how long you’ve been using Blackboard Learn, you may have B2s from older versions of Learn that are no longer used nor supported. We encourage removing these B2s.

 

 

2. Take inventory and collect updated Building Block installers. Review the non-Blackboard B2s in your environment and take note of version numbers. Plan to collect the latest B2s for third-party extensions.

Self- and Managed Hosting admins will follow typical upgrade planning and should plan to apply updated Building Blocks as part of a 9.1 Q4 2019 upgrade process. For SaaS clients, we have worked to collect updated versions of B2s from the majority of our partners that we will apply automatically after upgrade. You should still plan to supply any other necessary updated B2s to Product Support to install, and you should plan to test all third-party B2s including partners’ to ensure there are no issues specific to your environment

When collecting updated Building Blocks, make sure you have the latest version of the B2 from the provider (vendor, open source, or internal). Check vendor websites or contact vendors’ support and get the latest versions of B2s from them. Confirm that the updates have been tested to be Java 11 compatible. For open source Building Blocks you use, check community sources such as Ocelot to see if updates are available. If you have B2s created by Blackboard Consulting and supported under an ICM contract, contact Blackboard Product Support for the latest version that is Java 11 compatible.

 

3. Transition integrations to different integration types. Some solution providers have transitioned their integrations to other methods, such as leveraging the Learning Tools Interoperability (LTI) standard or REST APIs instead of Building Block APIs. In some cases, they may have completely different B2 integrations than the one you’re using. Working with these vendors, determine whether this is appropriate for you. Examples of these integrations requiring transition include Lynda.com and Turning Technologies. We will share a more comprehensive list of these as we learn more through the user community.

 

4. Test and update in-house Building Blocks. If you have B2s created at your institution, you should confirm their functionality in test/stage and prepare to update them. Guidance about updating Building Blocks can be found here. We’ve created an automated tool to assist with identifying potential library incompatibilities. While this tool doesn’t necessarily inform you of the functional behavior of the Building Block with Java 11, it provides guidance around library incompatibilities that could lead to a non-functional B2. See the section about the Building Block Scan Tool in the Resources section below.

 

5. Test in test/stage environments.

For SaaS: Before the production update in early February 2020, install and conduct thorough testing of your third-party B2s. SaaS test and stage environments are targeted to be updated on 12 December 2019. We are providing you several ways to test including two early access programs to start your testing now. See the resources section above for details.
For 9.1 Q4 2019: Testing on your test/stage environments can begin after the general availability of the 9.1 Q4 2019 installer. This is targeted for mid-December. A Technical Preview program will start on 20 November 2019. Sign up online; slots are limited.
 

6. Prepare for the production upgrade. Have your collected B2 installers ready to install after your production upgrade. For SaaS, we plan to automatically apply updates to verified partner Building Blocks. SaaS clients should request updates to other B2s that require updating through a Support case and provide the necessary .war file installers. To prevent disruption to users, you might also choose to make affected Building Blocks temporarily inactive so users don’t see error messages until the updated Building Blocks are installed.

Please note that updated B2s should only be applied to production environments before the production upgrade if the provider explicitly says that version is compatible with both Java 8 and Java 11. A number of B2s aren’t compatible with both, so an update in production early could disrupt the use of that tool.
 

7. Conduct post-upgrade testing. Review B2s after upgrade to validate their functionality. Report issues to the provider of the Building Block.

 

8. Plan for the future. Once this change is over, we encourage you to review your B2 inventory and plan for the future. Transitioning away from library-dependent integration frameworks like Building Blocks toward more change-resilient integration frameworks like LTI and REST can help prevent this type of change management activity. If your institution develops tools and integrations for your Blackboard Learn instance, learn more about LTI and REST in our developer community. Encourage your solution providers to consider integrations based on REST APIs and the latest in standards such as LTI Advantage.

 

Resources:

* **Testing environments**. There are numerous ways and locations where you can test the functionality of your Building Blocks.
  * **(Available Now, Self- and Managed Hosting)** The Technical Preview program gives early access to a 9.1 Q4 2019 release candidate installer in late November. Sign-up here. The General Availability of 9.1 Q4 2019 is planned for mid-December.
  * **(Available Now, all deployments)** The Java 11 Technical Preview Program. This is a community program with a community site, regular updates, and office hours calls every two weeks. The program includes access to two shared SaaS environments for Building Block testing. Testing results feed back into Blackboard so testing results can be shared with other clients. This is the preferred place for early access for Building Block testing. Here is the [signup form](https://www.surveymonkey.com/r/WRGXZLZ); requests are processed weekly.
  * **(Available Now, SaaS** A new Java 11 SaaS Early Access program has been established. In some cases, clients have institution-specific B2s for which testing in a shared environment could expose personal data, or perhaps testing a B2 would expose restricted license information for a commercial product. For testing in these situations and to ensure client success through this transition, Blackboard has established this new program where an institution can request an additional early testing environment in November at no additional cost. This environment will only be available for B2 testing until 12 December 2019 when client test/stage environments are updated to 3800.0. To request a Java 11 SaaS Early Access test environment, enter a support request on [Behind the Blackboard](https://behind.blackboard.com). You can enter this request now.
  * **(Available December, SaaS)** Client test/stage environments will be updated on 12 December 2019. Client can test their own B2s there.
* **Building Block Scan Tool**. We’ve created an automated tool for scanning B2s and help you determine if there are likely incompatible libraries. The results of the scan will highlight potentially incompatible libraries. While this may indicate likelihood of a need to update a Building Block, it doesn’t replace testing—we’ve seen a few cases where a B2 with compatibility alerts appears to function as expected, and other instances where a B2 has a clear scan but isn’t functioning quite as expected. We’re scanning Building Block installers when we have them and providing those results directly to SaaS clients. SaaS clients can also run the utility themselves. Self- and Managed Hosting clients can access the utility as part of the 9.1 Q4 2019 release.
  * [Documentation to run the Building Block Java 11 compatibility scanner yourself](https://docs.blackboard.com/Blackboard%20Learn%20Developers/B2s/Building%20Block%20Scan%20Tool%20for%20Blackboard%20Learn%20SaaS.html)
  * To request the results for a scan for a B2 found on your SaaS environment, submit a support request on [Behind the Blackboard](https://behind.blackboard.com).
* **Testing status for Partner Building Blocks**. As we work with partners to confirm the functionality of their B2s, we’re updating the status on [Behind the Blackboard](https://behind.blackboard.com)
* **Testing status for other Building Blocks**. Please provide us updates to B2 statuses based on your testing by completing our [B2 status feedback form](https://www.surveymonkey.com/r/NSGQNGD). This will help use track where community B2s are and share statuses with other clients in future updates.
* **Additional background information and FAQ**: General updates and answers to frequently asked questions can be found in this [Behind the Blackboard post](https://blackboard.secure.force.com/apex/btbb_articleview?id=kAA39000000CbCU).
* **Building Block developer resources**: The [developer’s community](https://community.blackboard.com/developers) has many resources for [Building Block development](https://docs.blackboard.com/Blackboard%20Learn%20Developers/B2s/Getting%20Started%20With%20Building%20Blocks.html).
  * [Preparing a Building Block for a newer version of Learn and ensuring it works with Learn SaaS](https://docs.blackboard.com/Blackboard%20Learn%20Developers/B2s/Preparing%20Your%20Building%20Blocks%20For%20Learn%20SaaS%20and%20Newer%20Learn%20Versions.html)
  * [B2 development frequently asked questions](https://docs.blackboard.com/Blackboard%20Learn%20Developers/B2s/Java%2011%20for%20Learn%20-%20FAQ.html)