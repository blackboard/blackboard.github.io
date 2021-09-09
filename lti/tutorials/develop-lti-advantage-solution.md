---
layout: post
title: "Developing an LTI 1.3/Advantage"
id: lti-tutorials-develop_lti_advantage
categories: Standards
author: Mark Bykerk Kauffman
---

# Developing an LTI 1.3/Advantage Solution - Recordings and Resources

### Caveat

Deleting a registered LTI domain and/or the associated managed placements from the Administrator Panel -> LTI Tool Providers page will invalidate all of the associated LTI launch links in courses. The data will be gone from the database. There is no way to fix this. NEVER delete a registered domain or managed placements without considering these consequences. If you create an LTI 1.3 Tool that uses the same domain as a currently registered LTI 1.1 tool on a Learn system, there is code in Learn that will prompt you to migrate from LTI 1.1 to LTI 1.3. Generally that's a great option. Finally, only very brave people make changes on a production system without testing first on a test or staging system. We recommend you be more cautious than brave.

### Webinars

NEW!! During DevCon 2020 Eric Preston presented the following on developing an LTI 1.3/Advantage solution. This is a must-watch if you are starting out on your LTI 1.3/Advantage journey. Or, if you have questions, you will likely find the answers here. [Watch this recording.](https://bbdemo.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=f2b32ac9-1789-4639-9139-abfb0029c0e2) Here are the [slides](/assets/files/DevCon20LTIWorkshop.pdf)

On April 10, 2019, Eric Preston, Blackboard's resident LTI expert, spoke with us in Technical Office Hours. He gave us an overview of LTI technology. [Watch recording the recording in Bb Collaborate.](https://us.bbcollab.com/collab/ui/session/playback/load/53618fbbef8b45628ff9b18f407d7456)

On May 1, 2019, Eric followed up with another, deeper dive into coding an LTI integration. [Watch the recording in Bb Collaborate](https://us.bbcollab.com/recording/e193c6cb59cb4ed1a776c271665d4154). [This is the associated slide deck.](https://slack-files.com/TFA153DM0-FJFEJH8NB-fbe304b473))

Here is the sample code referenced in the presentations: https://github.com/blackboard/BBDN-LTI-Tool-Provider-Node
