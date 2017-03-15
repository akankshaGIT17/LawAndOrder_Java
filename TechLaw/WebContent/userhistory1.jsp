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
<title>Missing Person/Valuable | LAW &amp; ORDER</title>
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
						rs2=db.execSQL("select t.NAME,USERNAME,ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as a,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
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
               
                <h3><%=rs2.getString("name") %></h3>
                     <img src="images/user.jpg" align="middle" width="198" height="162" />   <br/>
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
        <table border=0 align=center><tr><td> <h1> MISSING PERSON COMPLANT(S) </h1></td></tr></table>
       <table border="1" align="center">
		<tr  bgcolor="teal">
			<td><strong>COMPLAINT ON</strong></td>
			<td><strong>STATUS</strong></td>
			<td><strong>COMMENTS</strong></td>
			<td><strong>LAST CHECKED</strong></td>
			<td><strong>MISSING PERSON</strong></td>
			
		</tr>
        
        <% 
						
						try{
						db.connect();
						ResultSet rs6=null;
						
						
						rs6=db.execSQL("select BY,ON,STATUS,COMMENT,LAST_UPDATE_ON,NAME from SAKANSHA.LOSTPEOPLE as i where i.BY="+session.getAttribute("id"))  ;
						while(rs6.next())
						{%>

	
		<tr>
			<td><%=rs6.getString("ON") %></td>
			<td><font color=red><% if(rs6.getString("STATUS").equals("1"))  {out.print ("IN PROCESS"); } if(rs6.getString("STATUS").equals("0")) {out.print("PENDING");} if(rs6.getString("STATUS").equals("2")) {out.print("COMPLETED");}%></font></td>
			<td><%=rs6.getString("COMMENT") %></td>
			<td><%=rs6.getString("LAST_UPDATE_ON") %></td>
		<td><%=rs6.getString("NAME") %></td>
			<%
			}
			db.close();
			 %>
			 </tr>
			 <% }catch(Exception e)
        		 { %>
              		<%out.print(e);        
              	 } %> 
	
		

</table>
<br /> <br />
 <table border=0 align=center><tr><td> <h1> LOST VALUABLES COMPLAINT(S) </h1></td></tr></table>
       <table border="1" align="center">
		<tr  bgcolor="teal">
			<td><strong>COMPLAINT ON</strong></td>
			<td><strong>STATUS</strong></td>
			<td><strong>COMMENTS</strong></td>
			<td><strong>LAST CHECKED</strong></td>
			<td><strong>MISSING VALUABLES</strong></td>
			
		</tr>
        
        <% 
						try{
						
						db.connect();
						ResultSet rs1=null;
						
						
						rs1=db.execSQL("select BY,ON,STATUS,COMMENTS,LAST_UPDATE_ON,NAME from SAKANSHA.LOSTVALUE as i where i.BY="+session.getAttribute("id"))  ;
						while(rs1.next())
						{%>

	
		<tr>
			<td><%=rs1.getString("ON") %></td>
			<td><font color=red><% if(rs1.getString("STATUS").equals("1"))  {out.print ("IN PROCESS"); } if(rs1.getString("STATUS").equals("0")) {out.print("PENDING");} if(rs1.getString("STATUS").equals("2")) {out.print("COMPLETED");}%></font></td>
			<td><%=rs1.getString("COMMENTS") %></td>
			<td><%=rs1.getString("LAST_UPDATE_ON")%></td>
		<td><%=rs1.getString("NAME")%></td>
			<%
			}
			db.close();
			 %>
			 </tr>
			 <% }catch(Exception e)
        		 { %>
              	<tr><td>	<%out.print(e);} %> </td>
		</tr>
		
		

</table><br /><br />
</div>

<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
		
    </div></div>

</body>
</html>