<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Spielplan Theater Fridolin</title>
      </head>
      <body>
        <h1>Spielplan</h1>
        <table border="1">
          <tr>
            <th>Titel</th>
            <th>Autor</th>
            <th>Premiere</th>
            <th>ausverkauft</th>
          </tr>
          <xsl:apply-templates select="spielplan/eintrag"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="eintrag">
    <tr>
      <xsl:apply-templates/>
      <td>
        <input type="checkbox">
          <xsl:if test="ausverkauft">
            <xsl:attribute name="checked">checked</xsl:attribute>
          </xsl:if>
        </input>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="autor | premiere">
    <td><xsl:apply-templates/></td>
  </xsl:template>
  <xsl:template match="titel">
      <td>
        <a href="{@url}"><xsl:apply-templates/></a>
      </td>
  </xsl:template>
</xsl:stylesheet>
