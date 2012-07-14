<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Spielplan Theater Fridolin</title>
      </head>
      <body>
        <h1>Spielplan</h1>
        <img src="{spielplan/bild/quelle}" alt="{spielplan/bild/name}" border="0"/><br/><br/>
        <table border="1">
          <tr>
            <th>Titel</th>
            <th>Autor</th>
            <th>Premiere</th>
          </tr>
          <xsl:apply-templates select="spielplan/eintrag"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="eintrag">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>
  <xsl:template match="autor | premiere">
    <td><xsl:apply-templates/></td>
  </xsl:template>
  <xsl:template match="titel">
      <td>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@url"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </a>
      </td>
  </xsl:template>
  
</xsl:stylesheet>
