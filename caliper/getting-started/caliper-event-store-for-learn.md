---
layout: post
title: "Caliper Event Store in Learn"
categories: Standards Caliper Getting Started
id: caliper-gs-caliper-event_store_in_learn
author: Scott Hurrey
---

# Configuring Caliper Event Store in Learn

Learn was the first Learning Management System to be certified for
Caliper Learning Analytics. Caliper is an IMS Global standard that allows a
provider, in this case Learn, to stream usage data to an external system. This
data contains things like login and out events, content views, assignment
submissions, and even grading events. The standard defines a specific format
providing a self-contained JSON document that gives the ingestor all of the
information needed to understand who performed what action on what system to
what outcome. The following document describes how to enable an external Event
Store in Learn.

If you are self-hosted, you will need to make a configuration change in order
to use Caliper. In bb-config.properties, you must set
bbconfig.cloud.telemetry.aws.region=us-east-1 and run PushConfigUpdates for
the setting to take affect. For UK clients, the data transfer to us-east is
protected under the requirements as set forth in GDPR.

As a user with Administrator privledges, login to Learn and access
the System Administrator area. In the original experience, this is a tab
across the top. If in the Ultra experience, this will be available in the left
hand navigation panel.

![select-building-blocks-from-building-blocks-module.png](/assets/img/caliper-event-store-for-learn-1.png)

On the subsequent page, select installed Tools.

![select-installed-tools.png](/assets/img/caliper-event-store-for-learn-2.png)

From the Manage Building Blocks page, navigate through the paging tools until
you see the 'Telemetry' Building Block. Using your mouse, hover to the right
of the Building Block's title to show the context menu. Click the context menu
icon and select 'Settings' from the menu.

![select-settings-from-the-telemetry-building-block-context-menu.png](/assets/img/caliper-event-store-for-learn-3.png)

On the Settings page, you will notice two entries. Caliper Providers is to
review external Caliper Providers that are feeding Caliper events into Learn.
If you are a Kaltura client running on a SaaS deployment of Learn,
you will likely see Kaltura here. This is how the Kaltura Student Usage Report
is populated. For this document, we are focused on Caliper Event Stores. Click
the corresponding link.

![select-caliper-event-stores.png](/assets/img/caliper-event-store-for-learn-4.png)

On this screen, you can see all of the currently registered Event Stores. You
will likely only see one entry on this page, similar to the last URL in this
example. This is Learn's internal event store, used to power the Student
Activity Reports. The top entry in our example is a custom Event Store, used
to capture the Learn events as they are streamed. It is important
to note that the internal event store is not accessible externally. As a
client, you must enable your own custom event store and capture the data there
if you want access to it. It is also important to note that Caliper Providers
that send data to Learn like Kaltura are not included in the
caliper event stream. Any caliper providers on your campus should write
directly to your event store.

![select-add-event-store.png](/assets/img/caliper-event-store-for-learn-5.png)

1. Service URL - This is the full URL to the Caliper Ingestion Service i.e.
   `https://mydomain.edu/caliper`

2. API Key - This is a value that is included with every Caliper Event
   transmission. Your Event Store should know this value and use it to validate
   the message as authentic. It can also be used to differentiate between
   multiple Caliper Providers. Highly recommended that this value is a true UUID.

3. Generate API Key - Use this button to have Learn automatically
   generate a true UUID for the API key if you have not already done so.

4. Event Batch Size - The Telemetry Building Block captures a lot of
   information. The Event Batch Size allows you to specify how many messages to
   compile before sending. Once it the batch size is reached, a single HTTP
   message will be sent with an array of caliper events.

5. Active - Essential Admin toggle to make the Event Store active or inactive.

6. Submit/Cancel - Click Submit to save.

![fill-out-the-event-store-registration-form.png](/assets/img/caliper-event-store-for-learn-6.png)

<p>As soon as you enable your event store, it will start to recieve events. Your
event store should be a fully-hardened data warehouse. There is a ton of data
and no way to filter the data you receive on the Learn server. You
can certainly filter out the data that you want, but you will have to be able
to process all of the incoming messages and have ample space and processing
power to store the data and run reports against it. If you want more
information about what types of data is included, check out the rest of this
space for documents tagged for caliper.</p>
