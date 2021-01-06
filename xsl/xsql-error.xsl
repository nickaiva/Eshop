<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 
 <xsl:template match="xsql-error">
  <xsl:param name="error-mesg">Error!</xsl:param>

  <p>
   <table border="0" style="background:yellow" width="100%">
         
    <tr><td><h3><xsl:value-of select="$error-mesg"/></h3></td></tr>
    <tr><td>
     <b>XSQL Action Handler:</b> <xsl:value-of select="@action"/>
    </td></tr>    
    <tr><td>
     <b>Code:</b> <xsl:value-of select="@code"/>
    </td></tr>   
    <xsl:apply-templates/>
   </table>
  </p>

 </xsl:template> 
 
 <xsl:template match="message">
  <tr><td><b>Message: </b>  
   <xsl:value-of select="."/> 
  </td></tr>
 </xsl:template> 
   
 <xsl:template match="statement">
  <tr><td><b>Statement: </b>
   <xsl:value-of select="."/>
  </td></tr>
 </xsl:template> 
 
 
 
 
</xsl:stylesheet>