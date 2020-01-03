---
layout: learn
parent: b2s
category: resources-b2
---

# 8 steps to prepare for Java 11

(Updated 3 Jan 2020 with clarifications and status updates)

 

Over the past several months we have communicated that we plan to update your Blackboard Learn environment to Java 11. This important update can impact custom and third-party add-on tools leveraging the Building Blocks (B2) integration framework. This update is planned to be deployed into SaaS production environments in February 2020. For Self- and Managed Hosting clients, 9.1 Q4 2019 is targeted to be released in December 2019. 

 

As you know, Java are the libraries on which the Learn application runs and also the libraries that power Building Blocks, the add-on tools and features you may use in your environment. This update to Java 11 improves security and performance. Staying on recently updated libraries is crucial to staying ahead of those who may try to compromise your learning environment. 

 

Our testing shows that numerous Building Blocks in use today will no longer be compatible with Java 11 when we update SaaS production environments to release 3800.0 in February. Without action, these Building Blocks may stop working in your environment. Self- and Managed Hosting clients will also need to plan for this change as part of an upgrade to 9.1 Q4 2019. 

 

**Planned schedule for SaaS updates including Java 11, Learn version 3800.0**: 

* Test/stage – 19 December 2019 (available now) 
* Production, Continuous Delivery – early February 2020&ast; 
* Production, FDO options – 29 January 2020, 12 February 2020, 26 February 2020 

