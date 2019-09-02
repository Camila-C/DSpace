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

<%@ page import="org.dspace.content.Bitstream"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<%@ page import="org.dspace.app.webui.servlet.admin.EditCommunitiesServlet" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.browse.ItemCountException" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
  Community[] communities = (Community[]) request.getAttribute("communities");
  Map collectionMap = (Map) request.getAttribute("collections.map");
  Map subcommunityMap = (Map) request.getAttribute("subcommunities.map");
  Boolean admin_b = (Boolean)request.getAttribute("admin_button");
  boolean admin_button = (admin_b == null ? false : admin_b.booleanValue());
  ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));
%>

<%!
	void showCommunity(Community c, JspWriter out, HttpServletRequest request, ItemCounter ic,
	Map collectionMap, Map subcommunityMap, String idAccordion, Boolean first) throws ItemCountException, IOException, SQLException
	{
		boolean showLogos = ConfigurationManager.getBooleanProperty("jspui.community-list.logos", true);
		// Inicio panel-default
		out.println("<div class=\"panel panel-default\">");
		
		// Inicio panel-heading
		out.println("<div class=\"panel-heading\">");
		out.println("<h4 class=\"panel-title\">");

		out.println("<a role=\"button\" data-toggle=\"collapse\" data-parent=\"#" + idAccordion
			+ "\" class=\"" + (first ? "" : "collapsed") + "\" href=\"#com-collapse-" + c.getID() + "\"></a>");

		out.println("<a href=\"" + request.getContextPath() + "/handle/" + c.getHandle() + "\">");

		Bitstream logo = c.getLogo();
		if (showLogos && logo != null) {
			out.println("<img src=\"" + request.getContextPath() + "/retrieve/" + logo.getID()
				+ "\" alt=\"community logo\" height=\"30\">");
		}

		out.println(c.getMetadata("name"));

		if(ConfigurationManager.getBooleanProperty("webui.strengths.show")) {
			out.println(" <span class=\"badge\">" + ic.getCount(c) + "</span>");
		}
		
		out.println("</a></h4></div>");
		// Fin panel-heading
		
		// Inicio panel-collapse
		out.println("<div id=\"com-collapse-" + c.getID() + "\" class=\"panel-collapse collapse " + (first ? "in" : "") + "\">");
		out.println("<div class=\"panel-body\">");

		if (StringUtils.isNotBlank(c.getMetadata("short_description")))	{
			out.println("<p>" + c.getMetadata("short_description") + "</p>");
		}

		// Get the collections in this community
		Collection[] cols = (Collection[]) collectionMap.get(c.getID());
		if (cols != null && cols.length > 0) {
			out.println("<div class=\"panel-group\" id=\"col-accordion-" + c.getID() + "\">");
			for (int j = 0; j < cols.length; j++) {
				out.println("<div class=\"panel panel-default\">");
				out.println("<div class=\"panel-heading\">");
				out.println("<h4 class=\"panel-title\">");
				out.println("<a role=\"button\" data-toggle=\"collapse\" data-parent=\"#col-accordion-"
					+ c.getID() + "\" class=\"collapsed\" href=\"#col-collapse-" + cols[j].getID() + "\"></a>");
				out.println("<a href=\"" + request.getContextPath() + "/handle/" + cols[j].getHandle() + "\">");

				out.println(cols[j].getMetadata("name"));
				if(ConfigurationManager.getBooleanProperty("webui.strengths.show")) {
					out.println(" [" + ic.getCount(cols[j]) + "]");
				}
				out.println("</a></h4></div>");

				out.println("<div id=\"col-collapse-" + cols[j].getID() + "\" class=\"panel-collapse collapse\">");
				out.println("<div class=\"panel-body\">");
				if (StringUtils.isNotBlank(cols[j].getMetadata("short_description"))) {
					out.println("<p>" + cols[j].getMetadata("short_description") + "</p>");
				}
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");
			}
			out.println("</div>");
		}

		// Get the sub-communities in this community
		Community[] comms = (Community[]) subcommunityMap.get(c.getID());
		if (comms != null && comms.length > 0) {
			String newidAccordion = "accordion-" + c.getID();
			out.println("<div class=\"panel-group\" id=\"" + newidAccordion + "\">");
			for (int k = 0; k < comms.length; k++) {
				showCommunity(comms[k], out, request, ic, collectionMap, subcommunityMap, newidAccordion, false);
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
	<h1><fmt:message key="jsp.community-list.title"/></h1>
	<p><fmt:message key="jsp.community-list.text1"/></p>
	<% 	
			if (communities.length != 0) {
				String idAccordion = "accordion-communities";
				// Añadir la clase "in" al collapse del primer elemento del Accordion
				boolean first = true;
	%>
    		<div class="panel-group" id="<%=idAccordion%>">
				<%	for (int i = 0; i < communities.length; i++) {
							//El ID de autoarchivo es el nro. 50. Por lo tanto, para no mostrarla, pregunto si el ID es dintinto a 50
          		if (communities[i].getID() != 50) {
								showCommunity(communities[i], out, request, ic, collectionMap, subcommunityMap, idAccordion, first);
								first = false;
							}
         		}
				%>
    		</div>
	<%	}	%>
</dspace:layout>
