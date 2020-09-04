<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - HTML header for main home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page contentType="text/html;charset=ISO-8859-1" %>

<%@ page import="org.dspace.app.util.Util"%>
<%@ page import="org.dspace.core.ConfigurationManager"%>
<%@ page import="java.util.List" %>

		<%
	String title = (String) request.getAttribute("dspace.layout.title");
	String navbar = (String) request.getAttribute("dspace.layout.navbar");

	String siteName = ConfigurationManager.getProperty("dspace.name");
	String feedRef = (String)request.getAttribute("dspace.layout.feedref");
	boolean osLink = ConfigurationManager.getBooleanProperty("websvc.opensearch.autolink");
	String osCtx = ConfigurationManager.getProperty("websvc.opensearch.svccontext");
	String osName = ConfigurationManager.getProperty("websvc.opensearch.shortname");
	List parts = (List)request.getAttribute("dspace.layout.linkparts");
	String extraHeadData = (String)request.getAttribute("dspace.layout.head");
	String extraHeadDataLast = (String)request.getAttribute("dspace.layout.head.last");
	String dsVersion = Util.getSourceVersion();
	String generator = dsVersion == null ? "DSpace" : "DSpace "+dsVersion;

	String currentPath = (String)request.getAttribute("javax.servlet.forward.servlet_path");
%>

<!DOCTYPE html>
	<html lang="es">
    <head>
			<title><%= siteName %>: <%= title %></title>
			<meta charset="UTF-8">
			<meta name="Generator" content="<%= generator %>" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon"/>
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom/redmond/jquery-ui-1.10.3.custom.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap.min.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap-theme.min.css" type="text/css" />
			<!-- Tema del RID -->
			<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/rid-unrn-theme.css" type="text/css" />
			<!-- Fontawesome 5.10.1 -->
			<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/fontawesome-free-5.10.1/css/all.min.css" type="text/css" />
			<!-- Academicons 1.8.6 -->
			<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/academicons-1.8.6/css/academicons.min.css"/>
			<!-- My Flaticons -->
			<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/myFlaticons/flaticon.css"/>
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/dspace-theme.css" type="text/css" />
		<%	if (!"NONE".equals(feedRef)) {
				for (int i = 0; i < parts.size(); i+= 3) {
		%>
        	<link
				rel="alternate"
				type="application/<%= (String)parts.get(i) %>"
				title="<%= (String)parts.get(i+1) %>"
				href="<%= request.getContextPath() %>/feed/<%= (String)parts.get(i+2) %>/<%= feedRef %>"
			/>
		<%
				}
			}
			if (osLink) {
		%>
        <link rel="search" type="application/opensearchdescription+xml" href="<%= request.getContextPath() %>/<%= osCtx %>description.xml" title="<%= osName %>"/>
		<%
			}
				if (extraHeadData != null) { %>
					<%= extraHeadData %>
		<%  } %>
			<script src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
			<script src="<%= request.getContextPath() %>/static/js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
			<script src="<%= request.getContextPath() %>/static/js/bootstrap/bootstrap.min.js"></script>
			<script src="<%= request.getContextPath() %>/static/js/holder.js"></script>
			<script src="<%= request.getContextPath() %>/utils.js"></script>
			<script src="<%= request.getContextPath() %>/static/js/choice-support.js"> </script>
			<script src="<%= request.getContextPath() %>/static/js/rid-unrn-theme.js"> </script>
			<dspace:include page="/layout/google-analytics-snippet.jsp" />

		<%  if (extraHeadDataLast != null) { %>
					<%= extraHeadDataLast %>
		<%  } %>
    	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="<%= request.getContextPath() %>/static/js/html5shiv.js"></script>
			<script src="<%= request.getContextPath() %>/static/js/respond.min.js"></script>
		<![endif]-->
  	</head>

	<%-- HACK: leftmargin, topmargin: for non-CSS compliant Microsoft IE browser --%>
	<%-- HACK: marginwidth, marginheight: for non-CSS compliant Netscape browser --%>
	<body>
		<a class="sr-only" href="#content">Skip navigation</a>
		<header>
    	<%	if (!navbar.equals("off")) { %>
        	<dspace:include page="<%= navbar %>" />
		<%	} else { %>
        	<dspace:include page="/layout/navbar-minimal.jsp" />
		<%	} %>
		</header>

		<main id="content">
		<%-- Page contents --%>
		<%  if (currentPath != null && currentPath.equals("/index.jsp")) { %>
			<div>
		<%  } else { %>
			<div id="page-content" class="container">
		<%  } %>
		<% if (request.getAttribute("dspace.layout.sidebar") != null) { %>
			<div class="row">
				<div class="col-md-9">
		<% } %>
