---
layout: post
title: "Code Quality Initiative" 
categories: Learn b2
id: learn-b2-bp-code-quality
author: Scott Hurrey
status: deprecated
---

# Code Quality Initiative

## Why Code Quality Matters

  * Your code is your asset
  * Keeps your cost down as you grow
  * Increase robustness, maintainability, security, performance, scalability, extensibility, etc.
  * Prevention is the best medicine

#### Challenges with Code Quality

  * Often talked about in theory but not actually practiced
  * Hard to measure or prove
  * Difficult to plan and prioritize

#### Sonar – Quality Management Platform

[http://www.sonarsource.org/](https://www.sonarsource.org)

  * Open source and extensible
  * Manages code quality with:
    * Views of all projects at a glace, drill down to source code, differential, hotspots
    * Coding Rules
    * Unit Tests
    * Standard Metrics
    * Time Machine
    * Integration with tools such as PMD, Findbugs, Checkstyle, JSLint, Clover, Cobetura, Hudson (many plugins available)

#### Static Code Analysis (SCA)

  * Applies rules to find potential bugs, anti-patterns, and code style violations
  * Catches problems as early as possible in the development process
  * A well-established industry practice for validating the quality of source code
  * Can be automated and tracked by tools like Sonar

## Downloads

#### Blackboard Learn custom PMD rules and Sonar Java profile

The latest version is [attached](/attachments/bb_sonar_01.zip) to this post. Please install
Blackboard custom PMD rules before importing Java rule set.

How to install Blackboard custom PMD rules:

  1. Copy bb-.html-rules.jar and bb-rules-sonar.xml files to ${Sonar_Home}/extensions/rules/.html
  2. Make sure the files have read rights for Sonar
  3. Restart Sonar server
  4. Verify that Bb* rules exist from a Java profile's coding rules list

How to use Blackboard's Java rule set:

  1. Log in to Sonar as a user with Administrators role
  2. Navigate to "Configuration" -> "Quality Profiles"
  3. Click on "Restore profile" link located on the top right of the page
  4. Select bb-sonar-profile-java.xml and click on "Restore profile" button
  5. Specify the Sonar analysis configuration to use the restored profile