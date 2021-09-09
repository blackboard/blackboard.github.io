---
layout: post
title: "LTI Events"
id: caliper-events-lti_events
categories: Standards
author: Scott Hurrey
---

# LTI Events

Blackboard Learn's Caliper Analytics stream emits an LTIEvent when any user:

- **Clicks an LTI link**
- **Returns from an LTI link**

Here is some of the key data that is associated with these events:

### LTIEvent

**actor.@id** - contains a unique ID of the user (the ID is known to Bb)

**extensions** - contains a tag called **bb:user.externalId** with the batch_uid for the user

**object.launchUrl** - URL of the LTI Provider

**object.launchParameters** - name/value pairs passed

**group.courseNumber** - the course batch_uid (i.e. the ID sent in by LIS or Data Integration)

**action** - LoggedIn, LoggedOut

### Sample Payload

```json
{
  "@context": [
    "http://caliper.blackboard.com/ctx/caliper/v1/Context",
    "http://purl.imsglobal.org/ctx/caliper/v1p1"
  ],
  "type": "http://caliper.blackboard.com/caliper/v1/LTIEvent",
  "id": "6b495fe6-cdd9-459a-aa1f-39e4979b87f5",
  "actor": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
    "type": "Person",
    "extensions": {
      "bb:user.id": "_1_1",
      "bb:user.externalId": "administrator"
    }
  },
  "action": "LoggedIn",
  "object": {
    "@context": [
      "http://caliper.blackboard.com/ctx/caliper/v1/Context",
      "http://purl.imsglobal.org/ctx/caliper/v1p1"
    ],
    "type": "http://caliper.blackboard.com/caliper/v1/LTILaunchInfo",
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/ltiLaunches/d0b8a363-7484-4ee6-b458-0f0e0ce5f05f",
    "name": "",
    "description": "",
    "launchUrl": "https://ltiah.herokuapp.com/launch_lti",
    "launchParameters": {
      "tool_consumer_instance_contact_email": "admin@support-ultra-test.blackboard.com",
      "tool_consumer_info_product_family_code": "BlackboardLearn",
      "oauth_signature_method": "HMAC-SHA1",
      "tool_consumer_info_version": "3900.4.0-rel.14+d8ea606",
      "oauth_signature": "PEPikqcsphXcnKe/WQajV2VDNcQ=",
      "launch_presentation_document_target": "window",
      "lti_message_type": "basic-lti-launch-request",
      "custom_caliper_profile_url": "https://support-ultra-test.blackboard.com/learn/api/v1/telemetry/caliper/profile/ultra",
      "ext_launch_id": "d0b8a363-7484-4ee6-b458-0f0e0ce5f05f",
      "lis_person_sourcedid": "administrator",
      "ext_lms": "bb-3900.4.0-rel.14+d8ea606",
      "lis_person_name_family": "Administrator",
      "custom_caliper_federated_session_id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/sessions/0356052DAA966AA071787F54DBFEB1B1",
      "lis_person_name_full": "Blackboard Administrator",
      "context_label": "Ultra Ltiah_herokuapp_placement",
      "oauth_consumer_key": "mykeyagain",
      "user_id": "ffc08009f0884c059192bac549e117b2",
      "launch_presentation_return_url": "https://support-ultra-test.blackboard.com/webapps/blackboard/execute/blti/launchReturn?launch_id=d0b8a363-7484-4ee6-b458-0f0e0ce5f05f&link_id=ultra&launch_time=1608831491592",
      "oauth_version": "1.0",
      "resource_link_id": "ultra",
      "custom_tc_profile_url": "https://support-ultra-test.blackboard.com/learn/api/v1/lti/profile?lti_version=LTI-1p0",
      "oauth_callback": "about:blank",
      "lis_person_contact_email_primary": "noreply@blackboard.com",
      "roles": "urn:lti:sysrole:ims/lis/Administrator",
      "tool_consumer_instance_name": "Blackboard, Inc.",
      "launch_presentation_locale": "en-US",
      "context_title": "Ultra Ltiah_herokuapp_placement",
      "tool_consumer_instance_guid": "82ef1947e5974e559156e8a6c8c2ea79",
      "lis_person_name_given": "Blackboard",
      "oauth_timestamp": "1608831491",
      "lti_version": "LTI-1p0",
      "ext_launch_presentation_css_url": "https://support-ultra-test.blackboard.com/common/shared.css,https://support-ultra-test.blackboard.com/themes/as_2015/theme.css",
      "context_id": "_41_1",
      "oauth_nonce": "171815513849839",
      "tool_consumer_instance_description": "Blackboard, Inc."
    },
    "customParameters": {},
    "extensions": {}
  },
  "eventTime": "2020-12-24T17:38:11.660Z",
  "edApp": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/applications/learn",
    "type": "SoftwareApplication",
    "extensions": {
      "bb:request.headers.ipAddress": "186.28.208.123"
    }
  },
  "federatedSession": {
    "startedAtTime": "2020-12-24T17:38:11.660Z",
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/sessions/0356052DAA966AA071787F54DBFEB1B1",
    "type": "LtiSession",
    "name": "0356052DAA966AA071787F54DBFEB1B1",
    "dateCreated": "2020-12-24T17:38:11.660Z",
    "user": {
      "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/users/ffc08009f0884c059192bac549e117b2",
      "type": "Person",
      "extensions": {
        "bb:user.id": "_1_1",
        "bb:user.externalId": "administrator"
      }
    }
  },
  "extensions": {},
  "session": {
    "id": "https://caliper-mapping.cloudbb.blackboard.com/v1/sites/a118bba8-5378-4533-899b-8862ac59db03/sessions/0356052DAA966AA071787F54DBFEB1B1",
    "type": "Session"
  }
}
```
