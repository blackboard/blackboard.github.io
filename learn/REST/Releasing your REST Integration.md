# Releasing your REST Integration

You have taken the time to build a great integration now there are a few steps that should be followed to ensure a successful product release. 

These fall into two categories:

1. Developer Portal Settings
2. Learn REST Integration Configuration

## Developer Portal Settings
Before releasing your integration you want to ensure there are sufficient site and rate limits for smooth operation.

This is accomplished by creating a new group named after your company or institution - this new group will receive your production level settings.  

Please follow group naming conventions as described in our [Group Naming Requirements](https://docs.blackboard.com/learn/REST/Developer%20Portal%2C%20Development%20and%20Production%20Groups.html#group-naming-requirements) documentation.

Once you have created your production group file a support ticket requesting production settings on your group. 

If you are participating in our Open Innovation Initiative program please contact developers@blackboard.com

Once we have the information required you will then associate your application with your production group.

Your application is now using production settings.

Next step is making your application available to your clients.

## Delivering your REST Integration
There are three steps in releasing your integration:
1. Providing your client with your integration's Application ID. 

    * E.G.: 8abvr1e4-2x43-4757-8z63-0063259f234

2. Provide an integration preferred User name and Role name (assists in identification during support resolution). 

    * E.G.: **User Name**: SuperSoftware Sudoku User  
    
    * **Role Name**: SuperSoftware Sudoku Role.
    
3. Your documentation: You should provide a list of required Privileges for the Integration User Role.

    * You needed to find the entitlements (from the API documentation), and the Privileges (from Learn) in order to develop and test your application with a non-system admin user, it is good practice to share those privileges with your client.

    * Note that if your application is utilizing Three Legged OAuth (which uses the logged users privileges) this step is not required.

> It is _strongly_ recommended that you include the above information in your client facing documentation.

# Some DON'Ts

**1.** NEVER USE OR REQUIRE SYSTEM ADMINISTRATOR as your REST integration user
1. This places your client at risk.
2. A discerning administrator _will not_ install an integration requiring a Role of System Administrator.

**2:** NEVER ASK YOUR CLIENT TO INSTALL USING THEIR DEVELOPER PORTAL KEY:SECRET
1. Keys and Secrets should _never_ be shared.
2. Keys and Secrets should _never_ stored in remote systems. FWIW: the Developer Portal does not store them either.
3. Production group settings are global to specific to integrations. 


## Key Takeaways 

1. Providing the required Privileges to Learn Admins reduces the risk of a failure in integration installation and operation Blackboard nor you should want to burden clients with figuring out from the API Docs which Entitlements are needed and look up these Privileges on their own so that your application works as expected.
2. Following secure practices around key:secret management create a safer more secure www.
