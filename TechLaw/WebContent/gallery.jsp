<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<link href="css/lightbox2.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/lightbox.js"></script>

<script type="text/javascript" src="techfiles/ajax.js"></script>
<title>Gallery | LAW &amp; ORDER</title>
<style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 0%;
            height: 0%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 60%;
            height: 400%;
            padding: 16px;
            border: 16px solid orange;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>

<body>

	

<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="usersignin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}
 %>
		 
<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select t.NAME,USERNAME,IMAGE,ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as a,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
						while(rs2.next())
						{
						%><input type="hidden" value="<%=rs2.getString("USERNAME")%>" name="mmm"  />
<div id="container">
		<div id="header">
        	<h1><img src="images/sciren.png"></h1><input type="hidden" value="<%=rs2.getString("USERNAME")%>" name="email1" value="email1"  />
            <h2>Welcome <%=rs2.getString("name") %></h2>
        </div>   
        
       <ul id="navigation" class="nav-main">
	<li><a href="homepage.jsp">Home</a></li>
    
    <li class="list"><a href="#">Licenses</a>
	<ul class="nav-sub">
    <li><a href="hotel.jsp">Lodge/Hotel License</a></li>
		<li><a href="gunlicense.jsp">Arms License</a></li>
		<li><a href="loudspeakers.jsp">Loud Speaker License</a></li>
		<li><a href="massmeeting.jsp">Mass meeting License</a></li>
	</ul>
	</li>
    
    <li class="list"><a href="#">Police Department</a>
	<ul class="nav-sub">
    <li><a href="messagefromdgp.jsp">Message From DGP</a></li>
 		<li><a href="policehistory.jsp">History</a></li>
		<li><a href="policeorganisation.jsp">Organization</a></li>
		<li><a href="policewelfare.jsp">Welfare</a></li>
	</ul>
	</li>
    
   <li><a href="userservices.jsp">Services</a></li>
    <li><a href="lawsandacts.jsp">Law &amp; Acts</a></li>
    <li><a href="protecturself.jsp"><b>Protect Yourself</b></a></li>
    <li><a href="usercontact.jsp">Message</a></li>
    <li><a href="gallery.jsp">Gallery</a></li>
    <li><a href="logoutuser.jsp"><font color=red>Logout</font></a></li>

</ul>

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
               
                <h3>Hi,  <%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />   <br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">Normal Complaint</a></li>
                    <li><a href="missingperson.jsp">Missing Persons</a></li>
                    <li><a href="missingvaluables.jsp">Missing Valuables</a></li>
                    <li><a href="complaintstatususer.jsp">Complaint Status</a></li><%} %>
                    
                </ul>
</div>
                
                
              <div id="leftmenu_bottom"></div>
        </div>
        
        
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table align=center><tr><td><h1><font color=green>Image Gallery</font></h1></td></tr></table>
<table border="0">
	<tbody>
		<tr>
			<td><a href="gallery/gal (2).jpg" rel="lightbox" title="Image 1"><img src="gallery/gal (2).jpg" width="191" height="220"></img></a></td>
			<td><a href="gallery/gal (1).jpg" rel="lightbox" title="Image 2"><img src="gallery/gal (1).jpg" width="191" height="220"></img></a></td>
			<td><a href="gallery/gal (3).jpg" rel="lightbox" title="Image 3"><img src="gallery/gal (3).jpg" width="191" height="220"></img></a></td>
			</tr>
			<tr>
			<td><a href="gallery/gal (4).jpg" rel="lightbox" title="Image 4"><img src="gallery/gal (4).jpg" width="191" height="220"></img></a></td>
	<td><a href="gallery/gal (5).jpg" rel="lightbox" title="Image 5"><img src="gallery/gal (5).jpg" width="191" height="220"></img></a></td>
	<td><a href="gallery/gal (6).jpg" rel="lightbox" title="Image 6"><img src="gallery/gal (6).jpg" width="191" height="220"></img></a></td>
	</tr>
	<tr>
	<td><a href="gallery/gal (7).jpg" rel="lightbox" title="Image 7"><img src="gallery/gal (7).jpg" width="191" height="220"></img></a></td>
	<td><a href="gallery/gal (8).jpg" rel="lightbox" title="Image 8"><img src="gallery/gal (8).jpg" width="191" height="220"></img></a></td>
	<td><a href="gallery/gal (9).jpg" rel="lightbox" title="Image 9"><img src="gallery/gal (9).jpg" width="191" height="220"></img></a></td></tr>
	<tr>
	<td><a href="gallery/gal (10).jpg" rel="lightbox" title="Image 10"><img src="gallery/gal (10).jpg" width="191" height="220"></img></a></td>
	<td><a href="gallery/gal (11).jpg" rel="lightbox" title="Image 11"><img src="gallery/gal (11).jpg" width="191" height="220"></img></a></td>
	<td><a href="gallery/gal (12).jpg" rel="lightbox" title="Image 12"><img src="gallery/gal (12).jpg" width="191" height="220"></img></a></td>
	</tr></tbody>
</table>
</div>
<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div></div>

</body>
</html>