<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template match="/">
<fo:root>
<fo:layout-master-set>
<fo:simple-page-master master-name="meineSeite"
    page-width="21cm"
    page-height="29.7cm"
    margin-top="1cm" 
    margin-bottom="2cm" 
    margin-left="2.5cm" 
    margin-right="2.5cm">
  <fo:region-body margin-top="3cm"/>
  <fo:region-before extent="3cm"/>
  <fo:region-after extent="1.5cm"/>
</fo:simple-page-master>    
</fo:layout-master-set>

<fo:page-sequence master-reference="meineSeite">
<fo:static-content flow-name="xsl-region-before">
  <fo:block
    text-align="end" 
    font-size="10pt" 
    font-family="Arial">
    <xsl:value-of select="/Gedicht/Autor"/>
  </fo:block>
</fo:static-content> 

<fo:static-content flow-name="xsl-region-after">
  <fo:block
    text-align="end" 
    font-size="10pt" 
    font-family="Arial">
    <fo:page-number/>
  </fo:block>
</fo:static-content> 

<fo:flow flow-name="xsl-region-body">
    <xsl:apply-templates />
</fo:flow>

</fo:page-sequence>

</fo:root>
</xsl:template>

<xsl:template match="Gedicht/Autor">
  <fo:block
    font-size="18pt" 
    font-family="Arial" 
    space-after.optimum="15pt"
    background-color="silver"
    color="white"
    text-align="left">
    <xsl:value-of select="."/>    
  </fo:block>
</xsl:template>

<xsl:template match="Gedicht/Titel">
  <fo:block
    font-size="16pt" 
    font-family="Arial" 
    space-after.optimum="10pt"
    text-align="start">
    <xsl:value-of select="."/> 
  </fo:block>
</xsl:template>

<xsl:template match="Gedicht/Vers">
  <fo:block
    font-size="12pt" 
    font-family="Arial" 
    space-before.optimum="10pt"
    space-after.optimum="10pt"
    text-align="start">
    <xsl:apply-templates select="Zeile"/>
  </fo:block>
</xsl:template>

<xsl:template match="Zeile">
  <fo:block>
    <xsl:value-of select="."/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>
