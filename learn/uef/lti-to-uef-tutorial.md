---
layout: post
title: "Migrate an LTI Tool to UEF"
purple-text-title: "Migrate an LTI Tool to UEF"
categories: Learn UEF
author: Scott Hurrey
id: learn-uef-gs-tutorial-lti
---

# Tutorial: Migrate a Python LTI Tool to Ultra Extension

In this tutorial, we will be taking a basic Hello World LTI tool, and through various steps, create an Ultra Extension Framework integration, that opens a panel when a particular content item is clicked, and provides a button that allows the user to communicate back to Ultra to request that the panel be closed.

We will be using Python 3 and Flask for this exercise, but most of the work is done in Javascript that can be used with any language.

To get started, you will need to have Python installed, and you will need to clone the [tutorial repository](https://github.com/blackboard/BBDN-UEF-Python).

```
git clone https://github.com/blackboard/BBDN-UEF-Python.git
```

There are 5 branches:

* **Master**: The base LTI tool
* **1-LTI-TO-UEF**: This is the installation of the plumbing that allows you to begin your UEF integration
* **2-UEF-MESSAGECHANNEL**: In this branch, we implement all of the javascript we need to create a message channel for your application and Ultra to begin talking
* **3-UEF-PANEL**: This code implements the panel functionality
* **4-UEF-LOCALSTORAGE**: Implement localStorage to allow your embedded Javascript to pass information from Ultra to the rest of your application and vice versa

We will use **Docker** and **ngrok** for this demonstration. This allows us to run an LTI tool from our local desktop without the requirement of deploying to an internet-accessible service. This is also a great way to build and test your own applications.

If you prefer to watch videos, each step below has a video. You can also view the entire [Ultra Extension Framework - YouTube Tutorial Series](https://www.youtube.com/watch?v=Mp9tFpultaQ&list=PLbewGw29xjRa2ZQ7gs3CgisvBVvyuKhsR).

## Preparing the development environment

This section will help you set up your development environment and ensure that you are ready to participate in this tutorial.

### Step 1: Install ngrok.io

We will need a way to host our UEF integration on our desktop so we don't have to deploy to a third party server every time. Ngrok makes this extremely easy. You will need to follow these steps. Below is a video to help with the process.

<iframe width="361" height="268" src="https://www.youtube.com/embed/Mp9tFpultaQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. Go to [https://ngrok.io](https://ngrok.io)
2. Sign up for a free account if you don't already have one and login
3. Download the installer for your system [https://ngrok.com/download](https://ngrok.com/download)
4. Visit [https://dashboard.ngrok.com/get-started/setup](https://dashboard.ngrok.com/get-started/setup) and copy your authtoken
5. If on Mac, expand ngrok into your applications folder and add the application folder to your path. If on Windows, expand, create a folder to put ngrok.exe in, and [add that folder to your windows Path system variable](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/).
6. In a terminal cd to your ngrok directory and enter `$ ngrok authtoken <your authtoken>`
7. Start a tunnel on port (5000): `$ ./ngrok http 5000 --hostname uef.ngrok.io` 

> **NOTE**: Do not close your terminal - it must stay open while you are using the TLS connection.

### Step 2: Register your LTI Application in the Developer Portal

The next step is to register our application. Notice that we don't have any code yet. But we do know what our endpoints will be, and the developer portal doesn't really care about your code. It is simply a centralized repository that allows you to register your application once and deploy to any Learn instance. We are the only LMS that provides this centralized registration process. 

> At 2:07 of the video there is discussion of not entering a JWKS URL, leaving that field blank, and having Learn generate a private key for you. The developer portal will no longer allow that. You will need to enter a JWKS URL of ```https:<yourfqdn>/jwks/``` You will need to generate your own public.key and private.key file for your tool's use.

<iframe width="361" height="268" src="https://www.youtube.com/embed/E4PDgQxE5Tg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. Browse to [the developer portal](https://developer.blackboard.com)
2. If you do not have an account, register for one. The password restrictions are crazy, so be sure to read them before creating your password to save yourself some time and frustration.
3. Login to your account
4. Under My Apps, click the + icon to create a new application.
5. Give your application a name
6. Give your application a description
7. Under domain, simply add uef.ngrok.io. If you are using the shared system, we will provide shared credentials, as the system will not allow you to create multiple providers with the same domain.
8. Click the toggle to expand the LTI 1.3 fields
9. Leave the group as is
10. For the Login Initiation URL, enter `https://uef.ngrok.io/login/`. Note the trailing slash. This is required by Flask.
11. For the Tool Redirect URL, enter `https://uef.ngrok.io/launch/`. Note the trailing slash. This is required by Flask.
12. For the Tool JWKS URL, enter `https://uef.ngrok.io/jwks/`. This is a required update from what is shown in the video.
13. Leave the signing algorithm as is
14. Click 'Register application and generate API Key'

> **NOTE** Leave this page open for the duration of this tutorial or save the information in a text file. Once you leave this screen, you will not be able to retrieve the private key or the application secret.

### Step 3: Clone the repository

The next step is to clone the repository. You do not need a github account for this.

<iframe width="361" height="268" src="https://www.youtube.com/embed/rpUuUpK8MtQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. Navigate to [https://github.com/blackboard/BBDN-UEF-Python](https://github.com/blackboard/BBDN-UEF-Python), click the green code button, and copy the URL.
2. Open a terminal and navigate to the directory you wish to place the project in.
3. At the command-line, type: `git clone https://github.com/blackboard/BBDN-UEF-Python.git`
4. Open this project in your favorite IDE
5. In the app directory, there is a file called `ConfigTemplate.py`. Copy this file and paste it into the app directory. Rename it to `Config.py`. This **IS** case-sensitive.
6. Replace learnURL with the URL to your Learn instance, without the `https://`
7. Replace restKey with your REST application key.
8. Replace restSecret with your REST application secret.
9. Replace myUrl with the https ngrok link created in step 1. Include the `https://`
10. Save the file
11. In the app directory, there is a file called `lti-template.json`. Copy this file and paste it into the app directory. Rename it to `lti.json`. This **IS** case-sensitive.
12. Replace both instances of clientId with your application ID.
13. Save the file.
14. In the app directory, generate files called `private.key` and `public.key`. These **ARE** case-sensitive.
Example: On an *NIX* system with openssl installed do the following.
```
openssl genrsa -out private.key 2048
openssl rsa -in private.key -pubout -out public.key
```
16. Create a directory outside of your project, and copy these four files, Config.py, lti.json, public.key and private.key, and paste them there to prevent accidental loss of these files so you don't have to recreate them later.

### Step 4: Configure your Learn environment

Now that we have our registration complete, and our application mostly configured, we need to deploy our application to Learn. Again, if you are using the shared system, we will have already done this for you. That information will be displayed at the bottom of this document.

<iframe width="361" height="268" src="https://www.youtube.com/embed/vdXw3sztpz8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. Login to Learn with Admin credentials
2. Open the Admin panel
3. Click on LTI Tool Providers
4. Click on Register LTI 1.3 Tool
5. Paste your application ID and click submit
6. From the resulting screen, change the radio button from Exclude to Approve.
7. Copy your deployment Id.
8. In your IDE, open the lti.json file, and replace deploymentId with this value and save the file
9. Back in Learn, click submit.
10. From the context menu next to your application, select Manage Placements
11. On the Manage Placements screen, click create placement
12. Give the placement a label. This is how your tool will be referenced in the user interface.
13. Provide a handle. This must be unique across this Learn instance.
14. Ensure Availability is set to Yes
15. If you wish, you can add an icon file. This should be 50x50 and a PNG or JPG.
16. In the Tool Provider URL field, enter `https://uef.ngrok.io/launch/`. Be sure to include the trailing slash. This is required by Flask.
17. Click submit.
18. Return to the System Admin panel.
19. Click REST API Integrations
20. Click Create Integration
21. Paste your application ID in the application ID field
22. Assign a user. Because we are using three-legged oauth, the user you assign does not have to have any specific entitlements.
23. Ensure End User Access is set to Yes. This allows the use of three-legged oauth
24. Set Authorized to Act as User to Yes. In normal circumstances, we would leave this as Service Default. For UEF, the user won't be able to authorize the application, so we are preemptively disabling this requirement.
25. Click Submit.

### Step 5: Install Docker Desktop

For ease of use, we will be using Docker. This will create the environment for us the same way every time, allowing us to focus on the code. It is Python code, so you can use ngrok and run directly on your machine, or you can push the code to a cloud repository, but in this tutorial, we will assume that you are using Docker.

<iframe width="361" height="268" src="https://www.youtube.com/embed/siGD6-FX2uw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)

**Note**: If you are installing Docker Desktop on Windows 10, you will need to be sure Virtualization is configured correctly. [This article](https://docs.docker.com/docker-for-windows/troubleshoot/#virtualization) will help you get things configured correctly. Of note are that virtualization must be enabled in your bios, and with Windows Linux System 2, you must [install the linux kernel manually](https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package).

### Step 6: Test the application

<iframe width="361" height="268" src="https://www.youtube.com/embed/NmFLNAYwFOw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. Get the deployment ID from Learn
2. Add the deployment id to the lti.json file in your project and save it.
3. Open a terminal, cd to the directory where you cloned the application, and type: 
   `docker build -t uef-tutorial:0.1 .`. Note the period at the end.
4. This creates your image. Now let's run it. From the terminal, type: 
   `docker run -p 5000:5000 --name UEFTutorial uef-tutorial:0.1`
5. Open your Docker Desktop Dashboard to inspect that the UEFTutorial app is running
6. Browse to https URL provided by ngrok and you should see a message that the application is running.
7. Now open Learn, navigate to a course.
8. In the course outline, click the + icon and select content market.
9. Find the placement we created, and click the + icon to add it to your course outline.
10. Click the new content item. You should see your hello world message.

### Troubleshooting

If for some reason you get an error loading the site there are a few things to check:

* Ensure the tool is properly installed in Learn
* If you see an error similar to the one below - check your Dockerfile syntax - especially those gnarly double and single quotes:

```
ERROR: yaml.parser.ParserError: while parsing a block mapping
in "./docker-compose.yaml", line 14, column 1
expected <block end>, but found '<scalar>'
in "./Dockerfile", line 16, column 34
```

If you need to re-deploy, open docker desktop's dashboard, and click the garbage bin icon to delete the image, and then run the build and run docker commands again.

## Let's Code

Now that we have our development environment set up and configured, its time to get to work! A couple of notes to help you navigate this tutorial.

* Each step has a branch. You can use git checkout -b <branchname> to get the code for that branch.
* Don't forget to update the contentId in steps 3 and 4 to point to your content item.


### Step 1: Build a UEF shell

In the first step, we will make a few minor changes to our LTI tool the create an Ultra Extension Framework shell running in our Learn instance!

<iframe width="361" height="268" src="https://www.youtube.com/embed/6AcBJkJkgYY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Step 2: Set up communication

Next we will add to our javascript file to set up a message channel between our iframe and the Ultra UI, authorize the application using our REST Bearer Token, and subscribe to the events we want Ultra to notify us of.

<iframe width="361" height="268" src="https://www.youtube.com/embed/YFW-C_bJcjs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Step 3: Create a peek panel

Now we have a functioning Ultra Extension running, so let's do something with it. In this case, we are going to create a content item, and then listen for a user to enter a course and click on that item. When the item loads, we will open a peek panel. Remember our Hello World that we started with in our LTI tool? Well now we are displaying that same hello world in a peek panel inside of Ultra!

> Don't forget to change the contentId in the code to point to your content item.

<iframe width="361" height="268" src="https://www.youtube.com/embed/VcSpyZBehJU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Step 4: Implement localStorage

Cool, right? But let's put the finishing touches on this thing. We might need data in the rest of our application that only our javascript file has. We also might need a way for the rest of our application to talk to Ultra. Enter localStorage. Local Storage is a way to store things in memory that is accessible in your browser. Since all of our components are running in the same browser, we can use this to pass information around. In our example, we will take data from the message that Ultra sends us, pass it to our app, and display it in our hello world app. In addition, we will add a button to our hello world page that sends a message to our javascript file, asking Ultra to close the panel for us.

> Don't forget to change the contentId in the code to point to your content item.

<iframe width="361" height="268" src="https://www.youtube.com/embed/bvfD_Hnf2So" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Summary

I hope you found that fun and enlightening. As always, if you have questions, comments, or concerns, reach out to us at [developers@blackboard.com](mailto:developers@blackboard.com) and let us know!

-Happy Coding