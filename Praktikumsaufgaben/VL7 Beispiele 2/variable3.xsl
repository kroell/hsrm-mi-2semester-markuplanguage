<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h3>Komponisten</h3>
        <xsl:for-each select="komponisten/komponist">
          <xsl:variable name="lebensdaten" select="concat(geboren, '-',gestorben)" />
          <p><b>Name: </b><xsl:value-of select="name" /></p>
          <p><b>Lebensdaten: </b><xsl:value-of select="$lebensdaten"/></p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>