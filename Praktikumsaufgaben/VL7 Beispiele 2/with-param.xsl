<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/buecher">
    <html>
      <body>
        <h3>Aktuelle Empfehlungen</h3>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="buch[position() mod 2 =1]">
    <xsl:call-template name="buchpos"/>
  </xsl:template>
  <xsl:template match="buch[position() mod 2 =0]">
    <xsl:call-template name="buchpos">
      <xsl:with-param name="farbe">background-color:gray;</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="buchpos">
    <xsl:param name="farbe">background-color:silver;</xsl:param>
    <div style="{$farbe}">
      <b>Autor: </b><xsl:value-of select="autor"/>
      <br/>
      <b>Titel: </b><xsl:value-of select="titel"/>
      <br/>
      <b>ISBN: </b><xsl:value-of select="@isbn"/>
      <br/>
    </div>
  </xsl:template>
</xsl:stylesheet>