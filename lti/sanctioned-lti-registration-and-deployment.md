---
layout: post
title: "Anthology Sacntioned LTI Registration and Deployment with Learn"
id: sanctioned-lti-registration-deployment
categories: Standards
author: Mark Kauffman
---

# Sanctioned LTI Registration and Deployment with Learn

## Motivation

At Anthology we want our clients to have the best possible experience with Learn and the products that are integrated with it. To that end we developed a central registration service on our developer portal for use by 3rd-party vendors that are LTI 1.3 Tool providers. Using the central registration service, the Tool provider can go through the complexities of Tool registration and get a Client ID. That Client ID is all our mutual clients need to deploy a Tool. When the Tool is deployed a Deployment ID is generated that the client then provides the Tool vendor. The Client ID and Deployment ID are included in all LTI 1.3 communication, giving the Tool everything needed to identify the client's LMS. Reference [LTI Registration and Deployment](/lti/lti-registration-and-deployment).

## Why Vendor Tool-registration Is Best
Why do we only sanction vendor Tool registration? First, the vendor owns the Tool, hence it should be their responsibility to manage it. Second, there are about nine pieces of information to exchange during the registration process. Those are vendor specific settings, and the client doesn't need to be aware of any of those. Third, and especially important, should the vendor need to change any details about their Tool, if they own the registration, they can change it in a one-time action on their registration for all clients with negligible impact on our mutual clients. If the vendor has requested the client register the vendor Tool, then every client will need to make the changes on the central registration system. This latter option is error prone and likely to produce Tool downtime for our mutual clients. 

Hence, a Tool vendor can always design their system and processes so that our mutual clients never have to register a Tool on the central registration service. Two limited exceptions apply: 

1. Unique Client Subdomains or a unique Login Initiation URL: In this case the vendor provides a unique subdomain and/or a unique Login Initiation URL for each client's Tool. In all other cases, the vendor can always take responsibility for registration of the Tool, get the Client ID and provide that with their documentation. Then the client can provide the Deployment ID to the Tool vendor, by whatever means, a self-service portal, email, etc. after deploying the Tool. 

2. On-premise deployments: In this case the vendor provides an installable extension to their product which the client must install on-premise. In this case it is required that the client registers the application and installs it. 

The bottom line is that having the vendor register their Tool(s) to get Client ID(s) and having our mutual clients simply deploy their Client ID in exchange for a Deployment is the best process. But, if a vendor believes that it’s necessary for clients to register an LTI Tool, then clients are free to do so, while knowing that said vendor can likely make the process easier and simpler. We ask that the vendor talk to us and consider improving their architecture and processes to make our mutual clients work easier on deployment. And again, for REST Applications or for LTI Applications using REST APIs, the client should never register except in the case that the client owns, hosts, and manages the REST Application on-premise.  

## tl;dr
For LTI 1.3 only integrations the best client experience is given by a vendor when the vendor registers on the Anthology central registration portal and shares the client_id with the client. There are other processes that involve the vendor asking the client to register the LTI-1.3-only integration. While not ideal, that’s OK, as long as the integration is not using the associated REST API key/secret. 