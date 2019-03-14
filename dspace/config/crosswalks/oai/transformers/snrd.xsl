<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at
    http://www.dspace.org/license/
    
	Developed by DSpace @ Lyncode <dspace@lyncode.com> 
	Following Driver Guidelines 2.0:
		- http://www.driver-support.eu/managers.html#guidelines
 -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="http://www.lyncode.com/xoai">
	<xsl:output indent="yes" method="xml" omit-xml-declaration="yes" />
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<!-- Formatting dc.type  -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']">
		<xsl:variable name="type" select="./doc:element/doc:field[@name='value']/text()"/>
		<xsl:call-template name="type-openaire">
			<xsl:with-param name="theValue" select="$type"/>				
		</xsl:call-template>
		<xsl:call-template name="type-snrd">
			<xsl:with-param name="theValue" select="$type"/>
		</xsl:call-template>
		<xsl:variable name="version" select="./doc:element[@name='version']/doc:element/doc:field/text()"/>
		<xsl:call-template name="type-version">
			<xsl:with-param name="theValue" select="$version"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- Formatting dc.date.issued--> 
	<xsl:template match="/doc:metadata/doc:element[@name='dcterms']/doc:element[@name='issued']/doc:element/doc:field[@name='value']/text()">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestr" select="." />
		</xsl:call-template>
	</xsl:template>
	
	<!-- Removing dc.date.available -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:field/text()"/> 
		
	<!-- Formatting dc.identifier.isbn --> 			
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='isbn']/doc:field/text()">
		<xsl:call-template name="addPrefix">
			<xsl:with-param name="value" select="."/>
			<xsl:with-param name="prefix" select="'info:eu-repo/semantics/altIdentifier/isbn/'"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- TODO : EL FORMATO CON EL QUE SE ALMACENA EN CICDIGITAL ES, POR EJEMPLO: "ISBN: 1243" (para "otros", se aclara el tipo de identificador y luego el identificador). Acá se está concatenando al prefijo solicitado por SNRD, primero el tipo de identificador y luego el identificador. Se detecta como separador de ambas cosas la coma, el punto o los dos puntos. Por el momento en RID no es así.-->
	<!--  Formatting dc.identifier.other 
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='other']/doc:field[@name='value']/text()">
		<xsl:variable name="prefix" select="'info:eu-repo/semantics/altIdentifier/'"/>
		<xsl:choose>
			<xsl:when test="contains(.,':')">
				<xsl:variable name="esquema" select="substring-before(.,':')"/>
				<xsl:variable name="identificador" select="substring-after(.,':')"/>
				<xsl:value-of select="concat($prefix,$esquema,$identificador)"/>		
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="esquema" select="substring-before(.,' ')"/>
				<xsl:variable name="identificador" select="substring-after(.,' ')"/>
				<xsl:value-of select="concat($prefix,$esquema,$identificador)"/>
			</xsl:otherwise>
		</xsl:choose>
					
	</xsl:template>-->
	
	
	<!--  Removing dc.description.provenance --> 
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='provenance']" />
	
	<!--  Removing cic.isPeerReviewed  
	<xsl:template match="/doc:metadata/doc:element[@name='cic']/doc:element[@name='isPeerReviewed']" />-->
	
	<!-- Formatting language to ISO 639-3--> 
	<xsl:template  match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element[@name='iso']/doc:field[@name='value']/text()">	
		<xsl:call-template name="snrd-language">
			<xsl:with-param name="value" select="."/>
		</xsl:call-template> 
	</xsl:template>		
	
	<!-- Prefixing and Modifying dc.rights -->
	<!-- Removing unwanted -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:element" />
	<!-- Replacing -->
	<!--
 	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field/text()"> 
 		<xsl:text>info:eu-repo/semantics/openAccess</xsl:text> 
 	</xsl:template> 
	-->


	<!-- AUXILIARY TEMPLATES -->
	
	<xsl:template name="type-version">
		<xsl:param name="theValue" />
		<xsl:variable name="finalValue">
			<xsl:choose>
				<xsl:when test="$theValue = 'info:eu-repo/semantics/submittedVersion'">
					info:eu-repo/semantics/submittedVersion
				</xsl:when>
				<xsl:when test="$theValue = 'info:eu-repo/semantics/acceptedVersion'">
					info:eu-repo/semantics/acceptedVersion
				</xsl:when>
				<xsl:otherwise>
					info:eu-repo/semantics/publishedVersion
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<doc:element name='type'>
			<doc:element name='version'>				
				<doc:field name="value"><xsl:value-of select="normalize-space($finalValue)"/></doc:field>				
			</doc:element>
		</doc:element>
	</xsl:template>
	
	<!-- Tipos según OpenAIRE -->
	<xsl:template name="type-openaire">
		<xsl:param name="theValue" />
		<xsl:variable name="finalValue">
			<xsl:choose>
				<xsl:when test="$theValue = 'Articulo'">
					article
				</xsl:when>
				<xsl:when test="$theValue = 'Tesis de doctorado'">
					doctoralThesis
				</xsl:when>
				<xsl:when test="$theValue = 'Tesis de maestria'">
					masterThesis
				</xsl:when>
				<xsl:when test="$theValue = 'Trabajo final de posgrado'">
					masterThesis
				</xsl:when>
				<xsl:when test="$theValue = 'Tesis de grado'">
					bachelorThesis
				</xsl:when>
				<xsl:when test="$theValue = 'Trabajo final de grado'">
					bachelorThesis
				</xsl:when>
				<xsl:when test="$theValue = 'Libro'">
					book
				</xsl:when>
				<xsl:when test="$theValue = 'Parte de libro'">
					bookPart
				</xsl:when>
				<xsl:when test="$theValue = 'Objeto de conferencia'">
					conferenceObject
				</xsl:when>
				<xsl:when test="$theValue = 'Patente'">
					patent
				</xsl:when>
				<xsl:when test="$theValue = 'Documento de trabajo'">
					workingPaper
				</xsl:when>
				<xsl:when test="$theValue = 'Informe tecnico'">
					report
				</xsl:when>
				<xsl:when test="$theValue = 'Datos primarios'">
					other
				</xsl:when>	
			</xsl:choose>
		</xsl:variable>
		<!-- Prefijo añadido desde las Directrices SNRD v.2015 -->
		<xsl:variable name="openaireTypePrefix">info:eu-repo/semantics/</xsl:variable>
		<doc:element name="type">
			<doc:element name='openaire'>
				<doc:field name="value"><xsl:value-of select="concat($openaireTypePrefix, normalize-space($finalValue))"/></doc:field>						
			</doc:element>
		</doc:element>
	</xsl:template>
	
	<!-- Tipos según SNRD -->
	<xsl:template name="type-snrd">
		<xsl:param name="theValue"/>
		
		<xsl:variable name="finalValue">
			<xsl:choose>
				<xsl:when test="$theValue = 'Articulo'">
					artículo
				</xsl:when>
				<xsl:when test="$theValue = 'Tesis de doctorado'">
					tesis doctoral
				</xsl:when>
				<xsl:when test="$theValue = 'Tesis de maestria'">
					tesis de maestría
				</xsl:when>		
				<xsl:when test="$theValue = 'Trabajo final de posgrado'">
					tesis
				</xsl:when>
				<xsl:when test="$theValue = 'Tesis de grado'">
					tesis de grado
				</xsl:when>
				<xsl:when test="$theValue = 'Trabajo final de grado'">
					trabajo final de grado
				</xsl:when>
				<xsl:when test="$theValue = 'Libro'">
					libro
				</xsl:when>
				<xsl:when test="$theValue = 'Parte de libro'">
					parte de libro
				</xsl:when>
				<xsl:when test="$theValue = 'Objeto de conferencia'">
					documento de conferencia
				</xsl:when>
				<xsl:when test="$theValue = 'Patente'">
					patente
				</xsl:when>
				<xsl:when test="$theValue = 'Documento de trabajo'">
					documento de trabajo
				</xsl:when>
				<xsl:when test="$theValue = 'Informe tecnico'">
					informe técnico
				</xsl:when>
				<xsl:when test="$theValue = 'Datos primarios'">
					conjunto de datos
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<!-- Prefijo añadido desde las Directrices SNRD v.2015 -->
		<xsl:variable name="snrdTypePrefix">info:ar-repo/semantics/</xsl:variable>
		<doc:element name="type">
			<doc:element name='snrd'>
				<doc:field name="value"><xsl:value-of select="concat($snrdTypePrefix, normalize-space($finalValue))"/></doc:field>
			</doc:element>
		</doc:element>
	</xsl:template>
	
	<xsl:template name="snrd-language" >		
		<xsl:param name="value"/>
		
		<xsl:variable name="valueLanguage">
			<xsl:choose>
				<xsl:when test="$value='es'">
					spa
				</xsl:when>
				<xsl:when test="$value='en_US'">
					eng
				</xsl:when>
				<xsl:when test="$value='en'">
					eng
				</xsl:when>
				<xsl:when test="$value='de'">
					deu
				</xsl:when>
				<xsl:when test="$value='pt'">
					por
				</xsl:when>
				<xsl:when test="$value='fr'">
					fra
				</xsl:when>
				<xsl:when test="$value='it'">
					ita
				</xsl:when>
				<xsl:when test="$value='ja'">
					jpn
				</xsl:when>
				<xsl:when test="$value='tr'">
					tur
				</xsl:when>
				<xsl:otherwise>
					spa
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>		
			<xsl:value-of select="normalize-space($valueLanguage)"/>	
	</xsl:template>
	
	<!-- dc.type prefixing -->
	<xsl:template name="addPrefix">
		<xsl:param name="value" />
		<xsl:param name="prefix" />
		<xsl:choose>
			<xsl:when test="starts-with($value, $prefix)">
				<xsl:value-of select="$value" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($prefix, $value)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Date format -->
	<xsl:template name="formatdate">
		<xsl:param name="datestr" />
		<xsl:variable name="sub">
			<xsl:value-of select="substring($datestr,1,10)" />
		</xsl:variable>
		<xsl:value-of select="$sub" />
	</xsl:template>
</xsl:stylesheet>
