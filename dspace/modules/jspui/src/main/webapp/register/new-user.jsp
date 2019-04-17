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

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.dspace.app.webui.servlet.RegisterServlet" %>

<%
    boolean retry = (request.getAttribute("retry") != null);
%>

<dspace:layout style="submission" titlekey="jsp.register.new-user.title">
	<h1><fmt:message key="jsp.register.new-user.title"/></h1>
	<%	if (retry) { %>
	<p class="alert alert-warning">
		<fmt:message key="jsp.register.new-user.info1"/>
	</p>
	<%	} %>
	<p class="alert"><fmt:message key="jsp.register.new-user.info2"/></p>
  <form class="form-horizontal" action="<%= request.getContextPath() %>/register" method="post">
    <input type="hidden" name="step" value="<%= RegisterServlet.ENTER_EMAIL_PAGE %>"/>
	  <div class="form-group">
  		<label class="col-md-3 control-label" for="temail">
				<fmt:message key="jsp.register.new-user.email.field"/>
			</label>
      <div class="col-md-5">
				<input class="form-control" type="text" name="email" id="temail" />
			</div>
    </div>
		<div class="form-group">
			<div class="col-md-offset-3 col-md-3">
				<input class="btn btn-success btn-block" type="submit" name="submit" value="<fmt:message key="jsp.register.new-user.register.button"/>" />
			</div>
		</div>
  </form>
  <dspace:include page="/components/contact-info.jsp" />
</dspace:layout>
