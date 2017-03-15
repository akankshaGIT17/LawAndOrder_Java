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
<table align="center"><tr><td><img src="images/tick.png" width="85" height="73" /></td>
		
		<td><h4><a href="addofficer.jsp">Add A Police Officer</a></h4></td><td><img src="images/cross.png" width="85" height="73" /></td>
		
		<td><h4>Remove A Police Officer</h4></td></tr></table>
		<table align="center"><tr></tr></table>
		
		<jsp:include page='low.jsp' flush="false"></jsp:include>

</body>
</html>