&ast; See the [SaaS release schedule](https://help.blackboard.com/Learn/Administrator/SaaS/Release_Notes/Learn_SaaS_Release_Schedule) for details and updates. 

 

**Planned schedule for Self- and Managed Hosting for Java 11, Learn version 9.1 Q4 2019**: 

* General Availability – [9.1 Q4 2019](https://blackboard.secure.force.com/btbb_articleview?id=kA41O0000002nDBSAY) is available now. 

 

## What you should do to prepare for this change: 

1. **Clean up**. You should inactivate or remove Building Blocks (B2s) from your environments you no longer use or support. If the tool contains data you may need to retain for data retention purposes, you should make it inactive; if you know you no longer have any need for the B2 it can be removed. Depending on how long you’ve been using Blackboard Learn, you may have B2s from older versions of Learn that are no longer used nor supported. We encourage removing these B2s. 
 

2. **Take inventory and collect updated Building Block installers**. Review the non-Blackboard B2s in your environment and take note of version numbers. Plan to collect the latest B2s for third-party extensions. 
 
   Self- and Managed Hosting admins will follow typical upgrade planning and should plan to apply updated Building Blocks as part of a 9.1 Q4 2019 upgrade process. For SaaS clients, we have worked to collect updated versions of B2s from the majority of our partners that we will apply automatically after upgrade. You should still plan to supply any other necessary updated B2s to Product Support to install, and you should plan to test all third-party B2s including partners’ to ensure there are no issues specific to your environment 
 
   When collecting updated Building Blocks, make sure you have the latest version of the B2 from the provider (vendor, open source, or internal). Check vendor websites or contact vendors’ support and get the latest versions of B2s from them. Confirm that the updates have been tested to be Java 11 compatible. For open source Building Blocks you use, check community sources such as [OSCELOT](https://github.com/oscelot) to see if updates are available. If you have B2s created by Blackboard Consulting and supported under an ICM contract, contact Blackboard Product Support for the latest version that is Java 11 compatible. 
 

3. **Transition integrations to different integration types**. Some solution providers have transitioned their integrations to other methods, such as leveraging the [Learning Tools Interoperability (LTI) standard](https://imsglobal.org/lti) or [REST APIs](/Blackboard%20Learn%20Developers/REST/Getting%20Started%20With%20REST.html) instead of Building Block APIs. In some cases, they may have completely different B2 integrations than the one you’re using. Working with these vendors, determine whether this is appropriate for you. Examples of these integrations requiring transition include Lynda.com and Turning Technologies. We will share a more comprehensive list of these as we learn more through the user community. 
 

4. **Test and update in-house Building Blocks**. If you have B2s created at your institution, you should confirm their functionality in test/stage and prepare to update them. Guidance about updating Building Blocks can be found [here](/Blackboard%20Learn%20Developers/B2s/Preparing%20Your%20Building%20Blocks%20For%20Learn%20SaaS%20and%20Newer%20Learn%20Versions.html). We’ve created an automated tool to assist with identifying potential library incompatibilities. While this tool doesn’t necessarily inform you of the functional behavior of the Building Block with Java 11, it provides guidance around library incompatibilities that could lead to a non-functional B2. See the section about the Building Block Scan Tool in the Resources section below. 
 

5. **Test in test/stage environments**.  

   * **For SaaS**: Test and stage environments were updated on 19 December 2019. Testing can be conducted there. 
   * **For 9.1 Q4 2019**: Test in your test/stage environments using the [9.1 Q4 2019 installer](https://blackboard.secure.force.com/btbb_articleview?id=kA41O0000002nDBSAY).  

6. **Prepare for the production upgrade**. Have your collected B2 installers ready to install after your production upgrade. For SaaS, we plan to automatically apply updates to [_verified_ partner Building Blocks](https://blackboard.secure.force.com/btbb_articleview?id=kAA1O000000KyvZ) after the production upgrade. SaaS clients should request updates to other B2s that require updating through a Support case and provide the necessary .war file installers. To prevent disruption to users, you might also choose to make affected Building Blocks temporarily inactive so users don’t see error messages until the updated Building Blocks are installed. 

   * Please note that updated B2s should only be applied to production environments before the production upgrade if the provider explicitly says that version is compatible with both Java 8 and Java 11. A number of B2s aren’t compatible with both, so an update in production early could disrupt the use of that tool. 
 

7. **Conduct post-upgrade testing**. Review B2s after upgrade to validate their functionality. Report issues to the provider of the Building Block. 
 

8. **Plan for the future**. Once this change is over, we encourage you to review your B2 inventory and plan for the future. Transitioning away from library-dependent integration frameworks like Building Blocks toward more change-resilient integration frameworks like LTI and REST can help prevent this type of change management activity. If your institution develops tools and integrations for your Blackboard Learn instance, learn more about LTI and REST in our [developer community](https://community.blackboard.com/developers). Encourage your solution providers to consider integrations based on REST APIs and the latest in standards such as LTI Advantage. 

 

## Resources: 

* **Testing environments**. There are numerous ways and locations where you can test the functionality of your Building Blocks. 

  * **(Available Now, all deployments)** The Java 11 Technical Preview Program. This is a community program with a community site, regular updates, and office hours calls every two weeks. The program includes access to two shared SaaS environments for Building Block testing. Testing results feed back into Blackboard so testing results can be shared with other clients. This is the preferred place for early access for Building Block testing. Here is the [signup form](https://www.surveymonkey.com/r/WRGXZLZ); requests are processed weekly. 

  * **(Available Now, SaaS)** Client test/stage environments were updated on 19 December 2019. Clients can test their own B2s there. 

  * **(Available Now, Self- and Managed Hosting)**  [Learn 9.1 Q4 2019 was made available in December](https://blackboard.secure.force.com/btbb_articleview?id=kA41O0000002nDBSAY).  

* **Building Block Scan Tool**. We’ve created an automated tool for scanning B2s and help you determine if there are likely incompatible libraries. The results of the scan will highlight potentially incompatible libraries. While this may indicate likelihood of a need to update a Building Block, it doesn’t replace testing—we’ve seen a few cases where a B2 with compatibility alerts appears to function as expected, and other instances where a B2 has a clear scan but isn’t functioning quite as expected. SaaS clients can run the utility themselves. Self- and Managed Hosting clients can access the utility as part of the 9.1 Q4 2019 release. 

  * [Documentation to run the Building Block Java 11 compatibility scanner yourself](/Blackboard%20Learn%20Developers/B2s/Building%20Block%20Scan%20Tool%20for%20Blackboard%20Learn%20SaaS.html) 

* **Testing status for Partner Building Blocks**. As we work with partners to confirm the functionality of their B2s, we’re [updating the status on Behind the Blackboard](https://blackboard.secure.force.com/btbb_articleview?id=kAA1O000000KyvZ) weekly. 

* **Testing status for other Building Blocks**. Please provide us updates to B2 statuses based on your testing by completing our [B2 status feedback form](https://www.surveymonkey.com/r/NSGQNGD). This will help use track where community B2s are and share statuses with other clients in future updates. 

* **Additional background information and FAQ**: General updates and answers to frequently asked questions can be found in this [Behind the Blackboard article](https://blackboard.secure.force.com/btbb_articleview?id=kAA39000000CbCU).  

* **Building Block developer resources**: The developer’s community has many resources for Building Block development. 

  * [Preparing a Building Block for a newer version of Learn and ensuring it works with Learn SaaS](/Blackboard%20Learn%20Developers/B2s/Preparing%20Your%20Building%20Blocks%20For%20Learn%20SaaS%20and%20Newer%20Learn%20Versions.html) 
  * [B2 development frequently asked questions](/Blackboard%20Learn%20Developers/B2s/Java%2011%20for%20Learn%20-%20FAQ.html)