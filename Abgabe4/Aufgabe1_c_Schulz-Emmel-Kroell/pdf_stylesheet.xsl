<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>

				<fo:simple-page-master master-name="Gesamtumsatz"
					page-width="21cm" page-height="29.7cm" margin-top="1cm"
					margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="6cm" />
					<fo:region-before extent="10cm" />
					<fo:region-after extent="10cm" />
				</fo:simple-page-master>

			</fo:layout-master-set>

			<fo:page-sequence master-reference="Gesamtumsatz">

				<fo:static-content flow-name="xsl-region-before">

					<fo:block text-align="center" font-size="20pt" font-weight="bold" text-decoration="underline" font-family="sans-serif">
						Theaterumsätze August 2009 bis Juli 2010
					</fo:block>

				</fo:static-content>

				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="left" font-size="10pt" font-family="sans-serif">
					</fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">

					<fo:block text-align="left" font-size="12pt" font-family="sans-serif">
						<xsl:apply-templates select="/Umsatz/Monate" />
						<xsl:apply-templates select="/Umsatz" />
					</fo:block>

				</fo:flow>

			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="/Umsatz/Monate">	
	
		<fo:table table-layout="fixed" width="100%">
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px" margin-bottom="2px">Monat</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px" margin-bottom="2px">Jahr</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px" margin-bottom="2px">Erwachsene</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px" margin-bottom="2px">Kinder</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px" margin-bottom="2px">Senioren</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold" font-size="10px" margin-bottom="2px">Gesamt</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					
		<xsl:for-each select="Monat">

					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="Monatszahl" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="Jahr" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="Altersgruppe/Erwachsene" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="Altersgruppe/Kinder" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="Altersgruppe/Senioren" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="Gesamtumsatz" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
		</xsl:for-each>
		
		</fo:table>
		
	</xsl:template>
	
	<xsl:template match="/Umsatz">	
	
		<fo:table table-layout="fixed" width="100%">
		
		<xsl:for-each select="Monate">

					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="8px">
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="sum(./Monat/Altersgruppe/Erwachsene)" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="sum(./Monat/Altersgruppe/Kinder)" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="sum(./Monat/Altersgruppe/Senioren)" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px">
									<xsl:value-of select="sum(./Monat/Gesamtumsatz)" />
									<xsl:text> EUR</xsl:text>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					
		</xsl:for-each>
		</fo:table>
	</xsl:template>

</xsl:stylesheet>
