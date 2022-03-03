---
layout: post
title: "Mapping Entitlements to Privileges"
id: rest_apis-learn-getting-started-entitlements
categories: Learn REST
author: Scott Hurrey
toc: true
---

# Bookmarklet To Help Map Entitlements To Permissions

One of the most difficult aspects to using the REST API is mapping the entitlements in the swagger documentation at developer.blackboard.com to the permissions available in the UI for creating a system role. Using this custom javascript bookmarklet makes this a lot easier. Here is the code:

```
javascript:(function()%7Bif('jQuery'%20in%20window)%7Blet%20showUids%3D(jq)%3D%3E%7Bjq('tbody%23listContainer_databody%20%3E%20tr').each((i%2Ctr)%3D%3E%7B%20var%20val%20%3D%20jq('input%5Btype%3Dcheckbox%5D'%2C%20tr).prop('value')%3B%20jq('th'%2C%20tr).append('%3Cdiv%3E%3Ci%3E'%2Bval%2B'%3C%2Fi%3E%3C%2Fdiv%3E')%3B%20%7D)%7D%3Blet%20ws%3D%5B%5D%3Bws.push(window)%3Blet%20ifr%3DjQuery('iframe').prop('contentWindow')%3Bif(ifr)%7Bws.push(ifr)%3B%7Dws.forEach((w)%3D%3E%7BshowUids(w.jQuery)%3B%7D)%3B%7D%7D)()
```

Simply create a new bookmark in your browser, paste this code in, and save it.

So what will this do for you? Essentially, this code searches the current webpage looking for checkbox input tags. It finds the value of that checkbox and displays this on the screen. In the context of the privileges page that you use to set permissions for a user role, this value is equal to the entitlement.

Here is a screen shot of that page before running this script:

![a screen shot of system role privileges before running the bookmarklet](/assets/img/privileges-without-entitlements.png)

And here is a screen shot after running this script:

![a screen shot of system role privileges after running the bookmarklet](/assets/img/privileges-with-entitlements.png)

As you can see the entitlement is now listed under the role. So now you can simply find the entitlement you are looking for in swagger, and ctrl-f/cmd-f to search for it here. Much easier than before.

As a side effect, you can use this on any page in Blackboard Learn and get useful information. As an example, search for courses or user, and now you can use this script to find out the objects pk1 value.
