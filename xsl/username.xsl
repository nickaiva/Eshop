<?xml version = "1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="xsql-error.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="count(//xsql-error)>0">
        <html>
          <head>
          </head>
          <body>
            <xsl:apply-templates select="//xsql-error"/>
          </body>
        </html>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="/page"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="/page">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" name="catalogue"
              href="../css/catalogue.css">
        </link>
        <table width="100%" height="40" cellpadding="0" cellspacing="0">
          <tr>
            <td >
              <!--IMG src="../images/Infote.gif"/-->
            </td>
          </tr>
          <table/>
        </table>
        <h1>Welcome to page management  <xsl:value-of select="//username"/>!</h1>
        <!--script src="../JavaScripts/check.js" language="JavaScript"/-->
      </head>
      <hr/>
      <body bgcolor="#ffcf00">
        <h2>Instructions</h2>
        <ol>
          <li>You can update, delete or insert new<i> products</i>!</li>
          <li>You can update, delete or insert new<i> categories</i> of products!</li>
          <li>You can <i>only</i> update a promotion!</li>
        </ol>
        <hr/>
        <h2>Management of pages</h2>
        <p>Choose by clicking the liks below!</p>
        <table border="0">
                   
          <tr bgColor="yellow" height="40">
              <td>
              <a href="promo_update0.xsql">
                <b>Update a promotion! </b>
              </a>
            </td>
            <td>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="prod_update0.xsql">
        <b>Update, delete or insert  a new product! </b>
        </a>
            </td>
            <td>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="cat_update0.xsql">
        <b>Update, delete or insert  a new category! </b>
        </a>
            </td>
          </tr>
        </table>
        <p>Διάρκεια: &nbsp;
          
          <xsl:value-of select="number(@xsql-timing)div number(1000)"/>

 &nbsp; sec</p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
