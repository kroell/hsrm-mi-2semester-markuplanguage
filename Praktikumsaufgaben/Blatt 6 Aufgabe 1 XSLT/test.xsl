<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	
		<html>
			<head>
				<title>Adressbuch</title>
			</head>
			
			<body>
			
			<table border="1">
				<tr>
					<th>Nr.</th>
					<th>Anrede</th>
					<th>Vorname</th>
					<th>Name</th>
					<th>Beruf</th>
					<th>Tel.Privat</th>
				</tr>
				<xsl:for-each select="ADRESSBUCH/PERSON">
				<xsl:sort select="VOLLER_NAME/NAME" data-type="number"/>
					<tr>
						<td><xsl:number count="ADRESSBUCH/PERSON" format="01"/></td>
						<td><xsl:apply-templates select="ANREDE"/></td>
						<td><xsl:apply-templates select="VOLLER_NAME/VORNAME"/></td>
						<td><xsl:apply-templates select="VOLLER_NAME/NAME"/></td>
						<td><xsl:apply-templates select="BERUF"/></td>
						<td><xsl:apply-templates select="KONTAKT/TELEFON"/></td>
					</tr>
				
				</xsl:for-each>
			</table>
				
			</body>
		
		</html>
	
	
	</xsl:template>
	
	<xsl:template match="ANREDE">
		<xsl:value-of select="@TITEL"/>
	</xsl:template>
	
	<xsl:template match="VOLLER_NAME/VORNAME">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="VOLLER_NAME/NAME">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="BERUF">
		<xsl:value-of select="@BEZEICHNUNG"/>
	</xsl:template>
	
	<xsl:template match="KONTAKT/TELEFON">
		<xsl:value-of select="TELEFON_PRIVAT"/>
	</xsl:template>
	
</xsl:stylesheet>