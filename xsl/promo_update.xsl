<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    
      <html>
        <head>
          <link rel="stylesheet" type="text/css" name="catalogue"
                href="../css/catalogue.css"/>
<script  src="../JavaScripts/checkXML.js" language="JavaScript"/>
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
<h1> Please enter           <u>              <i>always the full details</i>            </u> of the promotion!</h1>
<hr/>
          <form id="theform" action="promo_update2.xsql" method="post">
            <table width="100%" height="100" border="0">
              <tr>
                <td>Product ID number:</td>
                <td>
                  <input type="text" name="product_ID" size="50" mandatory="yes" >
	 <xsl:variable name="product_ID" select="product_ID"/>
	<xsl:attribute name="value"><xsl:value-of select="/page/PROMOS/PROMO/PRODUCT_ID"/></xsl:attribute>
                </input>
	</td>
              </tr>
              <tr>
                <td>Product name:</td>
                <td>
                  <input type="text" name="name" size="160" maxlength="100">
                 <xsl:variable name="name" select="name"/>
	<xsl:attribute name="value"><xsl:value-of select="/page/PROMOS/PROMO/NAME"/></xsl:attribute>
	</input>
	</td>
              </tr>
<tr>
                <td>Number of promotion ID :</td>
                <td>
                  <input type="text" name="ID" >
	 <xsl:variable name="ID" select="ID"/>
	<xsl:attribute name="value"><xsl:value-of select="/page/PROMOS/PROMO/ID"/></xsl:attribute>
	</input>
                </td>
              </tr>	

              <tr>
                <td>Number of promotion slot :</td>
                <td>
                  <input type="text" name="slot" >
	 <xsl:variable name="slot" select="slot"/>
	<xsl:attribute name="value"><xsl:value-of select="/page/PROMOS/PROMO/SLOT"/></xsl:attribute>
	</input>
                </td>
              </tr>
              <tr>
                <td>Promotion URL:</td>
                <td>
                  <input type="text" name="URL"
                        size="40">
		 <xsl:variable name="URL" select="URL"/>
		<xsl:attribute name="value"><xsl:value-of select="/page/PROMOS/PROMO/URL"/></xsl:attribute>
	</input>
	  </td>
              </tr>
              <tr>
                <td>Promotion status:</td>
                <td>
                <select name="status">
	 	<xsl:variable name="status" select="status"/>
	 	 <option value="ACTIVE">active</option> 
		<option value="INACTIVE">inactive</option>
	</select>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center">
                  <input type="reset" name="resetButton"
                         value="Reset all fields to default values!"/>

&nbsp;&nbsp;
		 
                  
                  <input type="submit" name="submitButton" value="Save!" onclick="f()"/>
                </td>
              </tr>
            </table>
          </form>
	<hr/>
          <a href="home.xsql">Go to the e-Mall Homepage! </a>

&nbsp;&nbsp;
	 
          
          <a href="prod_delete.xsql">  Delete a product!</a>

&nbsp;&nbsp;
	 
          
          <a href="prod_insert.xsql">  Insert a new product!</a>

&nbsp;&nbsp;
	 
          
          <a href="price-editor-search.xsql">  Change the price of a product!</a>
        </body>
      </html>
    
  </xsl:template>
</xsl:stylesheet>
