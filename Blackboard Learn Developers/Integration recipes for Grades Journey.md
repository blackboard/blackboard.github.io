# Integration recipes for Grades Journey
Use the following resources for Grades Journey integration:

Integration recipes for SIS Vendor types

Ellucian: Banner, Colleague, or PowerCampus

  * Grades Journey is not needed for ILP
  * XE and LMB are currently not available as extract options
  * Custom extraction options can use flat file, REST API, or LIS integrations

Peoplesoft

  * SAIP can configure to use LIS
  * Custom extraction options can use flat file, REST API, or LIS integrations

Jenzabar can use delimited file

Other or Custom SIS can use flat file, REST API, or LIS integrations

* * *

## Integration recipe for Flat file integration

  * Determine if you need approval from the instructor for columns created from SIS, other specific columns, or all columns.
  * If your institution uses provisioning, determine linking strategy for extracted columns. If the column name is not sufficient, the optional data can be used to pass in and echo back linking keys. Determine if you want to link the created column to the existing letter or custom grade schema (Note: Another file format exists for creating grade schemas if needed).
  * Develop programs to generate and pass provisioning files and consume extracted grade files.
  * If you need to lock the gradebook, enable _Lock on approval?_ in _Grade Approval and Transfer_ Settings.

* * *

## Integration recipe for REST API

  * Determine if you need approval from the instructor for columns created from SIS, other specific columns, or all columns.
  * If your institution uses provisioning, determine linking strategy for extracted columns. If the column name is not sufficient, the optional data can be used to pass in and echo back linking keys. Determine if you want to link the created column to the existing letter or custom grade schema (Note: Another transaction exists for creating grade schemas if needed).
  * Determine if you need to create content items.
  * Develop programs to generate and make web service calls to invoke provisioning transactions and to act as REST end-point for receiving extracts.
  * If you need to lock the gradebook, enable _Lock on approval?_ in _Grade Approval and Transfer_ Settings.

* * *

## Integration recipe for LTI

  * Determine if you need approval from the instructor for columns created from SIS, other specific columns, or all columns.
  * If your institution uses provisioning, determine if you want to link the created column to the existing letter or custom grade schema (Note: Another transaction exists for creating grade schemas if needed).
  * Develop programs to generate and make web service calls to invoke provisioning transactions, and to generate and make web service calls to invoke grade extract transactions.
  * If you need to lock the gradebook, enable _Lock on approval?_ in _Grade Approval and Transfer_ Settings.

More on [Grades Journey for SaaS](https://community.blackboard.com/external-li
nk.jspa?url=https%3A%2F%2Fhelp.blackboard.com%2FLearn%2FAdministrator%2FSaaS%2
FIntegrations%2FStudent_Information_System%2FSIS_Integration_Types%2FGrades_Jo
urney)

More on [Grades Journey for Self and Managed-
Hosted](https://community.blackboard.com/external-link.jspa?url=https%3A%2F%2F
help.blackboard.com%2FLearn%2FAdministrator%2FHosting%2FSystem_Integration%2FS
IS%2FSIS_Integration_Types%2FGrades_Journey)

