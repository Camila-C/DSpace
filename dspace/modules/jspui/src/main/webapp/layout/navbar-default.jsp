<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Default navigation bar
--%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=ISO-8859-1" %>

<%@ taglib uri="/WEB-INF/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale"%>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="java.util.Map" %>
<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Is the logged in user an admin
    Boolean admin = (Boolean)request.getAttribute("is.admin");
    boolean isAdmin = (admin == null ? false : admin.booleanValue());

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf( '?' );
    if( c > -1 )
    {
        currentPage = currentPage.substring( 0, c );
    }

    // E-mail may have to be truncated
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }
    
    // get the browse indices
    
	BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
    BrowseInfo binfo = (BrowseInfo) request.getAttribute("browse.info");
    String browseCurrent = "";
    if (binfo != null)
    {
        BrowseIndex bix = binfo.getBrowseIndex();
        // Only highlight the current browse, only if it is a metadata index,
        // or the selected sort option is the default for the index
        if (bix.isMetadataIndex() || bix.getSortOption() == binfo.getSortOption())
        {
            if (bix.getName() != null)
    			browseCurrent = bix.getName();
        }
    }
 // get the locale languages
    Locale[] supportedLocales = I18nUtil.getSupportedLocales();
    Locale sessionLocale = UIUtil.getSessionLocale(request);
