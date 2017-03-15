<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />
<html>
<head>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script language="JavaScript" src="techfiles/selectbox.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/prototype.js"></script>
<title>Police Option|Law &amp; Order</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:include page='top.jsp' flush="false"></jsp:include>
<br /><br /><script>
function changebelow(a)
{

	if(a==1||a==2)
	{
		
	document.getElementById("sel1").innerHTML="";
	document.getElementById("sel2").innerHTML="";
	document.getElementById("sel3").innerHTML="";
	}
	else if(a>2)
	{
	document.getElementById("sel1").innerHTML="<span>	<input type='radio'  value='1' onclick='city1()' name='corz' />City </span><span ><input type='radio' value='2' onclick='zone()' name='corz' />Zone</span>";
	
	}
	return;
}
function city1()
{
city();
document.getElementById("sel3").innerHTML="";
}
function zone()
{
document.getElementById("sel3").innerHTML="<span>Zone</span><span style='margin-left:35px;' id='zoneDIV'><select name='zone' style='width:175px'>	<option value='0'>Select</option><option value='1'>North</option><option value='2'>Central</option>	<option value='3'>Western</option><option value='4'>Southern</option>	</select></span>";
}


// Validation Script End 


</script>


<br />
<br/><center><h2>Add A Officer</h2></center>
<form name="RegistrationForm"  method="post" action="addofficercheck.jsp" onsubmit="return checkform()">
<fieldset >
<legend>Add a police officer</legend>
<table style="text-align:left" class="back" >
		<tr>
		<td>E-mail Id
		</td>
		<td><input name="email" maxlength="35" onblur="validateusername(this.value)"  style="width:175px"/> 
		</td>
	</tr>
	<tr>
	
		<td>Designation</td>
		<td>
			<div id='designationDIV' >
				<select name='designation' style="width:175px" id="designation" onchange=" changebelow(this.value)" >
				<option value="0">Select</option>
				<%
				db.connect();
				ResultSet rs=null;
				rs=db.execSQL("select id,name from sakansha.designation");
				while (rs.next())
				{
				%><option value="<%out.print(rs.getString("id")); %>"><%out.print(rs.getString("name"));%></option><%
				}				
				 %>
				</select>
			</div>
		</td>
	
	</tr>

	<tr>
		<td></td>
		<td>This will be designation with which the employee will be appointed</td>
	</tr>
		<tr><td></td><td >
	<div  id="sel1">

	</div>
	</td></tr>
	<tr >
	<td colspan="2">
	<div id="sel3"></div>
	</td>
		
	</tr>
	<tr >
	<td colspan="2"><div id="sel2"></div></td>
	</tr>
	
	
	
	
	
	
	<tr>
		<td colspan='2'><span id="usernameDIV"></span>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value='Create' />
			<input type="reset" value='Reset' />
		</td>
	</tr>
<tr><td colspan="2"  >
	<%
	if(request.getParameter("add")!=null)
	{
	out.print(request.getParameter("add")+"<br/> The officer will be getting an confirmation email which contains the confirmation link and the password.");
	}
	else
	{
	
	}
	 %>
	 </td></tr>
	 </table>
</fieldset>	
</form>
<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>