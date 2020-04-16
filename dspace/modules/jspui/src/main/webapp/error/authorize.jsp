<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Page representing an authorization error
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<dspace:layout titlekey="jsp.error.authorize.title">
    <section class="jumbotron text-center bg-transparent">
        <h2><fmt:message key="jsp.error.authorize.title"/></h2>
        <p class="lead"><fmt:message key="jsp.error.authorize.text1"/></p>
        <hr>
        <p>
            <a class="btn btn-lg btn-unrn" href="<%= request.getContextPath() %>/">
                <fmt:message key="jsp.general.gohome"/>
            </a>
        </p>
        <dspace:include page="/components/contact-info.jsp" />
    </section>
</dspace:layout>
