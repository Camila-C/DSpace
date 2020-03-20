<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - New password form
  -
  - Form where users can enter a new password, after having been sent a token
  - because they forgot the old one.
  -
  - Attributes to pass in:
  -    eperson          - the eperson
  -    token            - the token associated with this password setting
  -    password.problem - Boolean true if the user has already tried a password
  -                       which is for some reason unnacceptible
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="org.dspace.app.webui.servlet.RegisterServlet" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.Utils" %>

<%
    EPerson eperson = (EPerson) request.getAttribute("eperson");
    String token = (String) request.getAttribute("token");
    Boolean attr = (Boolean) request.getAttribute("password.problem");

    boolean passwordProblem = (attr != null && attr.booleanValue());
%>

<dspace:layout style="submission" titlekey="jsp.register.new-password.title" nocache="true">
  <section class="jumbotron bg-transparent">
    <h2><fmt:message key="jsp.register.new-password.title"/></h2>
    <p class="lead">
      <fmt:message key="jsp.register.new-password.hello">
        <fmt:param><%= Utils.addEntities(eperson.getFullName()) %></fmt:param>
      </fmt:message>
    </p>
    <hr>
    <%  if (passwordProblem) { %>
          <div class="alert alert-danger">
            <fmt:message key="jsp.register.new-password.info1"/>
          </div>
    <%  } %>
    <div class="row">
      <form method="post" action="<%= request.getContextPath() %>/forgot">
        <input type="hidden" name="step" value="<%= RegisterServlet.NEW_PASSWORD_PAGE %>"/>
        <input type="hidden" name="token" value="<%= token %>"/>
        <div class="form-group col-md-6">
          <label for="tpassword"><fmt:message key="jsp.register.new-password.pswd.field"/></label>
          <input class="form-control" type="password" name="password" id="tpassword" />
        </div>
        <div class="form-group col-md-6">
          <label for="tpassword_confirm"><fmt:message key="jsp.register.new-password.confirm.field"/></label>
          <input class="form-control" type="password" name="password_confirm" id="tpassword_confirm" />
        </div>
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-unrn-reverse">
            <fmt:message key="jsp.register.new-password.set.button"/>
          </button>
        </div>
      </form>
    </div>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>
