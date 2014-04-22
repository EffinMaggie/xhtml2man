<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              xmlns:xhtml="http://www.w3.org/1999/xhtml"
              version="1.0">
  <xsl:output method="text" encoding="UTF-8"
              omit-xml-declaration="yes"
              indent="no"
              media-type="text/plain" />

  <xsl:param name="section">7</xsl:param>

<xsl:template match="xhtml:body">
<xsl:if test="../xhtml:head/xhtml:meta[@name='description']">
.SH SYNOPSIS
.P
<xsl:value-of select="../xhtml:head/xhtml:meta[@name='description']/@content"/>
</xsl:if>
<xsl:apply-templates select="*"/>
<xsl:if test="../xhtml:head/xhtml:meta[@name='author']">
.SH AUTHOR
.P
This article was written by <xsl:value-of select="../xhtml:head/xhtml:meta[@name='author']/@content"/>.
</xsl:if>
</xsl:template>

<xsl:template match="xhtml:title">.TH "<xsl:value-of select="."/>" <xsl:value-of select="$section"/> "<xsl:choose>
  <xsl:when test="../xhtml:meta[@name='mtime']"><xsl:value-of select="../xhtml:meta[@name='mtime']/@content"/></xsl:when>
  <xsl:when test="../xhtml:meta[@name='date']"><xsl:value-of select="../xhtml:meta[@name='date']/@content"/></xsl:when>
  <xsl:otherwise>-</xsl:otherwise>
</xsl:choose>"</xsl:template>

<xsl:template match="xhtml:h1">
.SH "<xsl:value-of select="."/>"
</xsl:template>
<xsl:template match="xhtml:h2 | xhtml:h3 | xhtml:h4 | xhtml:h5 | xhtml:h6">
.SS "<xsl:value-of select="."/>"
</xsl:template>

<xsl:template match="xhtml:p">
.P
<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="xhtml:pre">
.P
.nf
<xsl:value-of select="."/>
.fi
</xsl:template>

</xsl:stylesheet>

