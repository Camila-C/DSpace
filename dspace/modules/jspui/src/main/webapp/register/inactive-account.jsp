<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Message informing user who said they'd forgot their password that their
  - account is inactive.
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<dspace:layout titlekey="jsp.register.inactive-account.title">
  <section class="jumbotron text-center bg-transparent">
    <h2><fmt:message key="jsp.register.inactive-account.title"/></h2>
    <p class="lead"><fmt:message key="jsp.register.already-registered.info1"/></p>
    <p>
      <fmt:message key="jsp.register.inactive-account.info">
        <fmt:param><%= request.getContextPath() %>/register</fmt:param>
      </fmt:message>
    </p>
    <hr>
    <p>
      <a class="btn btn-lg btn-unrn" href="<%= request.getContextPath() %>/">
        <fmt:message key="jsp.general.gohome"/>
      </a>
    </p>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>