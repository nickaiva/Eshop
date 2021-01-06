<?xml version="1.0" encoding="UTF-8"?>
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
        <link rel="stylesheet" type="text/css" name="catalogue" href="../css/catalogue.css">
	</link>
        <table width="100%" height="40" cellpadding="0" cellspacing="0">
          <tr>
            <td>
              <!--IMG src="../images/Infote.gif"/-->
            </td>
          </tr>
          <table/>
        </table>
        <h1>Login page </h1>
       <script type="text/javascript" language="JavaScript1.1">
// This function is used to check whether the username and
// password are entered.
   function validate(thisForm) {
	var usrName = thisForm.username.options[thisForm.username.selectedIndex].value;
	var passwrd = thisForm.password.value;
	if (usrName == "" || (usrName == null))  {
		alert("User Name can not be blank");
		thisForm.username.focus();
		return false;
	  }
	if (passwrd == "" || (passwrd == null))  {
		alert("Password can not be blank");
		thisForm.password.focus();
 		return false;   
	}
     }    </script>
      </head>
      <hr/>
      <body bgcolor="#ffcf00">
	<img src="../images/sperrbezirk.jpg" alt="sign" height="205" width="250" align="right" />
       <h2>Instructions</h2>
      <ol>
        <li>Please type your usernane.</li>
        <li>Next, please  type your password and click on enter!</li>
      </ol>  
        <form name="form1" action="login.xsql" method="post"> <!--j_security_check-->
          <table>
            <tr>
              <td>
	Username:
	</td>
              <td>
                <input type="text" name="username" value="momnpop" size="40" 
                       maxlength="50"/>
              </td>
            </tr>
            <tr>
              <td>
 	 Password:
	</td>
              <td>
                <input type="password" name="password" value="" size="40"
                       maxlength="50"/>
              </td>
            </tr>
            <br/>
            <tr>
              <td colspan="2" align="center">
                <input type="reset" name="Καθαρισμός" value="Reset"/>

&nbsp;
                
                <input type="submit" name="Είσοδος" value="Enter"
                       onsubmit="return validate(this)"/>
              </td>
            </tr>
          </table>
        </form>
        <hr/>
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
