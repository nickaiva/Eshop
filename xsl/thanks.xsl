<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="banner.xsl"/>
  <xsl:param name="updated_product"></xsl:param>
<xsl:template match="/">
  <html>
	<link rel="stylesheet" type="text/css" name="catalogue" href="../css/catalogue.css"/>
	<xsl:call-template name="banner"/>
<h1 class ="backoffice">Your request for: <xsl:value-of select="$updated_product"/> has been submitted!</h1>
   
	
<body bgcolor="#ffcf00"> 	

<!--applet code="DisplayImage.class" width="3000" height="100" /-->

 <xsl:if test="//xsql-error">
<h3>The following errors happened during the transaction:</h3>
  <table style="background:yellow">
  <xsl:for-each select="//xsql-error">  
  <tr>    
  <td><b>Action</b>
</td>  
    <td><xsl:value-of select="@action"/></td>  
  </tr>    <tr valign="top">   
   <td><b>Message</b></td>
      <td><xsl:value-of select="message"/></td>   
 </tr> 
 </xsl:for-each>  </table>
</xsl:if>
 
</body>
<h2>You can also navigate using the bookmarks menu, or click the home button!</h2>
<hr/>
	<a href="home.xsql">Go to the e-Mall Homepage! </a> &nbsp;&nbsp;
	<a href="prod_update0.xsql"> Edit  a product! </a>&nbsp;&nbsp;
	 <a href="prod_delete.xsql">  Delete a product!</a>&nbsp;&nbsp;
	 <a href="prod_insert.xsql">  Insert a new product!</a>&nbsp;&nbsp;
	 <a href="price-editor-search.xsql">  Change the price of a product!</a>
 </html>
 </xsl:template>
</xsl:stylesheet>
