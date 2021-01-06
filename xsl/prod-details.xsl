<?xml version = '1.0' encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="no" />

<xsl:include href="banner.xsl"/>
<xsl:include href="cat-nav.xsl"/>
<xsl:include href="product-xml.xsl"/>
<xsl:template match="/prod-details">
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
      <td valign="top" width="500">
       <table>
        <tr><td>
        <a href="home.xsql">Home</a>: 
        <a>
         <xsl:attribute name="href">prod-cat.xsql?category_id=<xsl:value-of select="//CATEGORY_ID"/>&amp;</xsl:attribute>         
         <xsl:value-of select="//CATEGORY_NAME"/>
        </a>
        
        
        
        </td></tr>
        <tr><td>
         <table width="500">          
          <xsl:apply-templates select="PRODUCT-SET/DETAILS"/>                
         </table>
        </td></tr>
       </table>
      </td>
     </tr> 
    </table>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="PRODUCT-SET/DETAILS">
  <tr>
   <td align="left">
    <span class="product-name">
     <xsl:value-of select="NAME"/>
    </span>
   </td>
   <td align="right">
    <span class="product-price">
     €<xsl:value-of select="PRICE"/>
    </span>
   </td>
  </tr>
  <tr><td colspan="2">
   <xsl:choose>
    <xsl:when test="WIDTH>100">
     <xsl:apply-templates select="IMAGE_URL">
      <xsl:with-param name="align-var">top</xsl:with-param>
     </xsl:apply-templates>   
    </xsl:when>
    <xsl:otherwise>
     <xsl:apply-templates select="IMAGE_URL"/>
    </xsl:otherwise>  
   </xsl:choose>
   <xsl:apply-templates select="//product/*"/>
  </td></tr> 
 </xsl:template>

 <xsl:template match="IMAGE_URL">
  <xsl:param name="align-var">right</xsl:param>
  
  <xsl:if test="$align-var='top'">
    <xsl:text disable-output-escaping="yes">&lt;center&gt;</xsl:text>
  </xsl:if>
  <img>
   <xsl:attribute name="align"><xsl:value-of select="$align-var"></xsl:value-of></xsl:attribute>
   <xsl:attribute name="height"><xsl:value-of select="../HEIGHT"/></xsl:attribute>
   <xsl:attribute name="width"><xsl:value-of select="../WIDTH"/></xsl:attribute>
   <xsl:attribute name="src"><xsl:value-of select="."/></xsl:attribute>
  </img> 
  <xsl:if test="$align-var='top'">
    <xsl:text disable-output-escaping="yes">&lt;/center&gt;</xsl:text>
  </xsl:if>
 </xsl:template>

</xsl:stylesheet>
