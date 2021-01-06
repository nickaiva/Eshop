<?xml version = '1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--xsl:param name="DATETIME"/-->

 <xsl:template name="banner">

  <table width="100%" height="100" class="banner-style" border="0">
   <tr>
    <td colspan="2">     
      <span class="banner-title">
      The Mom N' Pop Catalogue       
      </span>            
    </td>
   </tr>
<!-- An extra for the Date-->	
  <tr>
  	<td colspan="2">
	<span class="banner-subtitle">
	<!--xsl:value-of select="/home/ROWSET/ROW/DATETIME"/-->
	<marquee>Call  800 11 00000 to order! </marquee>      
	</span>
    	</td>

  </tr>

   <tr>
    <!--td align="left" valign="top">
      <i>
       <span class="banner-subtitle">
	
       </span>
      </i>
   
    </td-->
	
    <td align="right" valign="top">
    <form action="prod-search.xsql" method="post">
     <span class="banner-subtitle">
      Search for a product: <input name="search_terms" size="30"/> 
      <input type="hidden" name="skip-rows" value="0"/>
      <input type="submit" value="Find!"></input>
     </span>
    </form>
    </td>
   </tr>           
  </table> 
 </xsl:template>

</xsl:stylesheet>