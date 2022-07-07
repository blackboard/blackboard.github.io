---
layout: post
title: "Migrating from LTI 1.0/1.1 to 1.3"
id: lti-migrating-from_11_to_13
categories: Standards
author: Eric Preston
---

# Migrating from LTI 1.0/1.1 to 1.3

### Overview

For the first time in LTI's history we need to handle migrating from one version to another. Before 1.3 the changes were all
additive, but with 1.3 the payload format and security model have changed significantly, so we need a way to
migrate existing LTI 1.1 (and 1.0) links to support the 1.3 format.

Note that Learn has never allowed two tools or applications to be configured in the same Learn instance with the
same fully qualified domain name (fqdn). This means that you cannot have both a 1.1 version and a 1.3 version of
a tool configured at the same time if they use the same fqdn.

If a tool provider wants to upgrade their tool to LTI 1.3/Advantage but not break all of an institution's existing links
then they will need to host their LTI 1.3/Advantage tool at the same fqdn.

In Learn we automatically upgrade the links for a tool when a Learn administrator deploys the 1.3 version of the tool.

At deployment time, if Learn sees there is an existing 1.1 tool registered with the same domain(s) as the 1.3
tool the admin is prompted to migrate the links. If they choose "yes" then we migrate ALL LTI 1.1 links to the
new LTI 1.3 application, effectively removing the LTI 1.1 domain configuration. The links remain and should work
fine if the tool developer has done their job correctly. The target_link_uri for the 1.3 tool is the same
as the launch URL defined in the LTI 1.1 placement or link.
