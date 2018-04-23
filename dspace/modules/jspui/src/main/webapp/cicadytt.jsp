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
	
<dspace:layout title="Resoluci&oacute;n CICADYTT Creaci&oacute;Mn del RID-UNRN">

<h4><strong>Resoluci&oacute;n CICADYTT Creaci&oacute;n del RID-UNRN</strong></h4>
<p>Esta resoluci&oacute;n establece en su Art&iacute;culo 4: Crear el Repositorio Digital Institucional de la Universidad Nacional de R&iacute;o Negro con la finalidad de reunir, registrar, divulgar, preservar y dar acceso a la producci&oacute;n acad&eacute;mica y de investigaci&oacute;n de los docentes- investigadores, becarios y estudiantes de maestr&iacute;a y doctorado de la Universidad, que depositar&aacute;n o entregar&aacute;n para su dep&oacute;sito los documentos digitales (tesis, documentos de conferencias, art&iacute;culos, informes t&eacute;cnicos, proyectos de investigaci&oacute;n entre otros)que sean resultado de la realizaci&oacute;n de actividades financiadas con fondos p&uacute;blicos.<br />El Repositorio Digital Institucional tendr&aacute; la finalidad de maximizar la visibilidad, el uso y el impacto, de la producci&oacute;n cient&iacute;fica acad&eacute;mica y art&iacute;stica, apoyar un proceso de retroalimentaci&oacute;n en el campo de la investigaci&oacute;n, el arte y la cultura y facilitar el acceso a la informaci&oacute;n cient&iacute;fica y acad&eacute;mica. En todos los casos se respetar&aacute;n las normativas respecto al derecho de autor y propiedad intelectual.</p>
<a href="<%= request.getContextPath() %>/res-creacion.pdf">Ver texto completo</a>

</dspace:layout>

