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
  <xsl:param name="name"><xsl:choose>
  <xsl:when test="//xhtml:meta[@name='unix:name']"><xsl:value-of select="//xhtml:meta[@name='unix:name']/@content"/></xsl:when>
  <xsl:otherwise><xsl:value-of select="//xhtml:name"/></xsl:otherwise>
</xsl:choose></xsl:param>

<xsl:template match="xhtml:body">
<xsl:if test="../xhtml:head/xhtml:meta[@name='unix:name']">
.SH NAME
.PP
<xsl:value-of select="../xhtml:head/xhtml:meta[@name='unix:name']/@content"/> - <xsl:value-of select="../xhtml:head/xhtml:title"/>
</xsl:if>
<xsl:if test="../xhtml:head/xhtml:meta[@name='description']">
.SH DESCRIPTION
.PP
<xsl:value-of select="../xhtml:head/xhtml:meta[@name='description']/@content"/>
</xsl:if>
<xsl:apply-templates select="*"/>
<xsl:if test="../xhtml:head/xhtml:meta[@name='author']">
.SH AUTHOR
.PP
This article was written by <xsl:value-of select="../xhtml:head/xhtml:meta[@name='author']/@content"/>.
</xsl:if>
</xsl:template>

<xsl:template match="xhtml:title">.TH "<xsl:value-of select="$name"/>" <xsl:value-of select="$section"/> "<xsl:choose>
  <xsl:when test="../xhtml:meta[@name='mtime']"><xsl:value-of select="../xhtml:meta[@name='mtime']/@content"/></xsl:when>
  <xsl:when test="../xhtml:meta[@name='date']"><xsl:value-of select="../xhtml:meta[@name='date']/@content"/></xsl:when>
  <xsl:otherwise>-</xsl:otherwise>
</xsl:choose>" "" "<xsl:value-of select="."/>"</xsl:template>

<xsl:template match="xhtml:h1">
.SH "<xsl:value-of select="."/>"
</xsl:template>
<xsl:template match="xhtml:h2 | xhtml:h3 | xhtml:h4 | xhtml:h5 | xhtml:h6">
.SS "<xsl:value-of select="."/>"
</xsl:template>

<xsl:template match="xhtml:p">
.PP
<xsl:apply-templates select="*|text()"/>
</xsl:template>

<xsl:template match="text()"><xsl:value-of select="."/></xsl:template>

<xsl:template match="xhtml:a">\fB<xsl:value-of select="."/>\f1 (\fI<xsl:value-of select="@href"/>\f1)</xsl:template>
<xsl:template match="xhtml:em">\fI<xsl:value-of select="."/>\f1</xsl:template>

<xsl:template match="xhtml:pre">
.PP
.DS I
.nf
<xsl:value-of select="."/>
.fi
.DE
</xsl:template>

</xsl:stylesheet>

