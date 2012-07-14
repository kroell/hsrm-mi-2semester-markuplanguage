<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:template match="/">
		<fo:root>
		
			<fo:layout-master-set>

				<fo:simple-page-master master-name="Rechnung"
					page-width="21cm" page-height="29.7cm" margin-top="1cm"
					margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="6cm" />
					<fo:region-before extent="10cm" />
					<fo:region-after extent="10cm" />
				</fo:simple-page-master>

			</fo:layout-master-set>

			<fo:page-sequence master-reference="Rechnung">

				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="right" font-size="10pt" font-family="sans-serif"
						white-space="pre">
						<xsl:value-of select="/rechnung/aussteller" />
					</fo:block>

					<fo:block text-align="left" font-size="10pt" font-family="sans-serif"
						margin-left="20px" white-space="pre">
						<xsl:value-of select="/rechnung/empfaenger" />
					</fo:block>

				</fo:static-content>

				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="left" font-size="10pt" font-family="sans-serif"
						margin-bottom="20px">
						Bank:
						<xsl:value-of select="/rechnung/bank/name" />
						BLZ:
						<xsl:value-of select="/rechnung/bank/blz" />
						Konto-Nr:
						<xsl:value-of select="/rechnung/bank/konto" />
					</fo:block>

					<fo:block text-align="left" font-size="10pt" font-family="sans-serif">
						Steuernummer:
						<xsl:value-of select="/rechnung/steuernummer" />
					</fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">

					<fo:block text-align="left" font-size="12pt" font-family="sans-serif"
						font-weight="bold">
						Rechnung:
						<xsl:value-of select="/rechnung/nummer" />
						vom
						<xsl:value-of select="/rechnung/datum" />
					</fo:block>

					<fo:block text-align="left" font-size="12pt" font-family="sans-serif"
						margin-top="20px" margin-bottom="20px" border-top="1px solid black" border-bottom="1px solid black">

						<xsl:apply-templates select="/rechnung/positionen" />
					</fo:block>

					<fo:block text-align="left" font-size="10pt" font-family="sans-serif" >
						<xsl:value-of select="/rechnung/bemerkung" />
					</fo:block>

				</fo:flow>

			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="/rechnung/aussteller">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="/rechnung/empfaenger">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="/rechnung/bank">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="/rechnung/steuernummer">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="/rechnung/nummer">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="/rechnung/datum">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="/rechnung/positionen">
		
		<fo:table table-layout="fixed" width="100%">
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px">Pos</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px">Bezeichnung</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px">Menge</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px">Einzelpreis</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px">Gesamtpreis</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					
		<xsl:for-each select="position">

					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="count(positionen)" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="bezeichnung" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="menge" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="einzelpreis" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="gesamtpreis" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>

		</xsl:for-each>
		
		</fo:table>
	</xsl:template>

	<xsl:template match="/rechnung/bemerkung">
		<xsl:value-of select="." />
	</xsl:template>


</xsl:stylesheet>
