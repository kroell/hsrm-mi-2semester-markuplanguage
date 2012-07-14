<?xml version="1.0" encoding="UTF-8"?>

<!--Arbeitsblatt 7, Aufgabe 2a -->
<!--Mareike Schulz, Nicole Emmel, Soeren Kroell -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />

	<xsl:template match="/">

		<html>
			<head>
				<title>Übungsblatt 7 - Aufgabe 2 a, b, c</title>
			</head>

			<body>
				<h1>Aufgabe 2 a, b und c</h1>
				<h3>Mareike Schulz, Nicole Emmel, Soeren Kroell</h3>
				<br />
				<table border="1" frame="box">
					<tr>
						<th bgcolor="#374049"><font color="white">Bundesstaat</font></th>
						<th bgcolor="#374049"><font color="white">Hauptstadt</font></th>
						<th bgcolor="#374049"><font color="white">Flaeche</font></th>
						<th bgcolor="#374049"><font color="white">Anzahl Städte</font></th>
						<th bgcolor="#374049"><font color="white">Stadt mit gr. Einwohnerzahl</font></th>
					</tr>
					<xsl:apply-templates select="mondial/country[@id='f0_967']" />
				</table>
			</body>
		</html>
	</xsl:template>

	<!--Nur USA-->
	<xsl:template match="mondial/country[@id='f0_967']">

		<xsl:for-each select="./province">

			<!--Nummerisch sortieren nach der Flaeche des Bundesstaates -->
			<xsl:sort select="@area" data-type="number" />
			<xsl:variable name="id_hauptstadt" select="@capital"/>
			<tr>
				
				<!--Name des Bundesstaates-->
				<td><xsl:value-of select="@name"/></td>
				
				<!--Name der Hauptstadt-->
				<xsl:for-each select="city">
					<xsl:if test="@id = $id_hauptstadt">
						<td><xsl:value-of select="./name"/></td>
					</xsl:if>
				</xsl:for-each>
				
				<!--Fläche-->
				<td><xsl:value-of select="@area"/></td>
				
				<!--Anzahl der Städte-->
				<td><xsl:value-of select='count(city)'/></td>
				
				<!--Stadt mit der grössten Einwohnerzahl-->
				<xsl:for-each select="city/population">
					<xsl:sort select="." data-type="number"/>
					<xsl:if test="position()=last()">
						<td><xsl:value-of select="../name"/></td>
					</xsl:if>
				</xsl:for-each>
				
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>