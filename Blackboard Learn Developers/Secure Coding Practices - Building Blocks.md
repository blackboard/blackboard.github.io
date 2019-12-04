# Secure Coding Practices - Building Blocks
*Author: Scott Hurrey*
*Categories: ['Building Blocks', 'Tutorials']*
*Tags: ['building blocks', 'best practices', 'security', 'developer']*
---
Blackboard takes security seriously and extends that same outlook to
developers by enabling them to apply industry standards of best practice to
their Building Blocks.

Blackboard Learn has integrated with a best practices open source security
library from the **Open Web Application Project's (OWASP) Enterprise Security
API (ESAPI)**. This security library ships by default installed on Blackboard
Learn through a Building Block called "_ESAPI Security Module_" and is
required for system operation. Blackboard strongly recommends all Building
Block developers leverage this new Security API based on **OWASP ESAPI for
Java** and **ESAPI for JavaScript**.

You may read more about the ESAPI library and secure development on Learn at
[help.blackboard.com](https://community.blackboard.com/external-
link.jspa?url=https%3A//help.blackboard.com/en-us/Learn/9.1_2014_04%
2FAdministrator/070_Server_Management_and_Integrations/Security).

## Secure Coding Best Practices

As part of secure coding practices, input that may be influenced by users,
whether trusted or not, should be validated on the server-side before
processing (input validation) as well as prior to display (output validation
or escaping). This helps ensure system resiliency and prevents security issues
such as cross-site scripting.

  * Input Validation: When receiving input from the request, always validate and always validate server-side.
  * Output Validation / Encoding / Escaping: When displaying any input, always ensure it is displayed in the correct context that it will be embedded in.

In addition to input and output validation Learn also affords the ability to
encrypt data during context passing.

