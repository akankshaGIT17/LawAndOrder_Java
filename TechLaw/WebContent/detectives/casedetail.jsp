<%@page import="java.util.*" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="GENERATOR" content="IBM WebSphere Studio"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="../css/lstyle.css" rel="stylesheet" type="text/css" />
<title>CaseDetails | Law &amp; Order</title>
<jsp:useBean id="db" class="database.dncon" />
<jsp:include page="includehead.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/othervalids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script></head>

<body>
<script type="text/javascript" language="javascript">
function checkform()
	{
	
			
				var str3=document.RegistrationForm.fir.value;
				if (str3==0)
				{
				alert("Please enter FIR number");
				document.RegistrationForm.fir.focus();
  				return false;
  				}
  				if (str3<=4)
				{
				alert("FIR number should be more than 4");
				document.RegistrationForm.fir.focus();
  				return false;
  				}
  				if (str3>15)
				{
				alert("FIR number should be LESS than 15");
				document.RegistrationForm.fir.focus();
  				return false;
  				}
  	var str2=document.RegistrationForm.pass.value;
				if (str2.length==0)
			{ 
				alert("Please enter the Password");
  				document.RegistrationForm.pass.focus();
  				return false;
  			}
  			if (str2.length<=4)
			{ 
				alert("Password should be more than 4 letters");
  				document.RegistrationForm.pass.focus();
  				return false;
  			}
	return true;
	}
	</script>
<h2>Update Case Details</h2>
		<form method="post" action="casedetailcheck.jsp" name="RegistrationForm" onsubmit="return checkform()">            
			<fieldset>
			<legend>Form title</legend>
			<p>Please Enter the fields below :</p>
				<p><label for="f1">FIR Number Of The Case: </label><input type="text" name="fir" id="f1" /></p>
				<p><label for="f2">Password Provided: </label><input type="password" name="pass" id="f2" /></p>
				<input type="submit" value=" Submit " class="btn" />
				</fieldset>
				</form>
					</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; TGMC'12 TechJustice</p>
<p class="right"><a href="inbox.jsp">Mail</a> | <a href="updateprofile.jsp">Update Profile</a> | <a href="pass.jsp">Update Password</a> | <a href="changepic.jsp">Update Profile Picture</a> </p>
	</div>	
</div>	
</body>
</html>

				