<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>


<%--
  - Display item/collection/community statistics
  -
  - Attributes:
  -    statsVisits - bean containing name, data, column and row labels
  -    statsMonthlyVisits - bean containing name, data, column and row labels
  -    statsFileDownloads - bean containing name, data, column and row labels
  -    statsCountryVisits - bean containing name, data, column and row labels
  -    statsCityVisits - bean containing name, data, column and row labels
  -    isItem - boolean variable, returns true if the DSO is an Item 
  --%>
<style>

.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #006699; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #00557F; font-size: 12px;border-bottom: 1px solid #E1EEF4;font-weight: normal; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #006699;background: #E1EEf4;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #00557F; color: #FFFFFF; background: none; background-color:#006699;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }

</style>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="org.dspace.app.webui.servlet.MyDSpaceServlet"%>

<% Boolean isItem = (Boolean)request.getAttribute("isItem"); %>



<dspace:layout titlekey="jsp.statistics.title">
<h1><fmt:message key="jsp.statistics.title"/></h1>
<h2><fmt:message key="jsp.statistics.heading.visits"/></h2>

<div class="datagrid">

<table>
<thead>
<tr>
<th></th>
<th><fmt:message key="jsp.statistics.heading.views"/></th>
</tr>
</thead>
<c:forEach items="${statsVisits.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}">
<td>
<c:out value="${statsVisits.colLabels[counter.index]}"/>
<td>
<c:out value="${cell}"/>
</td>
</c:forEach>
</tr>
</c:forEach>
</table>

</div>


<h2><fmt:message key="jsp.statistics.heading.monthlyvisits"/></h2>
<div class="datagrid">
<table class="statsTable">
<thead>
<tr>
<th><!-- spacer cell --></th>
<c:forEach items="${statsMonthlyVisits.colLabels}" var="headerlabel" varStatus="counter">
<th>
<c:out value="${headerlabel}"/>
</th>
</c:forEach>
</tr>
</thead>
<c:forEach items="${statsMonthlyVisits.matrix}" var="row" varStatus="counter">
<c:choose>
<c:when test="${counter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}">
<td>
<c:out value="${statsMonthlyVisits.rowLabels[counter.index]}"/>
</td>
<c:forEach items="${row}" var="cell">
<td>
<c:out value="${cell}"/>
</td>
</c:forEach>
</tr>
</c:forEach>
</table>
</div>

<% if(isItem) { %>

<h2><fmt:message key="jsp.statistics.heading.filedownloads"/></h2>
<div class="datagrid">
<table class="statsTable">
<thead>
<tr>
<th><!-- spacer cell --></th>
<th><fmt:message key="jsp.statistics.heading.views"/></th>
</tr>
</thead>
<c:forEach items="${statsFileDownloads.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}">
<td>
<c:out value="${statsFileDownloads.colLabels[rowcounter.index]}"/>
<td>
<c:out value="${cell}"/>
</td>
</c:forEach>
</tr>
</c:forEach>
</table>
</div>
<% } %>


<h2><fmt:message key="jsp.statistics.heading.countryvisits"/></h2>
<div class="datagrid">
<table class="statsTable">
<thead>
<tr>
<th><!-- spacer cell --></th>
<th><fmt:message key="jsp.statistics.heading.views"/></th>
</tr>
</thead>
<c:forEach items="${statsCountryVisits.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}">
<td>
<c:out value="${statsCountryVisits.colLabels[rowcounter.index]}"/>
<td>
<c:out value="${cell}"/>
</tr>
</td>
</c:forEach>
</c:forEach>
</table>
</div>

<h2><fmt:message key="jsp.statistics.heading.cityvisits"/></h2>
<div class="datagrid">
<table class="statsTable">
<thead>
<tr>
<th><!-- spacer cell --></th>
<th><fmt:message key="jsp.statistics.heading.views"/></th>
</tr>
</thead>
<c:forEach items="${statsCityVisits.matrix}" var="row" varStatus="counter">
<c:forEach items="${row}" var="cell" varStatus="rowcounter">
<c:choose>
<c:when test="${rowcounter.index % 2 == 0}">
<c:set var="rowClass" value="evenRowOddCol"/>
</c:when>
<c:otherwise>
<c:set var="rowClass" value="oddRowOddCol"/>
</c:otherwise>
</c:choose>
<tr class="${rowClass}">
<td>
<c:out value="${statsCityVisits.colLabels[rowcounter.index]}"/>
<td>
<c:out value="${cell}"/>
</td>
</tr>
</c:forEach>
</c:forEach>
</table>
</div>

</dspace:layout>



