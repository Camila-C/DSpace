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
		<!-- dc.type.version -->
		<xsl:variable name="version" select="./doc:element[@name='version']/doc:element/doc:field/text()"/>
		<xsl:call-template name="type-version">
			<xsl:with-param name="theValue" select="$version"/>
		</xsl:call-template>
	</xsl:template>

	<!-- Formatting dc.language.iso to ISO 639-3--> 
	<xsl:template  match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element[@name='iso']/doc:field[@name='value']/text()">	
		<xsl:call-template name="snrd-language">
			<xsl:with-param name="value" select="."/>
		</xsl:call-template> 
	</xsl:template>		

	<!-- Removing dc.date.available -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:field/text()"/> 
		
	<!-- Removing dc.description.provenance --> 
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='provenance']" />

	<!-- Removing dc.rights -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:element" />
	
	<!-- INICIO: AUXILIARY TEMPLATES -->
	<!-- Versiones según SNRD -->
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
				<xsl:when test="$theValue = 'Tesis'">
					<!-- Para cada tipo, busca los subtipos subtipo y los compara -->
                    <xsl:for-each select="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type'][./doc:element/doc:field/text()=$theValue]/doc:element[@name='subtype']/doc:element/doc:field[@name='value']">
                        <xsl:choose>
                            <xsl:when test=". = 'Tesis de grado'">
                                bachelorThesis
                            </xsl:when>
							<xsl:when test=". = 'Tesis de maestria'">
                                masterThesis
                            </xsl:when>
                            <xsl:when test=". = 'Tesis de doctorado'">
                                doctoralThesis
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
				<xsl:when test="$theValue = 'Trabajo final'">
					<!-- Para cada tipo, busca los subtipos subtipo y los compara -->
                    <xsl:for-each select="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type'][./doc:element/doc:field/text()=$theValue]/doc:element[@name='subtype']/doc:element/doc:field[@name='value']">
                        <xsl:choose>
                            <xsl:when test=". = 'Trabajo final de grado'">
								bachelorThesis
							</xsl:when>
							<xsl:when test=". = 'Trabajo final de posgrado'">
								masterThesis
							</xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
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
				<xsl:when test="$theValue = 'Tesis'">
					<!-- Para cada tipo, busca los subtipos subtipo y los compara -->
                    <xsl:for-each select="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type'][./doc:element/doc:field/text()=$theValue]/doc:element[@name='subtype']/doc:element/doc:field[@name='value']">
                        <xsl:choose>
                            <xsl:when test=". = 'Tesis de grado'">
                                tesis de grado
                            </xsl:when>
							<xsl:when test=". = 'Tesis de maestria'">
                                tesis de maestría
                            </xsl:when>
                            <xsl:when test=". = 'Tesis de doctorado'">
                                tesis doctoral
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
				<xsl:when test="$theValue = 'Trabajo final'">
					<!-- Para cada tipo, busca los subtipos subtipo y los compara -->
                    <xsl:for-each select="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type'][./doc:element/doc:field/text()=$theValue]/doc:element[@name='subtype']/doc:element/doc:field[@name='value']">
                        <xsl:choose>
                            <xsl:when test=". = 'Trabajo final de grado'">
								trabajo final de grado
							</xsl:when>
							<xsl:when test=". = 'Trabajo final de posgrado'">
								tesis de maestría
							</xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
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
	
	<!-- Lenguaje segun SNRD -->
	<xsl:template name="snrd-language" >		
		<xsl:param name="value"/>
		<xsl:variable name="valueLanguage">
			<xsl:choose>
				<xsl:when test="$value='es'">spa</xsl:when>
				<xsl:when test="$value='en_US'">eng</xsl:when>
				<xsl:when test="$value='en'">eng</xsl:when>
				<xsl:when test="$value='de'">deu</xsl:when>
				<xsl:when test="$value='pt'">por</xsl:when>
				<xsl:when test="$value='fr'">fra</xsl:when>
				<xsl:when test="$value='it'">ita</xsl:when>
				<xsl:when test="$value='ja'">jpn</xsl:when>
				<xsl:when test="$value='tr'">tur</xsl:when>
				<xsl:otherwise>spa</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>		
		<xsl:value-of select="normalize-space($valueLanguage)"/>	
	</xsl:template>
	<!-- FIN: AUXILIARY TEMPLATES -->
</xsl:stylesheet>
