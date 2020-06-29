<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=ISO-8859-1" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

      <%
          String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
      %>

      <%-- Right-hand side bar if appropriate --%>
      <%
        if (sidebar != null) {
      %>
          </div>
          <div class="col-md-3">
            <%= sidebar %>
          </div>
        </div>       
      <% } %>
      </div>
    </main>
    <footer>
      <div class="box-logos">
        <div class="box-logo">
          <a href="https://crai.unrn.edu.ar/" target="_blank">
            <img src="<%= request.getContextPath() %>/image/footer/01_crai.svg" alt="CRAI">
          </a>
        </div>
        <div class="box-logo">
          <a href="https://www.unrn.edu.ar/" target="_blank">
            <img src="<%= request.getContextPath() %>/image/footer/02_unrn_blanco.svg" alt="UNRN">
          </a>
        </div>
        <div class="box-logo">
          <a href="http://editorial.unrn.edu.ar/" target="_blank">
            <img src="<%= request.getContextPath() %>/image/footer/03_editorial.svg" alt="Editorial UNRN">
          </a>
        </div>
        <div class="box-logo">
          <a href="http://www.unrn.tv/" target="_blank">
            <img src="<%= request.getContextPath() %>/image/footer/04_red_medios.svg" alt="Red de Medios">
          </a>
        </div>
        <div class="box-logo">
          <a href="https://pemtic.unrn.edu.ar/" target="_blank">
            <img src="<%= request.getContextPath() %>/image/footer/05_virtual.svg" alt="UNRNVirtual">
          </a>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-3">
            <a href="https://www.unrn.edu.ar" class="logo-pie" target="_blank">
              <img src="<%= request.getContextPath() %>/image/footer/footer_logo_unrn.svg" alt="UNRN">
            </a>
            <div class="info">
              <p>
                Belgrano 526.Viedma (8500)<br>
                R&iacute;o Negro, Argentina<br>
                Tel. (02920) 442006
              </p>
              <p><a href="mailto:rid@unrn.edu.ar">rid@unrn.edu.ar</a></p>
            </div>
          </div>
          <div class="col-xs-12 col-md-3">
            <h6>Colecciones</h6>
            <ul class="footer-links">
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/50">Congresos y jornadas</a></li>
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/13">Libros</a></li>
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/49">Revistas y art&iacute;culos</a></li>
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/3">Tesis y trabajos finales</a></li>
            </ul>
          </div>
          <div class="col-xs-12 col-md-3">
            <h6>Normativas</h6>
            <ul class="footer-links">
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/802">Creaci&oacute;n del RID-UNRN</a></li>
              <li><a href="<%= request.getContextPath() %>/rid-policies">Pol&iacute;ticas del RID-UNRN</a></li>
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/244">Ley Nacional 26.899 de Repositorios Digitales</a></li>
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/245">Reglamentaci&oacute;n de la Ley 26.899</a></li>
              <li><a href="<%= request.getContextPath() %>/handle/20.500.12049/237">Digesto UNRN</a></li>
            </ul>
          </div>
          <div class="col-xs-12 col-md-3">
            <h6>Enlaces de Inter&eacute;s</h6>
            <ul class="footer-links">
              <li><a href="https://creativecommons.org/" target="_blank">Licencia Creative Commons</a></li>
              <li><a href="http://www.openaccessweek.org/group/open-access-argentina" target="_blank">Acceso Abierto</a></li>
              <li><a href="https://datos.mincyt.gob.ar" target="_blank">Ciencia Abierta</a></li>
              <li><a href="http://repositoriosdigitales.mincyt.gob.ar" target="_blank">Portal del SNRD</a></li>
              <li><a href="http://www.biblioteca.mincyt.gob.ar/" target="_blank">Biblioteca Electr&oacute;nica</a></li>
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col col-sm-6 col-xs-12">
            <p class="copyright-text">&copy; <strong>2020 UNRN.</strong> Todos los derechos reservados.</p>
          </div>
          <div class="col col-sm-6 hidden-xs">
            <p class="copyright-text pull-right">&copy; Desarrollo Digital.
              <a href="https://crai.unrn.edu.ar/" target="_blank"><strong>CRAI</strong></a>.
            </p>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>
