<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Feedback form JSP
  -
  - Attributes:
  -    feedback.problem  - if present, report that all fields weren't filled out
  -    authenticated.email - email of authenticated user, if any
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
    boolean problem = (request.getParameter("feedback.problem") != null);
    String email = request.getParameter("email");

    if (email == null || email.equals("")) {
      email = (String) request.getAttribute("authenticated.email");
    }

    if (email == null) {
      email = "";
    }

    String feedback = request.getParameter("feedback");
    if (feedback == null) {
      feedback = "";
    }

    String fromPage = request.getParameter("fromPage");
    if (fromPage == null) {
		  fromPage = "";
    }
%>

<dspace:layout titlekey="jsp.feedback.form.title">
  <section class="jumbotron bg-transparent">
    <h2><fmt:message key="jsp.feedback.form.title"/></h2>
    <p class="lead"><fmt:message key="jsp.feedback.form.text1"/></p>
    <hr>
    <%	if (problem) { %>
      <div class="alert alert-danger">
        <fmt:message key="jsp.feedback.form.problem"/>
      </div>
    <%	} %>
    <div class="row">
      <form method="post" action="<%= request.getContextPath() %>/feedback">
        <div class="form-group col-md-6">
          <label for="temail"><fmt:message key="jsp.feedback.form.email"/></label>
          <input type="text" class="form-control" name="email" id="temail" size="50" value="<%=StringEscapeUtils.escapeHtml(email)%>">
        </div>
        <div class="form-group col-md-12">
          <label for="tfeedback"><fmt:message key="jsp.feedback.form.comment"/></label>
          <textarea class="form-control" name="feedback" id="tfeedback" rows="6" cols="50">
            <%=StringEscapeUtils.escapeHtml(feedback)%>
          </textarea>
        </div>
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-unrn-reverse" name="submit">
            <fmt:message key="jsp.feedback.form.send"/>
          </button>
          <a class="btn btn-default" href="<%= request.getContextPath() %>/">
            <fmt:message key="jsp.feedback.form.cancel"/>
          </a>
        </div>
      </form>
    </div>
  </section> 
</dspace:layout>
