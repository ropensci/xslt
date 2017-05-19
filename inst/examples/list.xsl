<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

  <xsl:strip-space elements="*" />

  <xsl:output encoding="UTF-8" method="text" />

  <xsl:key name="labelById" match="labels/list/label" use="@id" />

  <xsl:template match="/">Label,Proposal_ID,Directorate,Division,Submission_Date
<xsl:apply-templates select="result/documents/list" />
  </xsl:template>

  <xsl:template match="documents/list/document">"<xsl:apply-templates select="labels" />",<xsl:value-of select="content/field[@name='Proposal_ID']" />,<xsl:value-of select="content/field[@name='Directorate']" />,<xsl:value-of select="content/field[@name='Division']" />,<xsl:value-of select="content/field[@name='Submission_Date']" /><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="document/labels/label">
    <xsl:variable name="id" select="@id" />
    <xsl:value-of select="translate(key('labelById', $id)/@display, '&quot;', ' ')" /> (<xsl:value-of select="@occurrences" />)<xsl:if test="not(position() = last())">,<xsl:text> </xsl:text></xsl:if>
  </xsl:template>
</xsl:stylesheet>

