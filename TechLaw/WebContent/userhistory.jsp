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
<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<title>License History | LAW &amp; ORDER</title>
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
						rs2=db.execSQL("select t.name,IMAGE from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k ,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
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
               
                <h3><%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="198" height="162" /> <br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">File Complaint</a></li>
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
        <table border=0 align=center><tr><td> <h1> HOTEL LICENSE REQUESTS </h1></td></tr></table>
       <table border="1" align="center">
		<tr  bgcolor="teal">
			<td><strong>Applied On</strong></td>
			<td><strong>Status</strong></td>
			<td><strong>Comment</strong></td>
			<td><strong>Last Checked</strong></td>
			<td><strong>Rejection</strong></td>
			
		</tr>
        
        <% 
						
						try{
						db.connect();
						ResultSet rs6=null;
						
						
						rs6=db.execSQL("select APPLIED_BY,APPLIED_ON,STATUS,COMMENTS,APPROOVED_ON,REJECTION from SAKANSHA.HOTEL as i where i.APPLIED_BY="+session.getAttribute("id"))  ;
						while(rs6.next())
						{%>
<% String rd= rs6.getString("APPROOVED_ON");%>
	
		<tr>
			<td><%=rs6.getString("APPLIED_ON") %></td>
			<td><font color=red><% if(rs6.getString("STATUS").equals("1"))  {out.print ("IN PROCESS"); } if(rs6.getString("STATUS").equals("0")) {out.print("PENDING");} if(rs6.getString("STATUS").equals("2")) {out.print("COMPLETED");}%></font></td>
			<td><%=rs6.getString("COMMENTS") %></td>
			<td><%=rs6.getString("APPROOVED_ON") %></td>
		<td><%=rs6.getString("REJECTION") %></td>
			<%
			}
			db.close();
			 %>
			 </tr>
			 <% }catch(Exception e)
        		 { %>
              		<%out.print("");        
              	 } %> 
	
		

</table>
<br /> <br />
 <table border=0 align=center><tr><td> <h1> ARMS LICENSE REQUESTS </h1></td></tr></table>
       <table border="1" align="center">
		<tr  bgcolor="teal">
			<td><strong>Applied On</strong></td>
			<td><strong>Status</strong></td>
			<td><strong>Comment</strong></td>
			<td><strong>Last Check</strong></td>
			<td><strong>Rejection</strong></td>
			
		</tr>
        
        <% 
						try{
						
						db.connect();
						ResultSet rs1=null;
						
						
						rs1=db.execSQL("select BY,ON,STATUS,COMMENTS,APPROVED_ON,REJECTION from SAKANSHA.ARMS as i where i.BY="+session.getAttribute("id"))  ;
						while(rs1.next())
						{%>
<% String rd1= rs1.getString("APPROVED_ON");%>
	
		<tr>
			<td><%=rs1.getString("ON") %></td>
			<td><font color=red><% if(rs1.getString("STATUS").equals("1"))  {out.print ("IN PROCESS");}  else if(rs1.getString("STATUS").equals("0")) {out.print("PENDING");} else {out.print("COMPLETED");}%></font></td>
			
			<td><%=rs1.getString("COMMENTS") %></td>
			<td><%=rs1.getString("APPROVED_ON")%></td>
		<td><%=rs1.getString("REJECTION")%></td>
			<%
			}
			db.close();
			 %>
			 </tr>
			 <% }catch(Exception e)
        		 { %>
              <%out.print("");} %>
		
		

</table><br /><br />
<table border=0 align=center><tr><td> <h1> LOUDSPEAKER LICENSE REQUESTS </h1></td></tr></table>
       <table border="1" align="center">
		<tr  bgcolor="teal">
			<td><strong>Applied On</strong></td>
			<td><strong>Status</strong></td>
			<td><strong>Comment</strong></td>
			<td><strong>Last Check</strong></td>
			<td><strong>Rejection</strong></td>
			
		</tr>
        
        <% 
						try{
						
						db.connect();
						ResultSet rs3=null;
						
						
						rs3=db.execSQL("select APPLIEDBY,APPLIEDON,STATUS,COMMENTS,APPROVEDON,REJECTION from SAKANSHA.LOUDSPEAKER as i where i.APPLIEDBY="+session.getAttribute("id"))  ;
						while(rs3.next())
						{%>
<% String rd2= rs3.getString("APPROVEDON");%>
	
		<tr>
			<td><%=rs3.getString("APPLIEDON") %></td>
			<td><font color=red><% if(rs3.getString("STATUS").equals("1"))  {out.print ("IN PROCESS"); } if(rs3.getString("STATUS").equals("0")) {out.print("PENDING");} if(rs3.getString("STATUS").equals("2")) {out.print("COMPLETED");}%></font></td>
			<td><%=rs3.getString("COMMENTS") %></td>
			<td><%=rs3.getString("APPROVEDON")%></td>
			<td><%=rs3.getString("REJECTION")%>
			</td></tr>
			<% }
			
			
			db.close(); 
			%>
			
		
			<% }catch(Exception e)
        		 { %>
              		<%out.print("");        
              	 } %> 
		

</table>
<br /> <br />
<table border=0 align=center><tr><td> <h1> MASS MEETING LICENSE REQUESTS </h1></td></tr></table>
       <table border="1" align="center">
		<tr  bgcolor="teal">
			<td><strong>Applied On</strong></td>
			<td><strong>Status</strong></td>
			<td><strong>Comment</strong></td>
			<td><strong>Last Check</strong></td>
			<td><strong>Rejection</strong></td>
			
		</tr>
        
        <% 
						try{
						
						db.connect();
						ResultSet rs4=null;
						
						
						rs4=db.execSQL("select APPLIEDBY,APPLIEDON,STATUS,COMMENTS,APPROVEDON,REJECTION from SAKANSHA.MASSMEETING as i where i.APPLIEDBY="+session.getAttribute("id"))  ;
						while(rs4.next())
						{%>

	
		<tr>
			<td><%=rs4.getString("APPLIEDON")%></td>
			<td><font color=red><% if(rs4.getString("STATUS").equals("1"))  {out.print ("IN PROCESS"); } if(rs4.getString("STATUS").equals("0")) {out.print("PENDING");} if(rs4.getString("STATUS").equals("2")) {out.print("COMPLETED");}%></font></td>
			<td><%=rs4.getString("COMMENTS")%></td>
			<td><%=rs4.getString("APPROVEDON")%></td>
			<td><%=rs4.getString("REJECTION")%>
			</td></tr>
			<% }
			
			
			db.close(); 
			%>
			
		
			<% }catch(Exception e)
        		 { %>
              		<%out.print("");        
              	 }} %> 
		

</table></div>

<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp">Uplaod Image</a></h3></div>
		
    </div></div>

</body>
</html>