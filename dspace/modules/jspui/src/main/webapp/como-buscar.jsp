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
	
<dspace:layout title="&iquest;C&oacute;mo buscar en el RID-UNRN?">

<h4>
	<strong>&iquest;C&oacute;mo buscar un documento en el RID-UNRN?</strong>
</h4>
<br>
<p>
	Es posible utilizar la caja de b&uacute;squeda para realizar b&uacute;squedas libres, ingresando datos tales como el autor, el t&iacute;tulo, palabras clave, o cualquier otra informaci&oacute;n con la que se cuente al momento de buscar.
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/busqueda/caja-busqueda.png"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<br>
<p>
Cuanto m&aacute;s espec&iacute;fico sea el t&eacute;rmino utilizado, m&aacute;s asertivos ser&aacute;n los resultados de la b&uacute;squeda.
<br>
Tambi&eacute;n es posible &ldquo;hojear&rdquo; el RID utilizando los diferentes filtros como autor, t&iacute;tulo, materia o fecha:
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/busqueda/filtros.png"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<br>
<p>
O elegir una comunidad en particular:
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/busqueda/comunidades.png"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/busqueda/colecciones.png"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<br>
<p>
Una vez que llegamos al registro se pueden observar diferentes situaciones con respecto al acceso al documento:
</p>
<br>
<p>
	<strong>Documento en acceso abierto</strong>
</p>
<p>
Es posible visualizar los metadatos: t&iacute;tulo, autor, fecha de publicaci&oacute;n, citaci&oacute;n, descripci&oacute;n, etc. y descargar el documento en tu dispositivo.
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/busqueda/abierto.png"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<br>
<p>
	<strong>Documento embargado</strong>
</p>
<p>
Es posible visualizar los metadatos: t&iacute;tulo, autor, fecha de publicaci&oacute;n, citaci&oacute;n, descripci&oacute;n, etc. Se deber&aacute; solicitar el documento a trav&eacute;s del bot&oacute;n &ldquo;Solicitar copia&rdquo;.
</p>
<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/busqueda/embargo.png"
		alt="Proceso documental del circuito de ingesta"
		class="img-responsive"
	/>
</p>
<p>
	<strong>Datos de contacto</strong>
</p>
<p>
Tristana Pissaco <br>
Dpto. Biblioteca Electr&oacute;nica, Repositorio y Contenidos Digitales <br>
Secretar&iacute;a de Investigaci&oacute;n, Creaci&oacute;n Art&iacute;stica, Desarrollo y Transferencia de Tecnolog&iacute;a <br>
Belgrano 526 &mdash; Viedma &mdash; R&iacute;o Negro | Tel. (02920) 442006 | <a href="mailto:rid@unrn.edu.ar?Subject=Consulta%20RID-UNRN" target="_top">rid@unrn.edu.ar</a>
</p>
</dspace:layout>
