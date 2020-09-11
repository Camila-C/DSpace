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

<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions"%>
<%@ page import="org.dspace.app.webui.util.UIUtil"%>
<%@ page import="org.dspace.content.Item"%>
<%@ page import="org.dspace.content.factory.ContentServiceFactory"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.dspace.content.service.ItemService"%>
<%@ page import="org.dspace.core.Utils"%>
<%@ page import="org.dspace.services.ConfigurationService"%>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>
<%@ page import="javax.servlet.jsp.jstl.core.Config" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<%
    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);

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
  
    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
    ItemService itemService = ContentServiceFactory.getInstance().getItemService();
%>

<%-- La propiedad navbar="off" permite acceder a la versión minimal de navbar (es decir, sin el input search en el header) --%>
<dspace:layout navbar="off" locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">
  <!-- INICIO -->
  <section id="home">
    <div class="jumbotron text-center">
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
  <!-- Nuevas Comunidades -->
  <section class="communities-section">
    <div class="row row-equal no-gutters">
      <div class="col-md-3 col-sm-6 col-xs-12 bg-primary">
        <a href="<%= request.getContextPath() %>/handle/20.500.12049/49">
          <div class="services text-center">
            <div class="icon">
              <span class="flaticon-investigacion"></span>
            </div>
            <div class="services-body">
              <h3>Articulos de Revista</h3>
              <p>
                Colecci&oacute;n que contiene art&iacute;culos cient&iacute;ficos y m&aacute;s producci&oacute;n cient&iacute;fico-t&eacute;cnica, tanto de
                investigadores como de becarios de la Universidad Nacional de R&iacute;o Negro y de otras instituciones.
              </p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-3 col-sm-6 col-xs-12 bg-darken">
        <a href="<%= request.getContextPath() %>/handle/20.500.12049/50">
          <div class="services text-center">
            <div class="icon">
              <span class="flaticon-presentacion"></span>
            </div>
            <div class="services-body">
              <h3>Congresos y Jornadas</h3>
              <p>
                Descubr&iacute; todo documento y material publicado en congresos, jornadas, conferencias, etc. brindadas
                por la Universidad Nacional de R&iacute;o Negro u otras filiaciones institucionales.
              </p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-3 col-sm-6 col-xs-12 bg-primary">
        <a href="<%= request.getContextPath() %>/handle/20.500.12049/13">
          <div class="services text-center">
            <div class="icon">
              <span class="flaticon-libro"></span>
            </div>
            <div class="services-body">
              <h3>Libros</h3>
              <p>
                Encontr&aacute; libros y partes de libros, editados por otras filiaciones, y material aportado por el
                CELEI (Centro de Estudios Latinoamericanos de Educaci&oacute;n Inclusiva) en formato digital.
              </p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-3 col-sm-6 col-xs-12 bg-darken">
        <a href="<%= request.getContextPath() %>/handle/20.500.12049/3">
          <div class="services text-center">
            <div class="icon">
              <span class="flaticon-sitio-web"></span>
            </div>
            <div class="services-body">
              <h3>Tesis y trabajos finales</h3>
              <p>
                Naveg&aacute; por tesis, tesinas y trabajos finales de carrera de grado, maestr&iacute;a, doctorales
                y post-doctorados de las distintas sedes de la Universidad Nacional de R&iacute;o Negro, as&iacute;
                c&oacute;mo tambi&eacute;n de otras filiaciones.
              </p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </section>
  <!-- Areas de la UNRN -->
  <section class="area-section">
    <div class="container">
      <div class="row">
        <div class="col-md-7 area-text">
          <h2>&Aacute;reas dentro del RID</h2>
          <p>
            Distintas &aacute;reas o departamentos, que componen la estructura de la Universidad Nacional de R&iacute;o
            Negro, son considerados espacios de producci&oacute;n y centros concentradores de contenido.
          </p>
          <div class="row">
            <div class="col-md-12">
              <a href="<%= request.getContextPath() %>/handle/20.500.12049/54">
                <div class="area-body">
                  <div class="icon"><span class="flaticon-navegador"></span></div>
                  <div class="text">
                    <h3>Editorial UNRN</h3>
                    <p>
                      Sello creado para editar, publicar y promover obras concebidas en el &aacute;mbito
                      acad&eacute;mico
                    </p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-md-12">
              <a href="<%= request.getContextPath() %>/handle/20.500.12049/237">
                <div class="area-body">
                  <div class="icon"><span class="flaticon-ley"></span></div>
                  <div class="text">
                    <h3>Digesto UNRN</h3>
                    <p>Colecci&oacute;n ordenada y sistematizada de las normas de la Universidad</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-md-12">
              <a href="<%= request.getContextPath() %>/handle/20.500.12049/5453">
                <div class="area-body">
                  <div class="icon"><span class="flaticon-analitica"></span></div>
                  <div class="text">
                    <h3>OAC</h3>
                    <p>
                      La Oficina de Aseguramiento de la Calidad participa del an&aacute;lisis del funcionamiento de la
                      Universidad
                    </p>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <p>
            Puede consultar todas las comunidades y colecciones haciendo clic
            <a href="<%= request.getContextPath() %>/community-list">aqu&iacute;</a></p>
        </div>
        <div class="col-md-5 img"></div>
      </div>
    </div>
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
            <a class="btn-show-more hidden-xs hidden-sm" href="<%= request.getContextPath() %>/simple-search">
              VER TODOS >
            </a>
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
          String displayAbstract = itemService.getMetadataFirstValue(item, "dc", "description", "resumen", Item.ANY);
          if (displayAbstract == null || displayAbstract.equals("-")) {
            displayAbstract = "Sin resumen en español";
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
  </section>
</dspace:layout>
