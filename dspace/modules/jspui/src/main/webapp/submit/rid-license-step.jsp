<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Show the user the Creative Commons license which they may grant or reject
  -
  - Attributes to pass in:
  -    cclicense.exists   - boolean to indicate CC license already exists
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="org.dspace.core.Context" %>
<%@ page import="org.dspace.app.webui.servlet.SubmissionController" %>
<%@ page import="org.dspace.submit.AbstractProcessingStep" %>
<%@ page import="org.dspace.app.util.SubmissionInfo" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
    // Obtain DSpace context
    Context context = UIUtil.obtainContext(request);

    //get submission information object
    SubmissionInfo subInfo = SubmissionController.getSubmissionInfo(context, request);

    String ridCommercial = (String) request.getAttribute("ridCommercial");
    String ridAdaptation = (String) request.getAttribute("ridAdaptation");
%>

<dspace:layout style="submission" locbar="off" navbar="off" titlekey="jsp.submit.creative-commons.rid.title" nocache="true">
	<form name="foo" id="license_form" action="<%= request.getContextPath() %>/submit" method="post" onkeydown="return disableEnterKey(event);">
		<jsp:include page="/submit/progressbar.jsp"/>
		<h1><fmt:message key="jsp.submit.creative-commons.rid.heading"/></h1>
		<div class="alert alert-info">
			<fmt:message key="jsp.submit.creative-commons.rid.info1"/>
		</div>
		<label><fmt:message key="jsp.submit.creative-commons.rid.commercial.title"/></label>
		<a class="btn" href="" data-toggle="modal" data-target="#commercialModal">
			<i class="far fa-question-circle fa-lg" style="color:#049CCF;"></i>
		</a>
		<p class="help-block">
			<label class="radio-inline">
				<input type="radio" name="ridCommercial" value="yes" <%=ridCommercial.equals("yes") ? "checked" : "" %> />
				<fmt:message key="jsp.submit.creative-commons.rid.yes"/>
			</label>
			<label class="radio-inline">
				<input type="radio" name="ridCommercial" value="nc" <%=ridCommercial.equals("nc") ? "checked" : "" %> />
				<fmt:message key="jsp.submit.creative-commons.rid.no"/>
			</label>
		</p>
		<label><fmt:message key="jsp.submit.creative-commons.rid.adaptation.title"/></label>
		<a class="btn" href="" data-toggle="modal" data-target="#adaptationModal">
			<i class="far fa-question-circle fa-lg" style="color:#049CCF;"></i>
		</a>
		<p class="help-block">
			<label class="radio-inline">
				<input type="radio" name="ridAdaptation" value="yes" <%=ridAdaptation.equals("yes") ? "checked" : "" %> />
				<fmt:message key="jsp.submit.creative-commons.rid.yes"/>
			</label>
			<label class="radio-inline">
				<input type="radio" name="ridAdaptation" value="nd" <%=ridAdaptation.equals("nd") ? "checked" : "" %> />
				<fmt:message key="jsp.submit.creative-commons.rid.no"/>
			</label>
			<label class="radio-inline">
				<input type="radio" name="ridAdaptation" value="sa" <%=ridAdaptation.equals("sa") ? "checked" : "" %>/>
				<fmt:message key="jsp.submit.creative-commons.rid.adaptation.option1"/>
			</label>
		</p>
		<br>
		<h4>Licencia elegida</h4>
		<p>
			<a id="license_title_link" href="http://creativecommons.org/licenses/by-sa/4.0/" target="_black">
				Atribución-SinDerivadas 4.0 Internacional
			</a>
		</p>
		<p>
			<i id="cc" class="fab fa-creative-commons fa-3x"></i>
			<i id="by" class="fab fa-creative-commons-by fa-3x"></i>
			<i id="nc_slot" class="fab fa-creative-commons-nc fa-3x"></i>
			<i id="nd_slot" class="fab fa-creative-commons-nd fa-3x"></i>
			<i id="sa_slot" class="fab fa-creative-commons-sa fa-3x"></i>
		</p>
		<div>
			<a id="type_license" target="_blank" href="https://creativecommons.org/share-your-work/public-domain/freeworks">
				¡Esta es una Licencia de Cultura Libre!
			</a>
			<img id="seal" src="image/cc/fc_approved_tiny.png" alt="seal" width="64" height="64">
		</div>
		<!-- CommercialModal -->
		<div class="modal fade" id="commercialModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title"><fmt:message key="jsp.submit.creative-commons.rid.commercial.title"/></h3>
					</div>
					<div class="modal-body">
						<h4><b><fmt:message key="jsp.submit.creative-commons.rid.yes"/></b></h4>
						<p><fmt:message key="jsp.submit.creative-commons.rid.commercial.info1"/></p>
						<h4><b><fmt:message key="jsp.submit.creative-commons.rid.no"/></b></h4>
						<p><fmt:message key="jsp.submit.creative-commons.rid.commercial.info2"/></p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		<!-- AdaptationModal -->
		<div class="modal fade" id="adaptationModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title"><fmt:message key="jsp.submit.creative-commons.rid.adaptation.title"/></h3>
					</div>
					<div class="modal-body">
						<h4><b><fmt:message key="jsp.submit.creative-commons.rid.yes"/></b></h4>
						<p><fmt:message key="jsp.submit.creative-commons.rid.adaptation.info1"/></p>
						<h4><b><fmt:message key="jsp.submit.creative-commons.rid.adaptation.option1"/></b></h4>
						<p><fmt:message key="jsp.submit.creative-commons.rid.adaptation.info2"/></p>
						<h4><b><fmt:message key="jsp.submit.creative-commons.rid.no"/></b></h4>
						<p><fmt:message key="jsp.submit.creative-commons.rid.adaptation.info3"/></p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		<%-- Hidden fields needed for SubmissionController servlet to know which step is next--%>
    <%= SubmissionController.getSubmissionParameters(context, request) %>
    <input type="submit" id="submit_grant" name="submit_grant" value="submit_grant" style="display: none;" />
    <div class="row col-md-6 pull-right btn-group">
			<%  //if not first step, show "Previous" button
				if(!SubmissionController.isFirstStep(request, subInfo)) {
			%>
			<button class="btn btn-default col-md-4" type="submit" name="<%=AbstractProcessingStep.PREVIOUS_BUTTON%>">
				<fmt:message key="jsp.submit.general.previous"/>
			</button>
			<%  } %>
			<button class="btn btn-default col-md-4" type="submit" name="<%=AbstractProcessingStep.CANCEL_BUTTON%>">
				<fmt:message key="jsp.submit.general.cancel-or-save.button"/>
			</button>
			<button class="btn btn-primary col-md-4" type="submit" name="<%=AbstractProcessingStep.NEXT_BUTTON%>">
				<fmt:message key="jsp.submit.general.next"/>
			</button>
    </div>
	</form>
	<script>
		let titleCom = {name: "", url: ""};
		let titleAda = {name: "", url: ""};

		// Llamo a las funciones para que carguen el valor por defecto
		jQuery(document).ready(function() {
			updateCommercialOption(jQuery('input:radio[name=ridCommercial]:checked').val());
			updateAdaptationOption(jQuery('input:radio[name=ridAdaptation]:checked').val());
		})

		// Cada vez que se presiona el radio de commercial
		jQuery('input:radio[name=ridCommercial]').change(function() {
			updateCommercialOption(jQuery(this).val());
		});

		// Cada vez que se presiona el radio de adaptation
		jQuery('input:radio[name=ridAdaptation]').change(function() {
			updateAdaptationOption(jQuery(this).val());
		}).change();

		function updateCommercialOption(val) {
			titleCom = {name: "", url: ""};
			if(val != "nc") {
				jQuery("#nc_slot")[0].style.display = "none";
			} else {
				jQuery("#nc_slot")[0].style.display = "inline";
				titleCom.name = "-NoComercial";
				titleCom.url = "-nc";
			}
			updateTypeLicense();
			updateCcUrl();
		}

		function updateAdaptationOption(val) {
			titleAda = {name: "", url: ""};
			if (val == "nd") {
				jQuery("#nd_slot")[0].style.display = "inline";
				jQuery("#sa_slot")[0].style.display = "none";
				titleAda.name = "-SinDerivadas";
				titleAda.url = "-nd";
			} else if(val == "sa") {
				jQuery("#sa_slot")[0].style.display = "inline";
				jQuery("#nd_slot")[0].style.display = "none";
				titleAda.name = "-CompartirIgual";
				titleAda.url = "-sa";
			} else {
				jQuery("#sa_slot")[0].style.display = "none";
				jQuery("#nd_slot")[0].style.display = "none";
			}
			updateTypeLicense();
			updateCcUrl();
		}

		function updateCcUrl() {
			jQuery("#license_title_link")[0].innerHTML = "Atribución" + titleCom.name + titleAda.name + " 4.0 Internacional";
			jQuery("#license_title_link")[0].href = "http://creativecommons.org/licenses/by" +
							titleCom.url +
							titleAda.url +
							"/4.0/deed.es";
		}

		function updateTypeLicense(val) {
			if (titleAda.url == "-nd" || titleCom.url == "-nc") {
				jQuery("#type_license")[0].text = "Esta no es una Licencia de Cultura Libre.";
				jQuery("#seal")[0].src = "image/cc/fc_dubious.png";
			} else {
				jQuery("#type_license")[0].text = "¡Esta es una Licencia de Cultura Libre!";
				jQuery("#seal")[0].src = "image/cc/fc_approved_tiny.png";
			}
		}
	</script>
</dspace:layout>
