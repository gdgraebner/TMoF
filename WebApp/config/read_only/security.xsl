<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <xsl:for-each select="node()">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="security">
    <xsl:result-document href="read_only/security.js">
      <xsl:text disable-output-escaping="yes">var secdata =</xsl:text>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      <xsl:text disable-output-escaping="yes">[</xsl:text>
      <xsl:for-each select="item">
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">   {</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "abbr" : "</xsl:text>
        <xsl:value-of select="@abbr"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "shorttitle" : "</xsl:text>
        <xsl:value-of select="@shorttitle"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "longtitle" : "</xsl:text>
        <xsl:value-of select="@longtitle"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "color" : "</xsl:text>
        <xsl:value-of select="@color"/>
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">   },</xsl:text>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      <xsl:text disable-output-escaping="yes">]</xsl:text>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>