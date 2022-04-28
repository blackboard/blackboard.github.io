---
layout: post
title: "pyLTI1p3"
id: lti-tutorials-pylti1p3
categories: Standards
author: Scott Hurrey
---

# Using the pyLTI1p3 Library with Blackboard Learn

LTI 1.3 is a much better, much more secure option for integrating one application with another in a standard way. Python is an industry-standard language and is in use by many Blackboard institutions for building integrations. 
The purpose of this document is to demonstrate how to use the [pyLTI1p3](https://pypi.org/project/PyLTI1p3) library, built by [Dmitry Viskov](https://github.com/dmitry-viskov) to easily integrate a Python 
application with Blackboard Learn's Ultra Experience. For the purposes of this demonstration, we will use Dmitry's [pylti1.3 flask example](https://github.com/dmitry-viskov/pylti1.3-flask-example).

### About The Project

The Flask sample is a simple way to test all the LTI Advantage capabilities of any platform that supports it. Essentially, the application is a brick breaker type game. It uses a basic launch to load the game. 
It uses the Names and Roles Provisioning Service to load a leaderboard, it uses the Assignments and Grades Service to save your score, and you can use Deep Linking to create links to the game with varying degrees of difficulty. 
Best of all, with a few minor configuration changes, this project works with Blackboard Learn out of the box!

## Getting Started

As with any project, the first step is to clone the project to your local desktop. To do this, simply open a terminal, navigate to the directory you wish to clone the application to, 
and type `git clone https://github.com/dmitry-viskov/pylti1.3-flask-example.git`. If you are interested in making changes, you should fork the repo to your own account, and clone from there.

### Setting Up Learn

#### Developer Portal 

Now that we have the project cloned locally, we need to register the application for use with Learn. We do this via the [developer portal](https://developer.blackboard.com). 
For more information on this process, check out this [document](/rest-apis/learn/getting-started/registry). Once you have an account set up, you can simply register a new application. 
You will be prompted to enter several pieces of information. For this project, here is what we need to enter:

| Field                | Description                                                                                                                                                           | Example                                                                                      |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Application Name     | You can enter anything you like, but this name will display in Learn                                                                                                  | `Py LTI 1.3 Game`                                                                            |
| Description          | This is a free-form field. You can enter anything you like.                                                                                                           | `A brick-breaker-style game written by Dmitry Viskov to demonstrate LTI Advantage in Python` |
| Domain(s)            | This should be the domain you plan to host the tool from. We use heroku, in our example. This requires some additional code changes, documented [here](#using-heroku) | `pylti1p3-game.herokuapp.com`                                                                |
| Login Initiation URL | This is the URL that Learn will use to launch into your application to begin the OIDCLogin process                                                                    | `https:pylti1p3-game.herokuapp.com/login/`                                                   |
| Tool Redirect URL(s) | The URL to redirect to upon successful completion of the OIDC Login                                                                                                   | `https:pylti1p3-game.herokuapp.com/launch/`                                                  |
| Tool JWKS URL        | The publicly accessible URL to the tool's public key. We do not use this in this project, so we will leave it blank and let the portal generate our private key        |
| Signing Algorithm    | The cryptographic algorithm used to sign the JWT. Leave this as RS256                                                                                                 |
| Group                | The developer group to associate with the integration. Here is more information on [groups](/rest-apis/learn/admin/groups-quotas-rates)                               |

Once you fill out this form, click the `Register application and generate API key` button, and you will be prompted with several pieces of information. You will only see this once, so make sure you save the data somewhere. 
Click `Done` to take you back to the applications page.

We have one more step to go. Next to the name of your game, click the ellipsis `...` icon to launch the context menu and select `Manage Placements`. Click the `Register` button.
In the `Name` field, give the placement a name that you want to display to the instructor.
In the `Desciption` field, type anything you like. Under `Type`, select `Deep Linking content tool`.
Under `Target link URI`, enter the launch URL to your tool. In our case it is `https://pylti1p3-game.herokuapp.com/launch/`. 
Now click `Register placement`, and we are ready to deploy the tool in Blackboard Learn.

#### Learn System Admin

Now that we have our application registered, we have to tell our Learn instance that we have an application we want to integrate. To do this, you will need administrator privileges. 
Navigate to your Learn server in your browser and login as an appropriate user. Click the `Admin` link in the Ultra Base Navigation to access the System Administrator panel. 
In the `Integrations` module, click the link for `LTI Tool Providers`. Then in the menu bar, click `Register LTI 1.3 Tool`. You are prompted for a Client ID. 
In the data you received from the developer portal, there was an Application ID. In LTI, this is your Client ID, and we will need it here. Paste in your Client ID and click submit. 
Learn will reach out to the Developer Portal, verify your Client ID and then display a form with all the settings available. Many of these settings are read-only. 
We need to save the `Deployment ID`, make sure the tool is marked as 'Approved', and be sure to enable memberships and posting of grades. Then click submit.

Our game is now installed in Blackboard Learn!


### Setting Up The Tool

There are four files we need to modify in our tool in order to run it. In the repository you cloned to your desktop, you will see a configs directory.

#### game.json

In `game.json`, you will already see a section for Blackboard. It will look like this:

```json
"https://blackboard.com": {
    "client_id": "your client id",
    "auth_login_url": "https://developer.blackboard.com/api/v1/gateway/oidcauth",
    "auth_token_url": "https://developer.blackboard.com/api/v1/gateway/oauth2/jwttoken",
    "key_set_url": "https://developer.blackboard.com/api/v1/management/applications/<your client id>/jwks.json",
    "key_set": null,
    "private_key_file": "private.key",
    "deployment_ids": ["your deployment id"]
}
```

The Blackboard URL is the _Issuer_ sent in the LTI launch JWT. This is always the value in Blackboard Learn. The value for `client_id` should be set to your client ID (application ID from the Developer Portal). 
The `auth_login_url` and `auth_token_url` settings are always the same, and do not need to be changed. The `key_set_url` is always the same, as well, 
though it contains your client ID, so you will need to replace `<your client id>` with, you guessed it, your client ID. The _deployment ID_ that you received when you registered your tool in learn 
goes in the `deployment_ids` setting. Save this file.

#### Private/public key pair

You need to generate your own private/public key pair in RSA format. There are many online tools or command-line tools to do this.
The next file we need to modify is the `private.key` file, also in the configs directory. Delete the current contents, and paste the private key you generated.
You should put your public keyi in the `public.key` file.
Last, you'll need to convert your public key to the JWK format and put that in the public.jwk.json file.

We are now ready to run our code! The final step is to deploy the Game application to the server it will run on and run `python game/app.py`.

### Using Heroku

If you are planning to run this on Heroku, there are a few additional changes that need to be made before you deploy your code. First, Heroku needs to know what to do when your code is committed. Enter `Procfile`. 
Simply create a file named `Procfile` at the root level of the game, and in it place:

```python
web: python game/app.py
```

Now save this file.

Next, open up game/app.py. At the very bottom of the page, you will see an entry that looks like this:

```python
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9017)
```

Heroku controls the ports that your application runs on, and setting it incorrectly renders your application useless. Furthermore, it can change from deploy-to-deploy. 
As such, we need to pull the port number from environment variables. To do so, replace the code above with the code below:

```python
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 33507))
    app.run(host='0.0.0.0', port=port)
```

Lastly, app.py is in the game directory rather than the root directory, so we need to make a few small adjustments. Towards the top (around line 27), you will see the Flask app being initialized:

```python
app = Flask('pylti1p3-game-example', template_folder='templates', static_folder='static')
```

We need to account for the directory we are running in, and add the path to this declaration:

```python
app = Flask('pylti1p3-game-example', template_folder='game/templates', static_folder='game/static')
```

And finally, we need to make sure our application can find the LTI configuration file. Around line 65, you will see a method called `get_lti_config_path` and it will look like this:

```python
def get_lti_config_path():
    return os.path.join(app.root_path, '..', 'configs', 'game.json')
```

Make it look like this:

```python
def get_lti_config_path():
    return os.path.join(app.root_path, 'configs', 'game.json')
```

And that's it. You can now check in your code to your Heroku dyno - `git push -u heroku master` - and Heroku will build and run your application. Once its complete, you can run `heroku logs --tail` 
to see the communication between Learn and our game.

## Running The Game From Learn

Now that all the setup is done, we are ready to play our game. As a user in a course with Instructor privileges, login to Blackboard and navigate to your Ultra course. 
In the left-hand navigation, you will see a link to `View course & institution tools`. Click this link. In teh corresponding peek panel, click the link to `Browse all course tools`. 
Under the _Institution Tools_ header, you will find the placement we created. It will be listed under the `label` you defined when creating the placement. 
Click this link, and you will be launched via LTI to a simple form that allows you to select the difficulty of the game you wish to play. 
Click the button for your selected difficulty, and the tool will automatically create a link to the game with the selected difficulty in your course outline.

> **NOTE**: If you selected 'Launch in a new window' when you created the placement, you will have to refresh the course outline before you will see the content item.

You should now have a content item called `Breakout <your selected difficulty> mode!`.

#### Click it to play!

In the background, the tool uses the Names and Roles Provisioning service to create a leaderboard with the course members. 
Further, it uses the Assignments and Grades Service to store your latest score. Pretty fancy, right?
