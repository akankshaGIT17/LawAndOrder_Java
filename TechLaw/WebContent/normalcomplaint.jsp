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
<title>Complaint | LAW &amp; ORDER</title>
</head>

<body>
<!-- Validation Script Start -->
<script type="text/javascript" language="javascript">
function checkform()
	{	
		
		if(document.RegistrationForm.district.selectedIndex<1)
				{
					alert("Select District");
					document.RegistrationForm.district.focus();
					return false;
				}
		if(document.RegistrationForm.area.selectedIndex<1)
				{
					alert("Select Area");
					document.RegistrationForm.area.focus();
					return false;
				}
		if(document.RegistrationForm.crimetype.selectedIndex<1)
				{
					alert("Select Crimetype");
					document.RegistrationForm.crimetype.focus();
					return false;
				}
		msg = validateField(document.RegistrationForm.complaint,'STRING','5','1000','Complaint','',' ');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.complaint.focus();
					return false;
				}
		msg = validateField(document.RegistrationForm.ip,'STRING','6','15','IP Address','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.ip.focus();
					return false;
				}
				return true;
	}	
</script>
<!-- Validation Script End -->
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
               
                <h3><%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />  <br/>
                <ul>
                    <li><a href="#"></a></li>
                   <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">File Complaint</a></li>
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
        <form name="RegistrationForm" method="post" action="normalcomplaintcheck.jsp" onsubmit="return checkform()" >

	
<!-- Left column start-->

			
					
				
				<div id="left">
					
					<h2 align="center"><font color="green" >What happens when a complaint is
filled?</font></h2><br />
					<h4><font color="olive">An police officer will be verifying
the complaint with complainant.
Either FIR is filled or Petty case or non cognizable case is made.
Investigation continues depending upon the case.</font></h4>
					
				</div>
		
					
			
		

<!-- Left column end -->

<!--content column start -->
<td width='80%' valign="top">
<table width='100%' border="0" >
	<tr>
		<td >
		

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
<tr class="colour">



		<td colspan="2"><h1><%	 out.print("Complaint Form");  %>  </h1></td>
		
	</tr>
	<tr>
		<td colspan="2"><%
	 out.print("This is a non emergency complaint.No action will be taken suddenly.Proper investigation will be done and this could take time.");  %></td>
		
	</tr>
	<tr>
		<td colspan="2" class="style3"><font color=red>
			<%
	 out.print("If you are trying to register emergency complaint then please go to the emergency complaint form.");  %></font>
	 
		</td>
	</tr>
	<tr>
		<td width="40%"><%
	 out.print("Contact Details ");  %></td>
		<td width="60%">
			<%
			db.connect();
			ResultSet rs=null;
			rs=db.execSQL("select * from SAKANSHA.district");
			
			%><select  onchange='loadareas(this.value)' name='district'>
			<option value="0"><%
	 out.print("Select");  %></option>
			<%
			while(rs.next())
			{
				%><option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%> </option><%
			}
			db.close();
			 %></select>
			
		</td>
	</tr>
	<tr>
		<td>Area </td>
		<td><div id="areaDIV"><select name='area'><option><%
	 out.print("--Select--");  %></option></select> </div></td>
	</tr>
	<tr>
		<td width="40%"><%
	 out.print("Crime Type");  %></td>
		<td width="60%">
			<%
			db.connect();
			ResultSet rs1=null;
			rs1=db.execSQL("select * from SAKANSHA.COMPLAINTS_TYPE");
			
			%><select   name='crimetype'>
			<option value="0"><%
	 out.print("select");  %></option>
			<%
			while(rs1.next())
			{
				%><option value="<%=rs1.getString("id")%>"><%=rs1.getString("typename")%> </option><%
			}
			db.close();
			 %></select>
			
		</td>
	</tr>
	<tr>
		<td valign="top"><%
	 out.print("Complaint Information");  %></td>
		<td><textarea name='complaint' rows="10" cols="48"></textarea></td>
	</tr>
	<tr>
		<td valign="top"><%
	 out.print("Enter the below IP adderess");  %></td>
		<td>
				
		</td>
	</tr>
	
					
						<% 
						db.connect();
						ResultSet rs3=null;
						 String[] monthName = {"January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
						
						rs3=db.execSQL("select t.name,t.father,t.date,t.month,t.year,t.address,MOBILE,LOC_NAME,USERNAME from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN AS g,SAKANSHA.LOC as a,SAKANSHA.PIN as p,SAKANSHA.DISTRICT as d,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name',father varchar(100) path 'fathername',month varchar(2) path 'month',date varchar(2) path 'date',year varchar(4) path 'year',address varchar(500) path 'address',mobileno varchar(15) path 'mobileno') as t where i.SUBJECT_ID=g.ID and i.SUBJECT_ID="+session.getAttribute("id")+" and i.area=a.LOC_ID and a.pincode=p.PIN_ID and p.district=d.district_id");
						while(rs3.next())
						{
						String month = monthName[Integer.parseInt("Month")];
						%>
						
						<tr><td  style="text-align:left" id='name-text'><%
	 out.print("Name");  %>  </td><td> : <%=rs3.getString("t.NAME") %> </td></tr>
						<tr><td  style="text-align:left" id='father-text'><%
	 out.print("Father's Name");  %>  </td><td> : <%=rs3.getString("father") %> </td></tr>
						<tr><td  style="text-align:left" id='dob-text'><%
	 out.print("Date Of Birth");  %>  </td><td> : <%=rs3.getString("date")+"-"+month+"-"+rs3.getString("year") %> </td></tr>
						<tr><td  style="text-align:left" id='mobileno-text'><%
	 out.print("Mobile No");  %>  </td><td> : <%=rs3.getString("mobileno") %> </td></tr>
						<tr><td  style="text-align:left" id='address-text'><%
	 out.print("Adderess");  %>  </td><td> : <%=rs3.getString("address") %> </td></tr>
						<tr><td  style="text-align:left" id='district-text'><%
	 out.print("Contact Details");  %>  </td><td> : <%=rs3.getString("district_name") %> </td></tr>
							<%} %>
						
	<tr>
		<td><%
	 out.print(""); db.close(); %></td>
		<td><input type="text" name="ip"/></td>
	</tr>
	
	<tr>
	<td > IP :
<%try {
	 //InetAddress thisIp = InetAddress.getLocalHost();
	 String ipAddr = request.getHeader("HTTP_X_FORWARDED_FOR");

if (ipAddr == null) {
ipAddr = request.getRemoteAddr();
} 
	 
	 out.println("<span style='color: red;font-weight:bold;font-size:15pt'>"+ipAddr+"</span>");
	 	 
	 }
	catch(Exception e) {
	 out.println("Error"+e.getMessage());
	 }





%></td>



	<td><%
	 out.print("IP adderess ");  %></td>
	</tr>
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table>
</td>


</tr>

</table>
</td>
<tr></tr>


</form>
     <%} %>
<p>&nbsp;</p>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
      </div>
   </div>
</body>
</html>
        