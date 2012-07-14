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
            <th>Aufführungsort</th>
          </tr>
          <xsl:for-each select="eintrag">
            <tr>
              <td>
                <xsl:choose>
                  <xsl:when test="aufführungsort='Großer Saal'">
                    <font color="blue">
                      <xsl:value-of select="titel"/>
                    </font>
                  </xsl:when>
                  <xsl:when test="aufführungsort='Kleiner Saal'">
                    <font color="red">
                      <xsl:value-of select="titel"/>
                    </font>
                  </xsl:when>
                  <xsl:otherwise>
                    <font color="green">
                      <xsl:value-of select="titel"/>
                    </font>
                  </xsl:otherwise>
                </xsl:choose>                      
              </td>
              <td>
                <xsl:value-of select="autor"/>
              </td>
              <td>
                <xsl:value-of select="premiere"/>
              </td>
              <td>
                <xsl:value-of select="aufführungsort"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
