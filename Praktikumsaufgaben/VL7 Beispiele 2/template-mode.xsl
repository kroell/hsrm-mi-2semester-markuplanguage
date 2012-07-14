<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/buch">
    <html>
      <body>
        <h2>
          <xsl:value-of select="kapitel/haupttitel"/>
        </h2>
        <h3>Inhaltsverzeichnis</h3>
        <ol>
          <xsl:apply-templates select="kapitel/unterkapitel/titel" mode="inhaltsverzeichnis"/>
        </ol>
        <br/>
        <br/>
        <xsl:for-each select="kapitel/unterkapitel">
          <div>
            <xsl:apply-templates select="titel" mode="text"/>
            <xsl:apply-templates select="absatz"/>
          </div>
          <hr/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="titel" mode="inhaltsverzeichnis">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>
  <xsl:template match="titel" mode="text">
    <h4>
      <xsl:value-of select="."/>
    </h4>
  </xsl:template>
  <xsl:template match="absatz">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="code">
    <code>
      <xsl:value-of select="."/>
    </code>
  </xsl:template>
</xsl:stylesheet>