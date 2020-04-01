---
layout: learn
parent: b2s
category: resources-b2
---

# 8 steps to prepare for Java 11

(Updated March 2020 to remove SaaS release references since that is in the past. Updated 23 January 2020: clarification of Building Block updates at time of Learn upgrade; timeline and availability updates.)

 

Throughout 2019 we communicated that we planned to update your Blackboard Learn environment to Java 11. This important update can impact custom and third-party add-on tools leveraging the Building Blocks (B2) integration framework. This update was deployed into SaaS production environments in February 2020. For Self- and Managed Hosting clients, 9.1 Q4 2019 which includes Java 11 support was released December 2019.

 

As you know, Java are the libraries on which the Learn application runs and also the libraries that power Building Blocks, the add-on tools and features you may use in your environment. This update to Java 11 improves security and performance. Staying on recently updated libraries is crucial to staying ahead of those who may try to compromise your learning environment.

 

Our testing shows that numerous Building Blocks in use today will no longer be compatible with Java 11. Without action, these Building Blocks may stop working in your environment. Self- and Managed Hosting clients will need to plan for this change as part of an upgrade to 9.1 Q4 2019 and newer. 

 

**Learn SaaS**: 

Deployed in February 2020.
 

**Learn 9.1 for Self- and Managed Hosting**: 

[9.1 Q4 2019](https://blackboard.secure.force.com/btbb_articleview?id=kA41O0000002nDBSAY) is available now on Behind the Blackboard.

 

## What you should do to prepare for this change: 

1. **Clean up**. You should inactivate or remove Building Blocks (B2s) from your environments you no longer use or support. If the tool contains data you may need to retain for data retention purposes, you should make it inactive; if you know you no longer have any need for the B2 it can be removed. Depending on how long you’ve been using Blackboard Learn, you may have B2s from older versions of Learn that are no longer used nor supported. We encourage removing these B2s.
 

2. **Take inventory and collect updated Building Block installers**. Review the non-Blackboard B2s in your environment and take note of version numbers. Plan to collect the latest B2s for third-party extensions.
 
 
   Self- and Managed Hosting admins will follow typical upgrade planning and should plan to apply updated Building Blocks as part of a 9.1 Q4 2019 upgrade process. Admins may be able to update the Building Block prior to the upgrade if the provider indicates the Building Block is compatible with both Java 8 and Java 11 versions of Learn. Otherwise, updates can be applied after the Learn upgrade.


   When collecting updated Building Blocks, make sure you have the latest version of the B2 from the provider (vendor, open source, or internal). Check vendor websites or contact vendors’ support and get the latest versions of B2s from them. Confirm that the updates have been tested to be Java 11 compatible and validate in your test or stage environment. For open source Building Blocks you use, check community sources such as [OSCELOT](https://github.com/oscelot) to see if updates are available. If you have B2s created by Blackboard Consulting and supported under an ICM contract, contact Blackboard Product Support for the latest version that is Java 11 compatible. 
 

3. **Transition integrations to different integration types**. Some solution providers have transitioned their integrations to other methods, such as leveraging the [Learning Tools Interoperability (LTI) standard](https://imsglobal.org/lti) or [REST APIs](/learn/REST/Getting%20Started%20With%20REST.html) instead of Building Block APIs. In some cases, they may have completely different B2 integrations than the one you’re using. Working with these vendors, determine whether this is appropriate for you. Examples of these integrations requiring transition include Lynda.com and Turning Technologies. 
 

4. **Test and update in-house Building Blocks**. If you have B2s created at your institution, you should confirm their functionality in test/stage and prepare to update them. Guidance about updating Building Blocks can be found [here](/learn/B2s/Preparing%20Your%20Building%20Blocks%20For%20Learn%20SaaS%20and%20Newer%20Learn%20Versions.html). We’ve created an automated tool to assist with identifying potential library incompatibilities. While this tool doesn’t necessarily inform you of the functional behavior of the Building Block with Java 11, it provides guidance around library incompatibilities that could lead to a non-functional B2. See the section about the Building Block Scan Tool in the Resources section below.
 

5. **Test in test/stage environments**.  

   * **For SaaS**: It is always best practice to test new Building Blocks in your test/stage environment before applying to production. 
   * **For 9.1 Q4 2019**: Test in your test/stage environments using the [9.1 Q4 2019 installer](https://blackboard.secure.force.com/btbb_articleview?id=kA41O0000002nDBSAY).  

6. **Prepare for the production upgrade**. Have your collected B2 installers ready to install after your production upgrade.

To prevent disruption to users, you might also choose to make affected Building Blocks temporarily inactive so users don’t see error messages until the updated Building Blocks are installed.

   * Please note that updated B2s should only be applied to production environments before the production upgrade if the provider explicitly says that version is compatible with both Java 8 and Java 11. A number of B2s aren’t compatible with both, so an update in production early could disrupt the use of that tool. 
 

7. **Conduct post-upgrade testing**. Review B2s after upgrade to validate their functionality. Report issues to the provider of the Building Block. 
 

8. **Plan for the future**. Once this change is over, we encourage you to review your B2 inventory and plan for the future. Transitioning away from library-dependent integration frameworks like Building Blocks toward more change-resilient integration frameworks like LTI and REST can help prevent this type of change management activity. If your institution develops tools and integrations for your Blackboard Learn instance, learn more about LTI and REST in our [developer community](https://community.blackboard.com/developers). Encourage your solution providers to consider integrations based on REST APIs and the latest in standards such as LTI Advantage. 

 

## Resources: 

* **Testing environments**. There are numerous ways and locations where you can test the functionality of your Building Blocks. 

  * **(Available Now, Self- and Managed Hosting)**  [Learn 9.1 Q4 2019 was made available in December](https://blackboard.secure.force.com/btbb_articleview?id=kA41O0000002nDBSAY).  

* **Building Block Scan Tool**. We’ve created an automated tool for scanning B2s and help you determine if there are likely incompatible libraries. The results of the scan will highlight potentially incompatible libraries. While this may indicate likelihood of a need to update a Building Block, it doesn’t replace testing—we’ve seen a few cases where a B2 with compatibility alerts appears to function as expected, and other instances where a B2 has a clear scan but isn’t functioning quite as expected. SaaS clients can run the utility themselves. Self- and Managed Hosting clients can access the utility as part of the 9.1 Q4 2019 release. 

  * [Documentation to run the Building Block Java 11 compatibility scanner yourself](/learn/B2s/Building%20Block%20Scan%20Tool%20for%20Blackboard%20Learn%20SaaS.html) 

* **Testing status for Partner Building Blocks**. As we worked with partners throughout 2019 in preparing for Java 11, we were [updating the status of those Building Blocks on Behind the Blackboard](https://blackboard.secure.force.com/btbb_articleview?id=kAA1O000000KyvZ). This document can be used as a resource, but please note that it was no longer updated afer February 2020. Be certain to check with Building Block suppliers for the most up-to-date information. 

* **Additional background information and FAQ**: General updates and answers to frequently asked questions can be found in this [Behind the Blackboard article](https://blackboard.secure.force.com/btbb_articleview?id=kAA39000000CbCU).  

* **Building Block developer resources**: The developer’s community has many resources for Building Block development. 

  * [Preparing a Building Block for a newer version of Learn and ensuring it works with Learn SaaS](/learn/B2s/Preparing%20Your%20Building%20Blocks%20For%20Learn%20SaaS%20and%20Newer%20Learn%20Versions.html) 
  * [B2 development frequently asked questions](/learn/B2s/Java%2011%20for%20Learn%20-%20FAQ.html)
