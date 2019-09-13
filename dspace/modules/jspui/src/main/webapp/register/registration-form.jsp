<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Registration information form
  -
  - Form where new users enter their personal information and select a
  - password.
  -
  - Attributes to pass in:
  -
  -   eperson          - the EPerson who's registering
  -   token            - the token key they've been given for registering
  -   set.password     - if Boolean true, the user can set a password
  -   missing.fields   - if a Boolean true, the user hasn't entered enough
  -                      information on the form during a previous attempt
  -   password.problem - if a Boolean true, there's a problem with password
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="org.dspace.app.webui.servlet.RegisterServlet" %>
<%@ page import="org.dspace.eperson.EPerson" %>

<%
    EPerson eperson = (EPerson) request.getAttribute( "eperson" );
    String token = (String) request.getAttribute("token");
    String netid = (String) request.getParameter("netid");
    String email = (String) request.getParameter("email");	

    Boolean attr = (Boolean) request.getAttribute("missing.fields");
    boolean missingFields = (attr != null && attr.booleanValue());

    attr = (Boolean) request.getAttribute("password.problem");
    boolean passwordProblem = (attr != null && attr.booleanValue());

    attr = (Boolean) request.getAttribute("set.password");
    boolean setPassword = (attr != null && attr.booleanValue());
%>

<dspace:layout style="submission" titlekey="jsp.register.registration-form.title" nocache="true">
  <section class="jumbotron bg-transparent">
    <h2><fmt:message key="jsp.register.registration-form.title"/></h2>
    <p class="lead">
      <fmt:message key="jsp.register.registration-form.info1"/>
    </p>
    <hr>
    <%  if (missingFields) { %>
          <div class="alert alert-danger">
            <fmt:message key="jsp.register.registration-form.instruct1"/>
          </div>
    <%  }
        if (passwordProblem) { %>
          <div class="alert alert-danger">
            <fmt:message key="jsp.register.registration-form.instruct2"/>
          </div>
    <%  } %>
    <div class="row">
      <form method="post" action="<%= request.getContextPath() %>/register">
        <input type="hidden" name="step" value="<%= RegisterServlet.PERSONAL_INFO_PAGE %>"/>
        <input type="hidden" name="token" value="<%= token %>"/>
        <% if (netid!=null) { %> <input type="hidden" name="netid" value="<%= netid %>" /> <% } %>
        <% if (email!=null) { %> <input type="hidden" name="email" value="<%= email %>" /> <% } %>
        <dspace:include page="/register/profile-form.jsp" />
        <% if (setPassword) { %>
          <div class="form-group col-md-6">
            <label for="tpassword"><fmt:message key="jsp.register.registration-form.pswd.field"/></label>
            <input class="form-control" type="password" name="password" id="tpassword" />
          </div>
          <div class="form-group col-md-6">
            <label for="tpassword_confirm"><fmt:message key="jsp.register.registration-form.confirm.field"/></label>
            <input class="form-control" type="password" name="password_confirm" id="tpassword_confirm" />
          </div>
        <%  } %>
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-unrn-reverse">
            <fmt:message key="jsp.register.registration-form.complete.button"/>
          </button>
        </div>
      </form>
    </div>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>
