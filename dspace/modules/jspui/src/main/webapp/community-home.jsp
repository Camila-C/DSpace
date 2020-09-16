<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Community home JSP
  -
  - Attributes required:
  -    community             - Community to render home page for
  -    collections           - array of Collections in this community
  -    subcommunities        - array of Sub-communities in this community
  -    last.submitted.titles - String[] of titles of recently submitted items
  -    last.submitted.urls   - String[] of URLs of recently submitted items
  -    admin_button - Boolean, show admin 'edit' button
  --%>

<%@ page import="org.dspace.content.service.CollectionService"%>
<%@ page import="org.dspace.content.factory.ContentServiceFactory"%>
<%@ page import="org.dspace.content.service.CommunityService"%>
<%@ page import="org.dspace.content.service.ItemService"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>

<%@ page import="org.dspace.app.webui.servlet.admin.EditCommunitiesServlet" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.*" %>
<%@ page import="org.dspace.core.Utils" %>
<%@ page import="org.dspace.services.ConfigurationService" %>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List"%>

<%
  // Retrieve attributes
  Community community = (Community) request.getAttribute( "community" );
  List<Collection> collections =
      (List<Collection>) request.getAttribute("collections");
  List<Community> subcommunities =
      (List<Community>) request.getAttribute("subcommunities");
  
  RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recently.submitted");
  ItemService itemService = ContentServiceFactory.getInstance().getItemService();
  
  Boolean editor_b = (Boolean)request.getAttribute("editor_button");
  boolean editor_button = (editor_b == null ? false : editor_b.booleanValue());
  Boolean add_b = (Boolean)request.getAttribute("add_button");
  boolean add_button = (add_b == null ? false : add_b.booleanValue());
  Boolean remove_b = (Boolean)request.getAttribute("remove_button");
  boolean remove_button = (remove_b == null ? false : remove_b.booleanValue());

  // get the browse indices
  BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
	CommunityService comServ = ContentServiceFactory.getInstance().getCommunityService();
	CollectionService colServ = ContentServiceFactory.getInstance().getCollectionService();
  // Put the metadata values into guaranteed non-null variables
  String name = comServ.getMetadata(community, "name");
  String intro = comServ.getMetadata(community, "introductory_text");
  String sidebar = comServ.getMetadata(community, "side_bar_text");
  
  ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();
  
  boolean feedEnabled = configurationService.getBooleanProperty("webui.feed.enable");
  String feedData = "NONE";
  if (feedEnabled) {
    // FeedData is expected to be a comma separated list
    String[] formats = configurationService.getArrayProperty("webui.feed.formats");
    String allFormats = StringUtils.join(formats, ",");
    feedData = "comm:" + allFormats;
  }
  
  ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));
%>

