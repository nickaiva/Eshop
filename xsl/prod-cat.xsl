<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="banner.xsl"/>
<xsl:include href="cat-nav.xsl"/>
<xsl:template match="/prod-cat">
 <html>     
  <head>
    <link rel="stylesheet" type="text/css" name="catalogue" href="../css/catalogue.css">
    </link>
  </head>    
  <body>   
    <table width="800" border="0">
     <tr><td colspan="2" height="100">
      <!-- banner table -->
      <xsl:call-template name="banner"/>            
     </td></tr>
     <tr>
      <td width="200">
       <!--product category list -->
       <xsl:apply-templates select="product_categories"/>
      </td>
      <td valign="top" width="600">
       <table>
        <tr><td>
        <a href="home.xsql">Home</a>: 
        
         <xsl:value-of select="//CATEGORY_NAME"/>
        
        </td></tr>
        <tr><td>
       <!--search results-->
       <xsl:apply-templates select="PRODUCTS"/>
       </td></tr>
       </table>
      </td>
     </tr> 
    </table>
  </body>
 </html>
</xsl:template>

<xsl:template match="PRODUCTS">

 <table class="search-results" width="100%">
  
   <th><span class="search-results">Product</span></th><th>Summary</th>
   <xsl:apply-templates select="PRODUCT"/>
 </table>
</xsl:template>

 <xsl:template match="PRODUCT">
  <tr>
   <td>   
    <a>
     <xsl:attribute name="href">prod-details.xsql?product_id=<xsl:value-of select="PRODUCT_ID"/>&amp;category_id=<xsl:value-of select="//CATEGORY_ID"/>&amp;</xsl:attribute>
    <xsl:value-of select="PRODUCT_NAME"/>
    </a>
   </td>
   <td><xsl:value-of select="SUMMARY"/></td>   
  </tr>
 </xsl:template>

</xsl:stylesheet>
