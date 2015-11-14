<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <xsl:for-each select="node()">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="toc">
    <xsl:result-document href="read_only/nav.js">
      <xsl:text disable-output-escaping="yes">var navdata =</xsl:text>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      <xsl:text disable-output-escaping="yes">[</xsl:text>
      <xsl:for-each select="track">
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">   {</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "tmid" : "</xsl:text>
        <xsl:value-of select="tmid"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "id" : "</xsl:text>
        <xsl:value-of select="position()"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "display" : "</xsl:text>
        <xsl:value-of select="@title"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "url" : "</xsl:text>
        <xsl:value-of select="location"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "change" : "</xsl:text>
        <xsl:value-of select="change"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "effdate" : "</xsl:text>
        <xsl:value-of select="eff_date"/>
        <xsl:text disable-output-escaping="yes">",</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">      "security" : "</xsl:text>
        <xsl:value-of select="security"/>
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping="yes">   },</xsl:text>
        <xsl:for-each select="folder">
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">   {</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "tmid" : "</xsl:text>
          <xsl:value-of select="tmid"/>
          <xsl:text disable-output-escaping="yes">",</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "id" : "</xsl:text>
          <xsl:number count="track|folder" level="multiple" format="1_1"/>
          <xsl:text disable-output-escaping="yes">",</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "display" : "</xsl:text>
          <xsl:value-of select="@title"/>
          <xsl:text disable-output-escaping="yes">",</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "url" : "</xsl:text>
          <xsl:value-of select="location"/>
          <xsl:text disable-output-escaping="yes">",</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "change" : "</xsl:text>
          <xsl:value-of select="change"/>
          <xsl:text disable-output-escaping="yes">",</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "effdate" : "</xsl:text>
          <xsl:value-of select="eff_date"/>
          <xsl:text disable-output-escaping="yes">",</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">      "security" : "</xsl:text>
          <xsl:value-of select="security"/>
          <xsl:text disable-output-escaping="yes">"</xsl:text>
          <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
          <xsl:text disable-output-escaping="yes">   },</xsl:text>
          <xsl:for-each select="item">
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">   {</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "tmid" : "</xsl:text>
            <xsl:value-of select="tmid"/>
            <xsl:text disable-output-escaping="yes">",</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "id" : "</xsl:text>
            <xsl:number count="track|folder|item" level="multiple" format="1_1_1"/>
            <xsl:text disable-output-escaping="yes">",</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "display" : "</xsl:text>
            <xsl:value-of select="@title"/>
            <xsl:text disable-output-escaping="yes">",</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "url" : "</xsl:text>
            <xsl:value-of select="location"/>
            <xsl:text disable-output-escaping="yes">",</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "change" : "</xsl:text>
            <xsl:value-of select="change"/>
            <xsl:text disable-output-escaping="yes">",</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "effdate" : "</xsl:text>
            <xsl:value-of select="eff_date"/>
            <xsl:text disable-output-escaping="yes">",</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">      "security" : "</xsl:text>
            <xsl:value-of select="security"/>
            <xsl:text disable-output-escaping="yes">"</xsl:text>
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">   },</xsl:text>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      <xsl:text disable-output-escaping="yes">]</xsl:text>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>