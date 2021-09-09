---
layout: post
title: "Configuring Ultra Extension Framework in Learn"
purple-text-title: "Configuring Ultra Extension Framework in Learn"
categories: Learn UEF
id: rest_apis-learn-uef-configure
---

# Configuring Ultra Extension Framework in Learn

The Ultra Extension Framework (UEF) encompasses a broad array of features and functionality, and as such, each UEF-enabled integration will have its own specific configuration settings. However, the setup process followed by a Blackboard Learn System Administrator leverages existing standard configuration workflows already in place. Adding a UEF-enabled integration to a Blackboard Learn environment requires a System Admin to make configuration changes to one or more of the following areas:

**REST API Integrations**: UEF-enabled integrations will need to be added as a REST API integration [Administrator Panel ⇨ REST API Integrations ⇨ Create Integration].

<img alt="Create a REST API Integration in Blackboard Learn" src="/assets/img/1RestAPIintegrations.png" width="50%" />

**LTI Tool Providers**: UEF-enabled integrations will need to be registered as an LTI Tool Provider. We recommend using LTI 1.3, though LTI 1.1 will work.

To register an LTI 1.3 tool:

[Administrator Panel ⇨ LTI Tool Providers ⇨ Register LTI 1.3 Tool]

To register an LTI 1.1 tool:

[Administrator Panel ⇨ LTI Tool Providers ⇨ Register Provider Domain]

<img alt="Register LTI Tool" src="/assets/img/2LTIToolProviders.png" width="50%" />

**New LTI Placement Type**: "Ultra extension"
As part of the Ultra integration framework development, it's necessary to define a way for Learn admins to register an Ultra integration and how the registered integrations are going to be loaded inside Ultra:
• We'll keep the current registration workflow for LTI 3rd party tools, but a new placement type will be added so that is possible to know when an LTI tool is expected to work as an Ultra UI integration.
• The new LTI placement type will be known as "Ultra extension" and such type will only be visible for Learn Ultra instances.

**NOTE**: When registering an LTI 1.1 Placement, you must include the following information:

- Tool Provider URL
- Tool Provider Key
- Tool Provider Secret

The Tool Provider Key and Tool Provider Secret would be the ones given by the devportal when the application is created and the Tool Provider URL must follow this format:

`https://example.provider.com/lti-launch?id=<PlacementId>&appkey=<Tool Provider Key>`

<img alt="Manage LTI Placements" src="/assets/img/3ManagePlacements.png" width="50%" />

<img alt="Create LTI Placement" src="/assets/img/4CreatePlacement.png" width="50%" />

Cross-Origin Resource Sharing: For UEF-enabled integrations that make direct calls to their Blackboard Learn instance's REST API will need be be configured via the Cross-Origin Resource Sharing (CORS) tool [Administrator Panel ⇨ Cross-Origin Resource Sharing ⇨ Create Configuration].

<img alt="Cross Origin Resource Sharing Configuration" src="/assets/img/5CORSSharing.png" width="50%" />
