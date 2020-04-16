<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Page representing an internal server error
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<dspace:layout titlekey="jsp.error.internal.title">
    <section class="jumbotron text-center bg-transparent">
        <h2><fmt:message key="jsp.error.internal.title"/></h2>
        <p class="lead"><fmt:message key="jsp.error.internal.text1"/></p>
        <hr>
        <!--
        <%
            Throwable ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
            if(ex == null) out.println("No stack trace available<br/>");
            else {
                for(Throwable t = ex ; t!=null; t = t.getCause())
                {
                    out.println(t.getMessage());
                    out.println("=============================================");
                    t.printStackTrace(new PrintWriter(out));
                    out.println("\n\n\n");
                }
            }
        %>
        -->
        <p>
            <a class="btn btn-lg btn-unrn" href="<%= request.getContextPath() %>/">
                <fmt:message key="jsp.general.gohome"/>
            </a>
        </p>
        <dspace:include page="/components/contact-info.jsp" />
    </section>
</dspace:layout>
