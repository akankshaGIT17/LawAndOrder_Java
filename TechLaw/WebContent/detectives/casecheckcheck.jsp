<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <jsp:useBean id="db" class="database.dncon" />
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   
<html>
<head>
<title>casecheckcheck</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%

		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		String fir=request.getParameter("firno");
		String detail=request.getParameter("detail5");
		 String personal="";
		
		ResultSet rs=null;
		PreparedStatement ps=null;						
		
													
												
												try{
										  // String query="insert into SAKANSHA.DETECTIVE_DETAIL(fir,DETECTIVE_DETAIL) values(,'"+email.toLowerCase()+"','"+password+"',current_timestamp,0,1)";
										   
										  //  rs=ps.executeUpdate(query);
										//   db.updateSQL(query);
										   //out.print(query);
										   Statement st=con.createStatement();
											  String query1="UPDATE  SAKANSHA.DETECTIVE_DETAIL SET  DETAIL5='"+detail+"' where FIR='"+fir+"'";
											 // ps=con.prepareStatement(query1);
											//  rs=ps.executeQuery();
											st.executeUpdate(query1);
											  //db.updateSQL(query1);
											 con.close();
											    //out.print(query1);%><jsp:forward	page="suc.jsp"><jsp:param name="err" value="Your comment was added." /></jsp:forward><%
											    }catch (Exception e)
											    {out.print(e);} 
											   %>


</body>
</html>