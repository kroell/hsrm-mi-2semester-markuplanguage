<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink/namespace" xmlns:xalan="org.apache.xalan.xslt.extensions.Redirect" extension-element-prefixes="xalan">
<xsl:output method="xml" version="1.0" indent="yes"/>
	<xsl:template match="/">

		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
			width="950" height="1500" viewBox="0 0 950 1500">

			<g style="stroke:rgb(0,0,0);fill:rgb(0,0,255)">
			
				<!--senkrechte Linie -->
				<line x1="50" y1="30" x2="50" y2="540"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<!--waagerechte Linie -->
				<line x1="50" y1="540" x2="600" y2="540"
					style="stroke:rgb(0,0,0);stroke-width:5" />

				<!--Raster y-Achse -->
				<line x1="40" y1="60" x2="60" y2="60"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="100" x2="60" y2="100"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="140" x2="60" y2="140"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="180" x2="60" y2="180"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="220" x2="60" y2="220"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="260" x2="60" y2="260"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="300" x2="60" y2="300"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="340" x2="60" y2="340"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="380" x2="60" y2="380"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="420" x2="60" y2="420"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="460" x2="60" y2="460"
					style="stroke:rgb(0,0,0);stroke-width:5" />
				<line x1="40" y1="500" x2="60" y2="500"
					style="stroke:rgb(0,0,0);stroke-width:5" />

				<!--Achsenbeschriftung -->
				<text x="30" y="100" style="font-size: 15">
					<tspan x="10" y="20">Monat</tspan>
					<tspan x="5" y="65">AUG</tspan>
					<tspan x="5" y="105">SEP</tspan>
					<tspan x="5" y="145">OCT</tspan>
					<tspan x="5" y="185">NOV</tspan>
					<tspan x="5" y="225">DEC</tspan>
					<tspan x="5" y="265">JAN</tspan>
					<tspan x="5" y="305">FEB</tspan>
					<tspan x="5" y="345">MAR</tspan>
					<tspan x="5" y="385">APR</tspan>
					<tspan x="5" y="425">MAY</tspan>
					<tspan x="5" y="465">JUN</tspan>
					<tspan x="5" y="505">JUL</tspan>
					<tspan x="610" y="545">Umsatz in €</tspan>
				</text>
				
				<!--Balken -->
				<xsl:for-each select="Umsatz/Monate/Monat">
				
					<xsl:choose>
						<xsl:when test="Monatszahl = 8">
							<xsl:variable name="GesamtumsatzAug" select="Gesamtumsatz" />
							<rect x="52" y="47" width="{$GesamtumsatzAug div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="440" y="65">37.604</tspan></text>
						</xsl:when>	
						<xsl:when test="Monatszahl = 9">
							<xsl:variable name="GesamtumsatzSep" select="Gesamtumsatz" />
							<rect x="52" y="87" width="{$GesamtumsatzSep div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="390" y="105">33.071,50</tspan></text>
						</xsl:when>	
						<xsl:when test="Monatszahl = 10">
							<xsl:variable name="GesamtumsatzOct" select="Gesamtumsatz" />
							<rect x="52" y="127" width="{$GesamtumsatzOct div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="380" y="145">31.655</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 11">
							<xsl:variable name="GesamtumsatzNov" select="Gesamtumsatz" />
							<rect x="52" y="167" width="{$GesamtumsatzNov div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="400" y="185">33.879,50</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 12">
							<xsl:variable name="GesamtumsatzDec" select="Gesamtumsatz" />
							<rect x="52" y="207" width="{$GesamtumsatzDec div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="500" y="225">44.123</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 1">
							<xsl:variable name="GesamtumsatzJan" select="Gesamtumsatz" />
							<rect x="52" y="247" width="{$GesamtumsatzJan div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="580" y="265">51.858</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 2">
							<xsl:variable name="GesamtumsatzFeb" select="Gesamtumsatz" />
							<rect x="52" y="287" width="{$GesamtumsatzFeb div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="550" y="305">48.930</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 3">
							<xsl:variable name="GesamtumsatzMar" select="Gesamtumsatz" />
							<rect x="52" y="327" width="{$GesamtumsatzMar div 100}" height="25" style="fill:rgb(255,192,203)"/>
							<text><tspan x="600" y="345">53.667</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 4">
							<xsl:variable name="GesamtumsatzApr" select="Gesamtumsatz" />
							<rect x="52" y="367" width="{$GesamtumsatzApr div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="490" y="385">42.957,50</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 5">
							<xsl:variable name="GesamtumsatzMay" select="Gesamtumsatz" />
							<rect x="52" y="407" width="{$GesamtumsatzMay div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="430" y="425">37.404,50</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 6">
							<xsl:variable name="GesamtumsatzJun" select="Gesamtumsatz" />
							<rect x="52" y="447" width="{$GesamtumsatzJun div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="420" y="465">36.261,50</tspan></text>
						</xsl:when>
						<xsl:when test="Monatszahl = 7">
							<xsl:variable name="GesamtumsatzJul" select="Gesamtumsatz" />
							<rect x="52" y="487" width="{$GesamtumsatzJul div 100}" height="25" style="fill:rgb(255,20,147)"/>
							<text><tspan x="460" y="505">40.259,50</tspan></text>
						</xsl:when>
							
					</xsl:choose>

				</xsl:for-each>
			</g>
		</svg>

	</xsl:template>
</xsl:stylesheet>