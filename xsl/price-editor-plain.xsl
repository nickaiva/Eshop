<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 <xsl:param name="terms"></xsl:param>
 <xsl:param name="updated_product"></xsl:param>

 <xsl:template match="/prod-search | /price-update | /price-editor-dummy">
  <html>
   <head>
    <title>Price Editor Search</title>
    <SCRIPT LANGUAGE="JavaScript">    
          
      <![CDATA[        
       <!--        
               
      var lockUI="no";
      
      function lockCheck() {      
       if (lockUI=="yes") {
        alert('Updating the database. Please wait.');
        this.focus();       
        }
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
        
        var decimalPos=callingElement.value.indexOf(".");
        if (decimalPos!=-1 && decimalPos!=callingElement.value.length-3) {
         valid="no";
        }
        
        if (valid=="no") {
         alert('The price for '+product_name+' is invalid.\n Valid examples: 33.33, 20');
         callingElement.value=callingElement.form.original_price.value;
        return false;
        } else {
         return true;
        }
       }

      function submitForm(theForm) {
      
       if (validatePrice(theForm.new_price,theForm.product_name.value)) {        
        lockUI="yes";
        return true;
       } else {       
        return false;
       }
      }
     -->
    ]]>    
   </SCRIPT>
    
    
    
   </head>
   <body>
   
    <xsl:apply-templates select="update-results/xsql-status"/>
    
    <h2>Price Editor Search</h2>
    <form action="price-editor-search.xsql" method="POST">
     Search: <input type="text" name="terms">
              <xsl:attribute name="value"><xsl:value-of select="$terms"/></xsl:attribute> 
             </input>
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
  <input type="hidden" name="terms">
   <xsl:attribute name="value"><xsl:value-of select="$terms"/></xsl:attribute>
  </input>
  
  <tr>       
   <td>
    <xsl:value-of select="PRODUCT_NAME"/>   
   </td>
   <td>
    <xsl:value-of select="PRODUCT_CAT_NAME"/>
   </td>
   <td>
    
    $<input type="text" name="new_price" onFocus="lockCheck()">    
      <xsl:attribute name="value"><xsl:value-of select="PRODUCT_PRICE"/></xsl:attribute>
      <xsl:attribute name="onChange">validatePrice(this,"<xsl:value-of select="PRODUCT_NAME"/>")</xsl:attribute></input>
   </td>
   <td>
    <input type="submit" value="save"></input>
   </td>
  </tr>
  </form>
 </xsl:template>
 
 <xsl:template match="xsql-status">
  <b>
   <xsl:value-of select="@rows"/> row updated for <xsl:value-of select="$updated_product"/>.
  </b>
 </xsl:template>
  
</xsl:stylesheet> 