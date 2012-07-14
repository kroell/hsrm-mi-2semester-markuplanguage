<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="schrift">font-family:Arial; font-size:14pt;</xsl:variable>
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="buecher">
    <xsl:for-each select="buch">
      <div>
        <p style="{$schrift}"><b>Autor: </b><xsl:value-of select="autor" /></p>
        <p><xsl:attribute name="style"><xsl:value-of select="$schrift" /></xsl:attribute> <b>Titel: </b><xsl:value-of select="titel" /></p>
        <p><b>ISBN: </b><xsl:value-of select="@isbn" /></p>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
