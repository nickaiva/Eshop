<?xml version = '1.0' encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 

 <xsl:template match="description">  
  <p class="product-description">
   <b>Description:</b>
   <br/>
   <xsl:value-of select="."/>
  </p>
 </xsl:template>

<xsl:template match="summary">
  <p class="product-summary">
   <b>Summary:</b>
   <br/>        
   <xsl:value-of select="."/>
  </p>         
 </xsl:template>
 

 <xsl:template match="dimensions">
  <p class="product-dimensions">
   <b>Dimensions:</b>
   <br/>
   <xsl:value-of select="long-val"/> <xsl:value-of select="long-unit"/> long
   <xsl:value-of select="wide-val"/> <xsl:value-of select="wide-unit"/> wide
   <xsl:value-of select="tall-val"/> <xsl:value-of select="tall-unit"/> tall   </p>  
 </xsl:template>

 <xsl:template match="clothing-size-list">
   <p class="clothing-size">
    Sizes: 
    <xsl:for-each select="size">
      <xsl:value-of select="."/>
      <xsl:if test="position()&lt;last()">,</xsl:if>
    </xsl:for-each>   
   </p>
 </xsl:template>

 <xsl:template match="*"></xsl:template>

</xsl:stylesheet>