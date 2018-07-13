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

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>
	
<dspace:layout title="&iquest;C&oacute;mo subir un documento al RID-UNRN?">

<h4>
	<strong>&iquest;C&oacute;mo subir un documento al RID-UNRN?</strong>
</h4>
<br>
<p>
	Para poder subir un documento al RID-UNRN, deber&aacute;
	tratarse de un documento que haya pasado por una instancia de
	evaluaci&oacute;n por parte de la Universidad.
</p>
<p>
	Existen dos formas de depositar un documento. Estas son a trav&eacute;s de <strong>Autoarchivo</strong> y mediante <strong>Ventanilla Permanente</strong>.
</p>	
	<br>
	<h5>
	<strong>Autoarchivo</strong>
	</h5>
	
</p>
	Para depositar mediante Autoarchivo, deber&aacute; <a href="http://rid.unrn.edu.ar/jspui/register">crear una cuenta de usuario de RID-UNRN</a>. Una vez creada la cuenta, deber&aacute; <a href="http://rid.unrn.edu.ar/jspui/password-login">iniciar sesi&oacute;n</a> nuevamente desde "Mi DSpace". All&iacute; hacer clic en el bot&oacute;n "Comenzar un nuevo env&iacute;o" para enviar su documento. Una vez subido, el mismo atravesar&aacute; un proceso de curadur&iacute;a, luego del cual se le notificar&aacute; la puesta en acceso del documento, o, si fuera necesario, la solicitud de correcci&oacute;n de datos cargados.<br>
	Para ver un tutorial detallado de este proceso, haga clic <a href="<%= request.getContextPath() %>/instructivo-autoarchivo.pdf">aqu&iacute;</a>.

<p>
<br>

	<h5>
	<strong>Ventanilla Permanente</strong>
	</h5>
<p>	
	Las Ventanillas Permanentes (VP) son las oficinas de recepci&oacute;n de los resultados de
	investigaci&oacute;n, docencia y creaci&oacute;n art&iacute;stica generados por
	la comunidad de la Universidad. Puede acudir a una VP para presentar su producci&oacute;n. Funcionan como VP las siguientes oficinas:
</p>
<ul>
	<li>
		<p>
			Bibliotecas de Sede
		</p>
	</li>
	<li>
		<p>
			Secretar&iacute;as de Investigaci&oacute;n de Sede
		</p>
	</li>
	<li>
		<p>
			Departamento de Biblioteca, Repositorio y Contenidos Digitales
		</p>
	</li>
</ul>
<p>
	Junto con el documento a subir (en formato digital), se deber&aacute;
	completar y presentar los siguientes formularios:
</p>
<ul>
	<li>
		<p lang="es-ES" align="justify">
			<a href="<%= request.getContextPath() %>/F086-01.pdf">Formulario F086-01 (Formulario de Cesi&oacute;n no exclusiva de derechos para dep&oacute;sito en el RID-UNRN)</a>
		</p>
	</li>
	<li>
		<p lang="es-ES" align="justify">
			<a href="<%= request.getContextPath() %>/F087-01.pdf">Formulario F087-01 (Formulario de Registro de Datos)</a>
		</p>
	</li>
</ul>
<p>
	Las Ventanillas Permanentes cumplen las siguientes funciones:
</p>
<ul>
	<li>
		<p>
			Recepcionar los objetos digitales resultados de investigaci&oacute;n,
			docencia y creaci&oacute;n art&iacute;stica en los diferentes formatos
			aceptados seg&uacute;n las Pol&iacute;ticas del RID-UNRN en su
			versi&oacute;n digital.
		</p>
	</li>
	<li>
		<p>
			Recepcionar los Formularios de Cesi&oacute;n No Exclusiva de Derechos
			para el Dep&oacute;sito en el RID-UNRN y Formulario de Registro de
			datos.
		</p>
	</li>
	<li>
		<p>
			Extender el Certificado de Dep&oacute;sito.
		</p>
	</li>
	<li>
		<p>
			Remitir los Formularios de Cesi&oacute;n No Exclusiva de Derechos al
			Departamento de Biblioteca, Repositorio y Contenidos Digitales.
		</p>
	</li>
	<li>
		<p>
			Realizar la primer instancia de carga de los objetos digitales.
		</p>
	</li>
</ul>
<p>
	Una vez realizada la tarea de la VP, el Departamento de Biblioteca,
	Repositorio y Contenidos Digitales se encargar&aacute; de:
</p>
<ul>
	<li>
		<p>
			Cumplimentar la etapa de curadur&iacute;a.
		</p>
	</li>
	<li>
		<p>
			Realizar las devoluciones correspondientes en el caso de ser
			necesario corregir y/o realizar modificaciones.
		</p>
	</li>
	<li>
		<p>
			Subir definitivamente el objeto y publicar en el RID-UNRN una vez
			cumplimentados todos los pasos de manera correcta.
		</p>
	</li>
	<li>
		<p>
			Difundir por diferentes medios la incorporaci&oacute;n del nuevo
			material en el RID-UNRN.
		</p>
	</li>
</ul>

<br/>
<p dir="ltr">
	Proceso documental
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/ingesta-documental.jpg"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<br/>
<br/>
<p dir="ltr">
	Proceso administrativo
</p>
<br/>
<br/>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/ingesta-administrativo.png"
		alt="Proceso administrativo del circuito de ingesta"
		class="img-responsive"
	/>
</p>



</dspace:layout>
