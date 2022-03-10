---
layout: post
title: "Releasing your integration"
id: rest_apis-learn-getting-started-releasing_integration
categories: Learn Rest
author: Mark O'Neil
---

# Releasing your integration

You have taken the time to build a great integration now there are a few steps that should be followed to ensure a successful product release.

These fall into two categories:

  - Developer Portal Settings
  - Learn REST Integration Configuration

## Developer Portal Settings

Before releasing your integration, please make sure there are sufficient site and rate limits for a smooth operation, you can review our site: https://docs.blackboard.com/rest-apis/learn/admin/groups-quotas-rates to learn more about rate limits. So, the first steps are:

1. Create a group named after the Company or the institution, keep in mind this group will receive production level settings, also, please make sure to follow our Naming convention https://docs.blackboard.com/rest-apis/learn/admin/groups-quotas-rates#production-groups
2. File a Support ticket requestion production settings on your group (If you are a partner or Company, please send us an email to developers@blackboard.com)
3. We will proceed and update a group to a production group
4. Now you can associate your application with your production group.

Now your application is using production setting, next step is making your application available to your clients

## Delivering your REST integration

Here are Three steps in releasing your integration:

1. Provide your client with your integration's Application ID:
	
	E.G: 39CCFC5A-FC03-4854-A3D4-809663F2D237 

2. Provide an integration preferred username and role name:
	
	E.G: UserName: SuperSoftware Sudoku User

		 Role Name: SuperSoftware Sudoku Role

3. In YOUR documentation, you should provide a list of required privileges or entitlements for the integration User role.

	E.G: You needed to find the entitlements (from the API documentation) and the Privileges (from Learn) in order to develop and test your application with a non-system admin user. It is good practice to share those privileges with your client.

	Note that if your application is utilizing Three Legged OAuth - which uses the logged in user’s privileges - this step is not required.

> It is strongly recommended that you include the above information in your client facing documentation.

### Some DON’Ts

1. NEVER USE OR REQUIRE SYSTEM ADMINISTRATOR as your REST integration user
	- This places your client at risk.
	- A discerning administrator will not install an integration requiring a Role of System Administrator.

2: NEVER ASK YOUR CLIENT TO INSTALL USING THEIR DEVELOPER PORTAL KEY:SECRET
	- Keys and Secrets should never be shared.
	- Keys and Secrets should never stored in remote systems. FWIW: the Developer Portal does not store them either.
	- Production group settings are global to specific to integrations.

### Key Takeaways
	- Providing the required Privileges to Learn Admins reduces the risk of a failure in integration installation and operation. Blackboard nor you should want to burden clients with figuring out from the API Docs which Entitlements are needed and look up these Privileges on their own so that your application works as expected.
	- Following secure practices around key:secret management create a safer more secure www.
