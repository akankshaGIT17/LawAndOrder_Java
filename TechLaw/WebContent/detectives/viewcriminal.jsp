<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />

<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script>
<head>
<title>View Criminal</title>
	<jsp:include page="includehead.jsp" flush="false"></jsp:include>
	<script type="text/javascript">
             function loadSubmit() {
var ProgressImage = document.getElementById('progress_image');
document.getElementById("progress").style.visibility = "visible";
setTimeout("ProgressImage.src = ProgressImage.src",100);
return true;
} </script>
	<link href="../css/style2.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    
</head>
<body>
<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="signin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}
 %>
 <script type="text/javascript" language="javascript">
function checkform()
	{
	var form=document.password;
					
  	var str3=document.password.id1.value;
				if (str3.length>5)
			{ 
				alert("ID is less than 5");
  				document.password.pass1.focus();
  				return false;
  			}
  			if (str3.length<=0)
			{ 
				alert("Enter Proper ID");
  				document.password.pass1.focus();
  				return false;
  			}
  			if (str3.length="#@!%^&*()" || str3.length="#")
			{ 
				alert("Enter Proper ID");
  				document.password.pass1.focus();
  				return false;
  			}
  	var str2=document.password.id2.value;
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
         
<center><h1>View Criminal  </h1></center> 
<table width='100%' border="0" >
	<tr>
		<td >
		<form method="post"     action="criminalcheck.jsp"   id="ecomplaint" name="password" onsubmit="return checkform()">

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top' align="center">
<tr class="colour">
		<td><font> <%
							out.print(request.getParameter("err")); %></font></td>

		</tr>
	
	<tr>
		<td valign="top"><b>CRIMINAL ID:</b> </td>
		<td><input type="text" name="id1"/></td>
	</tr>
	
	<tr>
	<td></td><td><p style="visibility:hidden;" id="progress"><img id="progress_image" style="padding-left:5px;padding-top:5px;" src="../images/ajax-loader.gif" alt=""></img></p> </td>
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

</div>
		</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; TGMC'12 TechJustice</p>
		<p class="right"><a href="inbox.jsp">Mail</a> | <a href="updateprofile.jsp">Update Profile</a> | <a href="pass.jsp">Update Password</a> | <a href="changepic.jsp">Update Profile Picture</a> </p>
	</div>	
</div>	
</body>
</html>
