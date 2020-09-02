<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>

<%--
  - Display the form to refine the simple-search and dispaly the results of the search
  -
  - Attributes to pass in:
  -
  -   scope            - pass in if the scope of the search was a community
  -                      or a collection
  -   scopes 		   - the list of available scopes where limit the search
  -   sortOptions	   - the list of available sort options
  -   availableFilters - the list of filters available to the user
  -
  -   query            - The original query
  -   queryArgs		   - The query configuration parameters (rpp, sort, etc.)
  -   appliedFilters   - The list of applied filters (user input or facet)
  -
  -   search.error     - a flag to say that an error has occurred
  -   spellcheck	   - the suggested spell check query (if any)
  -   qResults		   - the discovery results
  -   items            - the results.  An array of Items, most relevant first
  -   communities      - results, Community[]
  -   collections      - results, Collection[]
  -
  -   admin_button     - If the user is an admin
  --%>

<%@page import="org.dspace.core.Utils"%>
<%@page import="com.coverity.security.Escape"%>
<%@page import="org.dspace.discovery.configuration.DiscoverySearchFilterFacet"%>
<%@page import="org.dspace.app.webui.util.UIUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.dspace.discovery.DiscoverFacetField"%>
<%@page import="org.dspace.discovery.configuration.DiscoverySearchFilter"%>
<%@page import="org.dspace.discovery.DiscoverFilterQuery"%>
<%@page import="org.dspace.discovery.DiscoverQuery"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="org.dspace.discovery.DiscoverResult.FacetResult"%>
<%@page import="org.dspace.discovery.DiscoverResult"%>
<%@page import="org.dspace.content.DSpaceObject"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ page import="java.net.URLEncoder"            %>
<%@ page import="org.dspace.content.Community"   %>
<%@ page import="org.dspace.content.Collection"  %>
<%@ page import="org.dspace.content.Item"        %>
<%@ page import="org.dspace.sort.SortOption" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Set" %>
<%
    // Get the attributes
    DSpaceObject scope = (DSpaceObject) request.getAttribute("scope" );
    String searchScope = scope!=null ? scope.getHandle() : "";
    List<DSpaceObject> scopes = (List<DSpaceObject>) request.getAttribute("scopes");
    List<String> sortOptions = (List<String>) request.getAttribute("sortOptions");

    String query = (String) request.getAttribute("query");
		if (query == null)
		{
				query = "";
		}
    Boolean error_b = (Boolean)request.getAttribute("search.error");
    boolean error = error_b==null ? false : error_b.booleanValue();
    
    DiscoverQuery qArgs = (DiscoverQuery) request.getAttribute("queryArgs");
    String sortedBy = qArgs.getSortField();
    String order = qArgs.getSortOrder().toString();
    String ascSelected = (SortOption.ASCENDING.equalsIgnoreCase(order)   ? "selected=\"selected\"" : "");
    String descSelected = (SortOption.DESCENDING.equalsIgnoreCase(order) ? "selected=\"selected\"" : "");
    String httpFilters ="";
		String spellCheckQuery = (String) request.getAttribute("spellcheck");
    List<DiscoverySearchFilter> availableFilters = (List<DiscoverySearchFilter>) request.getAttribute("availableFilters");
		List<String[]> appliedFilters = (List<String[]>) request.getAttribute("appliedFilters");
		List<String> appliedFilterQueries = (List<String>) request.getAttribute("appliedFilterQueries");
		if (appliedFilters != null && appliedFilters.size() >0 ) 
		{
				int idx = 1;
				for (String[] filter : appliedFilters)
				{
									if (filter == null
													|| filter[0] == null || filter[0].trim().equals("")
													|| filter[2] == null || filter[2].trim().equals(""))
									{
											idx++;
											continue;
									}
						httpFilters += "&amp;filter_field_"+idx+"="+URLEncoder.encode(filter[0],"UTF-8");
						httpFilters += "&amp;filter_type_"+idx+"="+URLEncoder.encode(filter[1],"UTF-8");
						httpFilters += "&amp;filter_value_"+idx+"="+URLEncoder.encode(filter[2],"UTF-8");
						idx++;
				}
		}
    int rpp          = qArgs.getMaxResults();
    int etAl         = ((Integer) request.getAttribute("etal")).intValue();

    String[] options = new String[]{"equals","contains","authority","notequals","notcontains","notauthority"};
    
    // Admin user or not
    Boolean admin_b = (Boolean)request.getAttribute("admin_button");
    boolean admin_button = (admin_b == null ? false : admin_b.booleanValue());