<%-- La propiedad navbar="off" permite acceder a la versión minimal de navbar (es decir, sin el input search en el header) --%>
<%@page import="org.dspace.app.webui.servlet.MyDSpaceServlet"%>
<dspace:layout navbar="off" title="<%= name %>" subtitle="Página de inicio de la comunidad" feedData="<%= feedData %>">
  <div id="community-home">
    <div class="row">
      <!-- TITULO -->
      <div class="col-md-12">
        <% if (StringUtils.isNotBlank(intro)) { %>
          <p style="font-size: 16px;"><%= intro %></p>
        <% } %>
      </div>
      <!-- Buscador de la comunidad -->
      <div class="col-md-12">
        <%  if(configurationService.getBooleanProperty("webui.strengths.show")) { %>
        <h3>
          Busca en un total de <%= ic.getCount(community) %> registros
          <a class="statisticsLink" href="<%= request.getContextPath() %>/handle/<%= community.getHandle() %>/statistics">
            <fmt:message key="jsp.community-home.display-statistics"/>
          </a>
        </h3>
        <%  } %>
        <div class="well">
          <form method="get" action="<%= request.getContextPath() %>/handle/<%= community.getHandle() %>/simple-search">
            <div class="input-group input-group-lg">
              <input
                type="text"
                class="form-control"
                maxlength=200
                size="50"
                placeholder="Busca registros dentro de esta comunidad y sus colecciones"
                name="query"
                title="Buscar en RID-UNRN"
              >
              <div class="input-group-btn">
                <button type="submit" class="btn btn-unrn-reverse">
                  <span class="fas fa-search"></span>
                  Buscar
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <!-- Buscar por -->
      <div class="col-md-12">
        <div class="top-title clearfix">
          <h4>
            Buscar/
            <span>En esta comunidad</span>
          </h4>
        </div>
        <div class="text-center">
          <%-- Insert the dynamic list of browse options --%>
          <%  
              ArrayList<String> browseIcons = new ArrayList<String>(Arrays.asList("fa-calendar-check", "fa-user-edit", "fa-book", "fa-cubes", "fa-chalkboard-teacher"));
              for (int i = 0; i < bis.length; i++) {
                String key = "browse.menu." + bis[i].getName();
                String iconClass = "fas " + browseIcons.get(i) + " fa-3x fa-pull-left";
          %>
                <form class="inline-form" method="get" action="<%= request.getContextPath() %>/handle/<%= community.getHandle() %>/browse">
                  <input type="hidden" name="type" value="<%= bis[i].getName() %>"/>
                  <%-- <input type="hidden" name="community" value="<%= community.getHandle() %>" /> --%>
                  <button type="submit" name="submit_browse" class="btn btn-store">
                    <span class="<%=iconClass%>"></span> 
                    <span class="btn-label">Buscar por</span>
                    <span class="btn-caption"><fmt:message key="<%= key %>"/></span>
                  </button>
                </form>
          <%  } %>
        </div>
      </div>
      <!-- Subcomunidades -->
      <%
	      if (subcommunities.size() != 0) {
      %>
      <div class="col-md-12">
        <div class="top-title clearfix">
          <h4>
            <!-- Cuando la colección es igual a Digesto, muestro como subcomunidad lo sig. -->
            <% if (name.equals("Digesto")) { %>
                Tipo de/
                <span>normativa</span>
            <% } else { %>
                Subcomunidades/
                <span>En esta comunidad</span>
            <% } %>
          </h4>
        </div>
        <div class="list-group">
          <% for (int j = 0; j < subcommunities.size(); j++) { %>
          <div class="list-group-item">
            <h4 class="list-group-item-heading">
              <a href="<%= request.getContextPath() %>/handle/<%= subcommunities.get(j).getHandle() %>">
	              <%= subcommunities.get(j).getName() %>
              </a>
              <%  if (configurationService.getBooleanProperty("webui.strengths.show")) { %>
              <span class="badge badge-unrn"><%= ic.getCount(subcommunities.get(j)) %></span>
              <%  }
                  if (remove_button) {
              %>
                <form class="btn-group" method="post" action="<%=request.getContextPath()%>/tools/edit-communities">
                  <input type="hidden" name="parent_community_id" value="<%= community.getID() %>" />
                  <input type="hidden" name="community_id" value="<%= subcommunities.get(j).getID() %>" />
                  <input type="hidden" name="action" value="<%=EditCommunitiesServlet.START_DELETE_COMMUNITY%>" />
                  <button type="submit" class="btn btn-xs btn-danger"><span class="fas fa-trash"></span></button>
                </form>
	            <%  } %>
            </h4>
            <p class="collectionDescription">
              <%= comServ.getMetadata(subcommunities.get(j), "short_description") %>
            </p>
          </div>
          <% } %>
        </div>
      </div>
      <% } %>
      <!-- Colecciones -->
      <%
	      if (collections.size() != 0) {
      %>
      <div class="col-md-12">
        <div class="top-title clearfix">
          <h4>
            <!-- Cuando la colección es igual a Digesto, muestro como subcomunidad lo sig. -->
            <% if (name.equals("Resoluciones de la Universidad Nacional de Río Negro")) { %>
                Órganos/
                <span>de Gobierno</span>
            <% } else { %>
                Colecciones/
                <span>En esta comunidad</span>
            <% } %>
          </h4>
        </div>
        <div class="list-group">
          <% for (int i = 0; i < collections.size(); i++) { %>
          <div class="list-group-item">
            <h4 class="list-group-item-heading">
              <a href="<%= request.getContextPath() %>/handle/<%= collections.get(i).getHandle() %>">
	              <%= collections.get(i).getName() %>
              </a>
              <%  if (configurationService.getBooleanProperty("webui.strengths.show")) { %>
              <span class="badge badge-unrn"><%= ic.getCount(collections.get(i)) %></span>
              <%  }
                  if (remove_button) {
              %>
                <form class="btn-group" method="post" action="<%=request.getContextPath()%>/tools/edit-communities">
                  <input type="hidden" name="parent_community_id" value="<%= community.getID() %>" />
                  <input type="hidden" name="community_id" value="<%= community.getID() %>" />
                  <input type="hidden" name="collection_id" value="<%= collections.get(i).getID() %>" />
                  <input type="hidden" name="action" value="<%=EditCommunitiesServlet.START_DELETE_COLLECTION%>" />
                  <button type="submit" class="btn btn-xs btn-danger"><span class="fas fa-trash"></span></button>
                </form>
	            <%  } %>
            </h4>
            <p class="collectionDescription">
              <%= colServ.getMetadata(collections.get(i), "short_description") %>
            </p>
          </div>
          <% } %>
        </div>
      </div>
      <% } %>
      <!-- Envios recientes -->
      <div class="col-lg-12">
        <div class="top-title clearfix">
          <h4>
            Env&iacute;os/
            <span>recientes
            <%
                if(feedEnabled)
                {
                  String[] fmts = feedData.substring(5).split(",");
                  String icon = null;
                  int width = 0;
                  for (int j = 0; j < fmts.length; j++)
                  {
                    if ("rss_1.0".equals(fmts[j]))
                    {
                      icon = "rss1.gif";
                      width = 80;
                    }
                    else if ("rss_2.0".equals(fmts[j]))
                    {
                      icon = "rss2.gif";
                      width = 80;
                    }
                    else
                      {
                        icon = "rss.gif";
                        width = 36;
                      }
            %>
                <a href="<%= request.getContextPath() %>/feed/<%= fmts[j] %>/<%= community.getHandle() %>">
                  <img
                    src="<%= request.getContextPath() %>/image/<%= icon %>"
                    alt="RSS Feed"
                    width="<%= width %>"
                    height="15"
                    style="margin: 3px 0 3px"
                  />
                </a>
            <%
                  }
                }
            %>
            </span>
          </h4>
          <a class="btn-show-more hidden-xs hidden-sm" href="<%= request.getContextPath() %>/handle/<%= community.getHandle() %>/simple-search">VER TODOS ></a>
        </div>
        <div class="submissions-list">
        <%
          int count = 0;
          for (Item item : submissions.getRecentSubmissions()) {
            //Título
            String displayTitle = itemService.getMetadataFirstValue(item, "dc", "title", null, Item.ANY);
            if (displayTitle == null) {
              displayTitle = "Sin título";
            }
            //Resumen
            String displayAbstract = itemService.getMetadataFirstValue(item, "dc", "description", "resumen", Item.ANY);
            if (displayAbstract == null || displayAbstract.equals("-")) {
              displayAbstract = "Sin resumen en español";
            }
            //Tipo
            String displayType = itemService.getMetadataFirstValue(item, "dc", "type", null, Item.ANY);
            if (displayType == null) {
              displayType = "Indefinido";
            }
            //Fecha de publicación
            String displayDate = itemService.getMetadataFirstValue(item, "dc", "date", "accessioned", Item.ANY);
            if (displayDate != null) {
              SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
              Date tmpDate = sdf.parse(displayDate);
              SimpleDateFormat dateFormat = new SimpleDateFormat("d MMM, yyyy");
              displayDate = dateFormat.format(tmpDate);
            }
        %>
          <div class="col-lg-12 col-md-12 col-sm-12">
            <a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>">
              <div class="row group-submission">
                <div class="type-group col-md-2">
                  <div class="date"><%=displayDate%></div>
                  <div class="line-short hidden-xs"></div>
                  <div class="type"><%=displayType%></div>
                </div>
                <div class="title-group col-md-10">
                  <div class="line-short visible-xs"></div>
                  <h4><%=displayTitle%></h4>
                  <p><%= Utils.addEntities(StringUtils.abbreviate(displayAbstract, 270))%></p>
                </div>
              </div>
            </a>
          </div>
          <%
              count++;
              if (count > 5) {
                break;
              }
            }
          %>
        </div>  
      </div>
    </div>
  </div>
  <%  // edit button(s)
      if(editor_button || add_button) {
  %>
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
        <%  if(editor_button) { %>
            <form method="post" action="<%=request.getContextPath()%>/tools/edit-communities">
              <input type="hidden" name="community_id" value="<%= community.getID() %>" />
              <input type="hidden" name="action" value="<%=EditCommunitiesServlet.START_EDIT_COMMUNITY%>" />
              <%--<input type="submit" value="Edit..." />--%>
              <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.general.edit.button"/>" />
            </form>
        <%  } %>
        <%  if(add_button) { %>
            <form method="post" action="<%=request.getContextPath()%>/tools/collection-wizard">
              <input type="hidden" name="community_id" value="<%= community.getID() %>" />
              <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.community-home.create1.button"/>" />
            </form>
            <form method="post" action="<%=request.getContextPath()%>/tools/edit-communities">
              <input type="hidden" name="action" value="<%= EditCommunitiesServlet.START_CREATE_COMMUNITY%>" />
              <input type="hidden" name="parent_community_id" value="<%= community.getID() %>" />
              <%--<input type="submit" name="submit" value="Create Sub-community" />--%>
              <input class="btn btn-default col-md-12" type="submit" name="submit" value="<fmt:message key="jsp.community-home.create2.button"/>" />
            </form>
        <%  } %>
        <%  if( editor_button ) { %>
            <form method="post" action="<%=request.getContextPath()%>/mydspace">
              <input type="hidden" name="community_id" value="<%= community.getID() %>" />
              <input type="hidden" name="step" value="<%= MyDSpaceServlet.REQUEST_EXPORT_ARCHIVE %>" />
              <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.mydspace.request.export.community"/>" />
            </form>
            <form method="post" action="<%=request.getContextPath()%>/mydspace">
              <input type="hidden" name="community_id" value="<%= community.getID() %>" />
              <input type="hidden" name="step" value="<%= MyDSpaceServlet.REQUEST_MIGRATE_ARCHIVE %>" />
              <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.mydspace.request.export.migratecommunity"/>" />
            </form>
            <form method="post" action="<%=request.getContextPath()%>/dspace-admin/metadataexport">
              <input type="hidden" name="handle" value="<%= community.getHandle() %>" />
              <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.general.metadataexport.button"/>" />
            </form>
        <%  } %>
        </div>
      </div>
	    <%= sidebar %>
    </dspace:sidebar>
  <%  } %>
</dspace:layout>
