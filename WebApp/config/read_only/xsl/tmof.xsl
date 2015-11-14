<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates select="docnavy-etm"/>
  </xsl:template>
  <xsl:template match="docnavy-etm">
    <xsl:if test="front/idinfo/titleblk/doctype/text()='OP'">
      <xsl:result-document href="{front/idinfo/titleblk/prtitle/nomen}.html">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <html>
          <head>
            <meta name="change" content=""/>
            <meta name="effdate" content=""/>
            <meta name="security" content=""/>
            <link rel="stylesheet" href="../../../config/procedures.css"/>
            <script src="../../../config/procedure.js"/>
            <script src="../../../../../config/read_only/nav.js"/>
            <title></title>
          </head>
          <body onload="loadProcedure()">
            <xsl:for-each select="body/section">
              <xsl:apply-templates select="."/>
            </xsl:for-each>
          </body>
        </html>
      </xsl:result-document>      
    </xsl:if>
    <xsl:if test="front/idinfo/titleblk/doctype/text()='HIST'">
      <xsl:result-document href="{front/idinfo/titleblk/prtitle/nomen}.html">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <html>
          <head>
            <meta name="change" content=""/>
            <meta name="effdate" content=""/>
            <meta name="security" content=""/>
            <link rel="stylesheet" href="../../../config/procedures.css"/>
            <script src="../../../config/procedure.js"/>
            <script src="../../../../../config/read_only/nav.js"/>
            <title></title>
          </head>
          <body onload="">
            <xsl:for-each select="body/chapter/section/subsection">
              <xsl:apply-templates select="."/>
            </xsl:for-each>
          </body>
        </html>
      </xsl:result-document>
    </xsl:if>
  </xsl:template>
  <xsl:template match="section">
    <table class="tm_section">
      <tr>
        <td class="tm_titlebar">
          <xsl:value-of select="title"/>
        </td>
      </tr>
      <xsl:for-each select="para0/step1">
        <xsl:apply-templates select="."/>
      </xsl:for-each>
    </table>
  </xsl:template>
  <xsl:template match="step1">
    <tr>
      <td class="tm_step1">
        <xsl:for-each select="node()">
          <xsl:apply-templates select="."/>
        </xsl:for-each>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="para">
    <xsl:for-each select="node()">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="extref">
    <span class="extref" tm_ref="{@xrefid}"></span>
  </xsl:template>
  <xsl:template match="figure">
    <xsl:for-each select="graphic">
      <img src="{unparsed-entity-uri(@boardno)}"/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="subsection">
    <table class="tm_section">
      <tr>
        <td class="tm_titlebar">
          <xsl:value-of select="title"/>
        </td>
      </tr>
    </table>
    <xsl:for-each select="para0/para">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>