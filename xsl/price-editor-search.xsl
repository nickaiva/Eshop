<?xml version = '1.0' encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8"/>
 <xsl:template match="/prod-search | /prod-update">
  <html>
   <head>
    <title>Price Editor Search</title>
    <SCRIPT LANGUAGE="JavaScript">    
          
      <![CDATA[        
       <!--
       
      ]]> 
      
      var numProducts=<xsl:value-of select="count(//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT)"/>; 
      var firstProductName='<xsl:value-of select="//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT/PRODUCT_NAME[position()=1]"/>';
      
      <![CDATA[
      
      function onLoadMethod() {
       //alert('numProducts: '+numProducts);
       //alert('firstProductName: '+firstProductName);
      }
       
      function validatePrice(callingElement,product_name) {
       var validChars="0123456789.";
             
       valid="yes";
       for (var i=0;i<callingElement.value.length;i++) {
        
        if (validChars.indexOf(callingElement.value.substring(i,i+1))==-1) {
         valid="no";
         break;
         }
        }
        if (valid=="no") {
         alert('The price for '+product_name+' is invalid.\n Valid examples: 33.33, 20');
         //callingElement.value=callingElement.form.original_price.value;
        return false;
        } else {
         return true;
        }
       }

      function submitForm(theForm) {
      
       if (validatePrice(theForm.new_price,theForm.product_name.value)) {        
        
        return true;
       } else {       
        return false;
       }
      }
     -->
    ]]>    
   </SCRIPT>
    
    
    
   </head>
   <body onLoad="onLoadMethod()" bgcolor="#ffcf00">
    
    <h2>Price Editor Search</h2>
    <form action="price-editor-search.xsql" method="POST">
     Search: <input type="text" name="terms"></input>
     <input type="submit" value="search"></input>
    </form>   
    <h2>Price Search Results</h2>    
    <p>
     
      <xsl:apply-templates select="PRICE_EDITOR_QUERY"/>
     
    </p>
   </body>
  </html>
 </xsl:template> 
 
 <xsl:template match="PRICE_EDITOR_QUERY">  
   <table>
    <th>Name</th><th>Category</th><th>Price</th>
    <xsl:apply-templates select="PRICE_EDITOR_PRODUCT"/>     
   </table>
 </xsl:template>
 
 <xsl:template match="PRICE_EDITOR_PRODUCT"> 
 
 
 
  <form action="price-editor-update.xsql" method="post" onsubmit="return submitForm(this)">
   <xsl:attribute name="name">edit_product_<xsl:value-of select="PRODUCT_ID"/></xsl:attribute>
  <input type="hidden" name="product_id">
   <xsl:attribute name="value"><xsl:value-of select="PRODUCT_ID"/></xsl:attribute>
  </input>
  <input type="hidden" name="original_price">
   <xsl:attribute name="value"><xsl:value-of select="PRODUCT_PRICE"/></xsl:attribute>
  </input>
    <input type="hidden" name="product_name">
   <xsl:attribute name="value"><xsl:value-of select="PRODUCT_NAME"/></xsl:attribute>
  </input>
  <tr>       
   <td>
    <xsl:value-of select="PRODUCT_NAME"/>   
   </td>
   <td>
    <xsl:value-of select="PRODUCT_CAT_NAME"/>
   </td>
   <td>
    
  $<input type="text" name="new_price">    
      <xsl:attribute name="value"><xsl:value-of select="PRODUCT_PRICE"/></xsl:attribute>
      <xsl:attribute name="onChange">validatePrice(this,&quot;<xsl:value-of select="PRODUCT_NAME"/>&quot;)</xsl:attribute></input>
   </td>
   <td>
    <input type="submit" value="save"></input>
   </td>
  </tr>
  </form>
 </xsl:template>
</xsl:stylesheet> 