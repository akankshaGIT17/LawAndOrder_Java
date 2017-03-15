<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />

<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script>
<head>
	<title>Detective Home|Law &amp; Order</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<meta name="copyright" content="" />	  
	<meta name="revisit-after" content="3 days" />
	<link href="../css/style2.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    
</head>

<body id="home">
	

<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="signin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}
 %>
		 
<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.NAME,IMAGE from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
							while(rs2.next())
						{
						%>
<ul class="hide"><li><a href="#">Skip to content</a></li></ul>
<div id="container">
	<div id="header">
	    <h1><a href="home.jsp">Welcome Detective <span><%=rs2.getString("name") %><%} %></span></a></h1>		
	</div>
    
	<div id="body">
		<ul id="nav">
			<li class="on first"><a href="home.jsp">Home page</a></li>
			<li><a href="casedetail.jsp">Update Case Details</a></li>
			<li><a href="services.html">Report A Criminal</a></li>
			<li><a href="lawsandacts.jsp">Laws &amp; Acts</a></li>
			<li><font color=red><a href="logout.jsp">Logout</a></font></li>
		</ul>
	<div id="content"><div>