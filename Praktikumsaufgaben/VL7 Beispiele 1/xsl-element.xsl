<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output indent="yes" encoding="iso-8859-1"/>
  <xsl:template match="/">
    <spielplan>
      <xsl:apply-templates/>
    </spielplan>
  </xsl:template>
  
  <xsl:template match="eintrag">
    <eintrag>
      <xsl:for-each select="@*">
        <xsl:element name="{name()}">
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:for-each>
    </eintrag>
  </xsl:template>
</xsl:stylesheet>