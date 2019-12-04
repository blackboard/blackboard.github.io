# Authorize and Authenticate in Blackboard Collaborate
Blackboard Collaborate relies on JSON web tokens (JWT) to authenticate and
authorize incoming REST API calls. You can read more about the JWT standard
[here](https://tools.ietf.org/html/rfc7519). A JSON web token
can be signed with either RSA or HMAC. RSA allows the REST Client to sign the
JWT with public and private keys via x.509 certificates. HMAC allows the JWT
to be signed with a shared secret. Either way, the data can be trusted because
it is digitally signed with mutually known credentials.

Here is a very simple sample Python script that uses a correctly formed JWT
assertion to request an access token and then uses the access token to make a
single API request: https://github.com/ryanhaber/Blackboard-REST-SDK-python/blob/master/bb-collab-simple-sample-get-users.py.

## JWT Assertion

To get API access to Blackboard Collaborate, you must create a JWT assertion.
A JWT assertion is a JSON web token request for access. It includes:

  * header
  * payload
  * signature

The header and payload are each base64 encoded and the three parts are
separated with a dot, resulting in a token in this format:

encodedheader.encodedpayload.signature

and resembles the following:

```eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJteS1jb2xsYWItcmVzdC1rZXkiLCJzd
WIiOiJteS1jb2xsYWItcmVzdC1rZXkiLCJleHAiOiIxNDgwNDU3NzYzOTg4In0.7eElTSzDRfWaQlK
eVaMDJlN07-_dmNq7nRP82pm47kY
```

### JWT Header

The header is a JSON object with that identifies the algorithm used to
generate the signature and the type of token being created. In this example,
the application is signing the data with HMAC-SHA 256 and requesting a JSON
Web Token.

```
    {  
       "alg": "HS256",  
       "typ": "JWT"   
    }
```

To create the encodedheader part of the token, base64 encode this JSON.

### JWT Payload

The payload contains information about the calling application that uniquely
identifies the client to the REST server. Blackboard Collaborate REST APIs
require these pieces of information:

  * the issuer of the request, which is the Collaborate REST API key
  * the subject of the request, which must be the same as the issuer
  * expiration time of the assertion, expressed in UNIX epoch time, within 5 minutes of the time of the request

For example:

```
    {  
       "iss": "my-collab-rest-key",  
       "sub": "my-collab-rest-key",  
       "exp": "1480457763988"   
    }
```

Base64 encode the payload and append it to the based64-encoded header,
separated by a dot.

### JWT Signature

The signature is basically the string created above
(encodedheader.encodedpayload), signed using the algorithm specified in the
header and the REST API secret provided by Blackboard. The resulting string
must be appended to encodedheader.encodedpayload, separated with a dot.

## Building a JWT Request

To request an access, you must make a POST request to the Collaborate API
/token endpoint, like the following.
```
    POST /token?grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJteS1jb2xsYWItcmVzd  
    C1rZXkiLCJzdWIiOiJteS1jb2xsYWItcmVzdC1rZXkiLCJleHAiOiIxNDgwNDU3NzYzOTg4In0.7eElTSzDRfWaQlKeVaMDJlN0-_7dmNq7nRP82pm47kY
```

Also note:

  * Include a grant_type parameter. The grant_type must always be set to urn:ietf:params:oauth:grant-type:jwt-bearer in Collaborate requests. This grant_type and the assertion are added as query parameters to the Collaborate /token endpoint and requested as a POST.

Include a header using for content-Type which is set to form/urlencoded.

## Using the JWT Token

A properly formed POST to /token returns an access token. To authorize a
request to Collaborate, add this access token as a Bear token in your
request's authorization header. The authorization header will look like the
following.
```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0ODAzNzM2ODEsInN1YiI6ImJiQ29sbGFiQXBpIiwiaXNzIjoiYmJDb2xsYWJBcGkiLCJ0eXBlIjoxLCJjb25zdW  
    1lciI6IjkxRjA1RENEODhGQzQzRkMwMUY0NjI5MDEwQzNFQjc3IiwiaWF0IjoxNDgwMzczMzIxfQ.Vi7jejTo380R_DYWO202q3dvd0XYsQbmpFd3DCgku64  
```

## Additional Resources

JSON Web Tokens are a widely adopted standard in modern applications, and
thus, there are a ton of resources available for developers interested in JWT
beyond the scope of Blackboard Collaborate.

  * [JWT.io](https://jwt.io): This site is dedicated to assisting developers trying to build JWT-enabled applications. There is a debugger that allows you to manually input your secret and your header and payload and generate an assertion. There is also an extensive list of available libraries in multiple languages that handle the bulk of the JWT creation.
  * [RFC 7519](https://tools.ietf.org/html/rfc7519): This is the actual standard specification document.

