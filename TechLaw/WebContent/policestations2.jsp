<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>police station nearest connections</title>



</head>
<body>

<% response.setDateHeader("Expires",-1);%>
<%
String responseText=new String("");
try{
 //out.print("here");
		

		String sel=(String) request.getParameter("q");//out.print("here");
			db.connect();
//out.print("here");
   ResultSet rs = null ; 
   String query="select ID,AREA,ADDRESS,ZONE,CONTACT from SAKANSHA.DISTRICT_PS where ID="+sel+"";
   
	rs=db.execSQL(query);
		while(rs.next())
		{
				
			responseText+="<table   border='0' cellpadding='5%' cellpadding='2%' style='width: 100%' >";
			
			responseText+="<tr ><td colspan='2'><h2> <font color=maroon>Address Of Police Station</font></h3></td></tr>";
			responseText+="<tr><td><b>Adderess: </b></td><td><font color=green><b>"+rs.getString("ADDRESS")+"</b></font></td></tr>";
			responseText+="<tr><td><b>Contact </b> : </td><td><font color=red><b>"+rs.getString("CONTACT")+"</b></font></td></tr>";
		}

	

  	out.print(responseText);
  	db.close();
 
 } 
 catch(Exception e)
	{
		responseText="Error "+e.getMessage();
		out.print(responseText);
	}
	
%>





</body>
</html>
		