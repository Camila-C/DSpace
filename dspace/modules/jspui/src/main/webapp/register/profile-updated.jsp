<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Profile updated message
  -
  -   password.updated - a Boolean indicating whether the user updated their
  -                      password.
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%
    boolean passwordUpdated = ((Boolean) request.getAttribute("password.updated")).booleanValue();
%>

<dspace:layout titlekey="jsp.register.profile-updated.title">
  <section class="jumbotron text-center bg-transparent">
    <h2><fmt:message key="jsp.register.profile-updated.title"/></h2>
    <p class="lead">
      <% if(passwordUpdated) { %>
        <fmt:message key="jsp.register.profile-updated.info1"/>
      <% } else { %>
        <fmt:message key="jsp.register.profile-updated.info2"/>
      <% } %>
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
