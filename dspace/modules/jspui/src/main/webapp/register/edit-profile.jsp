<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Profile editing page
  -
  - Attributes to pass in:
  -
  -   eperson          - the EPerson who's editing their profile
  -   missing.fields   - if a Boolean true, the user hasn't entered enough
  -                      information on the form during a previous attempt
  -   password.problem - if a Boolean true, there's a problem with password
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.eperson.EPerson, org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.Utils" %>

<%
    EPerson eperson = (EPerson) request.getAttribute("eperson");

    Boolean attr = (Boolean) request.getAttribute("missing.fields");
    boolean missingFields = (attr != null && attr.booleanValue());

    attr = (Boolean) request.getAttribute("password.problem");
    boolean passwordProblem = (attr != null && attr.booleanValue());

    boolean ldap_enabled = ConfigurationManager.getBooleanProperty("authentication-ldap", "enable");
    boolean ldap_eperson = (ldap_enabled && (eperson.getNetid() != null) && (eperson.getNetid().equals("") == false));
%>

<dspace:layout style="submission" titlekey="jsp.register.edit-profile.title" nocache="true">
  <section class="jumbotron bg-transparent">
    <h2>
      <fmt:message key="jsp.register.edit-profile.title"/>
      <%-- Menú de Ayuda
      <dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") + \"#editprofile\"%>">
        <fmt:message key="jsp.morehelp"/>
      </dspace:popup>
      --%>
    </h2>
    <p class="lead">
      <fmt:message key="jsp.register.edit-profile.info3"/>
    </p>
    <hr>
    <%  if (missingFields) { %>
          <div class="alert alert-danger">
            <fmt:message key="jsp.register.edit-profile.info1"/>
          </div>
    <%  }
        if (passwordProblem) { %>
          <div class="alert alert-danger">
            <fmt:message key="jsp.register.edit-profile.info2"/>
          </div>
    <%  } %>
    <div class="row">
      <form action="<%= request.getContextPath() %>/profile" method="post">
        <dspace:include page="/register/profile-form.jsp" />
        <%
            // Only show password update section if the user doesn't use
            // certificates
            if ((eperson.getRequireCertificate() == false) && (ldap_eperson == false)) {
        %>
              <div class="form-group col-md-12 alert">
                <fmt:message key="jsp.register.edit-profile.info5"/>
              </div>
              <div class="form-group col-md-6">
                <label for="tpassword"><fmt:message key="jsp.register.edit-profile.pswd.field"/></label>
                <input class="form-control" type="password" name="password" id="tpassword" />
              </div>
              <div class="form-group col-md-6">
                <label for="tpassword_confirm"><fmt:message key="jsp.register.edit-profile.confirm.field"/></label>
                <input class="form-control" type="password" name="password_confirm" id="tpassword_confirm" />
              </div>
        <%  } %>
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-unrn-reverse">
            <fmt:message key="jsp.register.edit-profile.update.button"/>
          </button>
        </div>
      </form>
    </div>
    <dspace:include page="/components/contact-info.jsp" />
  </section>
</dspace:layout>
