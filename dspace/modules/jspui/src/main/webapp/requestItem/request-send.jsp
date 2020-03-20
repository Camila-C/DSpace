<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - request-item received OK acknowledgement
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<dspace:layout locbar="off" navbar="default" titlekey="jsp.request.item.request-send.title">
  <section class="jumbotron text-center bg-transparent">
    <h2>
      <fmt:message key="jsp.request.item.request-send.info1"/>
    </h2>
    <p class="lead">
      <fmt:message key="jsp.request.item.request-send.info2"/>
    </p>
    <hr>
    <p>
      <a class="btn btn-lg btn-unrn" href="<%= request.getContextPath() %>/handle/${handle}">
        <fmt:message key="jsp.request.item.return-item"/>
      </a>
    </p>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>