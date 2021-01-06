<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="xsql-error.xsl"/>
<xsl:include href="banner.xsl"/>
<xsl:include href="cat-nav.xsl"/>

<xsl:param name="search_terms"></xsl:param>
<xsl:param name="row-count"></xsl:param>
<xsl:param name="skip-rows">0</xsl:param>
<xsl:param name="max-rows"></xsl:param>

<xsl:template match="/">

 <xsl:choose>
  
  <xsl:when test="count(//xsql-error)>0">
   <html>
   <head></head>
   <body>
   <xsl:apply-templates select="//xsql-error"/>
   </body>
   </html>
  </xsl:when>
  
  <xsl:otherwise>
   <xsl:apply-templates select="/prod-search"/>
  </xsl:otherwise>
  
 </xsl:choose>

</xsl:template>



<xsl:template match="/prod-search">
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
        <tr><td><a href="home.xsql">Catalogue Home Page</a></td></tr>
        <tr><td>Search Results For: <xsl:value-of select="$search_terms"/></td></tr>
        <tr><td>
       <!--search results-->
       <xsl:apply-templates select="PRODUCT_SEARCH | xsql-error"/>
       </td></tr>
       <tr><td colspan="3">
        <xsl:call-template name="paging"/>       
       </td></tr>
       </table>
      </td>
     </tr> 
     <tr>
      <td></td>
      <td>
      
      </td>
     </tr>
    </table>
   
  </body>
 </html>
</xsl:template>

<xsl:template match="PRODUCT_SEARCH">

 <table class="search-results"  height="100%" width="100%">
  
   <th><span class="search-results">Product</span></th><th>Summary</th><th>Category</th>
   <xsl:apply-templates select="PRODUCT"/>
 </table>
</xsl:template>

 <xsl:template match="PRODUCT">
  <tr>
   <td>   
    <a>
     <xsl:attribute name="href">prod-details.xsql?product_id=<xsl:value-of select="PRODUCT_ID"/></xsl:attribute>
    <xsl:value-of select="PRODUCT_NAME"/>
    </a>
   </td>
   <td><xsl:value-of select="SUMMARY"/></td>
   <td>
    <a>
    <xsl:attribute name="href">prod-cat.xsql?category_id=<xsl:value-of select="CATEGORY_ID"/></xsl:attribute>
   <xsl:value-of select="CATEGORY"/>
   </a>
   </td>
  </tr>
 </xsl:template>

 <xsl:template name="paging"> 
  
  
  <table><tr><td>
   <xsl:choose>
   
    <xsl:when test="number($skip-rows)-number($max-rows)&gt;=0">
     <xsl:call-template name="paging-form">
      <xsl:with-param name="new-skip-rows"><xsl:value-of select="number($skip-rows)-number($max-rows)"/></xsl:with-param>
      <xsl:with-param name="button-text">&lt;&lt;Previous</xsl:with-param>
     </xsl:call-template>
    </xsl:when>
   
    <xsl:otherwise>
     <xsl:call-template name="paging-form">
      <xsl:with-param name="new-skip-rows">-1</xsl:with-param>
      <xsl:with-param name="button-text">&lt;&lt;Previous</xsl:with-param>
     </xsl:call-template> 
    </xsl:otherwise>   
  
   </xsl:choose>
  </td> 
  
  <td>
   <xsl:call-template name="paging-list"/>
  </td>  
  
  <td>
   <xsl:choose>
    
    <xsl:when test="number($skip-rows)+number($max-rows)&lt;number($row-count)">
     <xsl:call-template name="paging-form">
      <xsl:with-param name="new-skip-rows"><xsl:value-of select="$skip-rows+$max-rows"/></xsl:with-param>
      <xsl:with-param name="button-text">   Next&gt;&gt;   </xsl:with-param>
     </xsl:call-template>
    </xsl:when>
    
    <xsl:otherwise>
     <xsl:call-template name="paging-form">
      <xsl:with-param name="new-skip-rows">-1</xsl:with-param>
      <xsl:with-param name="button-text">   Next&gt;&gt;   </xsl:with-param>
     </xsl:call-template>   
    </xsl:otherwise>         
   
   </xsl:choose>    
  </td></tr></table>   

 </xsl:template>

 <xsl:template name="paging-form">
  <xsl:param name="new-skip-rows"></xsl:param>
  <xsl:param name="button-text"></xsl:param>
  <form method="post" action="prod-search.xsql">
   <input type="hidden" name="skip-rows">
    <xsl:attribute name="value"><xsl:value-of select="number($new-skip-rows)"/></xsl:attribute>
   </input> 
   <input type="hidden" name="search_terms">
    <xsl:attribute name="value"><xsl:value-of select="$search_terms"/></xsl:attribute>
   </input>        
   <input type="submit">
    <xsl:attribute name="value"><xsl:value-of select="$button-text"/></xsl:attribute>
    <xsl:if test="$new-skip-rows=-1">
     <xsl:attribute name="disabled">yes</xsl:attribute>
    </xsl:if>
   </input>
  </form> 
 </xsl:template>

 <xsl:template name="paging-list">
  <xsl:param name="counter">0</xsl:param>
  <td>
   <xsl:choose>
     <xsl:when test="number($counter)*number($max-rows)!=number($skip-rows)">
      <xsl:call-template name="paging-form">
       <xsl:with-param name="new-skip-rows"><xsl:value-of select="number($counter)*number($max-rows)"/></xsl:with-param>
       <xsl:with-param name="button-text"><xsl:value-of select="number($counter)+1"/></xsl:with-param>
      </xsl:call-template>
     </xsl:when>
    
     <xsl:otherwise>
      <xsl:call-template name="paging-form">
       <xsl:with-param name="new-skip-rows">-1</xsl:with-param>
       <xsl:with-param name="button-text"><xsl:value-of select="number($counter)+1"/></xsl:with-param>
      </xsl:call-template>   
     </xsl:otherwise>            
    </xsl:choose>         
   </td>
      
   <xsl:if test="number($counter+1)*number($max-rows)&lt;number($row-count)">
    <xsl:call-template name="paging-list">
     <xsl:with-param name="counter"><xsl:value-of select="number($counter)+1"/></xsl:with-param>
    </xsl:call-template>
   </xsl:if>
   
 </xsl:template>

</xsl:stylesheet>
