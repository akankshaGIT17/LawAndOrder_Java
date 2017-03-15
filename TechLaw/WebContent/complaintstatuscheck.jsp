<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mail" class="database.mail" />


<%@page language="java" import="java.sql.*,java.util.*,java.io.*,java.net.*,java.text.*" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/ajax.js"></script>
<link href="css/lstyle.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Emergency Complaint | LAW &amp; ORDER</title>
</head>

<body>
<%
if(session.getAttribute("login")!=null)
	{
		 %>
		 <% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select t.name from SAKANSHA.SUBJECT as i,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID="+session.getAttribute("id"));
						while(rs2.next())
						{
						%>
<div id="container">
		<div id="header">
        	<h1><img src="images/sciren.png"></h1>
            <h2>Welcome <%=rs2.getString("name") %></h2>
        </div>   
        
       <ul id="navigation" class="nav-main">
	<li><a href="homepage.jsp">Home</a></li>
    
    <li class="list"><a href="#">Licenses</a>
	<ul class="nav-sub">
   <li><a href="hotel.jsp">Lodge/Hotel License</a></li>
		<li><a href="http://www.psdgraphics.com/category/buttons/">Arms License</a></li>
		<li><a href="loudspeakers.jsp">Loud Speaker License</a></li>
		<li><a href="massmeeting.jsp">Mass meeting License</a></li>
		
	</ul>
	</li>
    
    <li class="list"><a href="#">Police Department</a>
	<ul class="nav-sub">
    <li><a href="http://www.psdgraphics.com/about/">Message From DGP</a></li>
 		<li><a href="http://www.psdgraphics.com/commercial-use/">History</a></li>
		<li><a href="http://www.psdgraphics.com/about/terms-of-use/">Organization</a></li>
		<li><a href="http://www.psdgraphics.com/about/terms-of-use/">Welfare</a></li>
	</ul>
	</li>
    
    <li><a href="http://www.psdgraphics.com/advertise/">Services</a></li>
    <li><a href="http://www.psdgraphics.com/contact/">Law &amp; Acts</a></li>
    <li><a href="http://www.psdgraphics.com/contact/"><b>Protect Yourself</b></a></li>
    <li><a href="http://www.psdgraphics.com/contact/">Message</a></li>
    <li><a href="http://www.psdgraphics.com/contact/">Gallery</a></li>
    <li><a href="http://www.psdgraphics.com/contact/"><font color=red>Logout</font></a></li>

</ul>

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
                <h3><%=rs2.getString("name") %></h3><%} %><%db.close(); %><%} %>
                     <img src="images/user.jpg" align="middle" width="198" height="162" />   <br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">Normal Complaint</a></li>
                    <li><a href="missingperson.jsp">Missing Persons</a></li>
                    <li><a href="missingvaluables.jsp">Missing Valuables</a></li>
                    <li><a href="complaintstatususer.jsp">Complaint Status</a></li>
                    
                </ul>
</div>
                
                
              <div id="leftmenu_bottom"></div>
        </div>
        
        
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
       <table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
<tr class="colour">
		<td colspan="2"><font color=green><h1><%  out.print("COMPLAINT STATUS"); %></h1></font>
		<input type="hidden" value="<%=request.getParameter("complaint")%>" name="complaint"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">  
		<%
		db.connect();
		String comp=request.getParameter("complaint");
		String query="select c.status,STATEMENTS,UPDATED_ON from SAKANSHA.COMPLAINTS as c,SAKANSHA.COMPLAINTS_CHECK as cs where c.status=cs.id and c.COMP_NUM='"+comp+"'";
		ResultSet rs=db.execSQL(query);
		if(rs.next())
		{
		String status="Complaint Status Of ID "+comp+" : "+rs.getString("STATEMENTS")+"<br/>"+"Last Updated On : "+rs.getString("UPDATED_ON");
		
		out.print(status);
		}
		else
		{
		out.print("notfound");
		}
		db.close();
		 %>
		 
		</td>
	</tr>
	
</table>

       
 



<p>&nbsp;</p>




	
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
      </div>
   </div>
</body>
</html>
            