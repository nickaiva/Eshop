<?xml version = '1.0'  encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output  method="html" encoding="UTF-8"/>
<xsl:include href="banner.xsl"/>
 <xsl:param name="terms"></xsl:param>
 <xsl:param name="updated_product"></xsl:param>

 <xsl:template match="/prod-search | /price-update | /price-editor-dummy">
  <html>
   <head>
    <title>Price Editor Search</title>
    <SCRIPT LANGUAGE="JavaScript" >    
          
      <![CDATA[        
       <!--
       
      ]]> 
      
      var numProducts=<xsl:value-of select="count(//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT)"/>; 
      var firstProductName='<xsl:value-of select="//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT/PRODUCT_NAME[position()=1]"/>';
      var firstProductPrice='<xsl:value-of select="//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT/PRODUCT_PRICE[position()=1]"/>';
      var productPriceArray=[
        <xsl:for-each select="//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT/PRODUCT_NAME">
         "<xsl:value-of select="."/>"
         <xsl:if test="position()!=last()">,</xsl:if>
        </xsl:for-each>];
        
       <xsl:for-each select="//PRICE_EDITOR_QUERY/PRICE_EDITOR_PRODUCT">
        var productPrice<xsl:value-of select="PRODUCT_ID"/>=<xsl:value-of select="PRODUCT_PRICE"/>;       
       </xsl:for-each> 
        
      
      <![CDATA[
      
      function onLoadMethod() {
       //alert(' Total number of Products: '+numProducts);
       //alert('The first Product Name is: '+firstProductName);
       var arrayStr="";
       for (var i=0;i<productPriceArray.length;i++) {
        arrayStr=arrayStr+productPriceArray[i];
       }
      // alert("arrayStr: "+arrayStr);
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
         alert('The price for '+product_name+' is invalid!\n Valid examples are:\n a) with  two decimal digits: 33,33 or \n b)  without any decimal digits: 20');
         callingElement.value=callingElement.form.original_price.value;
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
    
    <link rel="stylesheet" type="text/css" name="catalogue" href="../css/catalogue.css"/>
    
   </head>
   <body onLoad="onLoadMethod()" class="backoffice" bgcolor="#ffcf00">
   <xsl:call-template name="banner"/>
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

	<hr/>
	<a href="home.xsql">Go to the e-Mall Homepage! </a>  &nbsp;&nbsp;
	<a href="prod_update0.xsql"> Edit  a product! </a> &nbsp;&nbsp;
	 <a href="prod_delete.xsql">  Delete a product!</a> &nbsp;&nbsp;
	 <a href="prod_insert.xsql">  Insert a new product!</a>


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
    
€    <input type="text" name="new_price">    
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