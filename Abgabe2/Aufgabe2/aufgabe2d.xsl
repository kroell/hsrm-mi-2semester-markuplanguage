<?xml version="1.0" encoding="UTF-8"?>

<!--Arbeitsblatt 7, Aufgabe 2d -->
<!--Mareike Schulz, Nicole Emmel, Soeren Kroell -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />

	<xsl:template match="/">
		<html>
			<head>
				<title>Übungsblatt 7 - Aufgabe 2d</title>
			</head>

			<body>
				<h1>Aufgabe 2d</h1>
				<h3>Mareike Schulz, Nicole Emmel, Soeren Kroell</h3>
				<br/>
				<h3>Liste aller Städte an der Donau</h3>
				
				<xsl:apply-templates select="mondial" />
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="mondial">
				<xsl:for-each select="river">
				
					<!--Wenn es die Donau ist-->
					<xsl:if test="@id='f0_38512'">
						<xsl:variable name="id_donau" select="@id"/>
						
						<xsl:for-each select="/mondial/country/province/city">
			 				<xsl:if test="located_at/@water=$id_donau">
								<li><xsl:value-of select="name"/></li>
		 					</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/mondial/country/city">
			 				<xsl:if test="located_at/@water=$id_donau">
								<li><xsl:value-of select="name"/></li>
		 					</xsl:if>
						</xsl:for-each>
						
					</xsl:if>
				</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>