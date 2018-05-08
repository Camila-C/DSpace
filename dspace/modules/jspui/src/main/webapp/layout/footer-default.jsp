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
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
             <footer class="navbar navbar-inverse navbar-bottom">
             <%-- <div id="designedby" class="container text-muted">
             <fmt:message key="jsp.layout.footer-default.theme-by"/> <a href="http://www.cineca.it"><img
                                    src="<%= request.getContextPath() %>/image/logo-cineca-small.png"
                                    alt="Logo CINECA" /></a> --%>
			 <%-- <div id="footer_feedback" class="pull-right">                                    
                                <p class="text-muted"><fmt:message key="jsp.layout.footer-default.text"/>&nbsp;-
                                <a target="_blank" href="<%= request.getContextPath() %>/feedback"><fmt:message key="jsp.layout.footer-default.feedback"/></a>
                                <a href="<%= request.getContextPath() %>/htmlmap"></a></p>
                                </div> --%>
                                <center>
                                <p class="text-muted"> RID-UNRN | Universidad Nacional de Río Negro
                                <p class="text-muted"> Departamento de Biblioteca Electrónica, Repositorio y Contenidos Digitales
                                <p class="text-muted"> Teléfono: +54 (02920) 442006 | <a href="mailto:rid@unrn.edu.ar" class="link_p">rid@unrn.edu.ar</a>
                                <p class="text-muted"> <a class="dspace_link" href="http://www.dspace.org">Supported by Dspace </a>
</a>
                                </center>

			</div>
    </footer>
    </body>
</html>
