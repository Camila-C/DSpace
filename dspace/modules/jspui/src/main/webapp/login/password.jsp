<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Page that displays the email/password login form
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<dspace:layout navbar="default" locbar="off" titlekey="jsp.login.password.title" nocache="true">
  <section class="container">
    <%--
    <span class="pull-right">
      <dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") + \"#login\"%>">
        <fmt:message key="jsp.help"/>
      </dspace:popup>
    </span>
    --%>
    <div class="col-md-10 col-md-offset-1 main-login">
      <div class="col-md-6 left-side">
        <h3>Iniciar sesión</h3>
        <dspace:include page="/components/login-form.jsp" />
      </div>
      <div class="col-md-6 right-side">
        <h3>Reg&iacute;strese ahora <span class="text-unrn">GRATIS!!</span></h3>
        <ul class="list-unstyled" style="line-height: 2">
          <li><span class="fas fa-check text-unrn"></span> Constribuya con sus propios trabajos</li>
          <li><span class="fas fa-check text-unrn"></span> Obtenga visibilidad y estabilidad</li>
          <li><span class="fas fa-check text-unrn"></span> Incremente el impacto de sus trabajos a trav&eacute;s de Altmetrics y Google Acad&eacute;mico</li>
          <li><span class="fas fa-check text-unrn"></span> Int&eacute;grese en redes de investigaci&oacute;n nacional e internacional</li>
          <li><span class="fas fa-check text-unrn"></span> Obtenga facilidad de difusi&oacute;n</li>
          <li><a href="<%= request.getContextPath() %>/faqs#beneficios"><u>Leer m&aacute;s</u></a></li>
        </ul>
        <a class="btn btn-unrn" href="<%= request.getContextPath() %>/register">
          Registrarme ahora!
        </a>
      </div>
    </div>
  </section>
</dspace:layout>
