<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Register with DSpace form
  -
  - Form where new users enter their email address to get a token to access
  - the personal info page.
  -
  - Attributes to pass in:
  -     retry  - if set, this is a retry after the user entered an invalid email
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="org.dspace.app.webui.servlet.RegisterServlet" %>

<%
    boolean retry = (request.getAttribute("retry") != null);
%>
<dspace:layout titlekey="jsp.register.new-user.title">
  <section class="jumbotron bg-transparent">
    <h2><fmt:message key="jsp.register.new-user.title"/></h2>
    <p class="lead">
      <fmt:message key="jsp.register.new-user.info2"/>
    </p>
    <hr>
    <%	if (retry) { %>
      <div class="alert alert-danger">
        <fmt:message key="jsp.register.new-user.info1"/>
      </div>
    <%	} %>
    <div class="row">
      <form method="post" action="<%= request.getContextPath() %>/register">
        <input type="hidden" name="step" value="<%= RegisterServlet.ENTER_EMAIL_PAGE %>"/>
        <div class="form-group col-md-6">
          <label for="temail"><fmt:message key="jsp.register.new-user.email.field"/></label>
          <input type="text" class="form-control" name="email" id="temail" placeholder="ejemplo@unrn.edu.ar">
        </div>
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-unrn-reverse">
            <fmt:message key="jsp.register.new-user.register.button"/>
          </button>
        </div>
      </form>
    </div>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>
