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
	
<dspace:layout title="Disposici&oacute;n SICADYTT Formularios">

<p lang="es-MX">
    <h4><strong>Dispocisi&oacute;n SICADyTT Aprobaci&oacute;n de Formularios </strong></h4>
</p>
<br>
<p lang="es-ES" align="justify">
    ART&Iacute;CULO 1&ordm;:
    Aprobar el formulario F086-01 (Formulario de Cesi&oacute;n no exclusiva de derechos para
    dep&oacute;sito en el RID-UNRN), formulario F087-01 (Formulario de Registro de Datos).
</p>
<p lang="es-ES" align="justify">
    ART&Iacute;CULO 2&ordm;:
    Registrar, comunicar al Departamento respectivo y archivar.
</p>
<br>
<p lang="es-MX">
    <strong>ANEXO I </strong>
</p>
<p lang="es-ES" align="justify">
    <a href="<%= request.getContextPath() %>/F086-01.pdf">Formulario F086-01 (Formulario de Cesi&oacute;n no exclusiva de derechos para dep&oacute;sito en el RID-UNRN)</a>
</p>
<p lang="es-ES" align="justify">
    <a href="<%= request.getContextPath() %>/F087-01.pdf">Formulario F087-01 (Formulario de Registro de Datos)</a>
</p>


</dspace:layout>
