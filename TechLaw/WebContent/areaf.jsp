<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>checking</title>
<% response.setDateHeader("Expires",-1);%>

<%
try
	{	

		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		String responseText=new String("");
		String pin=(String) request.getParameter("q");
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		
				String query;
		query=("select LOC_ID,LOC_NAME,PINCODE from SAKANSHA.LOC as a,SAKANSHA.PIN as p where a.pincode="+pin+" and a.pincode=p.pin_id");
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		
		responseText+="<select name='area'>";
	 responseText+="<option value='0'>Select</option>";
	 while(rs.next())
	 {
	 responseText+="<option  value='"+ rs.getString("LOC_ID") +"'>"+rs.getString("LOC_NAME")+"</option> ";		
	 }
	 responseText+="</select>";

  	out.print(responseText);

	
	
  	con.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>

		