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
	
<dspace:layout title="¿Qué es?">
<h4><strong>&iquest;Qu&eacute; es el RID-UNRN?</strong></h4>
<p><br /><strong>RID-UNRN</strong>, el Repositorio Institucional Digital de la Universidad Nacional de R&iacute;o Negro, tiene como objetivos, reunir, archivar y preservar la producci&oacute;n intelectual resultante de la actividad acad&eacute;mica e investigadora de nuestra comunidad universitaria, en formato digital, y ofrecer acceso abierto a dicha producci&oacute;n. La colecci&oacute;n abarca tesis de grado y posgrado, art&iacute;culos de revistas, libros y cap&iacute;tulos, documentos de trabajo, preprints, actas de congresos, etc.<br />RID-UNRN est&aacute; basado en los fundamentos filos&oacute;ficos del acceso abierto y promueve los valores de:</p>
<ul>
<li>Acceso a la informaci&oacute;n</li>
<li>Soberan&iacute;a tecnol&oacute;gica e informacional</li>
<li>Igualdad</li>
<li>Excelencia acad&eacute;mica</li>
<li>Pluralidad</li>
</ul>
<p>El RID-UNRN adhiere a la Iniciativa de <strong>Acceso Abierto</strong>, que sustenta el principio de la libre disposición de la información.</p>

<p dir="ltr">
	<img
		src="<%= request.getContextPath() %>/image/logo-acceso-abierto.jpeg"
		alt="Logo de Acceso Abierto"
		class="img-responsive"
	/>
</p>


</dspace:layout>

