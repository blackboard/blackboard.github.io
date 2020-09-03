---
layout: ally
title: Authorize and Authenticate in Ally as a Service
parent: ally
category: getting-started
tags: ['developer', 'rest', 'getting started', 'ally', 'api', 'jwt','json web token']
author: scott
---
# Authorize and Authenticate in Ally as a Service

Blackboard Ally as a Service relies on JSON web tokens (JWT) to authenticate and authorize incoming REST API calls. You can read more about the JWT standard [here](https:////tools.ietf.org/html/rfc7519). 

The JSON web token must be signed with HMAC. HMAC allows the JWT to be signed with a shared secret. The data can be trusted because it is digitally signed with mutually known credentials.

> **Note**: _To request these credentials, you will need to work with your Account Executive, who can request them on your behalf._

## JWT Assertion

To get API access to the Ally service, you must create a JWT assertion.
A JWT assertion is a JSON web token request for access. It includes:

  * header
  * payload
  * signature

The header and payload are each base64 encoded and the three parts are
separated with a dot, resulting in a token in this format:
```http
encodedheader.encodedpayload.signature
```

and resembles the following:
```http
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJteS1jb2xsYWItcmVzdC1rZXkiLCJzd
WIiOiJteS1jb2xsYWItcmVzdC1rZXkiLCJleHAiOiIxNDgwNDU3NzYzOTg4In0.7eElTSzDRfWaQlK
eVaMDJlN07-_dmNq7nRP82pm47kY
```

### JWT Header

The header is a JSON object with that identifies the algorithm used to
generate the signature and the type of token being created. In this example, the application is signing the data with HMAC-SHA 256 and requesting a JSON Web Token.

```json
    {  
       "alg": "HS256",  
       "typ": "JWT"   
    }
```

To create the encodedheader part of the token, base64 encode this JSON.

### JWT Payload

The payload contains information about the calling application that uniquely identifies the client to the REST server. The Ally as a Service REST APIs require these pieces of information:

  * **clientId** - holds the numerical value of your provided and unique Ally client ID
* **iat** - when the token was issued (seconds since epoch)

For example:
```json
    {  
       "clientId": "123",  
       "iat": "1480457763988"   
    }
```

Base64 encode the payload and append it to the based64-encoded header,
separated by a dot.

### JWT Signature

The signature is basically the string created above `encodedheader.encodedpayload`, signed using the algorithm specified in the header and the REST API secret provided by Blackboard. The resulting string must be appended to encodedheader.encodedpayload, separated with a dot.

## Using the JWT Token

A properly formed Ally as a Service API call will use this signed JWT as its bearer token. To authorize a request, simply add this token as a Bearer token in your request's authorization header. The authorization header will look like the following:

```http
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0ODAzNzM2ODEsInN1YiI6ImJiQ29sbGFiQXBpIiwiaXNzIjoiYmJDb2xsYWJBcGkiLCJ0eXBlIjoxLCJjb25zdW  
    1lciI6IjkxRjA1RENEODhGQzQzRkMwMUY0NjI5MDEwQzNFQjc3IiwiaWF0IjoxNDgwMzczMzIxfQ.Vi7jejTo380R_DYWO202q3dvd0XYsQbmpFd3DCgku64  
```

## Additional Resources

JSON Web Tokens are a widely adopted standard in modern applications, and
thus, there are a ton of resources available for developers interested in JWT beyond the scope of Ally.

  * [JWT.io](https://jwt.io/): This site is dedicated to assisting developers trying to build JWT-enabled applications. There is a debugger that allows you to manually input your secret and your header and payload and generate an assertion. There is also an extensive list of available libraries in multiple languages that handle the bulk of the JWT creation.
  * [RFC 7519](https://tools.ietf.org/html/rfc7519): This is the actual standard specification document.