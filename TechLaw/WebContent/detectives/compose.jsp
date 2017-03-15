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
<script>

function checkform()
	{	

				
					
				if(document.RegistrationForm.to.value.length == 0)			
				{
					alert("Please enter the senders Id");	
					document.RegistrationForm.to.focus();
					return false;
				}
				
			if(document.RegistrationForm.subject.value.length == 0)			
				{
					alert("Please enter the subject");	
					document.RegistrationForm.subject.focus();
					return false;
				}
				if(document.RegistrationForm.msg.value.length == 0)			
				{
					alert("Please enter the message");	
					document.RegistrationForm.msg.focus();
					return false;
				}
				
				
				
		return true;
	}	
</script>
<title>Compose Mail |Law &amp; Order</title>
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
       <% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.ID,i.USERNAME,NAME,SUBJECT_ID from SAKANSHA.SIGNIN as i,SAKANSHA.SUBJECT as k where i.ID="+session.getAttribute("id")+" and k.SUBJECT_ID="+session.getAttribute("id"));
						while(rs2.next())
						{
						%>
       
<center><h1> COMPOSE MAIL </h1></center> 
<table width='100%' border="0" >
	<tr>
		<td >
		<form method="post"     action="composecheck.jsp" onclick="return checkform()" name="RegistrationForm"  id="ecomplaint"  >

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top' align="center">
<tr class="colour">
		<td><font> <%
							out.print(request.getParameter("err")); %></font></td>
<input type="hidden" name="from" value="<%=rs2.getString("USERNAME")%>"/>
<input type="hidden" name="name" value="<%=rs2.getString("NAME")%>"/><%} db.close(); %><% %>
		</tr>
	
	<tr>
		<td valign="top"><b>To (Email ID):</b> </td>
		<td><input type="text" name="to"/></td>
	</tr>
	<tr> 
		<td valign="top"><b>Subject:</b> </td>
		<td><input type="text" name="subject"/></td>
	</tr>
	<tr>
		<td valign="top"><b>Message:</b> </td>
		<td><textarea name="msg" id="f6" cols="40" rows="10"></textarea></td>
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
