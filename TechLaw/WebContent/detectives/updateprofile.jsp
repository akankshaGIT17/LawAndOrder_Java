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

<title>Update Profile | Law &amp; Order </title>
<jsp:useBean id="db" class="database.dncon" />
<jsp:include page="includehead.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/othervalids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script></head>

<body>

<script type="text/javascript" language="javascript">
function checkform()
	{	
			var form=document.RegistrationForm;
			var msg = validateField(document.RegistrationForm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert("Enter Valid Email ID");	
					document.RegistrationForm.email.focus();
					return false;
				}
				var str1=document.RegistrationForm.password.value;
				if (str1.length==0)
			{ 
				alert("Please enter the password");
  				form.password.focus();
  				return false;
  			}
			if(str1.length<6)
			{
				alert("Password should be atleast six characters");
  				form.password.focus();
  				return false;
			}
			var str2=document.RegistrationForm.repassword.value;
				if (str2.length==0)
			{ 
				alert("Please Re-enter the password");
  				form.repassword.focus();
  				return false;
  			}
			if(str2!=str1)
			{
				alert("Password does not match with previously typed one");
  				form.repassword.focus();
  				return false;
			}			
			var msg = validateField(document.RegistrationForm.name,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.fathername,'NAME','1','50','Father Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.fathername.focus();
					return false;
				}
				
				
				
				if(document.RegistrationForm.profession.selectedIndex<1)
				{
					alert("Select your Occupation");
					document.RegistrationForm.profession.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.addressLine1,'STRING','5','200','Address Line-1','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.addressLine1.focus();
					return false;
				}
				var msg1 = validatePincode(document.RegistrationForm.pincode,'Pincode',true,6);
				if(msg.length > 0)			
				{
					alert(msg1);	
					document.RegistrationForm.pincode.focus();
					return false;
				}
				if(document.RegistrationForm.area.selectedIndex<1)
				{
					alert("Select your area");
					document.RegistrationForm.area.focus();
					return false;
				}
				if(document.RegistrationForm.bg.selectedIndex<1)
				{
					alert("Select your Blood Group");
					document.RegistrationForm.bg.focus();
					return false;
				}
				if(document.RegistrationForm.proof.selectedIndex<1)
				{
					alert("Select your Proof");
					document.RegistrationForm.proof.focus();
					return false;
				}		
		return true;
	}	
</script>
<!--Script ends-->
<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="signin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}
 %>

        <form name="RegistrationForm" method="post" onsubmit="return checkform()" action="updateprofilecheck.jsp" >
        <table width='100%' border="0" >
	<tr>
		<td >
		
			<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				<tr>
					<td colspan="2" class='colour' style='text-align:center'><h2>
Update Your Profile
</h2></td>
					
				</tr>
				<tr>
					<td colspan="2"><strong>You can update your information.</strong></td>
					
				</tr>
				<tr>
					<td style="width: 140px" >E Mail ID : </td>
					<td><input type='text' name='email' value=""  id="f1" maxlength='35'  /></td>
				</tr>
				<tr>
					<td></td>
					<td><span>On update of your id your username will also change.</span> </td>
				</tr>
				
				
				
</table>
<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
<fieldset>
						
<tr class="colour">
		<td colspan="4"><b>Personal Information</b></td>
	</tr>

	<tr>
		<td>Maritial Status:<span class='style3'>*</span></td>
		<td ><input type="radio" name="maritalstatus" value="2"/><label for="f41">Married</label></td>
		<td><input type="radio" name="maritalstatus" value="1" checked=checked/><label for="f41">Single</label></td>

	</tr>
	<tr>
		<td>Landline Number</td>
		<td><input type="text" name="stdcode" maxlength="6"	style="width: 60px" value="91"/> <input type="text" name="phoneno"
			maxlength="8" style="width: 85px"
			title="Enter phone no as mentioned below" value=""/></td>
		<td>Mobile Number</td>
		<td><input type="text" name="countrycode" readonly="readonly" maxlength="2" style="width: 22px" value="91"/> <input type="text" name="mobileno" value="" maxlength="10" style="width: 120px" title="Enter Mobile no as mentioned below"/></td>
	</tr>

	<tr>
		<td></td>
		<td>STD</td>
		<td></td>
		<td>Country</td>
	</tr>
	
</table>
<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
	<tr class="colour">
		<td colspan="4"><b>Residential Information</b></td>
	</tr>
	<tr>
		<td style="width: 120px">Adderess: <span class='style3'>*</span></td>
		<td><input type="text" name="addressLine1" maxlength="200" value=""			title="Enter your plot no and street address"/></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="text" name="addressLine2" maxlength="200"
			title="Location"/></td>
	</tr>
	<tr>
		<td>Pincode:<span class='style3'>*</span></td>
		 <td><input type="text" name=pincode maxlength="6" onblur="loadarea(this.value)"  value="" /> 
      <script>
      	document.RegistrationForm.year.value=<% %>
      	document.RegistrationForm.profession.selectedIndex=<% %>
 		
      	document.RegistrationForm.date.value=<%  %>
      	
      	loadarea(document.RegistrationForm.pincode.value);
      	setTimeout("bb()",1000);
      	
      	function bb()
      	{
      	document.RegistrationForm.area.value=<% %>
      	document.RegistrationForm.bg.selectedIndex=<% %>
      	
      	}
      </script>
	</td>
		 <td>Area : <span class='style3'>*</span></td>
		 <td>
	<span id='arealistDIV'><select name="area"><option value="1">Enter pin first</option></select></span>
	</td>
	</tr>
	<tr>
		
		<td>State:<span class='style3'>*</span></td>
		<td><input value='Haryana' readonly="readonly"/>
		</td>
		
	</tr>

	
	

</table>
<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
	<tr>
		<td colspan="2">Enter Verification Code</td>
	</tr>
	
	<tr>
		<td valign="top">
			<span id="leftDIV"></span>
		</td>
		<td>
			<span id="rightDIV"></span>
		</td>
	</tr>
	<tr>
		<td><img id="image" src="../captcha.jsp"/><br/><a href="#" onclick="document.getElementById('image').src = '../captcha.jsp?sid=' + Math.random(); return false">Reload image</a></td>
		<td><input type='text' maxlength="5" name='captcha'/> <span class="style3">Not Case sensititve ( ECOPS=ecops)</span></td>
	</tr>
	
	
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Update"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table>
</td>


</tr>
</filedset>
</table>
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
