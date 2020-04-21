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

<%@ page import="org.dspace.core.factory.CoreServiceFactory"%>
<%@ page import="org.dspace.core.service.NewsService"%>
<%@ page import="org.dspace.content.service.CommunityService"%>
<%@ page import="org.dspace.content.factory.ContentServiceFactory"%>
<%@ page import="org.dspace.content.service.ItemService"%>
<%@ page import="org.dspace.core.Utils"%>
<%@ page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Item" %>
<%@ page import="org.dspace.services.ConfigurationService" %>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Date" %>

<%
    List<Community> communities = (List<Community>) request.getAttribute("communities");

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
    // NewsService newsService = CoreServiceFactory.getInstance().getNewsService();
    // String topNews = newsService.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-top.html"));
    // String sideNews = newsService.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html"));

    ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();
    
    boolean feedEnabled = configurationService.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled)
    {
        // FeedData is expected to be a comma separated list
        String[] formats = configurationService.getArrayProperty("webui.feed.formats");
        String allFormats = StringUtils.join(formats, ",");
        feedData = "ALL:" + allFormats;
    }
    
    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
    ItemService itemService = ContentServiceFactory.getInstance().getItemService();
    CommunityService communityService = ContentServiceFactory.getInstance().getCommunityService();

  // Creo un ARRAY con los nombres de las 4 comunidades importantes
  ArrayList<String> fourCommunities = new ArrayList<String>(
          Arrays.asList(
                  "Tesis y Trabajos finales",
                  "Libros",
                  "Artículos de revista",
                  "Congresos y jornadas"
          )
  );
%>

<%-- La propiedad navbar="off" permite acceder a la versión minimal de navbar (es decir, sin el input search en el header) --%>
<dspace:layout navbar="off" locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">
  <%--
    <div class="jumbotron">
      <%= topNews %>
    </div> 
  --%>
  <!-- INICIO -->
  <section id="home">
    <div class="jumbotron text-center">
      <div class="pattern"></div>
      <h2><fmt:message key="jsp.layout.header-default.brand.heading" /></h2>
      <p class="container"><fmt:message key="jsp.layout.header-default.brand.heading2" /></p>
      <%-- Search Box --%>
      <form class="form-inline" method="get" action="<%= request.getContextPath() %>/simple-search">
        <div class="input-group input-group-lg">
          <input
            type="text"
            class="form-control"
            maxlength=200
            size="50"
            placeholder="<fmt:message key='jsp.layout.header-default.form.search' />"
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
  </section>
  <!-- COMUNIDADES -->
  <section class="pt-100 pb-100" id="four-communities">
    <% if (communities != null && communities.size() != 0) { %>
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
            boolean showLogos = configurationService.getBooleanProperty("jspui.home-page.logos", true);
            String name = "";
            for (Community com : communities) {
              name = com.getName();
              // Pregunto si el nombre se encuentra en las 4 comunidades mas importantes
              if (fourCommunities.contains(name)) {
        %>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <a href="<%= request.getContextPath() %>/handle/<%= com.getHandle() %>">
                  <div class="single-service">
                    <%  // FIXME: Buscar una forma mejor
                        if (name.equalsIgnoreCase("Tesis y Trabajos finales")) { %>
                          <i class="fas fa-user-graduate"></i>
                    <%  } else if(name.equalsIgnoreCase("Libros")) { %>
                          <i class="fas fa-book"></i>
                    <%  } else if(name.equalsIgnoreCase("Artículos de revista")) { %>
                          <i class="fas fa-paste"></i>
                    <%  } else { %>
                          <i class="fab fa-react"></i>
                    <%  } %>
                    <h4>
                      <%= com.getName() %>
                      <% if (configurationService.getBooleanProperty("webui.strengths.show")) { %>
                        <br><span class="badge"><%= ic.getCount(com) %></span>
                      <% } %>
                    </h4>
                    <p><%= communityService.getMetadata(com, "short_description") %></p>
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
        <a href="<%= request.getContextPath() %>/faqs#como-subir-un-documento" class="btn-mas-info">
          <fmt:message key="jsp.layout.sidebar.uploadFile.moreInformation"/>
        </a>
      </div>
    </div>
  </section>
  <section class="recent-submissions">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="top-title clearfix">
            <h3>
              ENV&Iacute;OS/
              <span>RECIENTES</span>
            </h3>
            <%--<a class="btn-show-more hidden-xs hidden-sm" href="">VER TODOS ></a>--%>
          </div>
        </div>
      </div>
      <div class="row submissions-list">
      <%
        int count = 0;
        for (Item item : submissions.getRecentSubmissions()) {
          // Título
          String displayTitle = itemService.getMetadataFirstValue(item, "dc", "title", null, Item.ANY);
          if (displayTitle == null) {
            displayTitle = "Sin título";
          }
          // Resumen
          String displayAbstract = itemService.getMetadataFirstValue(item, "dc", "description", "abstract", Item.ANY);
          if (displayAbstract == null) {
            displayAbstract = "Sin resumen";
          }
          // Tipo
          String displayType = itemService.getMetadataFirstValue(item, "dc", "type", null, Item.ANY);
          if (displayType == null) {
            displayType = "Indefinido";
          }
          // Fecha de publicación
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
                <p><%= Utils.addEntities(StringUtils.abbreviate(displayTitle, 270))%></p>
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
  </section>
</dspace:layout>
