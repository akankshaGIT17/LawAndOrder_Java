<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
	<title>Admin | Law &amp; Order</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<meta name="copyright" content="" />	  
	<meta name="revisit-after" content="3 days" />
	<link href="css/styleback.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    
</head>
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
	    <h1><a href="homepage.jsp">Admin <span><%=rs2.getString("NAME") %></span></a></h1>		
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
			<div id="main">
				<h2>Weclome Administrator</h2>
				<p>Now you can start updating the information or perform changes or etc.<br /> Following are the areas that need your tips.</p>
				
				<ul>
					<li><span><a href="laws.jsp">Update Law ,Rules and acts.</a></span></li>
					<li><span><a href="#">Citizen- Protect Yourself.</a></span></li>
					<li><span><a href="#">Police- Know your duties.</a></span></li>
					<li><span><a href="#">TIP OF THE DAY</a></span></li>
				</ul>
				<p>All other links are available at the bottom of the page.</p>			
			</div>
			<div id="sub">
				<p><img src="upload/<%=rs2.getString("IMAGE") %>" width="292" height="292"/>
				<% }}catch (Exception e){out.print(e);} %></p>
			</div>
		</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; Team TechJustice</p>
		<p class="right"><a href="updateprofile.jsp">Update Profile</a> | <a href="updatepassword.jsp">Change Password</a> |<a href="updateimage.jsp">Change Image</a> | <a href="logout.jsp">Logout</a> </p>
	</div>	
</div>	
</body>
</html>
