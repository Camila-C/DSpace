<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@ page import="org.dspace.core.Utils"%>
<%@ page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.NewsManager" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Metadatum" %>
<%@ page import="org.dspace.content.Item" %>

<%
  Community[] communities = (Community[]) request.getAttribute("communities");

  Locale sessionLocale = UIUtil.getSessionLocale(request);
  Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
  String topNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-top.html"));
  String sideNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html"));

  boolean feedEnabled = ConfigurationManager.getBooleanProperty("webui.feed.enable");
  String feedData = "NONE";
  if (feedEnabled) {
    feedData = "ALL:" + ConfigurationManager.getProperty("webui.feed.formats");
  }
    
  ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

  RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");

  /*
   * Creo un ARRAY con los ids de las 4 comunidades importantes y sus iconos
   * ID 2: Tesis y Trabajos finales
   * ID 5: Libros
   * ID 8: Artículos de revista
   * ID 9: Congresos y jornadas
   */

  ArrayList<Integer> fourCommunities = new ArrayList<Integer>(Arrays.asList(2, 5, 8, 9));
  String[] communityIcons = {"fas fa-user-graduate", "fas fa-paste", "fas fa-book", "fab fa-react"};
%>

<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">

  <!--
    <div class="jumbotron">
          <%= topNews %>
    </div> 
  -->

  <!-- Se oculta hasta que se resuelva lo del DIGESTO -->
  <section class="container">
    <% if (submissions != null && submissions.count() > 0) { %>
      <div class="col-md-8">
        <div class="panel panel-primary">        
          <div id="recent-submissions-carousel" class="panel-heading carousel slide">
            <h3>
              <fmt:message key="jsp.collection-home.recentsub"/>
              <% 
                if(feedEnabled) {
                  String[] fmts = feedData.substring(feedData.indexOf(':')+1).split(",");
                  String icon = null;
                  int width = 0;
                  for (int j = 0; j < fmts.length; j++) {
                    if ("rss_1.0".equals(fmts[j])) {
                      icon = "rss1.gif";
                      width = 80;
                    } else if ("rss_2.0".equals(fmts[j])) {
                      icon = "rss2.gif";
                      width = 80;
                    } else {
                      icon = "rss.gif";
                      width = 36;
                    }
              %>
                    <a href="<%= request.getContextPath() %>/feed/<%= fmts[j] %>/site">
                      <img src="<%= request.getContextPath() %>/image/<%= icon %>" alt="RSS Feed" width="<%= width %>" height="15" style="margin: 3px 0 3px" />
                    </a>
              <%
                  }
                }
              %>
            </h3>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <%
                boolean first = true;
                for (Item item : submissions.getRecentSubmissions()) {
                  Metadatum[] dcv = item.getMetadata("dc", "title", null, Item.ANY);
                  String displayTitle = "Untitled";
                  if (dcv != null & dcv.length > 0) {
                    displayTitle = Utils.addEntities(dcv[0].value);
                  }
                  dcv = item.getMetadata("dc", "description", "abstract", Item.ANY);
                  String displayAbstract = "";
                  if (dcv != null & dcv.length > 0) {
                    displayAbstract = Utils.addEntities(dcv[0].value);
                  }
              %>
                  <div style="padding-bottom: 50px; min-height: 200px;" class="item <%= first?"active":""%>">
                    <div style="padding-left: 80px; padding-right: 80px; display: inline-block;"><%= StringUtils.abbreviate(displayTitle, 400) %> 
                      <a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>" class="btn btn-success">See</a>
                      <p><%= StringUtils.abbreviate(displayAbstract, 500) %></p>
                    </div>
                  </div>
              <%
                  first = false;
                }
              %>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#recent-submissions-carousel" data-slide="prev">
              <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#recent-submissions-carousel" data-slide="next">
              <span class="icon-next"></span>
            </a>
            <ol class="carousel-indicators">
              <li data-target="#recent-submissions-carousel" data-slide-to="0" class="active"></li>
              <% for (int i = 1; i < submissions.count(); i++){ %>
                  <li data-target="#recent-submissions-carousel" data-slide-to="<%= i %>"></li>
              <% } %>
            </ol>
          </div>
        </div>
      </div>
    <% } %>
    <div class="col-md-4">
      <%= sideNews %>
    </div>
  </section>
  <!-- COMUNIDADES -->
  <section class="bg-grey-light pt-100 pb-100" id="four-communities">
    <% if (communities != null && communities.length != 0) { %>
      <div class="container">
        <div class="row">
          <div class="col-xl-8 mx-auto text-center">
            <div class="section-title">
              <h4><fmt:message key="jsp.home.com1"/></h4>
              <p>
                <fmt:message key="jsp.home.com2">
                  <fmt:param><%= request.getContextPath() %>/community-list</fmt:param>
                </fmt:message>
              </p>
            </div>
          </div>
        </div>
        <div class="row row-equal">
        <%
            boolean showLogos = ConfigurationManager.getBooleanProperty("jspui.home-page.logos", true);
            int id = 0;
            for (int i = 0; i < communities.length; i++) {
              id = communities[i].getID();
              //Pregunto si el ID se encuentra en las 4 comunidades mas importantes
              if (fourCommunities.contains(id)) {
        %>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <a href="<%= request.getContextPath() %>/handle/<%= communities[i].getHandle() %>">
                  <div class="single-service">
                    <%  // FIXME: Buscar una forma mejor
                        if (id == 2) { %>
                          <i class="fas fa-user-graduate"></i>
                    <%  } else if(id == 5) { %>
                          <i class="fas fa-book"></i>
                    <%  } else if(id == 8) { %>
                          <i class="fas fa-paste"></i>
                    <%  } else { %>
                          <i class="fab fa-react"></i>
                    <%  } %>
                    <h4>
                      <%= communities[i].getMetadata("name") %>
                      <% if (ConfigurationManager.getBooleanProperty("webui.strengths.show")) { %>
                        <br><span class="badge"><%= ic.getCount(communities[i]) %></span>
                      <% } %>
                    </h4>
                    <p><%= communities[i].getMetadata("short_description") %></p>
                  </div>
                </a>
              </div>
        <%
              }
            } 
        %>
        </div>
      </div>
    <% } %>
  </section>
  <section id="authors">
    <div class="bgimg-1">
      <div class="caption container">
        <h1><fmt:message key="jsp.layout.sidebar.uploadFile"/></h1>
        <h2><fmt:message key="jsp.layout.sidebar.uploadFile.description"/></h2>
        <a href="<%= request.getContextPath() %>/como-subir.jsp" class="btn-mas-info">
          <fmt:message key="jsp.layout.sidebar.uploadFile.moreInformation"/>
        </a>
      </div>
    </div>
  </section>
  <section class="container">
    <div class="col-md-3">
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-primary">
            <div class="panel-heading">
              <fmt:message key="jsp.layout.sidebar.uploadFile"/>
            </div>
            <div class="panel-body">
              <p><fmt:message key="jsp.layout.sidebar.uploadFile.description"/></p>
              <p>
                <a href="<%= request.getContextPath() %>/como-subir.jsp">
                  <fmt:message key="jsp.layout.sidebar.uploadFile.moreInformation"/>
                </a>
              </p>
              <a href="<%= request.getContextPath() %>/mydspace" class="btn btn-block btn-info btn-lg">
                <span class="glyphicon glyphicon-cloud-upload"></span>
                Subir
              </a>
            </div>
          </div>
        </div>
        <%
            int discovery_panel_cols = 12;
            int discovery_facet_cols = 12;
        %>
        <%@ include file="discovery/static-sidebar-facet.jsp" %>  
      </div>
    </div>
    <div class="row">
      <%@ include file="discovery/static-tagcloud-facet.jsp" %>
    </div>
  </section>
</dspace:layout>
