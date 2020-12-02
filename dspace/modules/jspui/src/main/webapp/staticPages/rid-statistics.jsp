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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<dspace:layout title="Preguntas frecuentes">
  <div class="row">
    <div class="col-md-12">
      <div class="text-center">
        <h2>Estad&iacute;sticas del RID-UNRN</h2>
      </div>
    </div>
    <div class="col-md-12 mb-30">
      <iframe
          title="Evolución del RID-UNRN por trimestre"
          aria-label="chart"
          id="datawrapper-chart-7oOr4"
          src="https://datawrapper.dwcdn.net/7oOr4/1/"
          scrolling="no"
          frameborder="0"
          style="width: 0; min-width: 100% !important; border: none;" height="525">
      </iframe>
      <script type="text/javascript">!function(){"use strict";window.addEventListener("message",(function(a){if(void 0!==a.data["datawrapper-height"])for(var e in a.data["datawrapper-height"]){var t=document.getElementById("datawrapper-chart-"+e)||document.querySelector("iframe[src*='"+e+"']");t&&(t.style.height=a.data["datawrapper-height"][e]+"px")}}))}();</script>
    </div>
    <div class="col-md-6 mb-30">
      <iframe
          title="Visitas acumuladas por trimestre"
          aria-label="Interactive line chart"
          id="datawrapper-chart-7cSiN"
          src="https://datawrapper.dwcdn.net/7cSiN/1/"
          scrolling="no"
          frameborder="0"
          style="width: 0; min-width: 100% !important; border: none;" height="372">
      </iframe>
      <script type="text/javascript">!function(){"use strict";window.addEventListener("message",(function(a){if(void 0!==a.data["datawrapper-height"])for(var e in a.data["datawrapper-height"]){var t=document.getElementById("datawrapper-chart-"+e)||document.querySelector("iframe[src*='"+e+"']");t&&(t.style.height=a.data["datawrapper-height"][e]+"px")}}))}();</script>
    </div>
    <div class="col-md-6 mb-30">
      <iframe
          title="Total de registros por comunidad principal"
          aria-label="chart"
          id="datawrapper-chart-WN0Yz"
          src="https://datawrapper.dwcdn.net/WN0Yz/1/"
          scrolling="no"
          frameborder="0"
          style="width: 0; min-width: 100% !important; border: none;" height="454">
      </iframe>
      <script type="text/javascript">!function(){"use strict";window.addEventListener("message",(function(a){if(void 0!==a.data["datawrapper-height"])for(var e in a.data["datawrapper-height"]){var t=document.getElementById("datawrapper-chart-"+e)||document.querySelector("iframe[src*='"+e+"']");t&&(t.style.height=a.data["datawrapper-height"][e]+"px")}}))}();</script>
    </div>
    <div class="col-md-12">
      <iframe
          title="Autores con mas registros en el RID-UNRN"
          aria-label="chart"
          id="datawrapper-chart-rbC3H"
          src="https://datawrapper.dwcdn.net/rbC3H/2/"
          scrolling="no"
          frameborder="0"
          style="width: 0; min-width: 100% !important; border: none;" height="318">
      </iframe>
      <script type="text/javascript">!function(){"use strict";window.addEventListener("message",(function(a){if(void 0!==a.data["datawrapper-height"])for(var e in a.data["datawrapper-height"]){var t=document.getElementById("datawrapper-chart-"+e)||document.querySelector("iframe[src*='"+e+"']");t&&(t.style.height=a.data["datawrapper-height"][e]+"px")}}))}();</script>
    </div>
  </div>
</dspace:layout>