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
        
        <form name="RegistrationForm" method="post" onsubmit="" action="updateimagecheck.jsp" enctype="multipart/form-data" >
        <table align=center>
        <tr>
        <td >Upload You Image: <span class='style3'></span></td>
		 			<td><input type="file" name="photo" /></td>
		 			</tr>
		 <tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Update"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
		 			</table></form>
		 			
		 			
		 			<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>