<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Navigation bar for admin pages
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%@ page import="org.dspace.eperson.EPerson" %>

<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	  // Is anyone logged in?
	  EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);    
    int c = currentPage.indexOf( '?' );
    if( c > -1 )
    {
        currentPage = currentPage.substring(0, c);
    }
    
    // E-mail may have to be truncated
    String navbarEmail = null;
    if (user != null)
    {
        navbarEmail = user.getEmail();
    }
%>
<nav id="navbar-admin" class="navbar">
	<div class="container">
	<!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%= request.getContextPath() %>/">
        <img id="logo" src="<%= request.getContextPath() %>/image/header/header_logo_unrn_negro.svg" alt="RID-UNRN logo" />
				</a>
			<p class="navbar-text hidden-xs">
        RID
        <br>
        Administraci&oacute;n
			</p>
      <form class="navbar-form navbar-right hidden-xs" role="search" method="get" action="<%= request.getContextPath() %>/simple-search">
        <div class="form-group">
          <input
            type="text"
            class="form-control input-lg"
            maxlength=200
            size="50"
            placeholder="<fmt:message key='jsp.layout.header-default.form.search' />"
            name="query"
            title="Buscar en RID-UNRN"
          >
        </div>
        <button type="submit" class="btn btn-unrn-reverse btn-lg">
          <span><i class="fas fa-search"></i></span>
        </button>
      </form>
    </div>
  </div>
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div id="bs-navbar-collapse-1" class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-right">
      <%-- Buscador --%>
      <li class="visible-xs">
        <form class="navbar-form" role="search" method="get" action="<%= request.getContextPath() %>/simple-search">
          <div class="form-group">
            <input
              type="text"
              class="form-control"
              maxlength=200
              size="50"
              placeholder="<fmt:message key='jsp.layout.header-default.form.search' />"
              name="query"
              title="Buscar en RID-UNRN"
            >
          </div>
          <button type="submit" class="btn btn-unrn-reverse">
            Buscar
          </button>
        </form>
      </li>
      <%-- Contenido --%>
      <li class="dropdown">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <fmt:message key="jsp.layout.navbar-admin.contents"/>
          <b class="caret"></b>
          </a>
          <ul class="dropdown-menu">
            <li><a href="<%= request.getContextPath() %>/tools/edit-communities"><fmt:message key="jsp.layout.navbar-admin.communities-collections"/></a></li>
            <li class="divider"></li>
            <li><a href="<%= request.getContextPath() %>/tools/edit-item"><fmt:message key="jsp.layout.navbar-admin.items"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/withdrawn"><fmt:message key="jsp.layout.navbar-admin.withdrawn"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/privateitems"><fmt:message key="jsp.layout.navbar-admin.privateitems"/></a></li>
          </ul>
        </li>
      </li>
      <%-- Control de acceso --%>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <fmt:message key="jsp.layout.navbar-admin.accesscontrol"/>
          <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="<%= request.getContextPath() %>/tools/group-edit"><fmt:message key="jsp.layout.navbar-admin.groups"/></a></li>
          <li><a href="<%= request.getContextPath() %>/tools/authorize"><fmt:message key="jsp.layout.navbar-admin.authorization"/></a></li>
        </ul>
      </li>
      <%-- Ayuda --%>
      <%-- No descomponer ni formatear este campo ya que falla --%>
      <li class="<%= ( currentPage.endsWith( "/help" ) ? "active" : "" ) %>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") %>"><fmt:message key="jsp.layout.navbar-admin.help"/></dspace:popup></li>
      <%-- Menú de usuario --%>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span>
              <%= StringUtils.abbreviate(navbarEmail, 20) %>
          <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="<%= request.getContextPath() %>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
          <li><a href="<%= request.getContextPath() %>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
          <li><a href="<%= request.getContextPath() %>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li>
          <li class="divider"></li>
          <li>
            <a href="<%= request.getContextPath() %>/logout">
              <span class="glyphicon glyphicon-log-out"></span>
              <fmt:message key="jsp.layout.navbar-default.logout"/>
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

