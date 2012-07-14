<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" version="4.01"/>
	<xsl:template match="/">
		<html>
			<title>Beispiel</title>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="kapitel">
		<h1>Ein Kapitel: <xsl:value-of select="titel"/></h1>
		<xsl:apply-templates select="absatz"/>
	</xsl:template>
	<xsl:template match="absatz">
		<p>
			<xsl:value-of select="."/>
		</p>
	</xsl:template>
</xsl:stylesheet>