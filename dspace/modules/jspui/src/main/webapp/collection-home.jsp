<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Collection home JSP
  -
  - Attributes required:
  -    collection  - Collection to render home page for
  -    community   - Community this collection is in
  -    last.submitted.titles - String[], titles of recent submissions
  -    last.submitted.urls   - String[], corresponding URLs
  -    logged.in  - Boolean, true if a user is logged in
  -    subscribed - Boolean, true if user is subscribed to this collection
  -    admin_button - Boolean, show admin 'edit' button
  -    editor_button - Boolean, show collection editor (edit submitters, item mapping) buttons
  -    show.items - Boolean, show item list
  -    browse.info - BrowseInfo, item list
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>

<%@ page import="org.dspace.app.webui.servlet.admin.EditCommunitiesServlet" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="org.dspace.browse.ItemCounter"%>
<%@ page import="org.dspace.content.*"%>
<%@ page import="org.dspace.core.Utils" %>
<%@ page import="org.dspace.eperson.Group"     %>
<%@ page import="org.dspace.services.ConfigurationService" %>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Date" %>

<%
    // Retrieve attributes
    Collection collection = (Collection) request.getAttribute("collection");
    Community  community  = (Community) request.getAttribute("community");
    Group      submitters = (Group) request.getAttribute("submitters");

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recently.submitted");
    ItemService itemService = ContentServiceFactory.getInstance().getItemService();

    boolean loggedIn = ((Boolean) request.getAttribute("logged.in")).booleanValue();
    boolean subscribed = ((Boolean) request.getAttribute("subscribed")).booleanValue();
    Boolean admin_b = (Boolean)request.getAttribute("admin_button");
    boolean admin_button = (admin_b == null ? false : admin_b.booleanValue());

    Boolean editor_b      = (Boolean)request.getAttribute("editor_button");
    boolean editor_button = (editor_b == null ? false : editor_b.booleanValue());

    Boolean submit_b      = (Boolean)request.getAttribute("can_submit_button");
    boolean submit_button = (submit_b == null ? false : submit_b.booleanValue());

    // get the browse indices
    BrowseIndex[] bis = BrowseIndex.getBrowseIndices();

    CollectionService collectionService = ContentServiceFactory.getInstance().getCollectionService();
    // Put the metadata values into guaranteed non-null variables
    String name = collectionService.getMetadata(collection, "name");
    String intro = collectionService.getMetadata(collection, "introductory_text");
    if (intro == null) {
        intro = "";
    }
    String copyright = collectionService.getMetadata(collection, "copyright_text");
    if (copyright == null) {
        copyright = "";
    }
    String sidebar = collectionService.getMetadata(collection, "side_bar_text");
    if(sidebar == null) {
        sidebar = "";
    }

    String communityName = collectionService.getMetadata(collection, "name");
    String communityLink = "/handle/" + community.getHandle();

    Bitstream logo = collection.getLogo();
    
    ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();
    
    boolean feedEnabled = configurationService.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled) {
      // FeedData is expected to be a comma separated list
      String[] formats = configurationService.getArrayProperty("webui.feed.formats");
      String allFormats = StringUtils.join(formats, ",");
      feedData = "coll:" + allFormats;
    }
    
    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    Boolean showItems = (Boolean)request.getAttribute("show.items");
    boolean show_items = showItems != null ? showItems.booleanValue() : false;
%>

