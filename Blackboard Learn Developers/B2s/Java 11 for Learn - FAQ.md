---
layout: learn
parent: b2s
category: resources-b2
---

# Java 11 for Learn: FAQ

To address recent changes in Oracle’s Java support model, Blackboard Learn is transitioning to adopt a more recent version of Java, Java 11 Corretto JDK.  To find details regarding the targeted versions and release dates please review the [latest announcement details](8%20steps%20to%20prepare%20for%20Java%2011.html).

 

As with prior Java version changes, it is generally expected that Building Blocks will continue to work as-is. However, Java 9 onwards has significant changes to library management and class reflection which has required numerous changes to the Learn application.  To assist developers in updates to existing Building Blocks we are provided guidance through these frequently asked questions: 

 

1. **Will EVERY Building Block (B2) be required to be recompiled with Java 11?**

   * No, not every B2 will need to be recompiled. However, most B2s are highly likely to use one or more libraries that will require an upgrade with Java 11 (Ex. Spring).  In that case, a recompile is unavoidable.  
In scenarios where the libraries are both Java 8 and Java 11 compatible, a B2 compiled with Java 8 will continue to work with Java 11. 

2. **Aren't JDK/runtime backward compatible? Why the need to recompile?**

   * There is no need to recompile solely for the sake of runtime compatibility. The class files created by Java 8 are still executable in Java 11; however, there have been other changes in the Java runtime (library changes, etc.) that might require modification of the code. These modifications may be made in Java 8 and compiled with Java 8 making it compatible with the Java 11 runtime. 

3. **Will I have to upgrade any of the jars or libraries bundled with my B2 for Java 11?**

   * All jars and libraries will require an upgrade. If the B2 libraries and jars are not compatible with the Java 11 runtime used by Blackboard Learn, an upgrade is required. For example, some parts of Spring 4.5 are not compatible with Java 11.  If the B2 is dependent on Spring 4.5, an update will be required to ensure compatibility with Java 11 (Spring 5.1.x). 

4. **Can I reference the 3rd party libraries or jars that are bundled with the Blackboard Learn for my B2?**

   * Blackboard strongly recommends NOT referencing 3rd party libraries and jars, because Blackboard may be required to upgrade libraries or jars bundled within Learn for various reasons including security updates. These upgrades may deprecate or eliminate certain methods or classes breaking B2 dependencies. To prevent this, Blackboard recommends that a B2 includes its own copies of dependent jars.  

5. **Does installer detect JDK version (i.e. did Blackboard update to detect/require Java 11)?**

   * Yes, the Blackboard installer is updated with logic to detect the minimum version of the JDK11 runtime supported by the Blackboard Learn build place. 

6. **Will B2 developers or Self Hosted system administrators need to make environment changes? **

   * Only integrations involving command line invocation will need to make environmental changes. Scenarios invoking Java from a script would need to include the argument "--add-modules=ALL-SYSTEM" to prevent potential module related errors.  
   * Depending on the client installation, there could be risk of StackOverflow due to the size of the callstack resolving class files. Tomcat can be modified via bb-config.properties setting "bbconfig.max.stacksize.tomcat". Default minimum is 1M  

7. **What is the impact of switching to Corretto 11 distribution of OpenJDK?**

   * With our AWS partnership, we have a path to ongoing support for Java that isn’t limited by the OpenJDK support timeframe and is simpler than prior support contract processes.   
   * It will be fully supported by Amazon including distribution of security patches until at least August 2024 whereas the open source OpenJDK will stop receiving security patches after the 6-month release windows from the next major JDK release.  
   * It has been fully tested by AWS to ensure compatibility with the Oracle Java platform.  
   * It has been designed as a full drop-in replacement for all Java SE distributions.  
   * There should be very minimal impact in switching to Corretto distribution beyond installing the Corretto binaries on the server platform and making sure all applications are updated to include the path to the correct binary in their startup or launch scripts.  
   * Amazon uses Corretto internally which means added benefits from testing on thousands of Amazon services.  Issues found internally at Amazon should be fixed and released within days.  

8. **How can I avoid having to do frequent testing and recompiling of Building Blocks?**

   * As noted above, including copies of dependent libraries in the Building Block rather than referencing them in the Learn application will help. To avoid the overhead of maintaining Building Blocks through these frequent library changes, we encourage you to also consider our ever-expanding support for LTI and REST APIs to determine when it would appropriate for you to transition your solution to these integration frameworks that aren’t impacted by library changes. The LTI/REST framework has the added benefit of being supported across all Learn deployments and UX options enabling your integration to also be Ultra ready. 