<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              xmlns:xhtml="http://www.w3.org/1999/xhtml"
              version="1.0">
  <xsl:output method="html" encoding="UTF-8"
              indent="no"
              media-type="text/plain" />

<xsl:template match="xhtml:title">.TH "<xsl:value-of select="."/>" 7 "<xsl:choose>
  <xsl:when test="../xhtml:meta[@name='date']"><xsl:value-of select="../xhtml:meta[@name='date']/@content"/></xsl:when>
  <xsl:otherwise>-</xsl:otherwise>
</xsl:choose>"</xsl:template>

<xsl:template match="xhtml:h1">.SH "<xsl:value-of select="."/>"</xsl:template>
<xsl:template match="xhtml:h2 | xhtml:h3 | xhtml:h4 | xhtml:h5 | xhtml:h6">.SS "<xsl:value-of select="."/>"</xsl:template>

<xsl:template match="xhtml:p">.P
<xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>

