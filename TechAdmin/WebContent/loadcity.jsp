<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page language="java" import="java.sql.*" %>
	<jsp:useBean id="db" class="database.dncon" />
<html>
<head>
<title>loadcity</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<% response.setDateHeader("Expires",-1);%>
<%

try{
		String responseText=new String("");

		//String Username=(String) request.getParameter("qparam");
			db.connect();

   ResultSet rs = null ; 
		String query="select id,name from sakansha.city ";
		rs = db.execSQL(query);
		responseText+="<span>City</span><span style='margin:42px'>";
		responseText+="<select onchange='javascript:loadofficer(this.value);' name='city'>";
while(rs.next())
		{
			responseText+="<option  value='"+ rs.getString("id") +"'>"+rs.getString("name")+"</option> ";		
		}
	responseText+="</select></span>";
  	out.print(responseText);
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>

</body>
</html>