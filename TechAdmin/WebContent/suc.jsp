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
<table align=center><tr><td>
		<img src="images/status.png" width="47" height="47"></img></td>
		<td><h1><font color=green>
	<%
	out.print(request.getParameter("err1"));
	 %></font></h1></td>
		
		
		</tr></table><table align="right"><tr><td><span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span><br /></td></tr></table>
		<br />
		
		<jsp:include page='low.jsp' flush="false"></jsp:include>

</body>
</html>