<%-- La propiedad navbar="off" permite acceder a la versión minimal de navbar (es decir, sin el input search en el header) --%>
<%@ page import="org.dspace.app.webui.servlet.MyDSpaceServlet"%>
<%@ page import="org.dspace.content.factory.ContentServiceFactory" %>
<%@ page import="org.dspace.content.service.CollectionService" %>
<%@ page import="org.dspace.content.service.ItemService" %>
<dspace:layout navbar="off" title="<%= name %>" feedData="<%= feedData %>">
  <div id="collection-home">
    <div class="row">
      <!-- TITULO -->
      <div class="col-md-12">
        <h2>
          <%= name %>
          <%  if(configurationService.getBooleanProperty("webui.strengths.show")) { %>
            [<%= ic.getCount(collection) %>]
          <%  } %>
          <br>
          <small><fmt:message key="jsp.collection-home.heading1"/></small>
            <a class="statisticsLink btn btn-info" href="<%= request.getContextPath() %>/handle/<%= collection.getHandle() %>/statistics">
              <fmt:message key="jsp.collection-home.display-statistics"/>
            </a>
        </h2>
        <% if (StringUtils.isNotBlank(intro)) { %>
          <p><%= intro %></p>
        <% } %>
      </div>
      <!-- Buscador de la comunidad -->
      <div class="col-md-12">
        <div class="well">
          <form method="get" action="<%= request.getContextPath() %>/handle/<%= collection.getHandle() %>/simple-search">
            <div class="input-group input-group-lg">
              <input
                type="text"
                class="form-control"
                maxlength=200
                size="50"
                placeholder="Busca registros dentro de esta coleccion"
                name="query"
                id="tequery"
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
      <!-- Boton Agregar -->
      <% if (submit_button) { %>
      <div class="col-md-12">
        <form class="well text-center" action="<%= request.getContextPath() %>/submit" method="post">
          <input type="hidden" name="collection" value="<%= collection.getID() %>" />
          <h4>¿Quer&eacute;s colabrorar subiendo tu investigaci&oacute;n o desarrollo a esta colecci&oacute;n? Hac&eacute; clic en el bot&oacute;n</h4>
          <button type="submit" name="submit" class="btn btn-success btn-lg">
            <fmt:message key="jsp.collection-home.submit.button"/>
          </button>
        </form>
      </div>
      <% } %>
      <!-- Boton Suscribir -->
      <div class="col-md-12">
        <form class="well text-center" method="get" action="">
          <% if (loggedIn && subscribed) { %>
          <h4>
            <fmt:message key="jsp.collection-home.subscribed"/>
            <a href="<%= request.getContextPath() %>/subscribe">
              <fmt:message key="jsp.collection-home.info"/>
            </a>
          <h4>
          <button type="submit" name="submit_unsubscribe" class="btn btn-warning btn-lg">
            <fmt:message key="jsp.collection-home.unsub"/>
          </button>
          <% } else { %>
          <h4><fmt:message key="jsp.collection-home.subscribe.msg"/></h4>
          <button type="submit" name="submit_subscribe" class="btn btn-primary btn-lg">
            <fmt:message key="jsp.collection-home.subscribe"/>
          </button>
          <% } %>
        </form>
      </div>
      <!-- Buscar por -->
      <div class="col-md-12">
        <div class="top-title clearfix">
          <h4>
            Buscar/
            <span>En esta colecci&oacute;n</span>
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
                <form class="inline-form" method="get" action="<%= request.getContextPath() %>/handle/<%= collection.getHandle() %>/browse">
                  <input type="hidden" name="type" value="<%= bis[i].getName() %>"/>
                  <%-- <input type="hidden" name="collection" value="<%= collection.getHandle() %>" /> --%>
                  <button type="submit" name="submit_browse" class="btn btn-store">
                    <span class="<%=iconClass%>"></span> 
                    <span class="btn-label">Buscar por</span>
                    <span class="btn-caption"><fmt:message key="<%= key %>"/></span>
                  </button>
                </form>
          <%  } %>
        </div>
      </div>
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
                <a href="<%= request.getContextPath() %>/feed/<%= fmts[j] %>/<%= collection.getHandle() %>">
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
          <a class="btn-show-more hidden-xs hidden-sm" href="<%= request.getContextPath() %>/handle/<%= collection.getHandle() %>/simple-search">VER TODOS ></a>
        </div>
        <% 
            if (show_items) {
              BrowseInfo bi = (BrowseInfo) request.getAttribute("browse.info");
              BrowseIndex bix = bi.getBrowseIndex();

              // prepare the next and previous links
              String linkBase = request.getContextPath() + "/handle/" + collection.getHandle();
              
              String next = linkBase;
              String prev = linkBase;
              
              if (bi.hasNextPage()) {
                  next = next + "?offset=" + bi.getNextOffset();
              }
              
              if (bi.hasPrevPage()) {
                  prev = prev + "?offset=" + bi.getPrevOffset();
              }

              String bi_name_key = "browse.menu." + bi.getSortOption().getName();
              String so_name_key = "browse.order." + (bi.isAscending() ? "asc" : "desc");
        %>
        <%-- give us the top report on what we are looking at --%>
        <fmt:message var="bi_name" key="<%= bi_name_key %>"/>
        <fmt:message var="so_name" key="<%= so_name_key %>"/>
        <div class="browse_range">
          <fmt:message key="jsp.collection-home.content.range">
            <fmt:param value="${bi_name}"/>
            <fmt:param value="${so_name}"/>
            <fmt:param value="<%= Integer.toString(bi.getStart()) %>"/>
            <fmt:param value="<%= Integer.toString(bi.getFinish()) %>"/>
            <fmt:param value="<%= Integer.toString(bi.getTotal()) %>"/>
          </fmt:message>
        </div>

        <%--  do the top previous and next page links --%>
        <ul class="prev-next-links pager">
        <%    if (bi.hasPrevPage()) { %>
          <li class="previous"><a href="<%= prev %>"><fmt:message key="browse.full.prev"/></a></li>
        <%    }
              if (bi.hasNextPage()) {
        %>
          <li class="next"><a href="<%= next %>"><fmt:message key="browse.full.next"/></a></li>
        <%    } %>
        </ul>

        <%-- output the results using the browselist tag --%>
        <%    if (bix.isMetadataIndex()) { %>
        <dspace:browselist browseInfo="<%= bi %>" emphcolumn="<%= bix.getMetadata() %>" />
        <%    } else { %>
        <dspace:browselist browseInfo="<%= bi %>" emphcolumn="<%= bix.getSortOption().getMetadata() %>" />
        <%    } %>

        <%-- give us the bottom report on what we are looking at --%>
        <div class="browse_range">
          <fmt:message key="jsp.collection-home.content.range">
            <fmt:param value="${bi_name}"/>
            <fmt:param value="${so_name}"/>
            <fmt:param value="<%= Integer.toString(bi.getStart()) %>"/>
            <fmt:param value="<%= Integer.toString(bi.getFinish()) %>"/>
            <fmt:param value="<%= Integer.toString(bi.getTotal()) %>"/>
          </fmt:message>
        </div>

        <%--  do the bottom previous and next page links --%>
        <ul class="prev-next-links pager">
        <%    if (bi.hasPrevPage()) { %>
          <li class="previous"><a href="<%= prev %>"><fmt:message key="browse.full.prev"/></a></li>
        <%    }
              if (bi.hasNextPage()) {
        %>
          <li class="next"><a href="<%= next %>"><fmt:message key="browse.full.next"/></a></li>
        <%    } %>
        </ul>
        <%
            } // end of if (show_title)
        %>
      </div>
    </div>
  </div>
  
  <% if(admin_button || editor_button ) { %>
    <dspace:sidebar>
      <div class="panel panel-warning">
        <div class="panel-heading"><fmt:message key="jsp.admintools"/>
          <span class="pull-right">
            <dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.collection-admin\")%>">
              <fmt:message key="jsp.adminhelp"/>
            </dspace:popup>
          </span>
        </div>
        <div class="panel-body">              
          <% if( editor_button ) { %>
              <form method="post" action="<%=request.getContextPath()%>/tools/edit-communities">
                <input type="hidden" name="collection_id" value="<%= collection.getID() %>" />
                <input type="hidden" name="community_id" value="<%= community.getID() %>" />
                <input type="hidden" name="action" value="<%= EditCommunitiesServlet.START_EDIT_COLLECTION %>" />
                <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.general.edit.button"/>" />
              </form>
          <% } %>

          <% if( admin_button ) { %>
              <form method="post" action="<%=request.getContextPath()%>/tools/itemmap">
                <input type="hidden" name="cid" value="<%= collection.getID() %>" />
                <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.collection-home.item.button"/>" />                  
              </form>
              <% if(submitters != null) { %>
                  <form method="get" action="<%=request.getContextPath()%>/tools/group-edit">
                    <input type="hidden" name="group_id" value="<%=submitters.getID()%>" />
                    <input class="btn btn-default col-md-12" type="submit" name="submit_edit" value="<fmt:message key="jsp.collection-home.editsub.button"/>" />
                  </form>
              <% } %>
              <% if( editor_button || admin_button) { %>
                <form method="post" action="<%=request.getContextPath()%>/mydspace">
                  <input type="hidden" name="collection_id" value="<%= collection.getID() %>" />
                  <input type="hidden" name="step" value="<%= MyDSpaceServlet.REQUEST_EXPORT_ARCHIVE %>" />
                  <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.mydspace.request.export.collection"/>" />
                </form>
                <form method="post" action="<%=request.getContextPath()%>/mydspace">
                  <input type="hidden" name="collection_id" value="<%= collection.getID() %>" />
                  <input type="hidden" name="step" value="<%= MyDSpaceServlet.REQUEST_MIGRATE_ARCHIVE %>" />
                  <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.mydspace.request.export.migratecollection"/>" />
                </form>
                <form method="post" action="<%=request.getContextPath()%>/dspace-admin/metadataexport">
                  <input type="hidden" name="handle" value="<%= collection.getHandle() %>" />
                  <input class="btn btn-default col-md-12" type="submit" value="<fmt:message key="jsp.general.metadataexport.button"/>" />
                </form>
              <% } %>
          <% } %>
        </div>
      </div>
      <%= sidebar %>
    </dspace:sidebar>
  <% } %>
</dspace:layout>
