<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Component which displays a login form and associated information
  --%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form id="loginform" name="loginform" method="post" action="<%= request.getContextPath() %>/password-login">
  <div class="form-group">
    <label for="tlogin_email" class="control-label">
      <fmt:message key="jsp.components.login-form.email"/>
    </label>
    <input type="text" class="form-control" name="login_email" id="tlogin_email" tabindex="1" placeholder="example@gmail.com">
    <span class="help-block"></span>
  </div>
  <div class="form-group">
    <label for="tlogin_password" class="control-label">
      <fmt:message key="jsp.components.login-form.password"/>
    </label>
    <input type="password" class="form-control" id="tlogin_password" name="login_password" tabindex="2">
    <span class="help-block"></span>
  </div>
  <div class="form-group">
    <a href="<%= request.getContextPath() %>/forgot">
      <fmt:message key="jsp.components.login-form.forgot"/>
    </a>
  </div>
  <button type="submit" class="btn btn-success btn-block" name="login_submit" tabindex="3">
    <fmt:message key="jsp.components.login-form.login"/>
  </button>
</form>
<script type="text/javascript">
	document.loginform.login_email.focus();
</script>