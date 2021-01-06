<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:template match="product_categories">
  <table valign="top" width="100%" height="100%" class="cat-directory" border="0">
    <tr><td><b>Categories</b></td></tr>
    <xsl:apply-templates select="category"/>        
  </table> 
 </xsl:template>
 
 <xsl:template match="category">
  <tr> 
   <td>
    <a>
     <xsl:attribute name="href">prod-cat.xsql?category_id=<xsl:value-of select="ID"/></xsl:attribute>
     <xsl:value-of select="NAME"/>
    </a>
   </td>
  </tr>
  <tr>
   <td height="10%"> </td>
  </tr>
 </xsl:template>
 
 
</xsl:stylesheet>