%>


       <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
         <!-- Habilitar cuando se saque el buscador del nav
         <a class="navbar-brand" href="<%= request.getContextPath() %>/">
          <img height="25" src="<%= request.getContextPath() %>/image/header_logo_unrn_blanco.svg" alt="DSpace logo" />
         </a>
         -->
       </div>
       <nav class="collapse navbar-collapse bs-navbar-collapse">
         <ul class="nav navbar-nav">
           <li class="<%= currentPage.endsWith("/home.jsp")? "active" : "" %>"><a href="<%= request.getContextPath() %>/"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
           <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-default.browse"/> <span class="caret"></span></a>
             <ul class="dropdown-menu">
               <li><a href="<%= request.getContextPath() %>/community-list"><fmt:message key="jsp.layout.navbar-default.communities-collections"/></a></li>
				<li class="divider"></li>
        <li class="dropdown-header"><fmt:message key="jsp.layout.navbar-default.browseitemsby"/></li>
				<%-- Insert the dynamic browse indices here --%>
				
				<%
					for (int i = 0; i < bis.length; i++)
					{
						BrowseIndex bix = bis[i];
						String key = "browse.menu." + bix.getName();
					%>
				      			<li><a href="<%= request.getContextPath() %>/browse?type=<%= bix.getName() %>"><fmt:message key="<%= key %>"/></a></li>
					<%	
					}
				%>
				    
				<%-- End of dynamic browse indices --%>

            </ul>
          </li>
          
          <%-- Preguntas Frecuentes--%>
          <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown">Preguntas Frecuentes <span class="caret"></span></a>
             <ul class="dropdown-menu">
             		<li><a href="<%= request.getContextPath() %>/que-es.jsp">&iquest;Qu&eacute; es el RID-UNRN?</a></li>
             		<li><a href="<%= request.getContextPath() %>/comunidades-colecciones.jsp">&iquest;C&oacute;mo est&aacute; organizado?</a></li>
				 	      <li><a href="<%= request.getContextPath() %>/como-buscar.jsp">&iquest;C&oacute;mo buscar en el RID-UNRN?</a></li>
			 		      <li><a href="<%= request.getContextPath() %>/como-subir.jsp">&iquest;C&oacute;mo subir un documento?</a></li>
                <li class="divider"></li>
                <li><a href="<%= request.getContextPath() %>/ayuda-bibliotecarios.jsp">Ayuda para los bibliotecarios</a></li>
            </ul>
          </li>
          
          <%-- Políticas del RID--%>
          <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pol&iacute;ticas del RID-UNRN<span class="caret"></span></a>
             <ul class="dropdown-menu">
			 <li><a href="<%= request.getContextPath() %>/politicas.jsp">Res. CICADYTT Pol&iacute;ticas del RID-UNRN</b></a></li>
             		<li><a href="<%= request.getContextPath() %>/ley-26899.jsp">Ley Nacional de Repositorios Digitales</a></li>
			 <li><a href="<%= request.getContextPath() %>/reglamentacion-ley.jsp">Reglamentaci&oacute;n de la Ley de Repositorios Digitales</a></li>
             		<li><a href="<%= request.getContextPath() %>/cicadytt.jsp">Res. CICADYTT Creaci&oacute;n del RID-UNRN</a></li>
			 <li><a href="<%= request.getContextPath() %>/disp-formularios.jsp">Disp. SICADYTT Formularios</a></li>
			 <li><a href="<%= request.getContextPath() %>/disp-circuitos-ingesta.jsp"> Disp. SICADYTT Circuitos de Ingesta</a></li>
             <!-- <li class="divider"></li> -->
             
           </ul>
          </li>
          
          <%-- ayudas 
          <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ayuda<span class="caret"></span></a>
             <ul class="dropdown-menu">
                <li><a href="<%= request.getContextPath() %>/#tt">Servicios a Usuarios</a></li>
                <li><a href="<%= request.getContextPath() %>/#tt">Servicios a Autores</a></li>
                <li class="divider"></li>
                 <li><a href="<%= request.getContextPath() %>/#tt">Buenas Practicas</a></li>
             </ul>
          </li> --%>
          
         <%--  <li class="<%= ( currentPage.endsWith( "/help" ) ? "active" : "" ) %>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") %>"><fmt:message key="jsp.layout.navbar-default.help"/></dspace:popup></li>
       </ul>
        --%>
 <% if (supportedLocales != null && supportedLocales.length > 1)
     {
 %>
    <div class="nav navbar-nav navbar-right">
	 <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
       <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-default.language"/><span class="caret"></span></a>
        <ul class="dropdown-menu">
 <%
    for (int i = supportedLocales.length-1; i >= 0; i--)
     {
 %>
      <li>
        <a onclick="javascript:document.repost.locale.value='<%=supportedLocales[i].toString()%>';
                  document.repost.submit();" href="<%= request.getContextPath() %>?locale=<%=supportedLocales[i].toString()%>">
         <%= supportedLocales[i].getDisplayLanguage(supportedLocales[i])%>
       </a>
      </li>
 <%
     }
 %>
     </ul>
    </li>
    </ul>
  </div>
 <%
   }
 %>
 
       <div class="nav navbar-nav navbar-right">
		<ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
         <%
    if (user != null)
    {
		%>
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <%= StringUtils.abbreviate(navbarEmail, 20) %> <span class="caret"></span></a>
		<%
    } else {
		%>
             <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <fmt:message key="jsp.layout.navbar-default.sign"/> <span class="caret"></span></a>
	<% } %>             
             <ul class="dropdown-menu">
               <li><a href="<%= request.getContextPath() %>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
               <li><a href="<%= request.getContextPath() %>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
               <li><a href="<%= request.getContextPath() %>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li>

		<%
		  if (isAdmin)
		  {
		%>
			   <li class="divider"></li>  
               <li><a href="<%= request.getContextPath() %>/dspace-admin"><fmt:message key="jsp.administer"/></a></li>
		<%
		  }
		  if (user != null) {
		%>
		<li><a href="<%= request.getContextPath() %>/logout"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="jsp.layout.navbar-default.logout"/></a></li>
		<% } %>
             </ul>
           </li>
          </ul>
          
	<%-- Search Box --%>
	<form method="get" action="<%= request.getContextPath() %>/simple-search" class="navbar-form navbar-right">
	    <div class="form-group">
			
          <input type="text" maxlength=200 class="form-control d-inline" placeholder="Ingrese palabras clave" name="query" id="tequery" size="25" title="Buscar en RID-UNRN"/>
        </div>
        <button type="submit" class="d-inline btn btn-primary"><span class="glyphicon glyphicon-search"></span> Buscar</button>
<%--               <br/><a href="<%= request.getContextPath() %>/advanced-search"><fmt:message key="jsp.layout.navbar-default.advanced"/></a>
<%
			if (ConfigurationManager.getBooleanProperty("webui.controlledvocabulary.enable"))
			{
%>        
              <br/><a href="<%= request.getContextPath() %>/subject-search"><fmt:message key="jsp.layout.navbar-default.subjectsearch"/></a>
<%
            }
%> --%> 
	</form></div>
    </nav>
