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
        <h2>Preguntas frecuentes</h2>
      </div>
    </div>
    <div class="col-md-12 before-accordion">
      <h3 id="sobre-el-rid">Sobre el Repositorio Institucional Digital de la Universidad Nacional de R&iacute;o Negro (RID-UNRN)</h3>
      <p>
        <strong>RID-UNRN</strong>, el Repositorio Institucional Digital de la Universidad Nacional de R&iacute;o Negro,
        tiene como objetivos, reunir, archivar y preservar la producci&oacute;n intelectual resultante de la actividad
        acad&eacute;mica e investigadora de nuestra comunidad universitaria, en formato digital, y ofrecer acceso abierto a
        dicha producci&oacute;n. La colecci&oacute;n abarca tesis de grado y posgrado, art&iacute;culos de revistas, libros
        y cap&iacute;tulos, documentos de trabajo, preprints, actas de congresos, etc.<br />RID-UNRN est&aacute; basado en 
        los fundamentos filos&oacute;ficos del acceso abierto y promueve los valores de:
      </p>
      <ul>
        <li>Acceso a la informaci&oacute;n</li>
        <li>Soberan&iacute;a tecnol&oacute;gica e informacional</li>
        <li>Igualdad</li>
        <li>Excelencia acad&eacute;mica</li>
        <li>Pluralidad</li>
      </ul>
      <p>
        El RID-UNRN adhiere a la Iniciativa de <strong>Acceso Abierto</strong>, 
        que sustenta el principio de la libre disposici&oacute;n de la informaci&oacute;n.
      </p>
    </div>
    <div class="col-md-12"><!-- Inicio accordion 1 -->
      <div class="panel-group accordion-faqs" id="accordion-faqs1">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs1" href="#beneficios">
                &iquest;Cu&aacute;les son los beneficios de un Repositorio Institucional?
              </a>
            </h4>
          </div>
          <div id="beneficios" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Los repositorios hoy constituyen un insumo de f&aacute;cil indexaci&oacute;n para los buscadores web m&aacute;s importantes, 
                esto se debe principalmente a la compatibilidad con la estructura de metadatos requerida por ellos, lo cual 
                permite que los resultados se posicionen en los primeros lugares.
              </p>
              <p>
                Por otro lado, los repositorios institucionales son cosechados por sistemas nacionales, regionales e 
                internacionales, lo cual incrementa la posibilidad de localizaci&oacute;n del &iacute;tem, tanto por los buscadores 
                web, como por los mismos cosechadores.
              </p>
              <p>
                Por ejemplo, el RID-UNRN es cosechado por el <a target="_blank" href="http://repositoriosdigitales.mincyt.gob.ar/vufind/">Sistema Nacional de Repositorios Digitales (SNRD)</a>
                , &eacute;ste a su vez es cosechado por el Sistema Regional, conocido como <a target="_blank" href="http://www.lareferencia.info/es/">La Referencia</a> que se ocupa de recolectar 
                toda la producci&oacute;n cient&iacute;fica de Am&eacute;rica Latina. A su vez, La Referencia es cosechada por <a target="_blank" href="https://www.openaire.eu/">OpenAire</a> que es el Sistema 
                de la Comunidad Europea.
              </p>
              <p>
                <!-- Infografia de pikochart -->
                <div class="piktowrapper-embed" style="height: 300px; position: relative;" data-uid="44168826-beneficios-de-depositar-en-el-rid">
                  <div class="pikto-canvas-wrap">
                    <div class="pikto-canvas">
                      <div class="embed-loading-overlay" style="width: 100%; height: 100%; position: absolute; text-align: center;">
                        <img width="60px" alt="Loading..." style="margin-top: 100px" src="https://create.piktochart.com/loading.gif"/>
                        <p style="margin: 0; padding: 0; font-family: Lato, Helvetica, Arial, sans-serif; font-weight: 600; font-size: 16px">Loading...</p>
                      </div>
                    </div>
                  </div>
                </div>
                <script>
                  (function(d){
                    var js, id="pikto-embed-js", ref=d.getElementsByTagName("script")[0];
                    if (d.getElementById(id)) { return;}
                    js=d.createElement("script");
                    js.id=id;
                    js.async=true;
                    js.src="https://create.piktochart.com/assets/embedding/embed.js";
                    ref.parentNode.insertBefore(js, ref);
                  }(document));
                </script>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div><!-- Fin accordion 1 -->
    <div class="col-md-12 before-accordion">
      <h3 id="sobre-el-uso-del-rid">Sobre el uso del RID-UNRN</h3>
    </div>
    <div class="col-md-12"><!-- Inicio accordion 2 -->
      <div class="panel-group accordion-faqs" id="accordion-faqs2">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#como-se-organiza">
                &iquest;C&oacute;mo est&aacute; organizado el RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="como-se-organiza" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Su contenido est&aacute; organizado en comunidades y colecciones, seg&uacute;n
                la tipolog&iacute;a, origen y objeto de los documentos:
              </p>
              <ul>
                <li><strong>Congresos y jornadas</strong></li>
                <li><strong>Datos primarios</strong></li>
                <li><strong>Investigaci&oacute;n</strong></li>
                <li><strong>Libros</strong></li>
                <li><strong>Multimedia</strong></li>
                <li><strong>Digesto</strong></li>
                <li><strong>Recursos Digitales Accesibles</strong></li>
                <li><strong>Recursos y Materiales Educativos</strong></li>
                <li><strong>Art&iacute;culos de Revista</strong></li>
                <li><strong>Sinf&oacute;nica</strong></li>
                <li><strong>Tesis y Trabajos Finales</strong></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#como-realizar-busquedas">
                &iquest;C&oacute;mo realizar b&uacute;squedas en el RID?
              </a>
            </h4>
          </div>
          <div id="como-realizar-busquedas" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                La funci&oacute;n principal del sitio web de RID-UNRN es ofrecer una variedad de opciones de recuperaci&oacute;n de la informaci&oacute;n. 
                El entorno web de funciona como un «buscador» proporcionando herramientas que facilitan la localizaci&oacute;n de las producciones 
                cient&iacute;fico tecnol&oacute;gicas que all&iacute; se alojan (filtros, listados, b&uacute;squedas simples y combinadas).
              </p>
              <p>
                <h5><strong>B&uacute;squeda simple</strong></h5>
                Para realizar una b&uacute;squeda simple ingrese una palabra relacionada con lo que necesita recuperar en la caja de b&uacute;squeda de la 
                p&aacute;gina principal del RID-URN. El sistema mostrar&aacute; una lista de aquellos registros que contengan la palabra buscada, 
                independientemente de sus metadatos. Este tipo de b&uacute;squeda puede traer una gran cantidad de resultados no deseados o no pertinentes.
              </p>              
              <p>
                <h5><strong>B&uacute;squeda avanzada: refinar los resultados</strong></h5>
                Luego de realizar una b&uacute;squeda simple, puede refinar dicha b&uacute;squeda a trav&eacute;s del filtro disponible en la barra lateral derecha de la 
                pantalla. Puede combinar distintos criterios de b&uacute;squeda ya sea por Idioma, tipo de documento, fecha de publicaci&oacute;n, idioma, autor, 
                disciplina, etc.
              </p>
              <p>
                <h5><strong>Explorar</strong></h5>
                Puede localizar la producci&oacute;n navegando por la Lista de Autores, por &aacute;reas de conocimiento y disciplinas, por Comunidades o por 
                Directores (&uacute;nicamente para tesis).
              </p>
              <p>
                Tambi&eacute;n a partir de un documento que sea de su inter&eacute;s puede consultar toda la producci&oacute;n de una determinada Colecci&oacute;n o Comunidad.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#que-es-autoarchivo">
                &iquest;Qu&eacute; es el Autoarchivo y para qu&eacute; sirve?
              </a>
            </h4>
          </div>
          <div id="que-es-autoarchivo" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                El Autoarchivo es el proceso de almacenamiento de documentos en el RID-UNRN
                donde los autores depositan sus obras, incluso previamente a su publicaci&oacute;n,
                logrando una difusi&oacute;n casi inmediata y disponibilidad de Acceso Abierto a trav&eacute;s de Internet.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#como-subir-un-documento">
                &iquest;C&oacute;mo subir un documento al RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="como-subir-un-documento" class="panel-collapse collapse">
            <div class="panel-body">
              <p>Pasos para subir un documento:</p>
              <p>
                <ul>
                  <li>
                    <span class="glyphicon glyphicon-user"></span>
                    Debe <a href="http://rid.unrn.edu.ar/jspui/register">registrarse previamente al RID-UNRN</a>. Si cuenta con mail institucional, procure utilizarlo.
                  </li>
                  <li>
                    <span class="glyphicon glyphicon-log-in"></span>
                    Una vez registrado, deber&aacute; <a href="http://rid.unrn.edu.ar/jspui/password-login">iniciar sesi&oacute;n</a> y luego hace clic en el bot&oacute;n "Comenzar un nuevo env&iacute;o".
                  </li>
                  <li>
                    <span class="glyphicon glyphicon-tasks"></span>
                    El sistema lo guiar&aacute; por una serie de sencillos pasos donde podr&aacute; cargar el formulario y subir sus archivos.
                  </li>
                  <li>
                    <span class="glyphicon glyphicon-send"></span>
                    Una vez subido, el RID-UNRN verificar&aacute; su solicitud y le notificar&aacute; si el documento ya se encuentra disponible o, si fuera necesario, una solicitud de correcci&oacute;n.
                  </li>
                </ul>
              </p>
              <p>
                Para ver un tutorial detallado de este proceso, haga clic <a href="<%= request.getContextPath() %>/documents/instructivo-autoarchivo.pdf">aqu&iacute;</a>.
              </p>
              <p>
                Por otro lado, si ya se encuentra registrado haga clic en el siguiente bot&oacute;n:
              </p>
              <br />
              <p>
                <a href="<%= request.getContextPath() %>/mydspace" class="btn btn-info btn-lg">
                  <span class="glyphicon glyphicon-cloud-upload"></span>
                  Subir documento
                </a>
              </p>
              <br />
              <div class="alert alert-warning">
                <strong>&iexcl;IMPORTANTE!</strong> 
                El documento que desea subir al RID-UNRN, deber&aacute; haber pasado por una instancia de evaluaci&oacute;n
                por parte de la UNRN y/o formar parte de Proyectos de Investigaci&oacute;n y Extensi&oacute;n realizados en
                el marco de la Universidad Nacional de R&iacute;o Negro. Para m&aacute;s informaci&oacute;n consultar las Pol&iacute;ticas
                de Dep&oacute;sito RID-UNRN.
              </div>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#que-son-las-licencias-cc">
                &iquest;Qu&eacute; son las licencias Creative Commons?
              </a>
            </h4>
          </div>
          <div id="que-son-las-licencias-cc" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                <b>Creative Commons</b> es una organizaci&oacute;n sin fines de lucro que fue fundada en el a&ntilde;o 2001.
                Su misi&oacute;n consiste en ayudar a las personas a proteger su trabajo a trav&eacute;s de unas sencillas
                licencias gratuitas y, con ello, contribuir a expandir el conocimiento y la creatividad por elmundo.
              </p>
              <p>
                Se debe tener en cuenta que las licencias <b>Creative Commons</b> no sustituyen ni reemplazan
                a los derechos de autor. Por otro lado, estas licencias sirven para dar permisos sobre los
                trabajos, para que estos puedan ser compartidos, usados o modificados. Por tanto,
                son m&aacute;s bien un complemento a los derechos de autor.
              </p>
              <p>
                Se podr&iacute;a decir que las licencias <b>Creative Commons</b> son una alternativa al
                conocido &quot;<i>todos los derechos reservados</i>&quot; y se basan en la propiedad intelectual.
                Si bien existen distintas licencias, cada una es flexible, pues el autor puede escoger el tipo, 
                m&aacute;s o menos restrictivo, que mejor se adapte a sus necesidades. En cualquier caso, 
                es importante tener presente que las licencias <b>Creative Commons</b> no operan al margen 
                de la legislaci&oacute;n de propiedad intelectual, al contrario, <i>se basan en ella</i>. 
                Adem&aacute;s, otorgar una licencia de este tipo no impide al autor de la obra obtener beneficios de la misma.
              </p>
              <p>
                Se puede concluir, por tanto, que cuando un autor autoriza el uso de su obra bajo
                una licencia <b>Creative Commons</b>, autom&aacute;ticamente da permiso para usarla
                con una condici&oacute;n esencial: <strong><i>citar la autor&iacute;a de la obra</i></strong>.
              </p>
              <p>
                En el RID-UNRN, a menos que se indique lo contrario, todas las obras difundidas tienen una licencia
                <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">
                  Creative Commons Reconocimiento-NoComercial-CompartirIgual (CC BY-NC-SA) 4.0 Internacional
                </a>.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#que-es-altmetric">
                &iquest;Qu&eacute; es la insignia de Altmetric?
              </a>
            </h4>
          </div>
          <div id="que-es-altmetric" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Algunos art&iacute;culos pueden mostrar la insignia de Altmetric 
                <img 
                  class="lazyloaded"
                  src="<%= request.getContextPath() %>/image/faqs/altmetric-badge-icon.png"
                  alt="Insignia Altmetric"
                  width="30"
                  height="30"
                >
              </p>
              <p>
                Esta insignia refleja la influencia del trabajo cient&iacute;fico dentro de los nuevos contextos digitales, 
                sociales y de informaci&oacute;n. Incluyen por ejemplo las veces que se ha visto un &iacute;tem en un espacio web, 
                se ha descargado, se ha referenciado en blogs y medios sociales como Facebook y Twitter, las veces que 
                ha sido marcado como favorito o guardado entre las referencias de un gestor de bibliograf&iacute;a. De esta 
                manera, un autor podr&aacute; ver, a trav&eacute;s del RID-UNRN, la influencia que tiene su obra y/o investigaci&oacute;n 
                mediante las Altmetrics y su referencia mediante Google Acad&eacute;mico.
              </p>
              <p>
                En la p&aacute;gina de detalles de Altmetrics, puede ver todas las conversaciones que rodean el resultado de 
                la investigaci&oacute;n de forma centralizada.
              </p>
              <p>
                Para poner los datos en contexto, Altmetric asigna al resultado de la investigaci&oacute;n un Puntaje de Atenci&oacute;n, 
                que representa una medida de calidad y cantidad de menciones en l&iacute;nea que ha recibido el art&iacute;culo. 
                <a target="_blank" href="https://help.altmetric.com/support/solutions/articles/6000060969-how-is-the-altmetric-score-calculated-">El algoritmo de puntuaci&oacute;n</a> 
                tiene en cuenta varios factores, como el alcance relativo de las diferentes fuentes de atenci&oacute;n.
              </p>
              <p>
                Tenga en cuenta que el puntaje de atenci&oacute;n Altmetric no puede decirle nada sobre la calidad del resultado de la investigaci&oacute;n.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs2" href="#que-es-el-handle">
                &iquest;Qu&eacute; es el Handle o identificador &uacute;nico?
              </a>
            </h4>
          </div>
          <div id="que-es-el-handle" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Es un enlace permanente, que permite que se puedan citar documentos del repositorio sin correr el riesgo de que 
                el d&iacute;a de ma&ntilde;ana sea un link "roto" (por ejemplo, si cambiara la direcci&oacute;n web del repositorio). Es generado 
                autom&aacute;ticamente por el repositorio cada vez que se carga un elemento nuevo, y redirige a la ubicaciń del documento 
                que describe.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div><!-- Fin accordion 2 -->
    <div class="col-md-12 before-accordion">
      <h3 id="sobre-el-ciclo-de-produccion">Sobre el ciclo de publicaci&oacute;n</h3>
      <p>
        El RID-UNRN se nutre de aquellas producciones cient&iacute;fico-tecnol&oacute;gicas autoarchivadas por investigadores, becarios, estudiantes y dem&aacute;s personal de la UNRN cuyas versiones hayan sido publicadas en acceso abierto, correspondan a versiones post-print de autor y/o que hayan atravesado un proceso de aprobaci&oacute;n por una autoridad competente.
      </p>
      <p>
        El proceso de inclusi&oacute;n de producciones en el RID comprende varias etapas que permiten mejorar la calidad descriptiva de cada objeto digital. Una buena calidad descriptiva genera una correcta organizaci&oacute;n y aumenta la precisi&oacute;n para obtener mejores resultados en la recuperaci&oacute;n de las producciones.
      </p>
      <p>
        El ciclo de publicaci&oacute;n se compone de las siguientes etapas:
      </p>
      <ol>
        <li><strong>Autoarchivo</strong>: el/los autor/es archivan su producci&oacute;n a trav&eacute;s del m&oacute;dulo de autoarchivo del RID describiendo sus metadatos.</li>
        <li><strong>Unificaci&oacute;n</strong>: se revisa si el registro no se encuentra previamente cargado en el RID.</li>
        <li><strong>Curator&iacute;a</strong>: desde la plataforma de administraci&oacute;n del RID, se lleva a cabo un control sobre los metadatos; en esta instancia el especialista tiene la capacidad de editar con vocabulario controlado de cada metadato.</li>
        <li><strong>Inclusi&oacute;n</strong>: los registros se ponen a disposici&oacute;n p&uacute;blica en la plataforma del RID-UNRN.</li>
      </ol>
    </div>
    <div class="col-md-12 before-accordion">
      <h3 id="sobre-los-aspectos-tecnicos">Sobre los aspectos t&eacute;cnicos del RID</h3>
      <p>
        El RID-UNRN se basa estructuralmente en <strong>DSpace</strong>, una plataforma de c&oacute;digo abierto, que provee las herramientas para la 
        administraci&oacute;n de colecciones digitales.
      </p>
      <p>  
        Con diferentes niveles de granularidad, esta aplicaci&oacute;n puede adaptarse a casi todo tipo de archivos (incluyendo libros, tesis, 
        fotograf&iacute;as, filmes, videos, datos de investigaci&oacute;n, etc.) y fondos documentales que quieran ser almacenados con &eacute;l. Su organizaci&oacute;n 
        es multinivel lo que lo hace adaptable a cualquier tipo de instituci&oacute;n, comenzando por comunidades de datos, que a su vez pueden 
        dividirse en subcomunidades y colecciones. Adem&aacute;s, su forma de trabajo permite que un documento ingresado a &eacute;l pueda pertenecer a m&aacute;s 
        de una colecci&oacute;n, evitando duplicidades innecesarias. Por ejemplo si una fotograf&iacute;a pertenece a una colecci&oacute;n pero tambi&eacute;n tiene 
        personajes que deben ser asociados en otra colecci&oacute;n, con DSpace puedes lograr que este objeto pertenezca a ambas colecciones y pueda 
        ser recuperado para cada una de ellas.
      </p>
      <p>  
        Dspace tiene gran capacidad de adaptaci&oacute;n,  es compatible con una diversidad de protocolos est&aacute;ndares (OAI- PMH, SWORD, OpenSearch, 
        OpenURL, etc.), utiliza Dublin Core como esquema de metadatos, es altamente flexible en cuanto a diferentes estrategias de preservaci&oacute;n 
        digital, utiliza vocabularios controlados integrados en el sistema  y es la plataforma m&aacute;s elegida a nivel mundial.
      </p>
    </div>
    <div class="col-md-12 before-accordion">
      <h3 id="sobre-la-normativa-vigente">Sobre la normativa vigente</h3>
      <ul>
        <li>
          <a href="<%= request.getContextPath() %>/handle/20.500.12049/247">
            Resoluci&oacute;n CICADyTT N&deg; 19/2017 - Pol&iacute;ticas del RID-UNRN
          </a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/handle/20.500.12049/802">
            Resoluci&oacute;n CICADyTT N&deg; 21/2015 - Creaci&oacute;n del RID-UNRN
          </a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/handle/20.500.12049/244">
            Ley Nacional N&deg; 26.899 de Repositorios Digitales
          </a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/handle/20.500.12049/245">
            Resoluci&oacute;n N&deg; 753 - E/2016. Reglamentaci&oacute;n Ley N&deg; 26.899 sobre Creaci&oacute;n de Repositorios Digitales
          </a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/handle/20.500.12049/3962">
            Resoluci&oacute;n CICADyTT N&deg; 13/2019 - Filiaci&oacute;n institucional
          </a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/handle/20.500.12049/1933">
            Resoluci&oacute;n CICADyTT N&deg; 22/2018 - Propiedad intelectual
          </a>
        </li>
      </ul>
    </div>
    <div class="col-md-12 before-accordion">
      <h3 id="para-los-autores">Para los autores</h3>
    </div>
    <div class="col-md-12"><!-- Inicio accordion 3 -->
      <div class="panel-group accordion-faqs" id="accordion-faqs3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#quienes-deben-publicar">
                &iquest;Qui&eacute;nes deber&iacute;an publicar en el RID?
              </a>
            </h4>
          </div>
          <div id="quienes-deben-publicar" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Cada investigador, tecn&oacute;logo, docente, no docente, becario o estudiante de grado o de posgrado que pertenezca 
                a la Universidad y que realice investigaci&oacute;n financiada con fondos p&uacute;blicos y/o que se valga de la infraestructura 
                de la instituci&oacute;n para sus actividades de investigaci&oacute;n, docencia, entre otras.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#ventajas-de-publicar">
                &iquest;Qu&eacute; ventajas me aporta publicar en el RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="ventajas-de-publicar" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                <h5><strong>Impacto y visibilidad</strong></h5>
                De manera progresiva, ver&aacute; incrementado el impacto de sus producciones, aumentar&aacute;n las posibilidades de citaci&oacute;n 
                bibliogr&aacute;fica en otros trabajos y podr&aacute; ser m&aacute;s referida su labor dado que un repositorio tiene mayor capacidad de 
                recuperaci&oacute;n que otro tipo de sitio dado que se encuentra organizado utilizando est&aacute;ndares y protocolos que potencian 
                la visibilidad de autores, t&iacute;tulos y tem&aacute;ticas.
              </p>
              <p>
                <h5><strong>Interacci&oacute;n y difusi&oacute;n</strong></h5>
                Podr&aacute; relacionarse con otros investigadores generando un nuevo canal de contacto donde compartir conocimiento, 
                experiencia y expandir as&iacute; su red de contactos y nuevas posibilidades de desarrollo editorial, acad&eacute;mico y cient&iacute;fico.
              </p>
              <p>
                <h5><strong>Preservaci&oacute;n y resguardo centralizado</strong></h5>                
                A mediano plazo podr&aacute; localizar gran parte de su producci&oacute;n cient&iacute;fica tecnol&oacute;gica de forma centralizada y preservada 
                digitalmente.
              </p>
              <p>
                <h5><strong>Innovaci&oacute;n y tendencias</strong></h5>                
                La creaci&oacute;n de repositorios y entornos que alojan la producci&oacute;n acad&eacute;mica, cient&iacute;fica y tecnol&oacute;gica de distintas 
                instituciones y organismos, son considerados de manera internacional, como las nuevas herramientas de difusi&oacute;n y 
                preservaci&oacute;n del conocimiento.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#derechos-sobre-publicaciones">
                &iquest;Qu&eacute; derechos va a tener la UNRN sobre los trabajos inclu&iacute;dos en el RID?
              </a>
            </h4>
          </div>
          <div id="derechos-sobre-publicaciones" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Los investigadores, becarios y dem&aacute;s personal de la UNRN ceden a la Universidad el permiso de incluir su producci&oacute;n 
                cient&iacute;fico-tecnol&oacute;gica en el Repositorio Institucional Digital, a trav&eacute;s de una licencia no exclusiva, irrevocable y 
                universal, que no incluye derechos de explotaci&oacute;n comercial.
              </p>
              <p>
                En caso que las producciones cient&iacute;fico-tecnol&oacute;gicas estuvieran protegidas por derechos de propiedad industrial y/o 
                acuerdos previos con terceros (editoriales, revistas cient&iacute;ficas, otras instituciones, etc.), los autores podr&aacute;n 
                hacer uso del derecho de exclusi&oacute;n (OPT-OUT es el derecho que tienen los autores de excluir el texto completo de 
                sus producciones del RID). En caso que la versi&oacute;n de la producci&oacute;n cient&iacute;fico-tecnol&oacute;gica se encontrase alcanzada 
                dentro del per&iacute;odo de embargo, el documento completo permanecer&aacute; sin acceso y se brindar&aacute;n solamente los metadatos 
                y el enlace al trabajo original publicado.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#que-es-la-cesion-no-exclusiva">
                &iquest;Qu&eacute; es la Cesi&oacute;n No Exclusiva de Derechos para el Dep&oacute;sito en el RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="que-es-la-cesion-no-exclusiva" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                La <b>Cesi&oacute;n No Exclusiva de Derechos para Dep&oacute;sito del RID-UNRN</b> es un acuerdo 
                mediante el cual el autor y RID-UNRN establecen bajo qu&eacute; condiciones se dar&aacute; 
                a conocer una obra. El acuerdo habilita al RID-UNRN, de forma no exclusiva, 
                como expresamente se indica, a publicar, preservar y difundir los contenidos 
                aportados por los usuarios. La condici&oacute;n de no exclusividad significa que el 
                autor no pierde los derechos sobre su trabajo en ning&uacute;n momento, y que puede, 
                por ejemplo, publicar el mismo en los medios que considere oportuno en cualquier 
                momento. Este acuerdo, a su vez, obliga al RID-UNRN a preservar debidamente el 
                material aportado y a difundirlo por su portal web. De este modo, ambas partes 
                acuerdan y reconocen los derechos que les son inherentes.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#que-es-el-embargo">
                &iquest;Qu&eacute; significa que un documento se encuentra embargado?
              </a>
            </h4>
          </div>
          <div id="que-es-el-embargo" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                El per&iacute;odo de embargo es el lapso de tiempo durante el cual el texto de la obra no 
                ser&aacute; accesible al p&uacute;blico (s&iacute; lo ser&aacute;n sus metadatos: t&iacute;tulo, autor, a&ntilde;o de publicaci&oacute;n, 
                resumen, etc.). Las razones para solicitar per&iacute;odo de embargo pueden ir desde el deseo 
                de proteger el contenido de la obra, especialmente si se trata de una patente o un 
                trabajo con un gran potencial de desarrollo futuro, hasta el hecho de no hacer p&uacute;blico 
                el texto de una obra que est&aacute; pr&oacute;xima a editarse por las v&iacute;as tradicionales. El autor 
                de la obra puede solicitar que el texto no sea visible por un per&iacute;odo m&iacute;nimo de tres 
                meses hasta un m&aacute;ximo de veinticuatro. Al t&eacute;rmino del per&iacute;odo de embargo, el texto 
                completo de la obra ser&aacute; p&uacute;blicamente accesible desde el portal.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#responsable-de-la-produccion">
                &iquest;Qui&eacute;n es responsable del contenido de las producciones?
              </a>
            </h4>
          </div>
          <div id="responsable-de-la-produccion" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Los autores son responsable exclusivos del contenido de sus obras, por lo que la UNRN queda eximida de todo tipo de responsabilidad, 
                sea civil, administrativa o penal, frente a cualquier reclamo o demanda por parte de terceros. Respecto al contenido de la producci&oacute;n 
                cient&iacute;fico-tecnol&oacute;gica, se establece que el autor deber&aacute; garantizar que no atente contra los derechos al honor, a la intimidad y a la 
                imagen de terceros (contemplados en el art&iacute;culo 19 de la Constituci&oacute;n Nacional).
              </p>
              <p>  
                El repositorio se compromete a quitar una obra de circulaci&oacute;n ante una demanda de violaci&oacute;n de derechos de propiedad intelectual.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#depositar-externamente">
                &iquest;Puedo depositar en otros repositorio institucionales o tem&aacute;ticos?
              </a>
            </h4>
          </div>
          <div id="depositar-externamente" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                SI, el autor es libre de depositar su producci&oacute;n en otros repositorios tem&aacute;ticos o institucionales de su elecci&oacute;n.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#como-subir-mi-tesis">
                Soy estudiante, &iquest;c&oacute;mo puedo subir mi tesis, tesina o trabajo final de carrera al RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="como-subir-mi-tesis" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="alert alert-info">
                <strong>
                  Es importante destacar que el registro de la Tesis, Tesina o Trabajo final 
                  de Carrera es un requisito necesario para tramitar el t&iacute;tulo de grado.
                </strong>
              </div>
              <p>
                Para poder subir una tesis de grado al Repositorio Institucional Digital (RID), en 
                primer lugar, el documento debe haber pasado por una instancia de evaluaci&oacute;n por 
                parte de la Universidad. En segundo lugar, el estudiante deber&aacute; acudir a las 
                Ventanillas Permanentes (VP), es decir, a las oficinas de recepci&oacute;n de resultados de
                investigaci&oacute;n, docencia y creaci&oacute;n art&iacute;stica. Entre ellas se destacan:
              </p>
              <ul>
                <li>Bibliotecas de Sede</li>
                <li>Secretar&iacute;as de Investigaci&oacute;n de Sede</li>
                <li>Departamento de Biblioteca, Repositorio y Contenidos Digitales (BERCoD), en el Rectorado</p></li>
              </ul>
              <p>
                Junto con el documento, en formato digital, el estudiante deber&aacute; completar 
                y presentar los siguientes formularios:
              </p>
              <ul>
                <li>
                  <a href="<%= request.getContextPath() %>/documents/F0114-01.pdf" target="_blank">
                    Formulario F0114-01 (Formulario de Cesi&oacute;n No Exclusiva de Derechos para Dep&oacute;sito en el RID-UNRN)
                  </a>
                </li>
                <li>
                  <a href="<%= request.getContextPath() %>/documents/F0115-01.pdf" target="_blank">
                    Formulario F0115-01 (Formulario de Registro de Datos RID-UNRN)
                  </a>
                </li>
              </ul>
              <p>
                Ambos formularios deben estar firmado por el remitente. Una vez realizado el 
                tr&aacute;mite anterior, la VP hace entrega de un comprobante al estudiante con firma 
                y sello de la Universidad, habiendo conclu&iacute;do &eacute;ste con su papeleo.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs3" href="#embargo-de-tesis">
                &iquest;Puedo embargar mi tesis o trabajo final de grado o posgrado?
              </a>
            </h4>
          </div>
          <div id="embargo-de-tesis" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Si, los estudiantes cuyas tesis, trabajos finales u obras abordan temas que puedan recaer en una &quot;novedad&quot; 
                podr&aacute;n solicitar que las mismas no sean publicadas ni divulgadas por un per&iacute;odo no mayor a un (1) a&ntilde;o, contando 
                a partir del d&iacute;a de su entrega formal.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div><!-- Fin accordion 3 -->
    <div class="col-md-12 before-accordion">
      <h3 id="sobre-la-filiacion-institucional">Sobre la filiaci&oacute;n institucional</h3>
      <p>
        La filiaci&oacute;n institucional es el nombre completo de la instituci&oacute;n a la cual pertenece el autor, con la cual se vincula 
        y que act&uacute;a como respaldo institucional de su producci&oacute;n cient&iacute;fica.
      </p>
      <p>
        Desde el 2019, por Resoluci&oacute;n del Consejo Superior de Investigaci&oacute;n, Creaci&oacute;n Art&iacute;stica, Desarrollo y Transferencia de 
        Tecnolog&iacute;a, se determin&oacute; que la &uacute;nica forma autorizada del nombre de la universidad a incluir en la filiaci&oacute;n institucional 
        es: <strong>Universidad Nacional de R&iacute;o Negro</strong> <em>(sin traducir a otras lenguas ni utilizar siglas)</em>.
      </p>
    </div>
    <div class="col-md-12"><!-- Inicio accordion 4 -->
      <div class="panel-group accordion-faqs" id="accordion-faqs4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs4" href="#importancia-de-la-filiacion">
                &iquest;Por qu&eacute; es importante la filiaci&oacute;n institucional?
              </a>
            </h4>
          </div>
          <div id="importancia-de-la-filiacion" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Tanto el nombre del autor como su filiaci&oacute;n institucional son indispensables ya que influyen en la reuni&oacute;n y 
                recuperaci&oacute;n de las publicaciones de la universidad en las bases de datos, en la visibilidad y la m&eacute;trica 
                institucional y en la fiabilidad de los indicadores de producci&oacute;n cient&iacute;fica.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs4" href="#quienes-deben-usar-la-filiacion">
                &iquest;Qui&eacute;nes deben poner la filiaci&oacute;n institucional?
              </a>
            </h4>
          </div>
          <div id="quienes-deben-usar-la-filiacion" class="panel-collapse collapse">
            <div class="panel-body">
              <ul>
                <li>
                  Personal vinculado a la Universidad: docentes, nodocentes, investigadores, personal t&eacute;cnico-administrativo y 
                  estudiantes de grado y posgrado.
                </li>
                <li>
                  Personal vinculado con otras instituciones que desarrollan actividades en el &aacute;mbito de la Universidad, o que 
                  dirijan o participen en proyectos de I+D+i financiados por la UNRN.
                </li>
                <li>Todo personal de la UNRN que realice estancias fuera de la misma.</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs4" href="#como-usar-la-filiacion">
                &iquest;C&oacute;mo debe mencionarse la filiaci&oacute;n institucional?
              </a>
            </h4>
          </div>
          <div id="como-usar-la-filiacion" class="panel-collapse collapse">
            <div class="panel-body">
              <p>Debe nombrarse como <strong>Universidad Nacional de R&iacute;o Negro</strong> respetando lo siguiente:</p>
              <ul>
                <li>Lengua espa&ntilde;ola</li>
                <li>Orden jer&aacute;rquico de mayor a menor</li>
                <li>Nombre completos de las instituciones</li>
                <li>Siglas en los casos indicados</li>
                <li>Puntuaci&oacute;n prescripta</li>
              </ul>
              <p>
                El personal vinculado con la Universidad Nacional de R&iacute;o Negro deber&aacute; indicar la filiaci&oacute;n institucional de 
                la siguiente forma:
              </p>
              <p>
                <em>Super&iacute;ndice 1</em>: Universidad Nacional de R&iacute;o Negro. Denominaci&oacute;n completa de la Unidad Ejecutora, 
                Escuela o Carrera de la UNRN. Asignatura (en caso de corresponder). R&iacute;o Negro, Argentina.
              </p>
              <p>
                <h5>Ejemplo:</h5>
                <ol>
                  <li>Universidad Nacional de R&iacute;o Negro. Laboratorio de Inform&aacute;tica Aplicada. R&iacute;o Negro, Argentina.</li>
                </ol>
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs4" href="#como-usar-multiples-filiaciones">
                &iquest;C&oacute;mo debe mencionarse la Filiaci&oacute;n Institucional en caso de Filiaci&oacute;n M&uacute;ltiple (Doble dependencia)
              </a>
            </h4>
          </div>
          <div id="como-usar-multiples-filiaciones" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Las filiaciones para un mismo autor deben indicarse en diferentes super&iacute;ndices, incluyendo siempre, en el super&iacute;ndice 1, 
                su pertenencia a la Universidad Nacional de R&iacute;o Negro.
              </p>
              <p>  
                Es por ello que el personal vinculado con otras instituciones (Doble dependencia) deber&aacute; indicar la filiaci&oacute;n institucional como:
              </p>
              <p>
                <em>Super&iacute;ndice 1</em>: Universidad Nacional de R&iacute;o Negro. Denominaci&oacute;n completa de la Unidad Ejecutora, 
                Escuela o Carrera de la UNRN. Asignatura (en caso de corresponder). R&iacute;o Negro, Argentina.
              </p>
              <p>
                <em>Super&iacute;ndice 2</em>: Nombre de la otra instituci&oacute;n, sigla (cuando correspondiere), sigla o denominaci&oacute;n de la Unidad Ejecutora. 
                R&iacute;o Negro, Argentina. O como lo indique la instituci&oacute;n seg&uacute;n su normativa.
              </p>
              <p>
                <h5>Ejemplo:</h5>
                <ol>
                  <li>Universidad Nacional de R&iacute;o Negro. Instituto de Investigaci&oacute;n en Paleobiolog&iacute;a y Geolog&iacute;a. R&iacute;o Negro, Argentina.</li>
                  <li>Consejo Nacional de Investigaciones Cient&iacute;ficas y T&eacute;cnicas, CONICET. Instituto de Investigaci&oacute;n en Paleobiolog&iacute;a y Geolog&iacute;a. R&iacute;o Negro. Argentina</li>
                </ol>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div><!-- Fin accordion 4 -->
  </div>
</dspace:layout>

