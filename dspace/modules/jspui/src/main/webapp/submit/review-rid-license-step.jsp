<%--
  Created by IntelliJ IDEA.
  User: msanhueza
  Date: 5/8/2020
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Sample Review JSP
  -
  - This is a sample JSP that works in conjuction with
  - the org.dspace.submit.step.SampleStep class
  -
  - This JSP is meant to be a template for similar review JSPs.
  -
  - Parameters to pass in to this page (from review.jsp)
  -    submission.jump - the step and page number (e.g. stepNum.pageNum) to create a "jump-to" link
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="org.dspace.app.webui.servlet.SubmissionController" %>
<%@ page import="org.dspace.app.util.SubmissionInfo" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.core.Context" %>
<%@ page import="org.dspace.content.Item" %>
<%@ page import="org.dspace.content.service.ItemService" %>
<%@ page import="org.dspace.content.factory.ContentServiceFactory" %>
<%@ page import="org.dspace.services.ConfigurationService" %>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
  request.setAttribute("LanguageSwitch", "hide");

  // Obtain DSpace context
  Context context = UIUtil.obtainContext(request);

  //get submission information object
  SubmissionInfo subInfo = SubmissionController.getSubmissionInfo(context, request);

  //get the step number (for jump-to link)
  String stepJump = request.getParameter("submission.jump");

  //get configurationManager and CC properties
  ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();
  String ccUri = configurationService.getProperty("cc.license.uri");
  String ccName = configurationService.getProperty("cc.license.name");

  //get item and itemService
  Item item = subInfo.getSubmissionItem().getItem();
  ItemService itemService = ContentServiceFactory.getInstance().getItemService();

  //get metadata values
  String ridLicenseUri = (itemService.getMetadataByMetadataString(item, ccUri) != null
          && itemService.getMetadataByMetadataString(item, ccUri).size() > 0)
          ? itemService.getMetadataByMetadataString(item, ccUri).get(0).getValue()
          : "Ninguno";
  String ridLicenseName = (itemService.getMetadataByMetadataString(item, ccName) != null
          && itemService.getMetadataByMetadataString(item, ccName).size() > 0)
          ? itemService.getMetadataByMetadataString(item, ccName).get(0).getValue()
          : "Ninguno";
%>

<%-- ====================================================== --%>
<%--                      RID CCLicense                     --%>
<%-- ====================================================== --%>
<div class="col-md-10">
  <div class="row">
    <span class="metadataFieldLabel col-md-4">Licencia elegida</span>
    <span class="col-md-8 break-all"><%=ridLicenseName%></span>
  </div>
  <div class="row">
    <span class="metadataFieldLabel col-md-4">Link de Creative Commons</span>
    <span class="col-md-8 break-all">
      <a href="<%=ridLicenseUri%>" target="_blank"><%=ridLicenseUri%></a></span>
  </div>
</div>
<div class="col-md-2">
  <input class="btn btn-default"
         type="submit"
         name="submit_jump_<%= stepJump %>"
         value="<fmt:message key="jsp.submit.review.button.correct"/>"
  />
</div>
