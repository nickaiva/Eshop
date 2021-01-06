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
 of the new category!</h1>
<hr/>
          <form id="theform" action="cat_insert2.xsql" method="post">
            <table width="100%" height="100" border="0">
             <tr>
                <td>Category name:</td>
                <td>
                  <input type="text" name="name" size="160" maxlength="100"
                         value=""/>
                </td>
              </tr>
              <tr>
                <td>Category description :</td>
                <td>
                  <textarea name="description" rows="15" cols="110"  value="Type XML here!" style="width:100%"
                            maxlength="1000">
          
                  </textarea>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center">
                  <input type="reset" name="resetButton" value="Reset all fields to default values!"/>&nbsp;&nbsp;
                  <input type="submit" name="submitButton" value="Save!" onclick="" />
                </td>
              </tr>
            </table>
          </form>
<hr/>
          <a href="home.xsql">Go to the e-Mall Homepage!	 </a>






&nbsp;&nbsp;
	
          
          
          
          
          
          
          <a href="cat_update0.xsql">  Edit  a category! </a>






&nbsp;&nbsp;
	 
          
          
          
          
          
          
          <a href="cat_delete.xsql">  Delete a category!  </a>






&nbsp;&nbsp;
	  
          
          
          
          
          
          
          <a href="price-editor-search.xsql">  Change the price of a product!</a>
        </body>
      </html>
  
  </xsl:template>
</xsl:stylesheet>
