<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		
		<html>
			<head>
				<title><xsl:value-of select= "PLAY/TITLE"/></title>
			</head>
			<body>
				<h1><xsl:value-of select= "PLAY/TITLE"/></h1>
				
				<xsl:value-of select="PLAY/PERSONAE/TITLE"/>
				<ul>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,21,36)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,50,52)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,103,48)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,152,20)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,173,10)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,183,5)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,188,12)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,200,12)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,212,35)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,248,30)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,278,69)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,347,22)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,369,45)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,415,20)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,435,22)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,457,20)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,477,15)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,492,11)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,503,15)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,519,15)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,534,15)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,549,40)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,589,11)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,600,15)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,616,15)"/></li>
					<li><xsl:value-of select="substring(PLAY/PERSONAE,631,90)"/></li>
				</ul>
				
				<xsl:apply-templates select="PLAY/ACT"/>
				
				
			</body>
		</html>
		
		</xsl:template>
		
		<xsl:template match="PLAY/ACT">
			<h1><xsl:value-of select="TITLE"/></h1>
			<xsl:apply-templates select="SCENE/SPEECH"/>
		</xsl:template>
		
		<xsl:template match="SCENE/SPEECH">
			<b><xsl:value-of select="SPEAKER"/></b>
			<xsl:apply-templates select="LINE"/>
		</xsl:template>
		
		<xsl:template match="LINE">
			<blockquote>
				<xsl:value-of select ="."/>
			</blockquote>
		</xsl:template>
		
</xsl:stylesheet>