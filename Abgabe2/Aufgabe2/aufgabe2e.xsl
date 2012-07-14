<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Übungsblatt 7 - Aufgabe 2 e</title>
			</head>

			<body>
				<h1>Aufgabe 2 e</h1>
				<h3>Mareike Schulz, Nicole Emmel, Soeren Kroell</h3>
				<br />
				<table border="1">
					<tr>
						<th bgcolor="#374049"><font color="white">An Russland angrenzende Staaten</font>
						</th>
						<th bgcolor="#374049"><font color="white">Bevölkerungsdichte</font>
						</th>
						<th bgcolor="#374049"><font color="white">Breitengrad</font>
						</th>
					</tr>

					<xsl:for-each select="mondial/country/border[@country='f0_358']">
						<xsl:sort select="..//city/@latitude" data-type="number" />

						<tr>
							<td>
								<xsl:value-of select="../@name" />
							</td>

							<td>
								<xsl:value-of select="round(../@population div ../@total_area)" />
							</td>

							<td>
								<xsl:value-of select="..//city[@id=../@capital]/@latitude" />
							</td>
						</tr>

					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>