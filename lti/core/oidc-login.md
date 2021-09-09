---
layout: post
title: "Handling OIDC Login"
id: lti-core-launch-oidc_login
categories: Standards
author: Eric Preston
---

# Handling OIDC Login

### Overview

The Open ID Connect 3rd-party-initiated login is the first step in handling an LTI 1.3 launch.

From Blackboard Learn you will receive a GET request to the URL you registered in the developer portal when you registered your application. The handling of this request is straight forward, but you'll need to note a couple of things.

1. You will receive and lti_message_hint as a URL parameter. You must send it back unaltered.
2. We do send the client_id and lti_deployment_id on the request, but note they are not required by the specification.
3. We strongly recommend you create a `state` parameter value and send that with your response, and store that locally so it can be verified on the subsequent launch request. This is how you prevent CSRF attacks. Note, that Safari currently doesn't support sending 3rd party cookies back if you are hosted in an iframe.

### Sample

Some sample code in Node.js is below:

```
exports.oidcLogin = function(req, res) {
  const state = uuid.v4(); // save this locally, such as in a cookie; optional in the OIDC spec
  const nonce = uuid.v4(); // Used to prevent playback
  const client = // You'll need to determine the client ID for this request from parameters on the request
  const redirectUri = // Get the Redirect URI for this client
  const oidcAuthUrl = // The URL you were given for this client when you registered your application

  let url =
    oidcAuthUrl +
    "?response_type=id_token" +
    "&scope=openid" +
    "&login_hint=" +
    req.query.login_hint +
    "&lti_message_hint=" +
    req.query.lti_message_hint +
    "&state=" +
    state +
    "&redirect_uri=" +
    encodeURIComponent(redirectUri) +
    "&client_id=" +
    clientId +
    "&nonce=" +
    nonce;

  res.redirect(url);
};
```
