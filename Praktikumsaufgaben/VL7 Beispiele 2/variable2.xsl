<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="mailAdresse">
    <a href="mailto:thomasj.sebestyen@meta-text.net">Thomas J. Sebestyen</a>
  </xsl:variable>
  <xsl:template match="/test">
    <html>
      <body>
        <xsl:copy-of select="$mailAdresse"/>
        <!--<xsl:value-of select="$mailAdresse"/>-->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
