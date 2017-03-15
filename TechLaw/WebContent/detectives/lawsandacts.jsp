<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />

<jsp:useBean id="db" class="database.dncon" />
<jsp:include page="includehead.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script></head>
<body>
<center><h1>Law &amp; Acts</h1></center>
<table align=left><tr><td>
<%
			db.connect();
			ResultSet rs=db.execSQL("select * from SAKANSHA.LAWACTS");
			while(rs.next())
			{
			
			 %>
			<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				
				<tr><td style='text-align:left;vertical-align: top'><b><span>Under Section : </span></b><%=rs.getString("section") %></td></tr>
				<tr><td style='text-align:left;vertical-align: top'><strong><font color=red><%=rs.getString("name") %></font></strong></td></tr>
				<tr><td style='text-align:left;vertical-align: top'><b>Law : </b><%=rs.getString("action") %></td></tr>
			
			<%
			}
			db.close();
			 %></table></td></tr></table>
			 
			<jsp:include page="includefoot.jsp" flush="false"></jsp:include>
</body>
</html>
			 