<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="2.0"
               exclude-result-prefixes="xs"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:output method="xml"
              encoding="UTF-8"
              indent="no"
              omit-xml-declaration="no"/>


  <!-- Test template that turns foo into bar -->
  <xsl:template match="foo">
    <bar>
      <xsl:apply-templates/>
    </bar>
  </xsl:template>

  <!-- Identity template -->
  <xsl:template match="@*|node()" priority="-1" mode="#all">
    <xsl:copy copy-namespaces="no">
      <xsl:apply-templates select="@*|node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>
