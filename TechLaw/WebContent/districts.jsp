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
	 rs1=db.execSQL("select LOC_ID,LOC_NAME from SAKANSHA.LOC as a,SAKANSHA.PIN as p where p.district="+district+" and a.pincode=p.PIN_ID ");
	 responseText+="<select style='width: 150px' name='area' >";
	 responseText+="<option value='0'>Select area</option>";
	 while(rs1.next())
	 {
	 responseText+="<option  value='"+ rs1.getString("LOC_ID") +"'>"+rs1.getString("LOC_NAME")+"</option> ";		
	 }
	 responseText+="</select>";

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
		

