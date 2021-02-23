---
layout: post
title: "Authorize and Authenticate in Ally"
purple-text-title: ""
id: ally-authorization
categories: Ally
author: Scott Hurrey
---
# Authorize and Authenticate in Ally as a Service

Blackboard Ally as a Service relies on JSON web tokens (JWT) to authenticate and authorize incoming REST API calls. You can read more about the JWT standard [here](https:////tools.ietf.org/html/rfc7519).

The JSON web token must be signed with HMAC. HMAC allows the JWT to be signed with a shared secret. The data can be trusted because it is digitally signed with mutually known credentials.

> **Note**: _To request these credentials, you will need to work with your Account Executive, who can request them on your behalf._

### JWT Assertion

To get API access to the Ally service, you must create a JWT assertion.
A JWT assertion is a JSON web token request for access. It includes:

  * header
  * payload
  * signature

The header and payload are each base64 encoded and the three parts are
separated with a dot, resulting in a token in this format:

~~~ http
encodedheader.encodedpayload.signature
~~~

and resembles the following:
~~~ http
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJjbGllbnRJZCI6ImFsbHktY2xpZW50LWlkIiwiaWF0IjoxNjAwMTc0MTM3fQ.
jh0tox209FPdI2TPMgIt6v2lQZLu9OGOnRs7KxJ6mLY
~~~

### JWT Header

The header is a JSON object with that identifies the algorithm used to
generate the signature and the type of token being created. In this example, the application is signing the data with HMAC-SHA 256 and requesting a JSON Web Token.

~~~ json
    {
       "alg": "HS256",
       "typ": "JWT"
    }
~~~

To create the encodedheader part of the token, base64 encode this JSON.

### JWT Payload

The payload contains information about the calling application that uniquely identifies the client to the REST server. The Ally as a Service REST APIs supports two types of payloads:

1. A payload that identifies the caller as a service holding the secret key. This will permit all actions to be undertaken against the Ally as a Service REST APIs. Required parameters are:
  * **clientId** - holds the numerical value of your provided and unique Ally client ID
  * **iat** - when the token was issued (seconds since epoch)<br />
For example:
~~~ json
    {
       "clientId": "###",
       "iat": "1480457763988"
    }
~~~
2. A payload that identifies a narrow set of of permissions that the holder can execute. This is useful for when you want to delegate _some_ access to the Ally as a Service REST APIs to a third party (e.g. a user of your own service) but don't want them to be able to execute other actions (such as uploading new content). Required parameters are:
  * **clientId** - holds the numerical value of your provided and unique Ally client ID
  * **iat** - when the token was issued (seconds since epoch)
  * **policy** - a set of statements that explicitly grant which resources and actions the token holder has access to. See [Policies](/ally/auth#policies) for more details.<br />
  For example, the following policy allows the holder to request the format related information and request an alternative format:

~~~ json
{
  "clientId": "###",
  "iat": "1480457763988",
  "policy": {
    "statements": [
      {
        "resource": "content:a1b2c3d4e5f6",
        "actions": ["content:getDetails:WithFormats", "content:getFormat"]
      }
    ]
  }
}
~~~

Base64 encode the payload and append it to the based64-encoded header,
separated by a dot.

### JWT Signature

The signature is basically the string created above `encodedheader.encodedpayload`, signed using the algorithm specified in the header and the REST API secret provided by Blackboard. The resulting string must be appended to encodedheader.encodedpayload, separated with a dot.

## Using the JWT Token

A properly formed Ally as a Service API call will use this signed JWT as its bearer token. To authorize a request, simply add this token as a Bearer token in your request's authorization header. The authorization header will look like the following:

~~~ http
    Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
    eyJjbGllbnRJZCI6ImFsbHktY2xpZW50LWlkIiwiaWF0IjoxNjAwMTc0MTM3fQ.
    jh0tox209FPdI2TPMgIt6v2lQZLu9OGOnRs7KxJ6mLY
~~~

### Policies

Ally as a Service supports fine-grained permissions by defining a policy that explicitly allows which resources a user has access to and what actions they're allowed to execute. A policy consists out of one or more statements expressing what resources and actions the user is allowed to interact with. These resources and actions are defined using namespaced strings.

#### Resources

Ally as a Service identifies the following resources:

 * **content:hashId** - A single piece of content identified by the hashId
 * **content:*** - All content uploaded into Ally as a Service

#### Actions

Ally as a Service identifies the following actions:

 * **content:upload** - Allows the holder to upload content to Ally
 * **content:getStatus** - Allows the holder to request the processing status for an uploaded piece of content
 * **content:getDetails** - Allows the holder to retrieve basic information for a piece of content
 * **content:getDetails:withFeedback** - Allows the holder to retrieve the feedback information for a piece of content
 * **content:getDetails:withFormats** - Allows the holder to retrieve the alternative formats information for a piece of content
 * **content:getFormat** - Allows the holder to request an alternative format for a piece of content

#### Policy statements

A policy statement identifies which action(s) can be invoked on which(s) resources.

For example, the following statement would allow for retrieving the procesing status of an uploaded piece of content:
~~~ json
{
  "resource": "content:a1b2c3d4e5f6",
  "action": ["content:getStatus"]
}
~~~

Note that a colon indicates the start of a new part in the namespace. It is possible to use a wildcard asterisk _*_ to widen the resource or action. For example, the following statement would allow for retrieving the procesing status of all content items:
~~~ json
{
  "resource": "content:*",
  "actions": ["content:getStatus"]
}
~~~

This can be done for both the resource or action string. For example, the following statement would allow for executing all content related actions on all content related resources. Note how the actions array has a second item as the wildcard only applies to one part of the namespace.
~~~ json
{
  "resource": "content:*",
  "actions": ["content:*", "content:*:*"]
}
~~~

### Additional Resources

JSON Web Tokens are a widely adopted standard in modern applications, and
thus, there are a ton of resources available for developers interested in JWT beyond the scope of Ally.

  * [JWT.io](https://jwt.io/): This site is dedicated to assisting developers trying to build JWT-enabled applications. There is a debugger that allows you to manually input your secret and your header and payload and generate an assertion. There is also an extensive list of available libraries in multiple languages that handle the bulk of the JWT creation.
  * [RFC 7519](https://tools.ietf.org/html/rfc7519): This is the actual standard specification document.