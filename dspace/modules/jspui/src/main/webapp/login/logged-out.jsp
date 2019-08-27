<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Displays a message indicating the user has logged out
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<dspace:layout locbar="nolink" titlekey="jsp.login.logged-out.title">
  <section class="jumbotron text-center bg-transparent">
    <h2><fmt:message key="jsp.login.logged-out.title"/></h2>
    <p class="lead"><fmt:message key="jsp.login.logged-out.thank"/></p>
    <hr>
    <p>
      &iquest;Tuvo alg&uacute;n problema? 
      <a href="<%= request.getContextPath() %>/feedback">Cont&aacute;ctenos</a>
    </p>
    <p>
      <a class="btn btn-unrn" href="<%= request.getContextPath() %>/">
        <fmt:message key="jsp.general.gohome"/>
      </a>
    </p>
  </section>
</dspace:layout>
