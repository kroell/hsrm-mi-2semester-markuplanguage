<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" />
	<xsl:template match="/">

		<xsl:variable name="PreisErwachsene" select="Daten/Preise/PreisErwachsene" />
		<xsl:variable name="PreisKinder" select="Daten/Preise/PreisKinder" />
		<xsl:variable name="PreisSenioren" select="Daten/Preise/PreisSenioren" />

		<xsl:element name="Umsatz">
			<xsl:element name="Monate">
				<xsl:for-each select="Daten/Besucher/Monat[@nr]">

					<xsl:variable name="UmsatzMonatErwachsene"
						select="$PreisErwachsene*(sum(./Tag/Erwachsene))" />
					<xsl:variable name="UmsatzMonatKinder" select="$PreisKinder*(sum(./Tag/Kinder))" />
					<xsl:variable name="UmsatzMonatSenioren"
						select="$PreisSenioren*(sum(./Tag/Senioren))" />
					<xsl:variable name="GesamtumsatzMonat"
						select="$UmsatzMonatErwachsene+$UmsatzMonatKinder+$UmsatzMonatSenioren" />



					<xsl:element name="Monat">

						<xsl:element name="Monatszahl">
							<xsl:value-of select="@*"></xsl:value-of>
						</xsl:element>

						<xsl:element name="Jahr">
							<xsl:if test="@* &gt; 7">
								<xsl:text>2009</xsl:text>
							</xsl:if>
							<xsl:if test="@* &lt; 8">
								<xsl:text>2010</xsl:text>
							</xsl:if>
						</xsl:element>

						<xsl:element name="Altersgruppe">

							<xsl:element name="Erwachsene">
								<xsl:value-of select="$UmsatzMonatErwachsene"></xsl:value-of>
							</xsl:element>

							<xsl:element name="Kinder">
								<xsl:value-of select="$UmsatzMonatKinder"></xsl:value-of>
							</xsl:element>

							<xsl:element name="Senioren">
								<xsl:value-of select="$UmsatzMonatSenioren"></xsl:value-of>
							</xsl:element>

						</xsl:element>

						<xsl:element name="Gesamtumsatz">
							<xsl:value-of select="$GesamtumsatzMonat">
							</xsl:value-of>
						</xsl:element>

					</xsl:element>

				</xsl:for-each>
			</xsl:element>
		</xsl:element>

	</xsl:template>
</xsl:stylesheet>