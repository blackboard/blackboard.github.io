# Working With The New Developer Documentation

With the recent Community Site transition from Jive to Personify, the necessity to migrate the Developer Documentation became critical. Personify did not offer the tools for content creation, organization, and curation that we required. After vetting several options, we made the decision to host Blackboard Developer Documentation using Github pages. You can now view all current documentation at https://docs.blackboard.com.

With this change, the process for working with the documentation has changed. The purpose of this document is to show the processes by which we create, update, and delete developer documentation in its new home. In addition, there are new steps required to wire new documents into the navigation flow. We will cover that here, as well.

## About
All developer documentation now lives in a [public repository in github](https://github.com/blackboard/blackboard.github.io). This allows anyone to submit new documentation or edit existing documentation via Pull Request. Now, rather than just a handful of Blackboarders, anyone with a github account can contribute. 

In addition, all documents are now written using Github Markdown, a much more user-friendly language than html. This allows one not only to be able to easily format documentation, but it also allows you to edit files firectly in the Github user interface. Using [Jekyll](https://jekyllrb.com/) in conjunction with Github Pages to dynamically create static documentation also makes publishing painless. This process is kicked off automatically whenever a commit is made to the master branch on Github. 

Jekyll, in conjunction with [Bundler](https://rubygems.org/gems/bundler) to run the full documentation suite locally. This is ideal in order to test your document before pushing it to production. 

## Setting Up Your Local Development Environment

In order to work on documentation locally, you just need to do a few things. First, you should fork the repository to your own repository. This can be done most easily through the Github interface. Once you have your own repository, you just need to prepare your local environment.

1. Clone the repository to your desktop. This is as simple as navigating to a command prompt and typing `git clone <your repo>.git`. If you already have this repo cloned, be sure to use git pull instead to ensure you are starting with the most current files.
2. Install Jekyll and Bundler, following the steps listed [here](https://jekyllrb.com/docs/).
3. Now you can run this is continuous mode, by simply typing `bundle exec jekyll serve` at the command prompt. This will continue to run and automatically rebuild the site as you make and save changes. The site will be available at http://localhost:4000.

**Note**: If you are on MacOS, you have a default Ruby installed. Jekyll and Bundler require Ruby, but a new version of Ruby that MacOS provides. If you are on a Mac, you can issue the following commands in a terminal session to work around this:

 ``` 
    brew install tree
    brew install rbenv ruby-build
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    source ~/.bash_profile
    rbenv install 2.7.0
    rbenv global 2.7.0
    gem install jekyll bundler
```

## Making Changes to Existing Documents

This is easy. Just find the document in the folder structure and edit it as you would any other Markdown file. The documents are organized in the following structure:

* **Top-Level**: This is all the files that are served on the landing page and common UI
* **collab**: All Blackboard Collaborate Documentation
* **connecttxt**: All Blackboard ConnectTxt Documentation
* **bbd**: All Blackboard Data Developer Documentation
* **dvba**: All documentation related to Developer Versions of Blackboard Applications 
* **learn**: All documentation related to Learn APIs overall
* **learn/B2s**: All Building Block documentation
* **learn/REST**: All LEarn REST API documentation
* **learn/SOAP - Deprecated**: All SOAP Web Services Documentation
* **mobile**: All documentation for Blackboard Mobile applications
* **openlms**: All Documentation for Blackboard OpenLMS
* **standards**: All documentation related to Blackboard's Standards Support
* **images**: All images, referenced from documentation as /images/<image file name>
* **attachments**: All attachments, referenced from documentation as /attachments/<attachment file name>

Simply edit the file, save your changes, and commit to your forked repository. Now you can use the built-in tools available in Github to issue a pull request. This request will be reviewed by the Developer Relations and Standards team and merged, as appropriate.

## Adding New Documents

Adding new documents is a bit trickier. There are some settings that need to be added to the top and some changes necessary to wire those documents into the navigation workflow. Both of these things are done via YAML. We will not accept new documents at the top-level, except on very specific cases, so this document will only cover adding new documents to an existing category.

Creating a document is pretty simple. Add a new Markdown (.md) file into the appropriate folder. For our purposes, we will call this document `new document.md`  and we will create this document in the `learn/REST` section. At the top of the, there are a few YAML settings required in order to tell Jekyll how to render the page. These settings must also match what is in the corresponding YAML file in the `_data` directory. So we will start with the YAML file itself.

Each section (Learn, OpenLMS, Standards, etc) have its own corresponding file. This file is meant to organize the documentation into categories and topics. In our example, we want to add `learn/REST/new document.md` to the Getting Started section. Let's take a look at an excerpt to see what the learn.yml file looks like:

```
  - name: Learn
  link: /learn/Integrate%20with%20Blackboard%20Learn.html
  parentId: learn
- name: REST
  link: /learn/REST/Getting%20Started%20With%20REST.html
  parentId: rest
  categories:
    - name: Getting Started
      link: /learn/REST/Getting%20Started%20With%20REST.html
      category: getting-started
      topics:
        - name: Basic Authentication
          link: /learn/REST/Basic%20Authentication.html
          category: getting-started
        - name: Three-Legged OAuth
          link: /learn/REST/Three-Legged%20OAuth.html
          category: getting-started
    - name: About
      link: /learn/REST/The%20Blackboard%20REST%20API%20Framework.html
      category: about
      topics:
        - name: Deprecation Policy
          link: /learn/REST/Public%20REST%20API%20Compatibility%20and%20Deprecation%20Policy.html
          category: about
        - name: Developer Portal Terms
          link: /learn/REST/Developer%20Portal%20Terms%20and%20Conditions.html
          category: about
```

If you are not familiar with YAML, it is pretty basic. The most important thing to remember is that spaces mean something. Similar to Python, the indentation is how things are logically grouped, so be sure you match the appopriate formatting to ensure your changes have the desired effect. 

The top level are the first-level headings. At this level, there are two values that are required.

* **name**: This is what will show up in the menu and in the sitemap
* **link**: This is the URL to the document that should be served when the link is clicked

If you only include these values at the top-level, you will get a flat menu structure. If you wish to include a hierarchy, as we do in Learn and Standards, you have a few other options.

* **parentId**: ParentId is used to identify the level the link belongs to
* **categories**: A YAML list of the categories that fall under the parentId

The result when including a category, is a hierarchy like this (based on the above YAML):

```
  Learn
--Getting Started
--About
```

Under categories, the following information is required:

* **name**: This is what will show up in the menu and in the sitemap
* **link**: This is the URL to the document that should be served when the link is clicked
* **category**: The internal name of the category, used in the document to link it to the appropriate rendering template
* **topics**: A YAML list of the documents that belong to this category 

The result when including a category with topics, is a hierarchy like this (based on the above YAML):

```
  Learn
--Getting Started
----Basic Authentication
----Three-Legged OAuth
--About
----Deprecation Policy
----Developer Portal Terms
```

For topics, the following information is required:

* **name**: This is what will show up in the menu and in the sitemap
* **link**: This is the URL to the document that should be served when the link is clicked
* **category**: The internal name of the category, used in the document to link it to the appropriate rendering template

So given the learn.yml file above, let's add our new document:

```
  - name: Learn
  link: /learn/Integrate%20with%20Blackboard%20Learn.html
  parentId: learn
- name: REST
  link: /learn/REST/Getting%20Started%20With%20REST.html
  parentId: rest
  categories:
    - name: Getting Started
      link: /learn/REST/Getting%20Started%20With%20REST.html
      category: getting-started
      topics:
        - name: Basic Authentication
          link: /learn/REST/Basic%20Authentication.html
          category: getting-started
        - name: Three-Legged OAuth
          link: /learn/REST/Three-Legged%20OAuth.html
          category: getting-started
        - name: New Document
          link: /learn/REST/new%20document.html
          category: getting-started
    - name: About
      link: /learn/REST/The%20Blackboard%20REST%20API%20Framework.html
      category: about
      topics:
        - name: Deprecation Policy
          link: /learn/REST/Public%20REST%20API%20Compatibility%20and%20Deprecation%20Policy.html
          category: about
        - name: Developer Portal Terms
          link: /learn/REST/Developer%20Portal%20Terms%20and%20Conditions.html
          category: about
```

Notice that we have set the file extension to **.html**. While yes, we are creating a Markdown file, jekyll is building a static website from that Markdown based on html templates that we have created. When the end user clicks the link in the menu or on the sitemap, it is loading a dynamically generated html file. For illustration of what we have just done, this is our new document hierarchy:

```
  Learn
--Getting Started
----Basic Authentication
----Three-Legged OAuth
----New Document
--About
----Deprecation Policy
----Developer Portal Terms
```

So now our learn.yml is updated and now we are ready to create the new document. Our documents are standard Markdown documents, with one specific modification. We must provide configuration and metadata at the top. All documents should contain a header similar to the following:

```
  ---
layout: learn
parent: rest
category: getting-started
---
# Getting Started With REST
*Author: Scott Hurrey*  
*Categories: []*  
*Tags: ['developer', 'rest', 'getting started', 'api', 'blackboard', 'developers']*  
<hr />

## Get Started with REST
```

The **layout** tag is used to tell jekyll which html template to use. These are located in the `_layouts` folder. Essentially, the value will correspond to the section you are in:

* collab
* connecttxt
* dvba
* learn
* openlms
* standards

In our YAML file, we specified a parentId. This parentId is the value to assign to **parent**. The **category** should match the category value specified for the topic in the YAML file.

For the metadata, simply provide the title of your document, the author's name, any category information you wish to provide, as well as any tags you wish to provide. We aren't doing anything with either currently, but that could change. Either way, both of these values are optional. Always ensure there is a blank line between the `<hr />` tag and the first line of the document. Omitting this can cause Markdown formatting in the first paragraph to fail to render properly.

Once you have finished, save your changes, and commit to your forked repository. Now you can use the built-in tools available in Github to issue a pull request. This request will be reviewed by the Developer Relations and Standards team and merged, as appropriate.

## Github Operations

For those unfamiliar with Github, here are a few helpful guides for forking repositories and issuing pull requests:

* [About Pull Requests - Github Documentation](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests)
* [About Forks - Github Documentation](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-forks)
* [Creating a Pull Request from a Fork - Github Documentation](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork)

## Summary

I hope this document de-mystifies the process a bit. Feel free to report issues to the Github repository [issues page](https://github.com/blackboard/blackboard.github.io/issues), start a [discussion on the community site](https://community.blackboard.com/discuss/viewcategory/78), or email us directly at developers@blackboard.com.