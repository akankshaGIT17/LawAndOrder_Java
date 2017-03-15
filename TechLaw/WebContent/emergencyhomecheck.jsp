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
						rs2=db.execSQL("select i.NAME,IMAGE from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k ,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs2.next())
						{
						%>
<div id="container">
		<div id="header">
        	<h1><img src="images/sciren.png"></h1>
            <h2>Welcome <%=rs2.getString("NAME") %></h2>
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
               
                <h3><%=rs2.getString("name") %></h3><%} %><%db.close(); %>
                     <img src="images/user.jpg" align="middle" width="198" height="162" />   <br/>
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
        	<h2> </h2>
        	<p>&nbsp;</p>
        	<%
db.connect();
String crimetype=request.getParameter("crimetype");
int area=Integer.parseInt(request.getParameter("area"));
String complaint=request.getParameter("complaint");
String ip=request.getParameter("ip");
String email=request.getParameter("email");
String email2=request.getParameter("email2");


Calendar cal = Calendar.getInstance(); 
int year = cal.get(Calendar.YEAR);



DecimalFormat myFormat = new java.text.DecimalFormat("00000");
String area1=myFormat.format(area);
        
        ResultSet rs=null;
        String query1="(select max(comp_id)+1 as id from SAKANSHA.COMPLAINTS)";
       
        rs=db.execSQL(query1);
        while(rs.next())
        {
        DecimalFormat myFormat1 = new java.text.DecimalFormat("000000");
		String id1=myFormat1.format(Integer.parseInt(rs.getString("id")));
		String query="INSERT INTO SAKANSHA.COMPLAINTS (COMP_ID, COMP_TEXT, COMP_BY, COMP_ON, EMERGENCY, TYPE, AREA, COMP_NUM,IP,EMAIL)   VALUES ("+rs.getString("id")+", '"+complaint+"', 1, current_timestamp, 1, "+crimetype+","+area+",'"+year+area1+id1+"', '"+ip+"','"+email+"')";
		db.updateSQL(query);
		
 %>
 <div style="text-align: center">
 <table>
 	<tr>
 		
				
					<table cellspacing='5' cellpadding="5" width="96%" class="back" style="text-align:left">
					<tr><td align="center"><strong>YOUR APPLICATION IS REGISTERED.</strong></td></tr>
					<tr><td align="center">The police officer will be alerted immediately.</td></tr>
					<tr><td align="center"><font color=red>In case you
					provided false details, the police has complEtE right to take
					action and charge you for that</font></td></tr>
					<tr><td align="center">We have sended your complaint ID details to your account.</td></tr>
					</table>
				
 		<td><table class="black" style="text-align:left">
 	<tr>
 	<td>
 	
 	</td>
 	<td>
 	<font color=green>	<h1 align="center" >YOUR COMPLAINT IS REGISTERED WITH US</h1></font>
 		<br/><center><font color=green>
 		HERE ARE YOUR DETAILS.PLEASE KEEP YOUR COMPPLAINT ID SAFELY AS IT WILL BE REQUIRED FOR FURTHER INVESTIGATION.THIS ID IS ALSO SENDED TO <% out.print(email);%>.</font></center>
 		<br/>
 		<font color=green><h1 align="center">YOUR COMPLAINT ID : <% out.print(year+area1+id1);%> </h1></font>
 	</td></tr>
 	<tr><td align="center"><font color=green></font></td></tr>
 </table>
 
 <%
 String  subject="You Complaint is registered at LAW & ORDER AUTOMATION";
												String message="  "
										     	+"Welcome to LAW & ORDER AUTOMATION"
										     	+"     You emregency complaint ID is   ."
										      	+"  "
										      	+""
										     	+"COMPLAINT ID : "+year+area1+id1+" "
										      	+"     Registered from IP address "+ip+" "      	      	
										      	+"Thank you. We will be dealing with your complaint soon.";
												mail.GmailSend(email,subject,message);
												
 String  subject1="EMERGENCY COMPALINT ID : "+year+area1+id1+"";
 
												String message1="  "
										     	+"Complaint : "+complaint
										     	+"       ."
										      	+" From Area :  "+area
										      	+"          "
										     	+"COMPLAINT ID : "+year+area1+id1+" "
										      	+"          Registered from IP address "+ip+" "      	      	
										      	+"   ";
												mail.GmailSend(email2,subject1,message1);
	}
		
		
	//	URL url = new URL("http://site2.way2sms.com/Main.action?id=C56D5726B5D445AB10EB5B360A88092C.w809&msg=EmgergencyComplaint2&to=9953955325&from=Way2Sms.com&unicode=no&send=1");
		//URLConnection conn = url.openConnection();
		//BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//String inputLine;
		//while ((inputLine = in.readLine()) != null) {
		//System.out.println(inputLine);
		//}
		//in.close();
		db.close();
		%> <% }%>
 		</td>
 	</tr>
 </table>
 <p>&nbsp;</p>



<p>&nbsp;</p>





<p>&nbsp;</p>




<% 	 			if(session.getAttribute("login")==null)
{
%>
					<jsp:forward	page="usersignin.jsp"><jsp:param name="err" value="Please sign in first." /></jsp:forward>	<%} %>	
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
      </div>
   </div></div>
</body>
</html>
        	