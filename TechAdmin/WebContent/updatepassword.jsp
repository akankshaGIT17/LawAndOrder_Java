<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<html>
<head>
<title>Police Option|Law &amp; Order</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:include page='top.jsp' flush="false"></jsp:include>
<br /><br />

        <script type="text/javascript" language="javascript">
function checkform()
	{
	var form=document.password;
					
  	var str3=document.password.pass1.value;
				if (str3.length==0)
			{ 
				alert("Please enter the Password");
  				document.password.pass1.focus();
  				return false;
  			}
  			if (str3.length<=4)
			{ 
				alert("Password should be more than 4 letters");
  				document.password.pass1.focus();
  				return false;
  			}
  	var str2=document.password.pass2.value;
				if (str2.length==0)
			{ 
				alert("Please enter the Password");
  				document.password.pass2.focus();
  				return false;
  			}
  			if (str2.length<=4)
			{ 
				alert("Password should be more than 4 letters");
  				document.password.pass2.focus();
  				return false;
  			}
	return true;
	}
	</script>
         
<table align=center><tr><td><h1><font color="orange">UPDATE PASSWORD</font></h1></td></tr></table>
<table cellspacing='5' cellpadding="5" width="96%" class="back" style="text-align:left">

					<td width='80%' valign="top">
<table width='100%' border="0" >
	<tr>
		<td >
		<form method="post"     action="updatepasswordcheck.jsp"   id="ecomplaint" name="password" onsubmit="return checkform()">

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top' align="center">
<tr class="colour">
		

	<tr>
		<td valign="top"><b>OLD PASSWORD :</b> </td>
		<td><input type="password" name="pass1"/></td>
	</tr>
	<tr>
		<td><b>NEW PASSWORD : </b></td>
		<td><input type="password" name="pass2"/></td>
	</tr>
	<tr>
	<td></td><td><p style="visibility:hidden;" id="progress"><img id="progress_image" style="padding-left:5px;padding-top:5px;" src="images/ajax-loader.gif" alt="">Please Wait..</img></p> </a></td>
	</tr>
	
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit"class="contSubmit" onclick="return loadSubmit()" value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table></form></td></tr></table>
</td></table>

        <jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>