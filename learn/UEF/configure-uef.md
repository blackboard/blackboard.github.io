---
layout: learn
parent: uef
category: uef-getting-started
---

# Configuring an Ultra Extension Framework Integration in Learn

The Ultra Extension Framework (UEF) encompasses a broad array of features and functionality, and as such, each UEF-enabled integration will have its own specific configuration settings. However, the setup process followed by a Blackboard Learn System Administrator leverages existing standard configuration workflows already in place. Generally speaking, adding a UEF-enabled integration to a Blackboard Learn environment requires a System Admin to make configuration changes to one or more of the following areas:

REST API Integrations: Most UEF-enabled integrations will need to be added as a REST API integration [Administrator Panel ⇨ REST API Integrations ⇨ Create Integration].

<img alt="Diagram" src="/images/1RestAPIintegrations.png" width="50%" />

LTI Tool Providers: Most UEF-enabled integrations will need to be registered as an LTI Tool Provider [Administrator Panel ⇨ LTI Tool Providers ⇨ Register Provider Domain/Register LTI 1.3 Tool]. In addition to the existing "Course tool", "Course content tool", "System tool", and "Administrator Tool" type options, some UEF integrations may also utilize the new “Ultra extension” LTI Placement Type option.

<img alt="Diagram" src="/images/2LTIToolProviders.png" width="50%" />

New LTI Placement Type: "Ultra extension"
As part of the Ultra integration framework development, it's necessary to define a way for Learn admins to register an Ultra integration and how the registered integrations are going to be loaded inside Ultra:
•	We'll keep the current registration workflow for LTI 3rd party tools, but a new placement type will be added so that is possible to know when an LTI tool is expected to work as an Ultra UI integration.
•	The new LTI placement type will be known as "Ultra UI integration" and such type will only be visible for Learn Ultra instances.

<img alt="Diagram" src="/images/3ManagePlacements.png" width="50%" />

<img alt="Diagram" src="/images/4CreatePlacement.png" width="50%" />

Cross-Origin Resource Sharing: For UEF-enabled integrations that make direct calls to their Blackboard Learn instance's REST API will need be be configured via the Cross-Origin Resource Sharing (CORS) tool [Administrator Panel ⇨ Cross-Origin Resource Sharing ⇨ Create Configuration].

<img alt="Diagram" src="/images/5CORSSharing.png" width="50%" />



