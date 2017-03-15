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

<%
try
{
db.connect();
ResultSet rs=null;
 rs=db.execSQL("select i.agency,a.loc_name,pe.status,i.id,i.time from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe where i.flag=pe.id and i.area=a.loc_id ");
out.print("<table width='98%' cellspacing='0' class='back'  >");
		 out.print("<tr><td style='padding-left:5px'><strong></strong></td><td><strong>Name</strong></td><td><strong>Area</strong></td><td></td><td><strong>Time</strong></td><td><strong>Status</strong></td></tr>");
		out.print("<tr><td colspan='6'><hr/></td></tr>");
				while(rs.next())
				 {
				out.print("<tr style='cursor:pointer' onclick=\"javascript:window.location='seedetective.jsp?id="+rs.getString("id")+"'\"><td style='padding-left:5px'></td><td>"+rs.getString("agency")+"</td><td>"+rs.getString("loc_name")+"</td><td></td><td>"+rs.getString("time")+"</td><td>"+rs.getString("status")+"</td></tr>");		
				out.print("<tr><td colspan='6'><hr/></td></tr>");
						
}
db.close();
				 }
				 catch(Exception e)
				 {
				 out.print(e.getMessage());
				 }
 %>
<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>