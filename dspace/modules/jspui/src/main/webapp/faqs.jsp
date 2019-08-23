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
  <div class="row pt-30">
    <div class="col-md-12">
      <div class="text-center">
        <h2>Preguntas frecuentes</h2>
      </div>
    </div>
    <div class="col-md-12">
      <div class="panel-group" id="accordion-faqs">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a role="button" data-toggle="collapse" data-parent="#accordion-faqs" href="#que-es">
                &iquest;Qu&eacute; es el RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="que-es" class="panel-collapse collapse in">
            <div class="panel-body">
              <p>
                <br/>
                <strong>RID-UNRN</strong>, el Repositorio Institucional Digital de la Universidad Nacional de R&iacute;o Negro, tiene como objetivos, reunir, archivar y preservar la producci&oacute;n intelectual resultante de la actividad acad&eacute;mica e investigadora de nuestra comunidad universitaria, en formato digital, y ofrecer acceso abierto a dicha producci&oacute;n. La colecci&oacute;n abarca tesis de grado y posgrado, art&iacute;culos de revistas, libros y cap&iacute;tulos, documentos de trabajo, preprints, actas de congresos, etc.<br />RID-UNRN est&aacute; basado en los fundamentos filos&oacute;ficos del acceso abierto y promueve los valores de:
              </p>
              <ul>
                <li>Acceso a la informaci&oacute;n</li>
                <li>Soberan&iacute;a tecnol&oacute;gica e informacional</li>
                <li>Igualdad</li>
                <li>Excelencia acad&eacute;mica</li>
                <li>Pluralidad</li>
              </ul>
              <p>El RID-UNRN adhiere a la Iniciativa de <strong>Acceso Abierto</strong>, que sustenta el principio de la libre disposici&oacute;n de la informaci&oacute;n.</p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#como-se-organiza">
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
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#que-es-autoarchivo">
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
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#como-subir-un-documento">
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
                Para ver un tutorial detallado de este proceso, haga clic <a href="<%= request.getContextPath() %>/instructivo-autoarchivo.pdf">aqu&iacute;</a>.
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
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#por-que-publicar">
                &iquest;Por qu&eacute; publicar en el RID-UNRN?
              </a>
            </h4>
          </div>
          <div id="por-que-publicar" class="panel-collapse collapse">
            <div class="panel-body">
              <p>
                Actualmente, el RID est&aacute; siendo indexado tanto por el <b>Sistema Nacional de Repositorios Digitales (SNRD)</b> como por <b>Google Acad&eacute;mico</b>.
                De esta manera, se aumenta la visibilidad del material cargado por los investigadores.
              </p>
              <p>
                Desde principios de junio 2019, el RID cuenta con la nueva indexaci&oacute;n de <b>Altmetrics</b>.
                Las Altmetrics son un conjunto de m&eacute;tricas usadas para medir los diferentes impactos de la investigaci&oacute;n.
                Es decir, se trata de una serie de indicadores que reflejan la influencia del trabajo cient&iacute;fico dentro de los nuevos contextos digitales,
                sociales y de informaci&oacute;n. Incluyen por ejemplo las veces que se ha visto un &iacute;tem en un espacio web, se ha descargado,
                se ha referenciado en blogs y medios sociales como Facebook y Twitter, las veces que ha sido marcado como favorito o guardado entre
                las referencias de un gestor de bibliograf&iacute;a. De esta manera, un autor podr&aacute;
                ver, a trav&eacute;s del RID-UNRN, la influencia que tiene su obra y/o investigaci&oacute;n
                mediante las <b>Altmetrics</b> y su referencia mediante <b>Google Acad&eacute;mico</b>.
              </p>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#que-son-las-licencias-cc">
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
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#que-es-la-cesion-no-exclusiva">
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
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#que-es-el-embargo">
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
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion-faqs" href="#que-funcion-cumplen-las-vp">
                &iquest;Qu&eacute; funciones cumplen las Ventanillas Permanentes (VP)?
              </a>
            </h4>
          </div>
          <div id="que-funcion-cumplen-las-vp" class="panel-collapse collapse">
            <div class="panel-body">
              <p>Las Ventanillas Permanentes cumplen las siguientes funciones:</p>
              <ul>
                <li>
                  <p>
                    Recepcionar los objetos digitales resultados de investigaci&oacute;n,
                    docencia y creaci&oacute;n art&iacute;stica en los diferentes formatos
                    aceptados seg&uacute;n las Pol&iacute;ticas del RID-UNRN en su
                    versi&oacute;n digital.
                  </p>
                </li>
                <li>
                  <p>
                    Recepcionar los Formularios de Cesi&oacute;n No Exclusiva de Derechos
                    para el Dep&oacute;sito en el RID-UNRN y Formulario de Registro de
                    datos.
                  </p>
                </li>
                <li><p>Extender el Certificado de Dep&oacute;sito.</p></li>
                <li>
                  <p>
                    Remitir los Formularios de Cesi&oacute;n No Exclusiva de Derechos al
                    Departamento de Biblioteca, Repositorio y Contenidos Digitales.
                  </p>
                </li>
                <li><p>Realizar la primer instancia de carga de los objetos digitales.</p></li>
              </ul>
              <p>Una vez realizada la tarea de la VP, el Departamento de Biblioteca, Repositorio y Contenidos Digitales se encargar&aacute; de:</p>
              <ul>
                <li><p>Cumplimentar la etapa de curadur&iacute;a.</p></li>
                <li><p>Realizar las devoluciones correspondientes en el caso de ser necesario corregir y/o realizar modificaciones.</p></li>
                <li><p>Subir definitivamente el objeto y publicar en el RID-UNRN una vez cumplimentados todos los pasos de manera correcta.</p></li>
                <li><p>Difundir por diferentes medios la incorporaci&oacute;n del nuevo	material en el RID-UNRN.</p></li>
              </ul>
              <br/>
              <p>Proceso documental</p>
              <p>
                <img
                  src="<%= request.getContextPath() %>/image/ingesta-documental.jpg"
                  alt="Proceso documental del circuito de ingesta"
                  class="img-responsive"
                />
              </p>
              <br/>
              <br/>
              <p>Proceso administrativo</p>
              <p>
                <img
                  src="<%= request.getContextPath() %>/image/ingesta-administrativo.png"
                  alt="Proceso administrativo del circuito de ingesta"
                  class="img-responsive"
                />
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</dspace:layout>

