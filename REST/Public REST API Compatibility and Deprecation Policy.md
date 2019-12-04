# Public REST API Compatibility and Deprecation Policy
*Author: Ryan Haber*
*Categories: []*
*Tags: ['developer']*
---
  * Compatibility
    * Backward compatibility
    * Stable URIs
      * HTTP Response Codes
      * Parameters and Data
      * Canonical URIs
    * Stable representations
    * Structured representations (application/json)
    * Values Not Included in Compatibility Policy
  * API versioning
    * Version Increments
    * Forward compatibility
  * Deprecation
    * Deprecation Policy
    * Announcements
    * Time frames
    * Detectability
    * Implementing API Deprecations
  * Best Practices

# Compatibility

## Backward compatibility

Wherever possible, we will maintain backward compatibility for REST resources
and their representations.

An API is backward compatible if a program written using one version of the
API will continue to work the same way without modification when using future
versions of the API.

If we need to change a representation so that it is not backward compatible,
we will create a new resource or media type using the new representation. In
such cases, we will maintain the old resource or media type according to the
deprecation policy described below. Such a change to a representation of a
resource constitutes a version increment to the corresponding REST API(s). We
may change the behavior of an API without warning if the existing behavior is
incorrect or creates a security vulnerability.

## Stable URIs

If a resource exists at a particular URI, that same resource will continue to
exist with the same meaning in future versions.

### HTTP Response Codes

  * We do not change the meaning of HTTP response codes. For example, if a URI that used to return a 200 response returns a 404, you can know that the response indicates that the resource cannot be found, and not that the resource has been moved to another location.
  * We may add HTTP response codes when modifying a resource to refine availability or error responses. Such additions will not change the meaning of success or basic failure responses such as 200, 400, or 403 responses.
  * We may change a resource to return a "redirection" response code, e.g., 301 or 302, instead of returning the resource itself. Your client must handle HTTP-level redirects, and respect HTTP headers such as _Location_. The target resource for any redirect will be backward compatible with the original resource.  

### Parameters and Data

  * If a resource begins to support more query parameters in future versions they will not be mandatory. The absence of a field value or a default value as appropriate behave as in prior versions.
  * If a resource accepts a representation, e.g., by POST or PUT, it will continue to accept the same representation in future versions. Any new fields that are accepted in a resource will not be mandatory. The default value assumed in their absence will maintain the previous meaning of the resource.

### Canonical URIs

  * The canonical URI of a resource used in _self_ links or used by other resources to point to the resource may change.

## **Stable representations**

If we document a resource as available in a specific media type, e.g., using
the Content-Type header, we will keep it available using that media type. If a
resource returns a default media type in the absence of content negotiation,
we will maintain that default.

## **Structured representations (application/json)**

We further commit to the stability of resources with a media type of
_application/json_.

  * We will maintain backward compatibility for key:value pairs in JSON objects. We will use the same name and return the same value type.
  * If the value of a field is an array, the type of the contents of the array will not change.
  * If the value is an object, that object will meet the same compatibility guarantees as the document as a whole:
    * We may add new key:value pairs to a representation at any time, but the new pairs will not alter the meaning of existing pairs.
  * If a field exposes a URI, the resource identified by that URI will maintain the same compatibility guarantee.
  * We may add new values to the enumerations at any time, but new values will not change the documented field default values, if any exists.

## Values Not Included in Compatibility Policy

The following are not covered by this compatibility policy:

  * Resource and [rate limits](https://community.blackboard.com/docs/DOC-4258-developer-groups-site-quotas-and-rate-limits).
  * default and maximum sizes of paged data
  * default sorting behaviors

The above items are not part of the API. They may change without warning. It
is your responsibility to adhere to limits and behaviors as described in the
API documentation or the developer community.

Structured representations of paged data and sorting behavior in API responses
follow the policies described in the "Structured Representation" section of
this document.

#

# API versioning

## Version Increments

Our APIs do not tag responses with their version number. The version is part
of the URL used to call the API. We increment version numbers only for REST
API endpoints affected by a particular change. The "expected" or "preferred"
version of an API end-point is always the highest version of the endpoint. The
existence of a higher-versioned endpoint implies that we have deprecated some
aspect of the previous version of the endpoint or associated resource. Once a
newer version of an API endpoint becomes available, we will mark any prior
versions of the endpoint as deprecated. If we deprecate an API version, we
will follow the policy laid out below.

## Forward compatibility

We make no guarantee of forward compatibility in our REST APIs. These non-
binding guidelines about our approach to forward-compatibility may help you
plan your projects.

An API is forward-compatible if a program written using one version of the API
will also work the same way without modification when using previous versions
of the API.

Where appropriate, we follow the Robustness Principle. This means that in some
cases, an API determines how to handle a request based only on the parts that
it recognizes. There are some notable exceptions.

  * Blackboard Learn ignores request query parameters that it does not recognize.
  * Property fields of structured data submitted via mutative requests that are not recognized by the server result in a 400 response. This includes fields deprecated in prior versions of an API.

# Deprecation

## Deprecation Policy

This REST API deprecation policy is to be understood in conjunction with any
other relevant deprecation policies. When there is a conflict of policy, the
most restrictive policy applies.

## Announcements

We make every effort to notify consumers about new deprecations through all
relevant channels. This includes:

  * Deprecation and "since" annotations in REST API swagger docs
  * Announcements on the developer community portal

## **Time frames**

We will give developers the longest possible notice of deprecations to
publicly accessible REST APIs. We maintain deprecated REST APIs in their
original forms for at least 1 year. Deprecations take effect with the
Blackboard Learn semi-annual releases for self-hosted and managed-hosting
customers. Exceptions to this policy apply in case of critical security
vulnerabilities or functional defects.

## **Detectability**

Requests made to deprecated APIs return a header with the response to notify
the consumer that the endpoint is deprecated. We use the warning header
_Warning: 299 - 'Deprecated API; @since version'_. For more information, see [
https://tools.ietf.org/html/rfc7234#section-5.5](https://community.blackboard.
com/external-link.jspa?url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7234).

## Implementing API Deprecations

For details related to the mechanics of deprecating Learn REST APIs please
email [developers@blackboard.com](mailto:developers@blackboard.com).

# Best Practices

  * You should not assume any constraints unless they are mentioned in the documentation. That is, even if the documented example is a number, you should not assume that the only possible response types are numeric unless so noted in the docs.
  * If a field property is not declared as mandatory in the API documentation, do not assume it will be present in responses.
  * Log the occurrence of any 299 response codes and periodically review the logs to plan for future app maintenance

