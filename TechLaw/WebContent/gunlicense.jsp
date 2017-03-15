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
<title>Arms License | LAW &amp; ORDER</title>
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

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
                <h3>Hi,  <%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />    <br/>
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
         <script type="text/javascript" language="javascript">
function checkform()
	{	
				
			
			
					
			
				
				msg = validateField(document.RegistrationForm.photo,'STRING','5','200','Lost Place','@#^,&*~-$%!');
				if(msg.length < 0)			
				{
					alert("Please upload document");	
					document.RegistrationForm.photo.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.otherweapon,'STRING','5','200','Lost Place','@#^,&*~-$%!');
				if(msg.length < 0)			
				{
					alert("Please enter the otherweapon");	
					document.RegistrationForm.otherweapon.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.licenseprob,'STRING','5','200','Lost Place','@#^,&*~-$%!');
				if(msg.length < 0)			
				{
					alert("Please you license problem");	
					document.RegistrationForm.licenseprob.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.licensebeforedetails,'STRING','5','200','Lost Place','@#^,&*~-$%!');
				if(msg.length < 0)			
				{
					alert("Please enter your license of weapon own before details");	
					document.RegistrationForm.licensebeforedetails.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.convictdetails,'STRING','5','200','Lost Place','@#^,&*~-$%!');
				if(msg.length < 0)			
				{
					alert("Please enter you convict details");	
					document.RegistrationForm.convictdetails.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.photo,'STRING','5','200','Lost Place','@#^,&*~-$%!');
				if(msg.length < 0)			
				{
					alert("Please enter need for weapon");	
					document.RegistrationForm.weaponneed.focus();
					return false;
				}
				
									
		return false;
	}	
</script>
        <form onsubmit="return checkform()" name="RegistrationForm" method="post" action="guncheck.jsp"  enctype="multipart/form-data">
<!--content column start -->

				<div align='center'>
		
					<table align=center><tr><td><h1 align="center"> <font color=teal >Application For Arms License </font></h1></td></tr></table>
					
				</div>
