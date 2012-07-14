<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/spielplan">
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
          </tr>
          <xsl:for-each select="eintrag">
            <tr>
              <td>
                <xsl:value-of select="titel"/>
              </td>
              <td>
                <xsl:value-of select="autor"/>
              </td>
              <td>
                <xsl:value-of select="premiere"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
