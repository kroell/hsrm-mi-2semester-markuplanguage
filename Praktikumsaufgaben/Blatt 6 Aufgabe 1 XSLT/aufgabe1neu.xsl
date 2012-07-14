<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		
		<xsl:apply-templates select="cd-sammlung/cd"/>
		
	</xsl:template>
	
	
	<xsl:template match="cd-sammlung/cd">
	
		<xsl:element name="cd-sammlung">
		
			<xsl:element name="cd">
			
				<xsl:element name="bestell-nr">
					<xsl:value-of select="@bestell-nr"></xsl:value-of>
				</xsl:element>
			
				<xsl:element name="titel">
					<xsl:value-of select="@titel"></xsl:value-of>
				</xsl:element>
				
				<xsl:element name="komponist">
					<xsl:value-of select="@komponist"></xsl:value-of>
				</xsl:element>
			
			</xsl:element>
	
		</xsl:element>
	
	</xsl:template>
	
</xsl:stylesheet>
