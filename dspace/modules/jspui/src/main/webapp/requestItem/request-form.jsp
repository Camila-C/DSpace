<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Sugest form JSP
  -
  - Attributes:
  -    requestItem.problem  - if present, report that all fields weren't filled out
  -    authenticated.email - email of authenticated user, if any
  -	   handle - URL of handle item
  --%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="java.util.*"%>
<%@ page import="org.dspace.app.webui.servlet.*" %>

<%
	  request.setCharacterEncoding("UTF-8");
	
    boolean problem = (request.getAttribute("requestItem.problem") != null);

    String email = (String) request.getAttribute("email");
    if (email == null)
      email = "";

    String userName = (String) request.getAttribute("reqname");
    if (userName == null)
      userName = "";

    String handle = (String) request.getAttribute("handle");
    if (handle == null )
      handle = "";
	
    String title = (String) request.getAttribute("title");
    if (title == null)
      title = "";
		
    String coment = (String) request.getAttribute("coment");
    if (coment == null)
      coment = "";

    UUID bitstream_id = (UUID) request.getAttribute("bitstream-id");
    boolean allfiles = (request.getAttribute("allfiles") != null);

%>

<dspace:layout locbar="off" navbar="default" titlekey="jsp.request.item.request-form.title" >
  <section class="jumbotron bg-transparent">
    <h2><fmt:message key="jsp.request.item.request-form.info1"/></h2>
    <p class="lead">
      <fmt:message key="jsp.request.item.request-form.info2">
        <fmt:param><a href="<%=request.getContextPath()%>/handle/<%=handle %>"><%=title %></a></fmt:param>
      </fmt:message>
      <div class="alert alert-info">
        <fmt:message key="jsp.request.item.request-form.info3"/>
      </div>
    </p>
    <hr>
    <%	if (problem) { %>
      <div class="alert alert-danger">
        <fmt:message key="jsp.request.item.request-form.problem"/>
      </div>
    <%	} %>
    <div class="row">
      <form name="form1" method="post" action="<%= request.getContextPath() %>/request-item">
        <input type="hidden" name="handle" value='<%= handle %>' />
        <input type="hidden" name="bitstream-id" value='<%= bitstream_id %>' />
        <input type="hidden" name="step" value="<%=RequestItemServlet.ENTER_FORM_PAGE %>" />
        <div class="form-group col-md-6">
          <label for="reqname"><fmt:message key="jsp.request.item.request-form.reqname"/></label>
          <input type="text" class="form-control" name="reqname" size="50" value="<%= userName %>">
        </div>
        <div class="form-group col-md-6">
          <label for="email"><fmt:message key="jsp.request.item.request-form.email"/></label>
          <input type="text" class="form-control" name="email" size="50" value="<%= email %>">
        </div>
        <div class="form-group col-md-12">
          <label for="allfiles"><fmt:message key="jsp.request.item.request-form.allfiles"/></label>
          <div class="input-group"> 
            <span class="input-group-addon">
              <input type="radio" name="allfiles" value="true" <%=allfiles?"checked":""%> />
            </span>
            <span class="form-control"><fmt:message key="jsp.request.item.request-form.yes"/></span>
          </div>
          <div class="input-group">
            <span class="input-group-addon">
              <input type="radio" name="allfiles" value="false" <%=allfiles?"":"checked"%> />
            </span>
            <span class="form-control"><fmt:message key="jsp.request.item.request-form.no"/></span>
          </div> 
        </div>
        <div class="form-group col-md-12">
          <label for="coment"><fmt:message key="jsp.request.item.request-form.coment"/></label>
          <textarea class="form-control" name="coment" rows="6" cols="46"><%= coment %></textarea>
        </div>
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-unrn-reverse" name="submit" value="true">
            <fmt:message key="jsp.request.item.request-form.go"/>
          </button>
          <a class="btn btn-default" href="<%=request.getContextPath()%>/handle/<%=handle %>">
            <fmt:message key="jsp.request.item.request-form.cancel" />
          </a>
        </div>
      </form>
    </div>
    <dspace:include page="/components/contact-info.jsp" />
  </section> 
</dspace:layout>