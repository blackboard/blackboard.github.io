# Register Developer Instances to the Cloud
*Author: Scott Hurrey*  
*Categories: []*  
*Tags: ['rest', 'blackboard learn', 'developer virtual machine', 'saas', 'developer portal', 'java8', 'cloud connector', 'developer']*  
<hr />
You must register developer instances of Blackboard Learn to the Blackboard
cloud. This is true of both developer virtual machines (DVM) that you host
locally and AWS cloud-based instances created from the Blackboard Learn AMI.
Use the following steps to register your DVM or AMI.

To register your developer instance to the Blackboard cloud:

Do not select **Move to Production** in the DVM or AMI without guidance to do
so from Blackboard's developer experience team.

  1. Log into your developer instance as Administrator. You may be greeted with an first-time user message. You can select **Close** or refresh the page to close it.
  2. Select **System Admin**.
  3. Select **Cloud Connector** under _Cloud Management_.
  4. Provide a **Display Name**.
  5. Select an **Instance Type**. For most development work, select **Development**.
  6. Select a **Regional Cloud**. This one-time choice indicates the AWS region with which you want to associate your developer instance. Your choice is permanent and irrevocable.
  7. Select **Save and Retry** to save the configuration and connect to the Blackboard cloud. In some cases, the developer instance of Learn throws an error explaining that it could not connect to the Blackboard cloud. This behavior is expected. Ignore it.

###

If you are working with a developer virtual machine (DVM) rather than an AMI,
you may need an SSL connection to register successfully. In these cases, you
receive an error message like the following:

![Screen+Shot+2016-04-24+at+10.50.13.png](/images/92928.png)

If you see this error message, try connecting to the Virtual Machine at
[https://localhost:9877](https://localhost:9877/) and following the steps
above. This should allow you to register to the cloud and then you should be
able to use it in non-SSL mode.

