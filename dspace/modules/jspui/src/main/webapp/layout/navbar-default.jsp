<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Default navigation bar
--%>

<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="/WEB-INF/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo"%>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="java.util.Locale" %>

<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Is the logged in user an admin
    Boolean admin = (Boolean)request.getAttribute("is.admin");
    boolean isAdmin = (admin == null ? false : admin.booleanValue());

    Boolean communityAdmin = (Boolean)request.getAttribute("is.communityAdmin");
    boolean isCommunityAdmin = (communityAdmin == null ? false : communityAdmin.booleanValue());
    
    Boolean collectionAdmin = (Boolean)request.getAttribute("is.collectionAdmin");
    boolean isCollectionAdmin = (collectionAdmin == null ? false : collectionAdmin.booleanValue());

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf( '?' );
    if( c > -1 ) {
      currentPage = currentPage.substring( 0, c );
    }

    // E-mail may have to be truncated
    String navbarEmail = null;
    if (user != null) {
      navbarEmail = user.getEmail();
    }
    
    // get the browse indices
    BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
    BrowseInfo binfo = (BrowseInfo) request.getAttribute("browse.info");
    String browseCurrent = "";
    if (binfo != null) {
      BrowseIndex bix = binfo.getBrowseIndex();
      // Only highlight the current browse, only if it is a metadata index,
      // or the selected sort option is the default for the index
      if (bix.isMetadataIndex() || bix.getSortOption() == binfo.getSortOption()) {
        if (bix.getName() != null)
          browseCurrent = bix.getName();
      }
    }

    // get the locale languages
    Locale[] supportedLocales = I18nUtil.getSupportedLocales();
    Locale sessionLocale = UIUtil.getSessionLocale(request);
%>

<nav class="navbar">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%= request.getContextPath() %>/">
        <img id="logo" src="<%= request.getContextPath() %>/image/header/header_logo_unrn_negro.svg" alt="RID-UNRN logo" />
      </a>
      <p class="navbar-text hidden-xs">
        Repositorio
        <br>
        Institucional Digital
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
  <div id="bs-navbar-collapse" class="collapse navbar-collapse">
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
      <%-- Inicio --%>
      <li>
        <a href="<%= request.getContextPath() %>/">
          Inicio
        </a>
      </li>
      <%-- Colección COVID19 --%>
      <li>
        <a href="<%= request.getContextPath() %>/handle/20.500.12049/5071">
          <span class="label label-success">Nuevo</span>
          Covid-19
        </a>
      </li>
      <%-- Listar --%>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <fmt:message key="jsp.layout.navbar-default.browse"/>
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
          <li>
            <a href="<%= request.getContextPath() %>/community-list">
              <fmt:message key="jsp.layout.navbar-default.communities-collections"/>
            </a>
          </li>
          <%-- Insert the dynamic browse indices here --%>
          <%
              for (int i = 0; i < bis.length; i++) {
                BrowseIndex bix = bis[i];
                String key = "browse.menu." + bix.getName();
                // Solo muestro estas tres
                if (bix.getName().equals("author") || bix.getName().equals("advisor") || bix.getName().equals("subject")) {
          %>
          <li>
            <a href="<%= request.getContextPath() %>/browse?type=<%= bix.getName() %>">
              <fmt:message key="<%= key %>"/>
            </a>
          </li>
          <%	  }
              }
          %>
          <%-- End of dynamic browse indices --%>
        </ul>
      </li>
      <%-- Preguntas Frecuentes--%>
      <li>
        <a href="<%= request.getContextPath() %>/faqs">
          Preguntas Frecuentes
        </a>
      </li>
      <%-- Políticas del RID-UNRN --%>
      <li><a href="<%= request.getContextPath() %>/rid-policies">Pol&iacute;ticas</a></li>
      <%--
        <li class="<%= ( currentPage.endsWith( "/help" ) ? "active" : "" ) %>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") %>"><fmt:message key="jsp.layout.navbar-default.help"/></dspace:popup></li>
      --%>
      <%-- Lenguajes --%>
      <%
          if (supportedLocales != null && supportedLocales.length > 1) {
      %>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <fmt:message key="jsp.layout.navbar-default.language"/>
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
          <%
              for (int i = supportedLocales.length-1; i >= 0; i--) {
          %>
          <li>
            <a
              onclick="javascript:document.repost.locale.value='<%=supportedLocales[i].toString()%>';document.repost.submit();"
              href="<%= request.getContextPath() %>?locale=<%=supportedLocales[i].toString()%>"
            >
              <%= supportedLocales[i].getDisplayLanguage(supportedLocales[i])%>
            </a>
          </li>
          <%
              }
          %>
        </ul>
      </li>
      <%
          }
      %>
      <%-- Menú de usuario --%>
      <li class="dropdown">
      <%
          if (user != null) {
      %>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span>
          <%= StringUtils.abbreviate(navbarEmail, 20) %>
          <span class="caret"></span>
        </a>
      <%
          } else {
      %>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span> 
          <fmt:message key="jsp.layout.navbar-default.sign"/> 
          <span class="caret"></span>
        </a>
      <%
          }
      %>             
        <ul class="dropdown-menu">
          <li><a href="<%= request.getContextPath() %>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
          <li><a href="<%= request.getContextPath() %>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
          <li><a href="<%= request.getContextPath() %>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li>
      <%
          if (isAdmin || isCommunityAdmin || isCollectionAdmin) {
      %>
          <li role="separator" class="divider"></li>
          <%  if (isAdmin) { %>
            <li>
              <a href="<%= request.getContextPath() %>/dspace-admin">
          <%  } else if (isCommunityAdmin || isCollectionAdmin) { %>
            <li>
              <a href="<%= request.getContextPath()%>/tools">
          <%  } %>
                <fmt:message key="jsp.administer"/>
              </a>
            </li>
      <%
          }
          if (user != null) {
      %>
          <li>
            <a href="<%= request.getContextPath() %>/logout">
              <span class="glyphicon glyphicon-log-out"></span> 
              <fmt:message key="jsp.layout.navbar-default.logout"/>
            </a>
          </li>
      <%
          }
      %>
        </ul>
      </li>
      <%-- Botón ingresar --%>
      <%  if (user == null) { %>
      <li>
        <p class="navbar-btn">
          <a class="btn btn-unrn" href="<%= request.getContextPath() %>/mydspace">Ingresar</a>
        </p>
      </li>
      <%  } %>
    </ul>
  </div>
</nav>
