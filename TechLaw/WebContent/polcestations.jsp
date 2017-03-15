<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="WEB-INF/theme/Master.css" type="text/css">
<title>loadarea</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />






<% response.setDateHeader("Expires",-1);%>
<%

try{
		String responseText=new String("");
		//String responseText2=new String("");

		String district=(String) request.getParameter("dis");
		//String zone=(String) request.getParameter("zone");
			db.connect();


 
		
 ResultSet rs1=null;
	 rs1=db.execSQL("select a.DISTRICT_ID,a.DISTRICT_NAME,p.ID,p.AREA,p.ZONE,p.ADDRESS,p.CONTACT from SAKANSHA.DISTRICT as a,SAKANSHA.DISTRICT_PS as p where p.ZONE="+district+" and p.zone=a.DISTRICT_ID");
	 responseText+="<select style='width: 150px' name='area' onchange='showdis2(this.value)'>";
	 responseText+="<option value='0'>Select area</option>";
	 while(rs1.next())
	 {
	 responseText+="<option  value='"+ rs1.getString("ID") +"'>"+rs1.getString("AREA")+"</option> ";		
	 }
	 responseText+="</select>";
	 responseText+="<div id='area12'>" + "</div>";

  	out.print(responseText);

		// System.out.print(responseText2);
	  //System.out.print(responseText);
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>





</body>
</html>
		

