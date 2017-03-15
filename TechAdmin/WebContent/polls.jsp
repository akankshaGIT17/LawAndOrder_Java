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
<form name="RegistrationForm" action="addpoll.jsp">
<table width="500px" cellpadding="5" cellpadding="5" class='back' style="text-align:left">
		<tr>
			<td colspan="2"><center><strong>Add Polls</strong></center></td>
		</tr>
		<tr>
			<td valign="top">Questions
			</td>
			<td><textarea name="question"  cols="30" rows="5" > </textarea>
			</td>
		</tr>
		<tr>
			<td><!-- Blank Line Added for visual appearance --></td>
		</tr>
		
		<tr >
			<td >
			Answer 1	
			</td>
			<td>
				<input type='text' name='answer1' maxlength='100'/>
			</td>
		
		</tr>
		<tr >
			<td >
			Answer 2	
			</td>
			<td>
				<input type='text' name='answer2' maxlength='100'/>
			</td>
			
		</tr>
		<tr >
			<td >
			Answer 3 (Optional)
			</td>
			<td>
				<input type='text' name='answer3' maxlength='100'/>
			</td>
			
		</tr>	
			<tr >
			<td >
			Answer 4 (Optional)
			</td>
			<td>
				<input type='text' name='answer4' maxlength='100'/>
			</td>
			
		</tr>
		<tr >
			<td colspan="2"><input type='checkbox' name='check'/>Do you want to make this active poll (Only active poll will be seen in the user's homepage) </td>
			
		</tr>
		<tr>
			<td></td>
			<td></td>
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