<div align="center">
		<table width='90%' align='center' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				<tr>
					
				<tr>
					<td colspan="2" class='color'><strong><font color=red>Enter all the fields marked as *. Please be ready with the documents to be uploaded before you fill the form.</font></strong></td>
					
				</tr>
				<tr>
					<td>Weather the applicant has been convicted?:<span class='style3'>*</span></td>
					<td ><input type="radio" name="convict" onclick="load2(this.value)" value="Yes"/> Yes <input type="radio" onclick="load2(this.value)" name="convict" value="No" />No
					<script type='text/javascript'>
				function load2(str)
					{
					if(str=="Yes")
						{
						document.getElementById("leftDIV2").innerHTML="Enter the complete details : <span class='style3'>*</span>";
						document.getElementById("rightDIV2").innerHTML="<textarea  name='convictdetails' ></textarea>";
						}
						
						
						if(str=="No")
						{
						document.getElementById("leftDIV2").innerHTML="";
						document.getElementById("rightDIV2").innerHTML="";
						}
					}
					</script></td>
				</tr><tr>
				<td valign="top" >
						<span id="leftDIV2"></span>
					</td>
					<td>
						<span id="rightDIV2"></span>
					</td></tr>
				<tr>
					<td>Whether you have applied for license before?:<span class='style3'>*</span></td>
					<td >
						<input type="radio" name="licensebefore" onclick="load3(this.value)" value="Yes"/> Yes <input type="radio" onclick="load3(this.value)" name="licensebefore" value="No" />No
					<script type='text/javascript'>
				function load3(str)
					{
					if(str=="Yes")
						{
						document.getElementById("leftDIV").innerHTML="Enter Completed Details: <span class='style3'>*</span>";
						document.getElementById("rightDIV").innerHTML="<textarea  name='licensebeforedetails' ></textarea>";
						}
						
						
						if(str=="No")
						{
						document.getElementById("leftDIV").innerHTML="";
						document.getElementById("rightDIV").innerHTML="";
						}
					}
					</script>
					</td>
				</tr><tr>
				<td valign="top" >
						<span id="leftDIV"></span>
					</td>
					<td>
						<span id="rightDIV"></span>
					</td></tr>
				<tr>
					<td >Whether you license was ever : <span class='style3'>*</span></td>
					<td>Suspended : <input type="radio" name="cancelled" onclick="load4(this.value)" value="Yes"/> Yes <input type="radio" onclick="load4(this.value)" name="cancelled" value="No" />No
					<br /> Canceled : <input type="radio" name="cancelled" onclick="load4(this.value)" value="Yes"/> Yes <input type="radio" onclick="load4(this.value)" name="cancelled" value="No" />No
					<br  />Revoked : <input type="radio" name="cancelled" onclick="load4(this.value)" value="Yes"/> Yes <input type="radio" onclick="load4(this.value)" name="cancelled" value="No" />No
					<script type='text/javascript'>
				
				function load4(str)
					{
					if(str=="Yes")
						{
						document.getElementById("leftDIV4").innerHTML="Complete Details: <span class='style3'>*</span>";
						document.getElementById("rightDIV4").innerHTML="<textarea  name='licenseprob' ></textarea>";
						}
						
						
						if(str=="No")
						{
						document.getElementById("leftDIV4").innerHTML="";
						document.getElementById("rightDIV4").innerHTML="";
						}
					}
					</script></td>
				</tr><tr>
				<td valign="top" >
						<span id="leftDIV4"></span>
					</td>
					<td>
						<span id="rightDIV4"></span>
					</td></tr>
				<tr>
					<td>Type Of Weapon for license:<span class='style3'>*</span></td>
					<td><input type="radio" name="NPB" value="1" onclick="load5(this.value)" />NPB <input
			type="radio" name="PB" value="1" onclick="load5(this.value)" />PB <input type="radio"
			name="pistol" value="1" onclick="load5(this.value)"/>Pistol <input type="radio" name="rifle"
			value="1" onclick="load5(this.value)"/>Rifle <input type="radio" name="weapon1"
			value="2" onclick="load5(this.value)"/>other</td>
			<script type='text/javascript'>
				
				function load5(str)
					{
					if(str=="2")
						{
						document.getElementById("leftDIV5").innerHTML="Enter Weapon: <span class='style3'>*</span>";
						document.getElementById("rightDIV5").innerHTML="<textarea  name='otherweapon' ></textarea>";
						}
						if(str=="1")
						{
						document.getElementById("leftDIV5").innerHTML="";
						document.getElementById("rightDIV5").innerHTML="";
						}
						
						}</script></tr>
					<tr>
				<td valign="top" >
						<span id="leftDIV5"></span>
					</td>
					<td>
						<span id="rightDIV5"></span>
					</td></tr>
				<tr>
				</tr>
				<tr>
					<td>Need Of Weapon:<span class='style3'>*</span></td>
					<td><textarea rows="2" cols="20" name="weaponneed"></textarea></td>
				</tr>
				<tr>
					<td>Details Of earleir Weapon (if any):<span class='style3'>*</span></td>
					<td><input type="text" name="previousweapon" maxlength="200" title="Pleae enter the Previous weapon"/></td>
				</tr>
				
	
		
		 		<tr>	
				 	<td >Document for License : <span class='style3'></span></td>
		 			<td><input type="file" name="photo" /></td>
				</tr>
				
					<tr><td colspan="2"></td></tr>
	<% 
						db.connect();
						ResultSet rs3=null;
						 String[] monthName = {"January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
						
						rs3=db.execSQL("select t.name,t.father,t.date,t.month,t.year,t.address,t.mobile,d.district_name from SAKANSHA.SUBJECT as i,SAKANSHA.LOC as a,SAKANSHA.PIN as p,SAKANSHA.DISTRICT as d,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name',father varchar(100) path 'father',month varchar(2) path 'month',date varchar(2) path 'date',year varchar(4) path 'year',address varchar(500) path 'address',mobile varchar(15) path 'mobile') as t where i.SUBJECT_ID="+session.getAttribute("id")+" and i.area=a.LOC_ID and a.pincode=p.pin_id and p.district=d.district_id");
						while(rs3.next())
						{
						String month = monthName[Integer.parseInt(rs2.getString("month"))];
						%>
						
						<tr><td  style="text-align:left" id='name-text'>Name  </td><td width="133"> : <%=rs2.getString("name") %> </td></tr>
						<tr><td  style="text-align:left" id='father-text'>Father </td><td width="133"> : <%=rs2.getString("father") %> </td></tr>
						<tr><td  style="text-align:left" id='dob-text'>D.O.B  </td><td width="133"> : <%=rs2.getString("date")+"-"+month+"-"+rs2.getString("year") %> </td></tr>
						<tr><td  style="text-align:left" id='mobileno-text'>Mobile</td><td width="133"> : <%=rs2.getString("mobile") %> </td></tr>
						<tr><td  style="text-align:left" id='address-text'>Address </td><td width="133"> : <%=rs2.getString("address") %> </td></tr>
						<tr><td  style="text-align:left" id='district-text'>Contact </td><td width="133"> : <%=rs2.getString("district_name") %> </td></tr>
							<%} %>
	
				
				
			</table>

	<table width='90' align='center' cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table>
	
</div>
</form>
        </div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
		
      </div>
  </div>
</body>
</html>
        