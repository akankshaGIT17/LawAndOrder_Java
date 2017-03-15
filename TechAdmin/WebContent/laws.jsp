<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			msg = validateField(document.RegistrationForm.section,'STRING','5','15','section','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.section.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.rule_name,'STRING','5','50','Name of the rule','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.rule_name.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.action,'STRING','5','150','Details of Action','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.action.focus();
					return false;
				}
			if(document.RegistrationForm.flag.selectedIndex<1)
				{
					alert("Select rule or act");
					document.RegistrationForm.flag.focus();
					return false;
				}
			
	
	return true;
	}	
</script>
<form name="RegistrationForm" action="addrule.jsp" onsubmit="return checkform()" method="post">


<table width="500px" cellpadding="5" cellpadding="5" class='back' style="text-align:left">
		<tr>
			<td colspan="2"><center><strong>Add Rules</strong></center></td>
		</tr>
		<tr>
			<td>Section of the Rule / Act</td>
			<td><input type="text" name="section" maxlength="15"  /> Example : EP Co 302</td>
		</tr>
		<tr>
			<td>Name of the Rule / Act</td>
			<td><input type="text" name="rule_name" maxlength="50"/> Example : POTA</td>
		</tr>
		
		<tr>
			<td valign="top">Action and Punishments
			</td>
			<td><textarea name="action"  cols="30" rows="5" > </textarea>
			</td>
		</tr>
		<tr>
			<td></td>
			<td> Example : Penality of sum of Rs-10000/- or Imprisionment for maximum of 2 years or both</td>
		</tr>
		<tr>
			<td>Rule or Act</td>
			<td>
				<select name='flag'>
					<option value='0'>Select</option>
					<option value='1'>Rule</option>
					<option value='2'>Act</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><!-- Blank Line Added for visual appearance --></td>
		</tr>
		
		
			
		<tr>
			<td><input type="submit" value='Create'  /></td>
			<td><input type="reset" value='Reset'/></td>
		</tr>
		<tr><td colspan="2"  style="font-size: 10pt;color: #0000a0;font-family: aerial;font-weight:bold">
	<%
	if(request.getParameter("add")!=null)
	{
	out.print(request.getParameter("add")+"<br/>");
	}
	else
	{
	
	}
	 %>
	 
	 </td></tr>
	</table>
</form>
<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>