<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Friendly 404 error message page
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<dspace:layout titlekey="jsp.error.404.title">
  <section class="jumbotron text-center bg-transparent">
    <img src="<%= request.getContextPath() %>/image/rid_404.svg" alt="404" />
    <h1><strong>404</strong></h1>
    <h2><fmt:message key="jsp.error.404.title"/></h2>
    <p><fmt:message key="jsp.error.404.text1"/></p>
    <p><fmt:message key="jsp.error.404.text2"/></p>
    <hr>
    <p>
      <a class="btn btn-lg btn-unrn" href="<%= request.getContextPath() %>/">
        <fmt:message key="jsp.general.gohome"/>
      </a>
    </p>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>