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
		String psname=request.getParameter("psname");
		String city=request.getParameter("city");
		String zone=request.getParameter("zone");
		db.connect();
		String options[]=request.getParameterValues("list2");
		
             db.updateSQL("insert into sakansha.policestation(ps_id,name,zone,city) values((select max(ps_id)+1 from sakansha.policestation),'"+psname+"',"+zone+","+city+")"); 
             
             
             for(int i=0;i<options.length;i++)
		{
		
			//Updates officers working police station to this police station
			db.updateSQL("update  sakansha.policejob set working=1,ps=(select max(ps_id) from sakansha.policestation) where p_ip="+options[i]); 
			
		}
		
		String options1[]=request.getParameterValues("list4");
		
		     for(int i=0;i<options1.length;i++)
		{
		
			//Inserts the areas which can be controlled by this police station.
			
			db.updateSQL("insert into sakansha.power values((select max(id)+1 from sakansha.power),(select max(ps_id) from sakansha.policestation),"+options1[i]+")"); 
			
			//Area should marked as assigned so that it will not be listed again.
			
			db.updateSQL("update sakansha.location set assigned=1 where loc_id="+options1[i]);
		}
	         db.close();
     }
          
catch(Exception e) { 
    out.println("Your query is not working"+e.getMessage());        
     }  
     

  

%>
<h2>Success</h2>
<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>