%>

<c:set var="dspace.layout.head.last" scope="request">
	<script type="text/javascript">
		var jQ = jQuery.noConflict();
		jQ(document).ready(function() {
			jQ( "#spellCheckQuery").click(function(){
				jQ("#query").val(jQ(this).attr('data-spell'));
				jQ("#main-query-submit").click();
			});
			jQ( "#filterquery" )
				.autocomplete({
					source: function( request, response ) {
						jQ.ajax({
							url: "<%= request.getContextPath() %>/json/discovery/autocomplete?query=<%= URLEncoder.encode(query,"UTF-8")%><%= httpFilters.replaceAll("&amp;","&") %>",
							dataType: "json",
							cache: false,
							data: {
								auto_idx: jQ("#filtername").val(),
								auto_query: request.term,
								auto_sort: 'count',
								auto_type: jQ("#filtertype").val(),
								location: '<%= searchScope %>'	
							},
							success: function( data ) {
								response( jQ.map( data.autocomplete, function( item ) {
									var tmp_val = item.authorityKey;
									if (tmp_val == null || tmp_val == '')
									{
										tmp_val = item.displayedValue;
									}
									return {
										label: item.displayedValue + " (" + item.count + ")",
										value: tmp_val
									};
								}))			
							}
						})
					}
				});
		});
		function validateFilters() {
			return document.getElementById("filterquery").value.length > 0;
		}
	</script>
</c:set>

