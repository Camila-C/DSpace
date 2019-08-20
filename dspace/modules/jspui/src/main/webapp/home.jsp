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
<%@ page import="org.apache.commons.lang.StringUtils"%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
  <%--
    <div class="jumbotron">
      <%= topNews %>
    </div> 
  --%>
  <!-- COMUNIDADES -->
  <section class="pt-100 pb-100" id="four-communities">
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
      <div class="caption text-right container">
        <h1><fmt:message key="jsp.layout.sidebar.uploadFile"/></h1>
        <h2><fmt:message key="jsp.layout.sidebar.uploadFile.description"/></h2>
        <a href="<%= request.getContextPath() %>/faqs.jsp#como-subir-un-documento" class="btn-mas-info">
          <fmt:message key="jsp.layout.sidebar.uploadFile.moreInformation"/>
        </a>
      </div>
    </div>
  </section>
  <section class="bg-grey-strong pt-100 pb-100" id="recent-shipments">
    <div class="container">
      <%  if (submissions != null && submissions.count() > 0) { %>
        <h1>ENVÍOS RECIENTES
          <br>
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
          <%    }
              }
          %>
        </h1>
        <div class="row">
          <div id="myCarousel" class="carousel slide hidden-xs hidden-sm">
            <!-- Carousel items: only desktop -->
            <div class="carousel-inner">
              <%
                boolean first = true;
                int flag = 0;
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
                  dcv = item.getMetadata("dc", "date", "accessioned", Item.ANY);
                  String displayDate = null;
                  if (dcv != null & dcv.length > 0) {
                    String date = dcv[0].value;
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
                    Date tmpDate = sdf.parse(date);
                    SimpleDateFormat dateFormat = new SimpleDateFormat("d MMM, yyyy");
                    displayDate = dateFormat.format(tmpDate);
                  }
                  
                  if (flag == 4) {
              %>
                      </div>
                    </div>
              <%  }

                  if (flag == 0 || flag == 4) {
              %>
                    <div class="item <%= first?"active":""%>">
                      <div class="row row-equal">
              <%  } %>
                        <div class="col-md-3">
                          <div class="panel">
                            <div class="descripcion"> 
                              <i class="icono fas fa-file-pdf"></i>
                              <p><%= StringUtils.abbreviate(displayTitle, 120) %></p>
                              <p><a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>">Ver m&aacute;s</a></p>
                              <div class="line-short"></div>
                              <div class="fecha"><%=displayDate%></div>
                            </div>
                          </div>
                        </div>
              <%  
                  if (flag == 7) {
              %>
                      </div>
                    </div>
              <%  }
                  flag++;
                  first = false;
                }
              %>
            </div>
            <!-- Indicadores -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>
            <!-- Controles -->
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
        <!-- Carousel: only mobile and tablets -->
        <div id="myCarouselMobile" class="carousel slide hidden-md hidden-lg">
          <!-- Carousel items -->
          <div class="carousel-inner">
            <%
                first = true;
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
                  dcv = item.getMetadata("dc", "date", "accessioned", Item.ANY);
                  String displayDate = null;
                  if (dcv != null & dcv.length > 0) {
                    String date = dcv[0].value;
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
                    Date tmpDate = sdf.parse(date);
                    SimpleDateFormat dateFormat = new SimpleDateFormat("d MMM, yyyy");
                    displayDate = dateFormat.format(tmpDate);
                  }
              %>
                <div class="item <%= first?"active":""%>">
                  <div class="panel">
                    <div class="descripcion"> 
                      <i class="icono fas fa-file-pdf"></i>
                      <p><%= StringUtils.abbreviate(displayTitle, 120) %></p>
                      <p><a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>">Ver m&aacute;s</a></p>
                      <div class="line-short"></div>
                      <div class="fecha"><%=displayDate%></div>
                    </div>
                  </div>
                </div>
              <%
                  first = false;
                }
              %>
            </div>
            <!-- Indicadores -->
            <ol class="carousel-indicators">
              <li data-target="#myCarouselMobile" data-slide-to="0" class="active"></li>
              <li data-target="#myCarouselMobile" data-slide-to="1"></li>
              <% for (int i = 1; i < submissions.count(); i++){ %>
                  <li data-target="#myCarouselMobile" data-slide-to="<%= i %>"></li>
              <% } %>
            </ol>
            <!-- Controles -->
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarouselMobile" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarouselMobile" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
      <%  } %>
    </div>
  </section>
</dspace:layout>
