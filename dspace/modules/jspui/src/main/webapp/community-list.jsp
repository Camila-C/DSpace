<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>

<%--
  - Display hierarchical list of communities and collections
  -
  - Attributes to be passed in:
  -    communities         - array of communities
  -    collections.map  - Map where a keys is a community IDs (Integers) and 
  -                      the value is the array of collections in that community
  -    subcommunities.map  - Map where a keys is a community IDs (Integers) and 
  -                      the value is the array of subcommunities in that community
  -    admin_button - Boolean, show admin 'Create Top-Level Community' button
  --%>

<%@	page import="org.apache.commons.lang.StringUtils"%>
<%@	page import="org.dspace.app.webui.servlet.admin.EditCommunitiesServlet"%>
<%@	page import="org.dspace.app.webui.util.UIUtil"%>
<%@	page import="org.dspace.browse.ItemCountException"%>
<%@	page import="org.dspace.browse.ItemCounter"%>
<%@	page import="org.dspace.content.Collection"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.content.factory.ContentServiceFactory" %>
<%@ page import="org.dspace.content.service.CollectionService" %>
<%@ page import="org.dspace.content.service.CommunityService" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
	List<Community> communities = (List<Community>) request.getAttribute("communities");
	Map collectionMap = (Map) request.getAttribute("collections.map");
	Map subcommunityMap = (Map) request.getAttribute("subcommunities.map");
	Boolean admin_b = (Boolean)request.getAttribute("admin_button");
	boolean admin_button = (admin_b == null ? false : admin_b.booleanValue());
	ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));
%>

<%!
	CommunityService comServ = ContentServiceFactory.getInstance().getCommunityService();
	CollectionService colServ = ContentServiceFactory.getInstance().getCollectionService();
	void showCommunity(Community c, JspWriter out, HttpServletRequest request, ItemCounter ic,
			Map collectionMap, Map subcommunityMap, String idAccordion, Boolean first) throws ItemCountException, IOException, SQLException
	{
		// Inicio panel-default
		out.println("<div class=\"panel panel-default\">");
		
		// Inicio panel-heading
		out.println("<div class=\"panel-heading\">");
		out.println("<h4 class=\"panel-title\">");

		out.println("<a role=\"button\" data-toggle=\"collapse\" data-parent=\"#" + idAccordion
			+ "\" class=\"" + (first ? "" : "collapsed") + "\" href=\"#com-collapse-" + c.getID().toString() + "\"></a>");

		out.println("<a href=\"" + request.getContextPath() + "/handle/" + c.getHandle() + "\">");

		out.println(c.getName());

		if(ConfigurationManager.getBooleanProperty("webui.strengths.show")) {
			out.println(" <span class=\"badge\">" + ic.getCount(c) + "</span>");
		}
		
		out.println("</a></h4></div>");
		// Fin panel-heading
		
		// Inicio panel-collapse
		out.println("<div id=\"com-collapse-" + c.getID().toString() + "\" class=\"panel-collapse collapse " + (first ? "in" : "") + "\">");
		out.println("<div class=\"panel-body\">");

		if (StringUtils.isNotBlank(comServ.getMetadata(c, "short_description")))	{
			out.println("<p>" + comServ.getMetadata(c, "short_description") + "</p>");
		}

		// Get the collections in this community
		List<Collection> cols = (List<Collection>) collectionMap.get(c.getID().toString());
		if (cols != null && cols.size() > 0) {
			out.println("<div class=\"panel-group\">");
			for (Collection col : cols) {
				out.println("<div class=\"panel panel-default\">");
				out.println("<div class=\"panel-heading\">");
				out.println("<h4 class=\"my-panel-title\">");
				out.println("<a href=\"" + request.getContextPath() + "/handle/" + col.getHandle() + "\">");
				out.println("<i class=\"fas fa-caret-right\"></i>");
				out.println(col.getName());
				if (ConfigurationManager.getBooleanProperty("webui.strengths.show")) {
					out.println(" <span class=\"label label-info\">" + ic.getCount(col) + "</span>");
				}
				out.println("</a></h4></div>");
				out.println("</div>");
			}
			out.println("</div>");
		}

		// Get the sub-communities in this community
		List<Community> comms = (List<Community>) subcommunityMap.get(c.getID().toString());
		if (comms != null && comms.size() > 0) {
			String newidAccordion = "accordion-" + c.getID().toString();
			out.println("<div class=\"panel-group\" id=\"" + newidAccordion + "\">");
			for (Community comm : comms) {
				showCommunity(comm, out, request, ic, collectionMap, subcommunityMap, newidAccordion, false);
			}
			out.println("</div>"); 
		}

		out.println("</div>");
		out.println("</div>");
		// Fin panel-collapse
		out.println("</div>");
		// Fin panel-default
	}
%>

<dspace:layout titlekey="jsp.community-list.title">
	<% if (admin_button) { %>     
		<dspace:sidebar>
			<div class="panel panel-warning">
				<div class="panel-heading">
					<fmt:message key="jsp.admintools"/>
					<span class="pull-right">
						<dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\")%>">
							<fmt:message key="jsp.adminhelp"/>
						</dspace:popup>
					</span>
				</div>
				<div class="panel-body">
					<form method="post" action="<%=request.getContextPath()%>/dspace-admin/edit-communities">
						<input type="hidden" name="action" value="<%=EditCommunitiesServlet.START_CREATE_COMMUNITY%>" />
						<input class="btn btn-default" type="submit" name="submit" value="<fmt:message key="jsp.community-list.create.button"/>" />
					</form>
				</div>
			</div>
		</dspace:sidebar>
	<% } %>
	<h2 class="text-center">
		<fmt:message key="jsp.community-list.title"/>
	</h2>
	<div class="alert alert-info">
		<strong>Informaci&oacute;n! </strong>
		<fmt:message key="jsp.community-list.text1"/>
	</div>
	<% 	
		if (communities.size() != 0) {
			String idAccordion = "accordion-communities";
			// Añadir la clase "in" al collapse del primer elemento del Accordion
			boolean first = true;
	%>
			<div class="panel-group" id="<%=idAccordion%>">
				<% for (Community community : communities) {
					//El ID de autoarchivo es el nro. 50. Por lo tanto, para no mostrarla, pregunto si el ID es dintinto a 50
					if (!community.getName().contains("Autoarchivo")) {
						showCommunity(community, out, request, ic, collectionMap, subcommunityMap, idAccordion, first);
						first = false;
					}
				}
				%>
			</div>
	<%	}	%>
</dspace:layout>