<%-- La propiedad navbar="off" permite acceder a la versión minimal de navbar (es decir, sin el input search en el header) --%>
<dspace:layout navbar="off" titlekey="jsp.search.title">
	<%-- Titulo BUSCAR --%>
	<h2><i class="fas fa-file"></i> <fmt:message key="jsp.search.title"/></h2>
	<%-- BUSCADOR --%>
	<div class="search-results">
		<%
			// Busca el nombre de la comunidad o colección en la que se está buscando
			if (scope != null) {
				%><h3>Buscando en la <%
				if (scope instanceof Community) {
					%><%="comunidad: "%><%
				} else {
					%><%="colección: "%><%
				}
				%><strong><%=scope.getName()%></strong><%
				%></h3><%
			}
		%>
		<div class="well">
			<form action="simple-search" method="get">
				<div class="input-group">
					<input type="text" class="form-control" size="50" id="query" name="query" value="<%= (query==null ? "" : Utils.addEntities(query)) %>"/>
					<span class="input-group-btn">
						<button id="main-query-submit" class="btn btn-unrn-reverse" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
				<% if (StringUtils.isNotBlank(spellCheckQuery)) {%>
				<p class="lead">
					<fmt:message key="jsp.search.didyoumean">
						<fmt:param>
							<a id="spellCheckQuery" data-spell="<%= Utils.addEntities(spellCheckQuery) %>" href="#"><%= spellCheckQuery %></a>
						</fmt:param>
					</fmt:message>
				</p>
				<% } %>                  
				<input type="hidden" value="<%= rpp %>" name="rpp" />
				<input type="hidden" value="<%= Utils.addEntities(sortedBy) %>" name="sort_by" />
				<input type="hidden" value="<%= Utils.addEntities(order) %>" name="order" />
				<% if (appliedFilters.size() > 0 ) { %>
					<div class="tagsinput">
						<%
							int idx = 1;
							for (String[] filter : appliedFilters)
							{
									boolean found = false;
						%>
						<select id="filter_field_<%=idx %>" name="filter_field_<%=idx %>" class="hidden">
						<%
								for (DiscoverySearchFilter searchFilter : availableFilters)
								{
										String fkey = "jsp.search.filter." + Escape.uriParam(searchFilter.getIndexFieldName());
										%><option value="<%= Utils.addEntities(searchFilter.getIndexFieldName()) %>"<% 
														if (searchFilter.getIndexFieldName().equals(filter[0]))
														{
																%> selected="selected"<%
																found = true;
														}
														%>><fmt:message key="<%= fkey %>"/></option><%
								}
								if (!found)
								{
										String fkey = "jsp.search.filter." + Escape.uriParam(filter[0]);
										%><option value="<%= Utils.addEntities(filter[0]) %>" selected="selected"><fmt:message key="<%= fkey %>"/></option><%
								}
						%>
						</select>
						<select id="filter_type_<%=idx %>" name="filter_type_<%=idx %>" class="hidden">
						<%
								for (String opt : options)
								{
										String fkey = "jsp.search.filter.op." + Escape.uriParam(opt);
										%><option value="<%= Utils.addEntities(opt) %>"<%= opt.equals(filter[1])?" selected=\"selected\"":"" %>><fmt:message key="<%= fkey %>"/></option><%
								}
						%>
						</select>
						<span class="tag label">
							<input type="text" id="filter_value_<%=idx %>" name="filter_value_<%=idx %>" value="<%= Utils.addEntities(filter[2]) %>" />
							<button type="submit" id="submit_filter_remove_<%=idx %>" name="submit_filter_remove_<%=idx %>" value="X">
								<i class="remove fa fa-times-circle"></i>
							</button>
						</span>
						<%
								idx++;
							}
						%>
					</div>
				<%
							}
				%>
			</form>
		</div><%-- END BUSCADOR --%>
		<%
			DiscoverResult qResults = (DiscoverResult)request.getAttribute("queryresults");
			List<Item>      items       = (List<Item>      )request.getAttribute("items");
			List<Community> communities = (List<Community> )request.getAttribute("communities");
			List<Collection>collections = (List<Collection>)request.getAttribute("collections");

			if( error )
			{
				%>
					<h3 class="submitFormWarn"><fmt:message key="jsp.search.error.discovery" /></h3>
				<%
			}
			else if( qResults != null && qResults.getTotalSearchResults() == 0 )
			{
				%>
					<h3><fmt:message key="jsp.search.general.noresults"/></h3>
				<%
			}
			else if( qResults != null)
			{
				long pageTotal   = ((Long)request.getAttribute("pagetotal"  )).longValue();
				long pageCurrent = ((Long)request.getAttribute("pagecurrent")).longValue();
				long pageLast    = ((Long)request.getAttribute("pagelast"   )).longValue();
				long pageFirst   = ((Long)request.getAttribute("pagefirst"  )).longValue();
				
				// create the URLs accessing the previous and next search result pages
				String baseURL =  request.getContextPath()
												+ (!searchScope.equals("") ? "/handle/" + searchScope : "")
												+ "/simple-search?query="
												+ URLEncoder.encode(query,"UTF-8")
												+ httpFilters
												+ "&amp;sort_by=" + sortedBy
												+ "&amp;order=" + order
												+ "&amp;rpp=" + rpp
												+ "&amp;etal=" + etAl
												+ "&amp;start=";

				String nextURL = baseURL;
				String firstURL = baseURL;
				String lastURL = baseURL;

				String prevURL = baseURL + (pageCurrent-2) * qResults.getMaxResults();

				nextURL = nextURL + (pageCurrent) * qResults.getMaxResults();
				
				firstURL = firstURL +"0";
				lastURL = lastURL + (pageTotal-1) * qResults.getMaxResults();

				long lastHint = qResults.getStart()+qResults.getMaxResults() <= qResults.getTotalSearchResults()?
							qResults.getStart()+qResults.getMaxResults():qResults.getTotalSearchResults();
		%>
		<h3>
			<fmt:message key="jsp.search.results.results">
				<fmt:param><%=qResults.getStart()+1%></fmt:param>
				<fmt:param><%=lastHint%></fmt:param>
				<fmt:param><%=qResults.getTotalSearchResults()%></fmt:param>
				<fmt:param><%=(float) qResults.getSearchTime() / 1000%></fmt:param>
			</fmt:message>
		</h3>
		<hr>
		<div class="row">
			<%-- ORDENAMIENTO --%>
			<div class="col-sm-6">
				<div class="dropdown dropdown-lg">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<i class="fa fa-cog"></i> Opciones
						<span class="caret"></span>
					</button>
					<div class="dropdown-menu" role="menu">
						<form action="simple-search" method="get">
							<input type="hidden" value="<%= Utils.addEntities(searchScope) %>" name="location" />
							<input type="hidden" value="<%= Utils.addEntities(query) %>" name="query" />
							<% 
								if (appliedFilterQueries.size() > 0 ) {
									int idx = 1;
									for (String[] filter : appliedFilters)
									{
										boolean found = false;
							%>
							<input type="hidden" id="filter_field_<%=idx %>" name="filter_field_<%=idx %>" value="<%= Utils.addEntities(filter[0]) %>" />
							<input type="hidden" id="filter_type_<%=idx %>" name="filter_type_<%=idx %>" value="<%= Utils.addEntities(filter[1]) %>" />
							<input type="hidden" id="filter_value_<%=idx %>" name="filter_value_<%=idx %>" value="<%= Utils.addEntities(filter[2]) %>" />
							<%
										idx++;
									}
								} 
							%>
							<div class="form-group">
								<label for="rpp"><fmt:message key="search.results.perpage"/></label>
								<select class="form-control" name="rpp" id="rpp">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="100">100</option>
								</select>
							</div>
							<%
								if (sortOptions.size() > 0)
								{
							%>
							<div class="form-group">
								<label for="sort_by"><fmt:message key="search.results.sort-by"/></label>
								<select class="form-control" name="sort_by" id="sort_by">
									<option value="score"><fmt:message key="search.sort-by.relevance"/></option>
							<%
									for (String sortBy : sortOptions)
									{
										String selected = (sortBy.equals(sortedBy) ? "selected=\"selected\"" : "");
										String mKey = "search.sort-by." + Utils.addEntities(sortBy);
							%>
									<option value="<%= Utils.addEntities(sortBy) %>" <%= selected %>><fmt:message key="<%= mKey %>"/></option>
							<%
									}
							%>
								</select>
							</div>
							<%
								}
							%>
							<div class="form-group">
								<label for="order"><fmt:message key="search.results.order"/></label>
								<select class="form-control" name="order" id="order">
									<option value="ASC" <%= ascSelected %>><fmt:message key="search.order.asc" /></option>
									<option value="DESC" <%= descSelected %>><fmt:message key="search.order.desc" /></option>
								</select>
							</div>
							<button type="submit" class="btn btn-unrn-reverse" name="submit_search"><fmt:message key="search.update" /></button>
							<%
								if (admin_button)
								{
							%>
							<button type="submit" class="btn btn-default" name="submit_export_metadata">
								<fmt:message key="jsp.general.metadataexport.button"/>
							</button>
							<%
								}
							%>
						</form>
					</div>
				</div>
			</div><%-- END ORDENAMIENTO --%>
			<%-- PAGINACIÓN --%>
			<div class="col-md-6 text-right">
				<ul class="pagination">
			<%
				if (pageFirst != pageCurrent)
				{
					%><li><a href="<%= prevURL %>"><fmt:message key="jsp.search.general.previous" /></a></li><%
				}
				else
				{
					%><li class="disabled"><span><fmt:message key="jsp.search.general.previous" /></span></li><%
				}
			
				if (pageFirst != 1)
				{
					%><li><a href="<%= firstURL %>">1</a></li><li class="disabled"><span>...</span></li><%
				}
			
				for( long q = pageFirst; q <= pageLast; q++ )
				{
					String myLink = "<li><a href=\"" + baseURL;
			
					if( q == pageCurrent )
					{
							myLink = "<li class=\"active\"><span>" + q + "</span></li>";
					}
					else
					{
						myLink = myLink
								+ (q-1) * qResults.getMaxResults()
								+ "\">"
								+ q
								+ "</a></li>";
					}
			%>
				<%= myLink %>
			<%
				}
			
				if (pageTotal > pageLast)
				{
					%><li class="disabled"><span>...</span></li><li><a href="<%= lastURL %>"><%= pageTotal %></a></li><%
				}

				if (pageTotal > pageCurrent)
				{
					%><li><a href="<%= nextURL %>"><fmt:message key="jsp.search.general.next" /></a></li><%
				}
				else
				{
					%><li class="disabled"><span><fmt:message key="jsp.search.general.next" /></span></li><%
				}
			%>
				</ul>
			</div><%-- END PAGINACIÓN --%>
		</div>
		<div class="discovery-result-results">
		<% 	if (communities.size() > 0 ) { %>
			<div class="panel panel-info">
				<div class="panel-heading"><fmt:message key="jsp.search.results.comhits"/></div>
				<dspace:communitylist  communities="<%= communities %>" />
			</div>
		<% 	} %>

		<% 	if (collections.size() > 0 ) { %>
			<div class="panel panel-info">
				<div class="panel-heading"><fmt:message key="jsp.search.results.colhits"/></div>
				<dspace:collectionlist collections="<%= collections %>" />
			</div>
		<% 	} %>

		<% 	if (items.size() > 0) { %>
			<div class="panel panel-info">
				<div class="panel-heading"><fmt:message key="jsp.search.results.itemhits"/></div>
				<dspace:itemlist items="<%= items %>" authorLimit="<%= etAl %>" />
			</div>
		<% 	} %>
		</div>
		<%-- if the result page is enought long... --%>
		<% 	if ((communities.size() + collections.size() + items.size()) > 5) {%>
		<%-- PAGINACIÓN --%>
		<ul class="pagination pull-right">
		<%
					if (pageFirst != pageCurrent)
					{
						%><li><a href="<%= prevURL %>"><fmt:message key="jsp.search.general.previous" /></a></li><%
					}
					else
					{
						%><li class="disabled"><span><fmt:message key="jsp.search.general.previous" /></span></li><%
					}
				
					if (pageFirst != 1)
					{
						%><li><a href="<%= firstURL %>">1</a></li><li class="disabled"><span>...</span></li><%
					}
				
					for( long q = pageFirst; q <= pageLast; q++ )
					{
						String myLink = "<li><a href=\"" + baseURL;
				
						if( q == pageCurrent )
						{
								myLink = "<li class=\"active\"><span>" + q + "</span></li>";
						}
						else
						{
							myLink = myLink
									+ (q-1) * qResults.getMaxResults()
									+ "\">"
									+ q
									+ "</a></li>";
						}
		%>
						<%= myLink %>
		<%
					}
				
					if (pageTotal > pageLast)
					{
						%><li class="disabled"><span>...</span></li><li><a href="<%= lastURL %>"><%= pageTotal %></a></li><%
					}

					if (pageTotal > pageCurrent)
					{
						%><li><a href="<%= nextURL %>"><fmt:message key="jsp.search.general.next" /></a></li><%
					}
					else
					{
						%><li class="disabled"><span><fmt:message key="jsp.search.general.next" /></span></li><%
					}
		%>
		</ul><%-- END PAGINACIÓN --%>
		<%	
				}
			} 
		%>
	</div><!-- END SEARCH-RESULTS -->

	<dspace:sidebar>
	<%
		boolean brefine = false;
		
		List<DiscoverySearchFilterFacet> facetsConf = (List<DiscoverySearchFilterFacet>) request.getAttribute("facetsConfig");
		Map<String, Boolean> showFacets = new HashMap<String, Boolean>();
			
		for (DiscoverySearchFilterFacet facetConf : facetsConf)
		{
			if(qResults!=null) {
					String f = facetConf.getIndexFieldName();
					List<FacetResult> facet = qResults.getFacetResult(f);
					if (facet.size() == 0)
					{
							facet = qResults.getFacetResult(f+".year");
						if (facet.size() == 0)
						{
								showFacets.put(f, false);
								continue;
						}
					}
					boolean showFacet = false;
					for (FacetResult fvalue : facet)
					{ 
						if(!appliedFilterQueries.contains(f+"::"+fvalue.getFilterType()+"::"+fvalue.getAsFilterQuery()))
						{
								showFacet = true;
								break;
						}
					}
					showFacets.put(f, showFacet);
					brefine = brefine || showFacet;
			}
		}
		if (brefine) {
	%>

	<h3 class="facets">
		<i class="fa fa-filter"></i>
		<fmt:message key="jsp.search.facet.refine" />
	</h3>
	<div id="facets" class="facets-box">
	<%
			for (DiscoverySearchFilterFacet facetConf : facetsConf)
			{
					String f = facetConf.getIndexFieldName();
					if (!showFacets.get(f))
							continue;
					List<FacetResult> facet = qResults.getFacetResult(f);
					if (facet.size() == 0)
					{
							facet = qResults.getFacetResult(f+".year");
					}
					int limit = facetConf.getFacetLimit()+1;
					
					String fkey = "jsp.search.facet.refine."+f;
	%>
		<div id="facet_<%= f %>">
			<h4><fmt:message key="<%= fkey %>" /></h4>
			<ul class="list-group">
			<%
					int idx = 1;
					int currFp = UIUtil.getIntParameter(request, f+"_page");
					if (currFp < 0)
					{
							currFp = 0;
					}
					for (FacetResult fvalue : facet)
					{ 
						if (idx != limit && !appliedFilterQueries.contains(f+"::"+fvalue.getFilterType()+"::"+fvalue.getAsFilterQuery()))
						{
						%><li class="list-group-item">
								<span class="badge"><%= fvalue.getCount() %></span>
								<a href="<%= request.getContextPath()
										+ (!searchScope.equals("")?"/handle/"+searchScope:"")
										+ "/simple-search?query="
										+ URLEncoder.encode(query,"UTF-8")
										+ "&amp;sort_by=" + sortedBy
										+ "&amp;order=" + order
										+ "&amp;rpp=" + rpp
										+ httpFilters
										+ "&amp;etal=" + etAl
										+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
										+ "&amp;filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
										+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
										title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>"
								>
									<%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %>
								</a>
							</li>
						<%
								idx++;
						}
						if (idx > limit)
						{
								break;
						}
					}
					if (currFp > 0 || idx == limit)
					{
						%><li class="list-group-item"><span style="visibility: hidden;">.</span>
						<% if (currFp > 0) { %>
								<a href="<%= request.getContextPath()
										+ (!searchScope.equals("")?"/handle/"+searchScope:"")
										+ "/simple-search?query="
										+ URLEncoder.encode(query,"UTF-8")
										+ "&amp;sort_by=" + sortedBy
										+ "&amp;order=" + order
										+ "&amp;rpp=" + rpp
										+ httpFilters
										+ "&amp;etal=" + etAl  
										+ "&amp;"+f+"_page="+(currFp-1) %>"
								>
									<span class="pull-left">
										<fmt:message key="jsp.search.facet.refine.previous" />
									</span>
								</a>
						<% 
							}
							if (idx == limit) { %>
								<a href="<%= request.getContextPath()
									+ (!searchScope.equals("")?"/handle/"+searchScope:"")
									+ "/simple-search?query="
									+ URLEncoder.encode(query,"UTF-8")
									+ "&amp;sort_by=" + sortedBy
									+ "&amp;order=" + order
									+ "&amp;rpp=" + rpp
									+ httpFilters
									+ "&amp;etal=" + etAl  
									+ "&amp;"+f+"_page="+(currFp+1) %>"
								>
									<span class="pull-right">
										<fmt:message key="jsp.search.facet.refine.next" />
									</span>
								</a>
						<%
							}
						%></li><%
					}
			%>
			</ul>
		</div>
	<%
			}
	%>
	</div>
	<%
		} 
	%>
	</dspace:sidebar>
</dspace:layout>
