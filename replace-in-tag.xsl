<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:foo="http://www.foo.org/" xmlns:bar="http://www.bar.org">
<xsl:template name="replace-in-tag" >
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)" disable-output-escaping="yes"/>
        <xsl:value-of select="$replace" disable-output-escaping="yes"/>
        <xsl:value-of select="$with" disable-output-escaping="yes"/>

        <xsl:call-template name="replace-in-tag">
          <xsl:with-param name="text">

<xsl:choose>
        <xsl:when test="contains($text,'&lt;/k&gt;')">
        	<xsl:value-of select="substring-after(substring-after($text,$replace),'&lt;/k&gt;')"/>
        </xsl:when>
        <xsl:otherwise>
        	<xsl:value-of select="substring-after($text,$replace)"/>
        </xsl:otherwise>
        </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="with" select="$with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
<xsl:template match="/">
  
<xsl:call-template name="replace-in-tag">
  <xsl:with-param name="text" select="'Empire &lt;k&gt;jnkj&lt;/k&gt;XXXqueuib &lt;k&gt;sdalkasjnsdafds&lt;/k&gt; IDFISB'" />
  <xsl:with-param name="replace" select="'&lt;k&gt;'" />
  <xsl:with-param name="with" select="'HAHAHA&lt;/k&gt;'"/>
</xsl:call-template>
\n
<xsl:value-of select="substring-after('asdfXdsaf','X')" disable-output-escaping="yes"/>
</xsl:template>
</xsl:stylesheet>
