<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
     <xsl:output method="html" indent="no"/>
  
<xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" name="catalogue"
              href="../css/catalogue.css"/>
	 <script  src="../JavaScripts/checkField.js" language="JavaScript"/>
           
      </head>
      <table width="100%" height="100" class="banner-style" border="0">
        <tr>
          <td colspan="2">
            <span class="banner-title">
      The Mom N' Pop e-Mall       
      </span>
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            <i>
              <span class="banner-subtitle">
        Edit the Catalogue
       </span>
            </i>
          </td>
          <td align="right" valign="top">
            <form action="prod-search.xsql" method="post">
              <span class="banner-subtitle">
      Search for a product: 
                
                <input name="search_terms" size="30"/>
                <input type="hidden" name="skip-rows" value="0"/>
                <input type="submit" value="Find!">
                </input>
              </span>
            </form>
          </td>
        </tr>
      </table>
      <body class="backoffice" bgcolor="#ffcf00">
        <xsl:if test="//xsql-error">
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
	<h1> Please enter 
          
          <i>  the promotion ID number  </i>

    you wish to edit!</h1><p>It must be less than 2!</p>
<hr/>
        <form  name="form1" action="promo_update.xsql" method="post">
          <table width="100%" height="100" border="0">
            <tr>
              <td>Promotion ID number:</td>
              <td>
                <input type="text" name="ID" size="50" mandatory="yes" value=""/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <input type="submit" name="submitButton" value="Edit it!"  onclick="butCheckForm_onclick()"/>


	&nbsp;&nbsp;	&nbsp;
		
                
                <input type="reset" name="reset" value="Clear!"/>
              </td>
            </tr>
          </table>
        </form>
	<hr/>
        <a href="home.xsql">Go to the e-Mall Homepage! </a>

 &nbsp;&nbsp;
	
        
        <a href="prod_delete.xsql"> Delete  a product! </a>

&nbsp;&nbsp;
	 
	 
        
        <a href="prod_insert.xsql">  Insert a new product!</a>

&nbsp;&nbsp;
	 
        
        <a href="price-editor-search.xsql">  Change the price of a product!</a>

&nbsp;

</body>
    </html>

  </xsl:template>
</xsl:stylesheet>
