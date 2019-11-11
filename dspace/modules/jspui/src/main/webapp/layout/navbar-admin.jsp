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

<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>

<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="org.dspace.sort.SortOption" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	  // Is anyone logged in?
	  EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);    
    int c = currentPage.indexOf( '?' );
    if( c > -1 ) {
      currentPage = currentPage.substring(0, c);
    }
    
    // E-mail may have to be truncated
    String navbarEmail = null;
    if (user != null) {
      navbarEmail = user.getEmail();
    }
%>

<nav class="navbar navbar-fixed-top">
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
            id="tequery"
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
  <div id="bs-navbar-collapse" class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-right">
      <%-- Buscador --%>
      <li class="visible-xs">
        <form class="navbar-form" role="search" method="get" action="<%= request.getContextPath() %>/simple-search">
          <div class="form-group">
            <input
              id="tequery"
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
            <li><a href="<%= request.getContextPath() %>/dspace-admin/workflow"><fmt:message key="jsp.layout.navbar-admin.workflow"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/supervise"><fmt:message key="jsp.layout.navbar-admin.supervisors"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/curate"><fmt:message key="jsp.layout.navbar-admin.curate"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/withdrawn"><fmt:message key="jsp.layout.navbar-admin.withdrawn"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/privateitems"><fmt:message key="jsp.layout.navbar-admin.privateitems"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/metadataimport"><fmt:message key="jsp.layout.navbar-admin.metadataimport"/></a></li>
            <li><a href="<%= request.getContextPath() %>/dspace-admin/batchimport"><fmt:message key="jsp.layout.navbar-admin.batchimport"/></a></li>             
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
          <li><a href="<%= request.getContextPath() %>/dspace-admin/edit-epeople"><fmt:message key="jsp.layout.navbar-admin.epeople"/></a></li>
          <li><a href="<%= request.getContextPath() %>/tools/group-edit"><fmt:message key="jsp.layout.navbar-admin.groups"/></a></li>
          <li><a href="<%= request.getContextPath() %>/tools/authorize"><fmt:message key="jsp.layout.navbar-admin.authorization"/></a></li>
        </ul>
      </li>
      <%-- Estadisticas --%>
      <li>
        <a href="<%= request.getContextPath() %>/statistics">
          <fmt:message key="jsp.layout.navbar-admin.statistics"/>
        </a>
      </li>
      <%-- Ajustes generales --%>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <fmt:message key="jsp.layout.navbar-admin.settings"/>
          <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="<%= request.getContextPath() %>/dspace-admin/metadata-schema-registry"><fmt:message key="jsp.layout.navbar-admin.metadataregistry"/></a></li>
          <li><a href="<%= request.getContextPath() %>/dspace-admin/format-registry"><fmt:message key="jsp.layout.navbar-admin.formatregistry"/></a></li>
          <li class="divider"></li>
          <li><a href="<%= request.getContextPath() %>/dspace-admin/news-edit"><fmt:message key="jsp.layout.navbar-admin.editnews"/></a></li>
          <li class="divider"></li>
          <li><a href="<%= request.getContextPath() %>/dspace-admin/license-edit"><fmt:message key="jsp.layout.navbar-admin.editlicense"/></a></li>
        </ul>
      </li>
      <%-- Ayuda --%>
      <li class="<%= ( currentPage.endsWith( "/help" ) ? "active" : "" ) %>">
        <dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") %>">
          <fmt:message key="jsp.layout.navbar-admin.help"/>
        </dspace:popup>
      </li>
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
<div class="jumbotron text-center jumbotron-admin">
  <div class="pattern"></div>
  <h1><fmt:message key="jsp.layout.header-default.brand.heading" /></h1>
  <p>Secci&oacute;n de Administraci&oacute;n</p>
</div>
