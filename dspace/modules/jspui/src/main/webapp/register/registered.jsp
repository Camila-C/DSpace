<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Registered OK message
  -
  - Displays a message indicating that the user has registered OK.
  - 
  - Attributes to pass in:
  -   eperson - eperson who's just registered
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="org.dspace.app.webui.servlet.RegisterServlet" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.Utils" %>

<%
    EPerson eperson = (EPerson) request.getAttribute("eperson");
%>

<dspace:layout titlekey="jsp.register.registered.title">
  <section class="jumbotron text-center bg-transparent">
    <h2>
      <fmt:message key="jsp.register.registered.thank">
        <fmt:param><%= Utils.addEntities(eperson.getFirstName()) %></fmt:param>
      </fmt:message>
      <fmt:message key="jsp.register.registered.title"/>
    </h2>
    <p class="lead">
      <fmt:message key="jsp.register.registered.info"/>
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
