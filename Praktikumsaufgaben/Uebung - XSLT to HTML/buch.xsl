<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
	
	<html>
	<head>
		<title>Buecherliste</title>
	</head>
	
	<body>
		<h1>Buecherliste</h1>
		
		<xsl:for-each select="buecher/buch">
		<xsl:sort select="@erschienen" data-type="number"/>
			<h2><xsl:apply-templates select="titel"/></h2>
			<b><xsl:apply-templates select="kapitel/titel"/></b>
			<p><xsl:apply-templates select="kapitel/absatz"/></p>
		</xsl:for-each>
	</body>
	
	</html>
	
	</xsl:template>
	
	<xsl:template match="titel">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="kapitel/titel">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="kapitel/absatz">
		<xsl:value-of select="."/>
	</xsl:template>
	
</xsl:stylesheet>