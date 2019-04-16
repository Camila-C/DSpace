<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Display a tombstone indicating that an item has been withdrawn.
  --%>

<%@ page contentType="text/html;charset=ISO-8859-1" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<dspace:layout title="&iquest;C&oacute;mo subir un documento al RID-UNRN?">
	<h2>&iquest;Qu&eacute; es el Autoarchivo y para qu&eacute; sirve?</h2>
	<p>
		El Autoarchivo es el proceso de almacenamiento de documentos en el RID-UNRN
		donde los autores depositan sus obras, incluso previamente a su publicaci&oacute;n,
		logrando una difusi&oacute;n casi inmediata y disponibilidad de Acceso Abierto a trav&eacute;s de Internet.
	</p>
	<h3>&iquest;C&oacute;mo subir un documento al RID-UNRN?</h3>
	<p>
		<ul>
			<li>
				<span class="glyphicon glyphicon-user"></span>
				Debe <a href="http://rid.unrn.edu.ar/jspui/register">registrarse previamente al RID-UNRN</a>. Procure utilizar su mail institucional.
			</li>
			<li>
				<span class="glyphicon glyphicon-log-in"></span>
				Una vez registrado, deber&aacute; <a href="http://rid.unrn.edu.ar/jspui/password-login">iniciar sesi&oacute;n</a> y luego hace clic en el bot&oacute;n "Comenzar un nuevo env&iacute;o".
			</li>
			<li>
				<span class="glyphicon glyphicon-tasks"></span>
				El sistema lo guiar&aacute; por una serie de sencillos pasos donde podr&aacute; cargar el formulario y subir sus archivos.
			</li>
			<li>
				<span class="glyphicon glyphicon-send"></span>
				Una vez subido, el RID-UNRN verificar&aacute; su solicitud y le notificar&aacute; si el documento ya se encuentra disponible o, si fuera necesario, una solicitud de correcci&oacute;n.
			</li>
		</ul>
	</p>
	<p>
		Para ver un tutorial detallado de este proceso, haga clic <a href="<%= request.getContextPath() %>/instructivo-autoarchivo.pdf">aqu&iacute;</a>.
	</p>
	<p>
		Por otro lado, si ya se encuentra registrado haga clic en el siguiente bot&oacute;n:
	</p>
	<p>
		<a href="<%= request.getContextPath() %>/mydspace" class="btn btn-info btn-lg">
  		<span class="glyphicon glyphicon-cloud-upload"></span>
   		Subir documento
  	</a>
	</p>
	<div class="alert alert-warning">
  	<strong>&iexcl;IMPORTANTE!</strong> 
		El documento que desea subir al RID-UNRN, deber&aacute; haber pasado por una instancia de evaluaci&oacute;n
		por parte de la UNRN y/o formar parte de Proyectos de Investigaci&oacute;n y Extensi&oacute;n realizados en
		el marco de la Universidad Nacional de R&iacute;o Negro. Para m&aacute;s informaci&oacute;n consultar las Pol&iacute;ticas
		de Dep&oacute;sito RID-UNRN.
	</div>

</dspace:layout>
