<%@ include file="/webapis/ui/doctype.jspf" %>

<%@ taglib uri="/bbNG" prefix="bbNG" %>
<%@ taglib uri="/bbUI" prefix="bbUI" %>
<%@ taglib uri="/loginUI" prefix="loginUI" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="productName" value="${ loginUI:getProductName() }" />

<%--
  This is a standard wrapper for all AS pages.  It is recommended that you keep this tag.
  --%>
<bbNG:genericPage authentication="N" wrapper="false" onLoad="loadLoginPage()" bodyClass="login-page" globalNavigation="false" allowScale="true">

<%@ include file="/webapis/ui/cookie-disclosure-login.jspf"%>

  <bbNG:jsBlock>
    <script type="text/javascript">
      function loadLoginPage()
      {
    	  if ( top != self )
    	  {
    		  top.location.replace( self.location.href );
    		}
    	  if(document.forms.login.user_id != undefined)
    		{
    		  document.forms.login.user_id.focus();
    		}
    	  setTimeout("triggerScreenreaderAlert()", 500);
      }

      function triggerScreenreaderAlert()
      {
    	if ( document.getElementById( 'loginErrorMessage' ) )
  	    {
    	  $( 'loginErrorMessage' ).update( $('loginErrorMessage').innerHTML );
  	    }
      }
    </script>
  </bbNG:jsBlock>

<%--
  If you need to customize styles defined in login.css, you can place your changes
  within the following <style> block.  The JSP comment markers surrounding the <bbNG:cssBlock> element
  must be removed before the changes will take effect.
--%>


<bbNG:cssBlock>

<style type="text/css">

/* this section is for the loginui:loginForm tag to hide the extraneous markup */

/* Removes "Sign in with third-party account" drop-down */
button#redirectProvidersDropdownButton {
	display: none;
}

/* clear styling and set background for SSO list */
#loginRedirectProviderList {
    display: inline-block;
    position: inherit;
    background: inherit;
    border: none;
    box-shadow: none;
}

#loginRedirectProviderList li a {
    text-align: center;
    text-decoration: none;
}

#loginRedirectProviderList li a:hover {
    text-decoration: underline;
}

/* hide the dropdown indicator */
#loginRedirectProviders button::after {
    display: none;
}

/* clear decoration on hover and focus */
#loginRedirectProviders button:focus, #loginRedirectProviders button:hover {
    background: inherit;
    border-color: inherit;
    color: inherit;
}

/* increase offset because we are permanently displaying SSO menu */
#loginOptions {
    margin: 58px auto 26px;
}

/* remove hover background color */
#loginRedirectProviderList li a:hover, #loginRedirectProviderList li a:focus {
    background-color: inherit;
}

ul#loginFormList.clearfix {
	display: none;
}

/* hides SAML icon if a custom one is uploaded */
#loginRedirectProviderList li img {
	display: none;
}

</style>

</bbNG:cssBlock>

<%--
  It is recommended that any text passed to the loginUI tags be localized.  The following
  is an example of loading a localized phrase from the security.properties resource bundle:

    <fmt:message var="strMyLoginText" key="my.login.text.key" bundle="${bundles.security}" />

  Once loaded, this phrase can be referenced as a JSTL variable:

    <loginUI:loginForm loginText="${strMyLoginText}" />
--%>

<%--
  Each of the <loginUI:*> elements used below can safely be rearranged to suit your needs.
  If you change the structure significantly, you may need to update the inline styles above.
  --%>

<div id="loginPageContainer">
  <div id="loginPane">

    <div id="loginContainer">
		<div id="loginHeader" class="clearfix">
    	    <h1 class="hideoff">${productName}</h1>
        	<bbNG:image src="/images/ci/logos/Bb_newLogo_060.png" alt="${productName}" class="productLogo" />
	        <loginUI:accessibility />
	    </div>

      <div id="loginLang" tabindex="0" class="clearfix">
        <loginUI:localePicker />
      </div>

      <div class="clearfix loginBody">
        <loginUI:errorMessage />

        <div id="loginBox">
          <loginUI:loginForm />
        </div>

        <div id="loginOptions">
          <loginUI:gatewayButtons />
        </div>
      </div>

      <loginUI:welcomeArea />

	</div>

  </div>

	<loginUI:systemAnnouncements maxItems="5" />

	<bbNG:copyright />

</div>

</bbNG:genericPage>
