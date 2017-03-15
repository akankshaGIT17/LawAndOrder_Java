<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<% response.setDateHeader("Expires",-1);%>

<%
try
	{	

		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		String responseText=new String("");

		String Username=(String) request.getParameter("qparam");
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		
				String query;
		query=("select * from SAKANSHA.SIGNIN where username='"+Username+"'");
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();

if (Username.length()>=6)
{
		if(rs.next())
		{
			
			if (rs.getString("username").equals(Username))
			{
				
				responseText="<font color='red'><strong>"+Username+"</strong> is already in use<br> please choose some other email </font>";		
				responseText+="<input type='hidden' name='usercheck' value='1'>";
			}
		}
			else
			{
				responseText="<font color='green'>You can choose this Email Id</font>";
				responseText+="<input type='hidden' name='usercheck' value='2'>";
			}
		
	
	
	

  	out.print(responseText);
con.close();  } 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>