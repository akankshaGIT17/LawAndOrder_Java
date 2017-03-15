<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />
<link href="css/styleback.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script language="JavaScript" src="techfiles/selectbox.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
  <html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
	<title>hi</title>
	
	<link href="css/styleback.css" rel="stylesheet" type="text/css" /></head>
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    

<%if(session.getAttribute("login")==null)
  { %>
 <jsp:forward	page="front.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
   <%}
   else
{
	session.setAttribute("id",session.getAttribute("id"));
}
 %> 
 <%  try{
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.NAME,k.IMAGE,k.ID,i.SUBJECT_ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k  where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs2.next())
						{
						%>
<body id="home">
<ul class="hide"><li><a href="#body">Skip to content</a></li></ul>
<div id="container">
	<div id="header">
	    <h1><a href="homepage.jsp">Admin <span><%=rs2.getString("NAME") %></span></a></h1>	<% }}catch (Exception e){out.print(e);} %>	
	</div>
    
	<div id="body">
		<ul id="nav">
			<li class="on first"><a href="homepage.jsp">Home page</a></li>
			<li><a href="policestation.jsp">Police Station</a></li>
			<li><a href="policeoption.jsp">Police Officers</a></li>
			<li><a href="detectives.jsp">Private Detectives</a></li>
			<li><a href="polls.jsp">Polls</a></li>
		</ul>
		<div id="content"><div>

</body>
</html>