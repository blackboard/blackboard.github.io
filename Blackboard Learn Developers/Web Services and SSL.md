# Web Services and SSL
*Author: Kelley MacEwen*  
*Categories: []*  
*Tags: ['web services', 'tutorials', 'webct', 'migrated from edugarage', 'developer']*  
<hr />
When HTTPS is enabled on the WebCT server, it is possible for a web service
client to contact the WebCT services via SSL. This page will talk about the
general procedures of calling WebCT web services via SSL, and discuss some
common issues with web services via SSL.

# Making Web Service Calls Via SSL

There is no special operations required for making web service calls via SSL.
All you need is

  1. WebCT server with a valid cacert and SSL enabled
  2. Java Run Time Environment on where the web service client will be running on
  3. Retrieving the web service using "http*s*://<server>/webct/axis/services/<service_name>"

To configure WebCT server with HTTPS, you could find detailed instructions on
WebCT Installation Guide.

Sometimes you may not have a commercial-grade certificate for development and
testing. To make the web service client accept your self-signed certificate,
you will need to import the self-signed certificate to the java keystore. An
example for importing the keystore is:

keytool \-import \-alias <alias> -keystore <JAVA_HOME>
/jre/lib/security/cacerts -file <the cert file>

Note that the default keystore password is "changeit"

# Common Issues

## javax.net.ssl.SSLException untrusted server cert chain

**Possible Cause:** This usually happens when a self-signed certificate is installed on the WebCT server which cannot be verified by the JRE.

**Solution:** To solve this problem, you will need to import the certificate file to the local keystore on the machine where the client will be running on.

**Note:** This happens in testing/development environment most of the time. Since the real WebCT customers will have a commercial-grade certificate installed for their WebCT installations, you will not need to import their certificate to all client machines.

## javax.net.ssl.SSLHandshakeException:
java.security.cert.CertificateException: Could not find trusted certificate

**Possible Cause:** This might happen to a client machine with older JREs. According to Sun:

"A Class 3 and Class 2 Verisign PCA root certificate included in various
releases of the SDK and JRE (see Contributing Factors below) will expire on
January 7, 2004 and may result in the following upon expiration: Java
applications and applets, deployed with the Java Plug-in or Java Web Start
which authenticate using certificates issued by the expiring root certificates
may encounter a security warning dialog box indicating an authentication
failure (see "Symptoms" section below.) Java applications or applets using a
Java Secure Socket Extension (JSSE) TrustManager that do not recognize expired
root certificates may not be able to access web sites via https (see
"Symptoms" section below.)"

**Solution:**

  1. Download the most recent root certificate from Verisign and import them to the keystore; or
  2. Update client JRE to
    * SDK and JRE 1.4.2_03 and later
    * SDK and JRE 1.4.1_06 and later

Note: You could find more information here: [http://sunsolve.sun.com/search/do
cument.do?assetkey=1-26-57436-1](https://community.blackboard.com/external-lin
k.jspa?url=http%3A//sunsolve.sun.com/search/document.do%3Fassetkey%3D1
-26-57436-1)

_This article originally authored by jni on the WebCT DevNet._

