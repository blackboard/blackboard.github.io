---
layout: blog
title: Use One-Time Session Token to Authenticate with UEF
date: 2021-05-10 16:13
category: blog
post_id: 20210511-uefnocookies
author: Scott Hurrey
tags: ["uef", "ultra", "lti", "rest"]
summary: As browsers continue to lock down cookies, particularly with iframes, there is a new way to handle authentication with the Ultra Extension Framework.
---

# Use One-Time Session Token to Authenticate with UEF

In testing with the [Google Canary Chrome Browser](https://www.google.com/chrome/canary/), one of our clients discovered an issue that was blocking users from logging in to their Blackboard Learn instance. After much troubleshooting, we discovered a multi-layer issue that brings us to, you guessed it, [cookies](https://docs.blackboard.com/blog/2020/10/15/Cookies-and-Browsers).

> **This affects clients in SaaS with Ultra Base Navigation enabled using Ultra integrations that rely on UEF**

Here is a brief description of the contributing factors:

First, the client had built a custom Ultra login page. The page included code designed to ensure that Learn login pages would never render inside of an iframe within Learn. It looks like this:

```
if ( top != self )
{
    top.location.replace( self.location.href );
}
```

In and of itself there's nothing wrong with it. We, at Blackboard, have removed it from the default Ultra login page, but many clients use it in Original login pages, and so it's moved with them into Ultra.

> If you are unsure whether you have a custom login page, visit [help.blackboard.com](https://help.blackboard.com/Learn/Administrator/SaaS/User_Interface_Options/Ultra_Experience/Institution_Branding/Customize_the_Login_Page) for more information.

Secondly, when a user logged in, Ultra Extensions automatically fired off an LTI launch to UEF-enabled tools. The way UEF works is: after the LTI launch is validated, the tool redirects to the Learn REST endpoint to initiate a UserAuth flow. In our documentation, we call this a Three-Legged OAuth or [3LO](https://docs.blackboard.com/learn/rest/getting-started/3lo). In most cases, it's a process that relies on a session cookie to hold everything together. This impending release of Chrome (and other browsers) will block this cookie because everything is happening across domains and involves the use of iframes.

So what happens is that, even though the integration is configured in Learn to not force the end-user to authorize the integration, the lack of the session cookie means that Learn has no idea that this user is logged in, so it pops open the login page.

Remember that code snippet above in the custom login page? Well, that takes over the entire browser page with the Learn login. And when the user logs in again, it renders the JavaScript meant for the UEF iframe into the page. In other words, it overtakes your Learn browser session. There is no way to actually get past that screen.

Related, this same issue affects Safari users when [cross-site tracking is disabled](https://support.apple.com/guide/safari/prevent-cross-site-tracking-sfri40732/mac).

## So what can you do?

Well, that depends upon who is reading this blog. If you are an administrator trying to get your users back in Learn, the most immediate fix is to remove that snippet from your login page. It won't fix your broken UEF integration, but it will at least let your users log in and interact with Learn.

If you are a developer that has built a UEF integration, we actually implemented a fix for this in April: a way to bypass the need for a session cookie in this process. In the LTI launch, we now provide what is called a one-time session cookie. This is present in both LTI 1.1 and 1.3 launches.

If you are using LTI 1.3, there's a small bug in this. I will share a workaround that will both get around this bug, but not fail when the bug is fixed.

This one-time session cookie is added to the claims in the LTI 1.3 JWT and the form POST parameters in LTI 1.1. You can grab that value from the LTI launch, return it as a parameter in your 3LO authorization code request, and your problem will be solved.

### LTI 1.3

In LTI 1.3, you will see the value in the `https://blackboard.com/lti/claim/one_time_session_token` claim. This token is made up of a specially generated token value. It should also be followed by a comma and the user's UUID. The bug is that the comma is missing. Luckily, the user's UUID is the sub token in the same set of LTI claims. We intend to fix this, but to ensure your code works both now and after the fix, you can simply look for the comma. If it's not there, append it and the sub and you will be off and running. Here's a Python 3 code snippet to illustrate how this might look. We will be updating our UEF sample code, but at the time of this writing, we have not done so.

```
    # Get the value of the one time session token from the LTI claim
    one_time_session_token  = message_launch_data['https://blackboard.com/lti/claim/one_time_session_token']

    # If there is no comma in the value, we've hit the bug. Add it and the user's UUID
    if "," not in one_time_session_token:
        one_time_session_token += "," + message_launch_data['sub']

    # Add the one_time_session_token to the query parameters to send to the Authorization Code endpoint
    params = {
        'redirect_uri' : Config.config['app_url'] + '/authcode/',
        'response_type' : 'code',
        'client_id' : Config.config['learn_rest_key'],
        'one_time_session_token' : one_time_session_token,
        'scope' : '*',
        'state' : str(uuid.uuid4())
    }

    # Encode the parameters
    encoded_params = urllib.parse.urlencode(params)

    # Redirect the successful LTI validation to the Authorization Code endpoint
    return(redirect(learn_url + '/learn/api/public/v1/oauth2/authorizationCode?' + encoded_params))
```



### LTI 1.1

By now, I hope you are using LTI 1.3, but I know many are not. As a result, we also added a one-time session token to LTI 1.1 launches. This will come in the form POST parameter `ext_one_time_session_token`. Just like in the 1.3 example, your application should take this value from the LTI launch, append it to the authorization code request endpoint as `one_time_session_token=that_token` and redirect them to the authorization code endpoint.

## Summary

We have validated this fix with one of the partners that was affected. If you are a developer, please fix the issue immediately! If you are an administrator of a Learn SaaS instance using Ultra, and you have UEF integrations, make sure you do not have that JavaScript snippet on your login page. And if you do, please remove it. Then let your UEF integration partners and developers know that this fix must be made as soon as possible.

Regardless of whether you are an administrator or a developer, please feel free to reach out to us at developers@blackboard.com with any questions.

Happy coding!
