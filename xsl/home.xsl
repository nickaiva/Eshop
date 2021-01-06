<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<xsl:include href="banner.xsl"/>
<xsl:template match="/home">
 <html>     
  <head>
    <link rel="stylesheet" type="text/css" name="catalogue" href="../css/catalogue.css">
	</link>
  </head>    
  <body>   
    <table width="800" border="0"><!--1200-->
     <tr><td colspan="2" height="100">
      <!-- banner table -->
      <xsl:call-template name="banner"/>            
     </td></tr>
     <tr>
      <td width="60%">
       <!--product category tables -->
       <xsl:apply-templates select="PRODUCT_CATEGORIES"/>
      </td>
      <td valign="top" width="200">
       <!--promotion table-->
       <xsl:apply-templates select="PROMOS"/>
      </td>
     </tr> 
    </table>

  </body>
 </html>
</xsl:template>

<xsl:template match="PROMOS">
 <table border="0">
  <xsl:apply-templates select="PROMO"/>          
 </table>
</xsl:template>

<xsl:template match="PROMO">
 <tr>
  <td width="100" height="100">
   <a>
    <xsl:attribute name="href">prod-details.xsql?product_id=<xsl:value-of select="PRODUCT_ID"/></xsl:attribute>
    <img width="200" height="150" >
     <xsl:attribute name="src"><xsl:value-of select="URL"/></xsl:attribute>
    </img>
   </a>
  </td>
  </tr>
</xsl:template>

<xsl:template match="PRODUCT_CATEGORIES">
 <table border="0">
  <tr>
   <td valign="top">
    <table valign="top" width="300" border="0"> 
     <xsl:apply-templates select="CATEGORY[position() &lt;= (last() div 2) ]"/>       
    </table>         
   </td>
   <td valign="top">
    <table valign="top" width="300" border="0">
     <xsl:apply-templates select="CATEGORY[position()>(last() div 2) ]">
      <xsl:with-param name="align-val">right</xsl:with-param>
     </xsl:apply-templates>
    </table>      
   </td>
  </tr>
 </table> 
</xsl:template>

<xsl:template match="CATEGORY">
  <xsl:param name="align-val">left</xsl:param>
  <tr>
   <td>
    <xsl:attribute name="align">
     <xsl:value-of select="$align-val"/>
    </xsl:attribute>
    
        
    <span class="category">
     <a>
      <xsl:attribute name="href">prod-cat.xsql?category_id=<xsl:value-of select="ID"/></xsl:attribute>
     <b><xsl:value-of select="NAME"/>. </b>
     
     <xsl:value-of select="DESCRIPTION"/>.
     </a>
     <i><xsl:apply-templates select="PRODUCTS"/></i>        
    <a>
      <xsl:attribute name="href">prod-cat.xsql?category_id=<xsl:value-of select="ID"/></xsl:attribute>
     . . .
     </a>
    </span>
   </td>
  </tr>
 
</xsl:template>

<xsl:template match="PRODUCTS">
 <xsl:for-each select="PRODUCTS_ROW[position() &lt;3]">
  <a>
   <xsl:attribute name="href">prod-details.xsql?product_id=<xsl:value-of select="./ID"/></xsl:attribute>
   <xsl:value-of select="./NAME"/>
   <xsl:if test="position() &lt; last()">, </xsl:if>
  </a>
 </xsl:for-each> 
</xsl:template>

</xsl:stylesheet>