<%
if(session.getAttribute("login")==null)
{
%>
<jsp:forward page="usersignin.jsp?err=You should be logged in to see this page"></jsp:forward>
<%
}
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.sql.*,java.util.*,java.io.*,java.net.*,java.text.*" %>
<jsp:useBean id="mail" class="database.mail" />
<%@page language="java" import="java.sql.*" %>
<%@ page import="java.util.*" %>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Homepage | LAW &amp; ORDER</title>
</head>

<body>
<%
if(session.getAttribute("login")!=null)
	{
		 %>
<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select t.NAME from SAKANSHA.SUBJECT as i,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID="+session.getAttribute("id"));
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
    <li><a href="messagefromdgp.jsp">Message From DGP</a></li>
 		<li><a href="policehistory.jsp">History</a></li>
		<li><a href="policeorganisation.jsp">Organization</a></li>
		<li><a href="policewelfare.jsp">Welfare</a></li>
	</ul>
	</li>
    
    <li><a href="userservices.jsp">Services</a></li>
    <li><a href="lawsandacts.jsp">Law &amp; Acts</a></li>
    <li><a href="http://www.psdgraphics.com/contact/"><b>Protect Yourself</b></a></li>
    <li><a href="http://www.psdgraphics.com/contact/">Message</a></li>
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
                    <li><a href="normalcomplaint.jsp">File Complaint</a></li>
                    <li><a href="#">Missing Persons</a></li>
                    <li><a href="#">Missing Valuables</a></li>
                    <li><a href="#">Complaint Status</a></li> <%} }%> 
                    
                </ul>
</div>
                
                
              <div id="leftmenu_bottom"></div>
        </div>
        
        
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <%
try{
db.connect();
String crimetype=request.getParameter("crimetype");
int area=Integer.parseInt(request.getParameter("area"));
String complaint=request.getParameter("complaint");
String ip=request.getParameter("ip");
String email=request.getParameter("email1");


Calendar cal = Calendar.getInstance(); 
int year = cal.get(Calendar.YEAR);



DecimalFormat myFormat = new java.text.DecimalFormat("00000");
String area1=myFormat.format(area);
        
        ResultSet rs=null;
    
        String query1="(select max(COMP_ID)+1 as id from SAKANSHA.COMPLAINTS)";
         rs=db.execSQL(query1);
      
        
       
        while(rs.next())
        {
        
        DecimalFormat myFormat1 = new java.text.DecimalFormat("000000");
		String id1=myFormat1.format(Integer.parseInt(rs.getString("id")));
		
		String query="INSERT INTO SAKANSHA.COMPLAINTS (COMP_ID, COMP_TEXT, COMP_BY, COMP_ON, EMERGENCY, TYPE, AREA, IP,COMP_NUM)   VALUES ("+rs.getString("id")+", '"+complaint+"', "+session.getAttribute("id")+", current_timestamp, 2, "+crimetype+","+area+", '"+ip+"','"+year+area1+id1+"')";
		db.updateSQL(query);
		
 %>
 <div style="text-align: center">
 
				<div id="left">
				
				
				
				
				<!-- here also the english text comes. so automatically you should call. the only advantage  is this page contains only one new line. below are some old lines -->
					<center><strong><font color="green" >What happens when a complaint is
filled?</font></strong></center><br />
					An police officer will be verifying
the complaint with complainant.
					Either FIR is filled or Petty case or non cognizable case is made.
					Investigation continues depending upon the case.
					You can take a look of how a case is processed and how the progress takes place. <a href='policedept/caseprogress.jsp'>click here to view</a>
					
				</div>
			
 	
 	<br /><tr><td>
 		<center><h1><font color=green>Your complaint is successfully filed</font></h1></center></td></tr>
 		<font color=green>Your complaint is successfully filed<%out.println(email); %></font>
 		<br/><font color=red>	This complaint is registered as a non emergency complaint.</font><table>
 	<tr>
 		
 		<td valign="top"><table class="back" style="text-align:left">
 		
 		<tr><td>
 		<center><h1><font color=green>Complaint ID : <% out.print(year+area1+id1);%> </font></h1></center>
 	</td></tr>
 	<tr><td><center>You can check the progress status of you case any time.</center></td></tr>
 	<%
 String  subject="You Complaint is registered at LAW & ORDER AUTOMATION";
												String message="  "
										     	+"Welcome to LAW & ORDER AUTOMATION"
										     	+"     You Complaint ID is   ."
										      	+"  "
										      	+""
										     	+"COMPLAINT ID : "+year+area1+id1+" "
										      	+"     Registered from IP address "+ip+" "      	      	
										      	+"Thank you. We will be dealing with your complaint soon.";
												mail.GmailSend(email,subject,message);%>
 
 <%}
		
		
	
		}
		catch(Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		%>
 		
 	
 </table>
 </td></tr></table></div>
 <p>&nbsp;</p>

 <p>&nbsp;</p>
  <p>&nbsp;</p>
   <p>&nbsp;</p>
    <p>&nbsp;</p>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
      </div>
   </div></div>
</body>
</html>
        