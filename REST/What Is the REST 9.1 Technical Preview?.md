# What Is the REST 9.1 Technical Preview?
The REST 9.1 Technical Preview is an effort to get the Blackboard Learn REST
Framework into the hands of as many developers as possible. Think of it as an
early test version of the REST Framework for Learn 9.1 self-hosted and
managed-hosted customers. This Technical Preview is the chance to try the APIs
out, see how they work, what use cases are met, and provide Blackboard with
feedback.

We have thoroughly tested the REST API framework against Learn SaaS and do not
anticipate issues with Learn 9.1 SH/MH, but we have not conducted the same
level of testing on Learn 9.1 SH/MH and bugs may surface during use.
Therefore, we do not recommend that you run REST APIs against your production
system at this time. We will provide notification when production use is
acceptable.

For more information you may want to read about [how the REST API Framework
works](https://community.blackboard.com/docs/DOC-1733-the-blackboard-rest-api-
framework).

**What is it about the REST API Technical Preview that Makes the APIs Un-suitable for Production Use?**

_They May Contain Bugs_

As we noted above, we took precautions to ensure a positive experience with
the release of the REST API Technical Preview on Learn 9.1 SH/MH; still some
issues may surface as the result of customers putting the APIs through their
paces.

_Learn 9.1 REST API TP Related Bug Fix Schedule_

The REST APIs are updated per Learn SaaS cadence which is significantly faster
than that of Learn 9.1 SH/MH. Also, in some cases, changes to core Learn code
is necessary to support an API. In an effort to simplify delivery and support
of Learn 9.1 SH/MH you can expect that REST API Technical Preview related bugs
will be fixed in subsequent Learn releases.

_Learn Enterprise REST API Feature Schedule_

The REST APIs will be updated for Learn 9.1 SH/MH during Major Releases only.
If after testing the REST APIs you require a more aggressive API change
management schedule you may consider upgrading to one of the Learn SaaS
Platforms.

_The APIs May Change_

The REST APIs are still in an early form and based on feedback and technical
requirements may change prior to final release.

_REST API Use Will be Monitored_

In order to best determine API usage and maintenance requirements we collect
data on the APIs being called and any generated errors. We do not collect data
that is sent as part of the API request nor do we collect data contained in
any response to a request.

**How to Use the REST API Technical Preview Properly**

If you’re still interested in trying the REST APIs, below are some pointers
for how to best participate.

_Test Your Applications Against the Developer Virtual Machine (DVM)_

The DVM is the perfect test environment while you are developing your
prototype or experimenting with the REST APIs. We have tools available which
allow you to quickly populate the DVM with data for testing purposes.

_Test Your Applications Against a Test Install of Learn_

After you have prototyped your REST Application using the DVM you may continue
testing with your TEST environment which may contain a more “real world”
representation of your Learn data.

_**We do not recommend that you run REST APIs against your Production system
at this time.**_

**And Most Importantly: Provide Feedback**

While Blackboard will have data on what APIs are being used, any feedback you
provide on how those APIs function and API Use Cases helps us make decisions
regarding API design as we move forward. Blackboard shall have a royalty‐free,
worldwide, perpetual license to use or incorporate into Blackboard’s products
or services any suggestions, ideas, enhancement requests, feedback,
recommendations or other information provided by you.

Feedback may be provided via developer area of Blackboard Community in the
[REST Technical Preview discussion
forum](https://community.blackboard.com/thread/1930), an email to
[developers@blackboard.com](mailto:developers@blackboard.com), or in the case
of a bug, a support case filed Behind the Blackboard.

