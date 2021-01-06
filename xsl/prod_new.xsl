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
              <form  action="prod-search.xsql" method="post">
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
          <h1> Please enter the  
            <u>
              <i>full details</i>
            </u>
 of the new product!</h1>
<hr/>
          <form id="theform" action="prod_insert2.xsql" method="post">
            <table width="100%" height="100" border="0">
             <tr>
                <td>Product name:</td>
                <td>
                  <input type="text" name="name" size="160" maxlength="100"
                         value=""/>
                </td>
              </tr>
              <tr>
                <td>Product price:</td>
                <td>
                  <input type="text" name="price" value=""/>
                </td>
              </tr>
              <tr>
                <td>Product image URL:</td>
                <td>
                  <input type="text" name="image_URL"
                         value="/xsql/momnpop/images/filename.jpg" size="40"/>
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Product image width in pixels:
                  <input type="text" name="width" value="" size="10"/>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Product image height in pixels:
                  <input type="text" name="height" value="" size="10"/>

                </td>
               </tr>
              <tr>
                <td>Product category ID number:</td>
                <td>
	 
	  <select name="category_ID">
	 <xsl:for-each select="page/PRODUCT_CATEGORIES/CATEGORY">
                <xsl:variable name="ID" select="ID"/>
	
	<option ><xsl:attribute name="value"><xsl:value-of select="$ID"/></xsl:attribute>
	<xsl:value-of select="NAME"/></option>	
                
	           
	</xsl:for-each>  
	</select>
                </td>
              </tr>
              <tr>
                <td>Product documentation in XML:</td>
                <td>
                  <textarea name="doc" rows="15" cols="130"
                            value="Type XML here!" style="width:100%"
                            maxlength="4000">
                <product>
                      <summary>
                       Made of fine velvet and silk!
                      </summary>
                      <description>
        		Available colours are brown, black and  white.
        		</description>
                      <dimensions>
                        <long-val>0,35</long-val>
                        <long-unit>metres</long-unit>
                        <wide-val>0,35</wide-val>
                        <wide-unit>metres</wide-unit>
                        <tall-val>0,35</tall-val>
                        <tall-unit>metres</tall-unit>
                      </dimensions>
                      <clothing-size-list>
                        <size>
			Available in stock currently in the following sizes: Small, Medium, Large and Extra Large. 
			Any other sizes can be delivered on special orders, upon formally written request.
                        </size>
                      </clothing-size-list>
                    </product>
                  </textarea>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center">
                  <input type="reset" name="resetButton" value="Reset all fields to default values!"/>&nbsp;&nbsp;
                  <input type="submit" name="submitButton" value="Save!" onclick="f();" />
                </td>
              </tr>
            </table>
          </form>
<hr/>
          <a href="home.xsql">Go to the e-Mall Homepage!	 </a>






&nbsp;&nbsp;
	
          
          
          
          
          
          
          <a href="prod_update0.xsql">  Edit  a product! </a>






&nbsp;&nbsp;
	 
          
          
          
          
          
          
          <a href="prod_delete.xsql">  Delete a product!  </a>






&nbsp;&nbsp;
	  
          
          
          
          
          
          
          <a href="price-editor-search.xsql">  Change the price of a product!</a>
        </body>
      </html>
  
  </xsl:template>
</xsl:stylesheet>
