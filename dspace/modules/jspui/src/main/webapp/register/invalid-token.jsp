<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>


<dspace:layout titlekey="jsp.register.invalid-token.title">
	<h2><fmt:message key="jsp.register.invalid-token.title"/></h2>
	<p><fmt:message key="jsp.register.invalid-token.info1"/></p>
  <ul>
    <li>
      <fmt:message key="jsp.register.invalid-token.info2"/>
      <pre>
        <%= ConfigurationManager.getProperty("dspace.url") %>/register?token=ABCDEFGHIJK
        LMNOP
      </pre>
    </li>
		<li>
      <fmt:message key="jsp.register.invalid-token.info3"/>
      <pre>
        <%= ConfigurationManager.getProperty("dspace.url") %>/register?token=ABCDEFGHIJKLMNOP
      </pre>
  		<fmt:message key="jsp.register.invalid-token.info4"/>
    </li>
  </ul>
  <dspace:include page="/components/contact-info.jsp" />
</dspace:layout>