# ConnectTxt Programming APIs
*Author: Scott Hurrey*
*Categories: ['ConnectTxt Developer Documentation']*
*Tags: ['apis', 'blackboard connecttxt', 'programming apis', 'developer']*
---
ConnectTxt now provide example code in several different programming
languages. These programming APIs can be used to easily integrate ConnectTxt
functionality into your existing application.

# Java

  * [Download Addressbook software version (v1.2) - zip 33MB](https://www.txttools.co.uk/preloginjsp/docs/Txttools_SOAP_Addressbook_API_Java_Client_1.2.zip)
  * [Download Messaging software version (v1.2) - zip 33MB](https://www.txttools.co.uk/preloginjsp/docs/Txttools_SOAP_Messaging_API_Java_Client_1.2.zip)

# PHP

The PHP API is currently in development. The API is capable of sending and
receiving messages, as well as retrieving status updates. This new version,
v0.2, incorporates PHPUnit test classes, and is capable of retrieving account
credit information from the ConnectTxt website. Future versions will
incorporate support for the SOAP API and address book uploads.

  * [Download latest software and documentation (v0.2.2)](https://www.txttools.co.uk/preloginjsp/docs/txttools_PHP_API_0.2.2.zip) - Tutorial available in HTML below.

# .NET

  * [Download Addressbook API version 1.0](https://www.txttools.co.uk/preloginjsp/docs/DotNet_SOAP_AddressbookClient_1.0.zip)
  * [Download Messaging API version 1.1](https://www.txttools.co.uk/preloginjsp/docs/DotNet_SOAP_MessageClient_1.1.zip)

Any question or suggestions please [e-mail
us](mailto:txttoolstechies@blackboard.com) or call +44 (0)113 234 2111.

  * Java
  * PHP
  * .NET
  * Txttools PHP API Tutorial
    * Installation
    * The TxttoolsConnectionFactory and Connection Objects
    * Sending your First SMS
    * Getting Status Updates for a Message
    * Getting Inbound Messages

# Txttools PHP API Tutorial

This document aims to assist PHP developers with integrating their systems
with txttools through the PHP API. The API, provided under the LGPLv3 licence,
is designed to make it easy for PHP developers to use the txttools SMS
messaging system, without having to implement their own connection packages,
or be aware of the the underlying processes involved.

**Please note: This version of the API is a pre-release version, and as such is under intensive development. It is provided with no warranty whatsoever. Future releases of the API may change some or all of the public interface – please check the changelog before installing a new version. Also, this is still a basic intro to get you started, so please see the included PHPDoc for additional options, parameters, and exception details.**

## Installation

Installation of the PHP API is extremely simple. Just unzip the provided
installation set to an appropriate directory within your IDE's workspace. No
additional setup is required, except to make sure that the server you will be
running your PHP scripts on can make outbound connections on port 80 and 443.
If it cannot, speak to your network admin to resolve this.

## The TxttoolsConnectionFactory and Connection Objects

The TxttoolsConnectionFactory and Connection objects are the cornerstones of
the API, and the two classes you will regularly interact with. Including the
required files for the API is very simple; you just include the
TxttoolsConnectionFactory object, like this:

require_once('/path/to/php/api/TxttoolsConnectionFactory.php');

(The API uses cascaded includes, so including this one file automatically
includes any files it depends on.)

To make a connection to txttools, you provide TxttoolsConnectionFactory with
the required connection settings, and it returns a Connection object that you
can use to send and receive messages.

For example, to open an XML-based connection to txttools over SSL, you could
use the following call:

$txttoolsAPI = TxttoolsConnectionFactory::getConnection(

TxttoolsConnectionFactory::$CONNECTION_TYPE_XML,

'username',

'password',

Connection::$PROTOCOL_SSL

);

The first parameter being passed specifies the type of connection to use –
XML, SOAP, REST and so forth. For ease of use, these are defined as global
static fields in the TxttoolsConnectionFactory class.

**Note that in this pre-release version, only XML connections are available.**

The second and third parameters are the username and password of the txttools
account you want to send/receive messages from. The fourth parameter is the
protocol to use when making the connection – either HTTP or SSL. Again, for
ease of use, these are defined in the Connection object.

## Sending your First SMS

Before you can send an SMS message, you need to construct the message, and
assign it some recipients. Firstly, create your MessageRecipient objects:

$recipients = array();

$recipient = new MessageRecipient('Preece', 'Greg',

'txttools.co.uk', '+441234567890');

array_push($recipients, $recipient);

Note that all phone numbers **must** be internationally formatted – ie, start
with a plus sign and the international dialling code for the destination
country. Once you've created your recipients, you can create an
OutboundMessage for them.

$message = new OutboundMessage('Message text', 1234567890,

$recipients);

The parameters here are the text of the message to be sent, the timestamp at
which it should be sent (seconds since Jan 1st 1970), and the array of
recipients created above. Now that we have our OutboundMessage object, let's
send it!

$returnedObjects = $txttoolsAPI->sendMessage($message);

This sends the SMS message through the txttools system, and gets the system's
response. When sending a message, this consists of a message receipt and an
initial status update. These are represented by SentMessage and
SentMessageStatus objects. So print_r($returnedObjects) outputs:

Array

(

[0] => SentMessage Object

(

[messageText:private] => Sent message

[destination:private] => +441234567890

[messageTicket:private] => 12345

[uniqueID:private] =>

)

[1] => SentMessageStatus Object

(

[messageTicket:private] => 12345

[statusCode:private] => 0

[statusMessage:private] => Queued at txttools

)

)

All the methods in the Connection class work in this way, returning an array
of objects representing the data received from the txttools system. You can
then do as you wish with the returned data – save it to a database, or discard
it as necessary. It is a good idea to save message receipts, or at the very
least message tickets, because these are used to poll for status updates on a
message.

## Getting Status Updates for a Message

After you have sent a message, you can check its current status using the
Connection->getStatusUpdatesForMessage() method. By providing this method with
the ticket number of a previously sent message, you will receive one or more
SentMessageStatus objects for that message.

$statusObjects = $txttoolsAPI->getStatusUpdatesForMessage(

$messageTicket

);

print_r($statusObjects);

Output:

Array

(

[0] => SentMessageStatus Object

(

[messageTicket:private] => 12345

[statusCode:private] => 5

[statusMessage:private] => Delivered to handset

)

)

## Getting Inbound Messages

Getting SMS messages sent into the txttools account is easiest of all:

$inboundMessages = $txttoolsAPI->getInboundMessages();

print_r($inboundMessages);

This will return an array of InboundMessage objects:

Array

(

[0] => InboundMessage Object

(

[messageTicket:private] => 54321

[messageText:private] => Hi Greg, how are you?

[sourceNumber:private] => +449876543210

[timeReceived:private] => 1234567890

)

)

