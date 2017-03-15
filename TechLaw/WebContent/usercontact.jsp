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
<link href="css/lstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<title>Contact DGP | LAW &amp; ORDER</title>
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
						rs2=db.execSQL("select t.NAME,IMAGE,USERNAME,ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as a,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
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

        <script type="text/javascript" language="javascript">
function checkform()
	{
	var form=document.contact;
			msg = validateField(document.contact.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert("Enter your name");	
					document.contact.email.focus();
					return false;
				}
				msg = validateField(document.contact.name);
				if(msg.length > 0)			
				{
					alert("enter name");	
					document.contact.name.focus();
					return false;
				}
			msg = validateField(document.contact.msg,'STRING','5','1000','Complaint','');
				if(msg.length > 0)			
				{
					alert("Please Enter your message to DGP");	
					document.contact.msg.focus();
					return false;
				}
			return true;
	}
	</script>
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
        
        <h1><font color=blue>Contact DGP </font></h1>
        <form method="post"     action="usercontactcheck.jsp"   id="login_form" name="contact" onsubmit="return checkform()">
        
<table align=center ><tr><td colspan="2">
		<table border="0">
			<tbody>
				<tr>
					<td>Name : </td>
					<td><input type="text" name="name" size="20" /></td>
				</tr>
				<tr>
					<td>Message :</td>
					<td><textarea rows="2" cols="20" name="msg"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" name="message" value="Send Message" /></td>
					<td><input type="reset" name="Reset" value="Reset" /></td>
				</tr>
			</tbody>
		</table>
		</td></tr>

	<% 
						db.connect();
						ResultSet rs3=null;
						 String[] monthName = {"January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
						
						rs3=db.execSQL("select t.name,t.father,t.date,t.month,t.year,t.address,t.mobile,d.district_name,s.USERNAME from SAKANSHA.SIGNIN as s,SAKANSHA.SUBJECT as i,SAKANSHA.LOC as a,SAKANSHA.PIN as p,SAKANSHA.DISTRICT as d,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name',father varchar(100) path 'father',month varchar(2) path 'month',date varchar(2) path 'date',year varchar(4) path 'year',address varchar(500) path 'address',mobile varchar(15) path 'mobile') as t where s.USERNAME="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id")+" and i.area=a.LOC_ID and a.pincode=p.pin_id and p.district=d.district_id");
						while(rs3.next())
						{
						String month = monthName[Integer.parseInt(rs2.getString("month"))];
						%>
						
						<tr><td  style="text-align:left" id='name-text'>Name  </td><td width="133"> : <%=rs2.getString("name") %> </td></tr>
						<tr><td  style="text-align:left" id='email'>Email  </td><td width="133"> : <%=rs2.getString("username") %> <input type="hidden" value="<%=rs2.getString("USERNAME")%>" name="email1" value="email1"  /></td></tr>
						<tr><td  style="text-align:left" id='father-text'>Father </td><td width="133"> : <%=rs2.getString("father") %> </td></tr>
						<tr><td  style="text-align:left" id='dob-text'>D.O.B  </td><td width="133"> : <%=rs2.getString("date")+"-"+month+"-"+rs2.getString("year") %> </td></tr>
						<tr><td  style="text-align:left" id='mobileno-text'>Mobile</td><td width="133"> : <%=rs2.getString("mobile") %> </td></tr>
						<tr><td  style="text-align:left" id='address-text'>Address </td><td width="133"> : <%=rs2.getString("address") %> </td></tr>
						<tr><td  style="text-align:left" id='district-text'>Contact </td><td width="133"> : <%=rs2.getString("district_name") %> </td></tr>
							<%} %>
	</table>
<input type="hidden" value="1" name="usertype"  />
<br /></form></div>
<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div></div>

</body>
</html>
        