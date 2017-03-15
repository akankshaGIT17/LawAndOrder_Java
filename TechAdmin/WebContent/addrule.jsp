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
<jsp:useBean id="db" class="database.dncon" />
<jsp:include page='top.jsp' flush="false"></jsp:include>
<br /><br />
<%
try 
	{ 
		db.connect();
		
		String section=request.getParameter("section");
		
		String rule=request.getParameter("rule_name");
		String action=request.getParameter("action");
		String flag=request.getParameter("flag");
		
		db.updateSQL("insert into sakansha.lawacts(id,section,name,action,flag,time) values ((select max(id)+1 from sakansha.lawacts),'"+section+"','"+rule+"','"+action+"',"+flag+",current_timestamp)");       
      
       
   		
   		out.println("Laws and acts added");
   		db.close();
     }
          
catch(Exception e) { 
    out.println("Your query is not working"+e.getMessage());        
     }  
     

  

%>
<jsp:forward page="laws.jsp">	<jsp:param name="add" value="Rule / Act added. Police officer may use this rule or act now." /></jsp:forward>

</body>
</html>