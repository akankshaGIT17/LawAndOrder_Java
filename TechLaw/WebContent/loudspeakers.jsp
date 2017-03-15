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
<title>LoudSpeaker License | LAW &amp; ORDER</title>
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
						rs2=db.execSQL("select i.NAME,IMAGE,k.username from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k ,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
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
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="198" height="162" />   <br/>
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
        <script type="text/javascript">
             function loadSubmit() {
var ProgressImage = document.getElementById('progress_image');
document.getElementById("progress").style.visibility = "visible";
setTimeout("ProgressImage.src = ProgressImage.src",100);
return true;
} </script>
        <script type="text/javascript">
function checkform()
{
				var msg = validateField(document.RegistrationForm.peti_name,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.peti_name.focus();
					return false;
				}
				var msg = validateField(document.RegistrationForm.reason,'STRING','5','200','Reason for using speakers','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.reason.focus();
					return false;
				}	
				if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select Year of starting for using speakers");
					document.RegistrationForm.year.focus();
					return false;
				}
				if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select Month of starting for using speakers");
					document.RegistrationForm.month.focus();
					return false;
				}
				if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select Date of starting for using speakers");
					document.RegistrationForm.date.focus();
					return false;
				}
				var msg = document.RegistrationForm.s_time;
				if(msg.value.length == 0)			
				{
					alert("Please enter starting time of meeting");	
					document.RegistrationForm.s_time.focus();
					return false;
				}
				if(document.RegistrationForm.year1.selectedIndex<1)
				{
					alert("Select Year of ending for using speakers");
					document.RegistrationForm.year1.focus();
					return false;
				}
				if(document.RegistrationForm.month1.selectedIndex<1)
				{
					alert("Select Month of ending for using speakers");
					document.RegistrationForm.month1.focus();
					return false;
				}
				if(document.RegistrationForm.date1.selectedIndex<1)
				{
					alert("Select Date of ending for using speakers");
					document.RegistrationForm.date1.focus();
					return false;
				}
				var msg = document.RegistrationForm.e_time;
				if(msg.value.length == 0)			
				{
					alert("Please enter starting time of meeting");	
					document.RegistrationForm.e_time.focus();
					return false;
				}
				var msg = validateField(document.RegistrationForm.location,'STRING','5','200','Location','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.location.focus();
					return false;
				}	
}
</script>
        <form name="RegistrationForm" method="post" action="loudspeakerscheck.jsp" onsubmit="return checkform()">
<!--content column start -->

				<div align='center'>
		
					<h2><font color="olive">Application For LoudSpeaker License
Under Sec 33 of B.P.Act, 1951</font></h2>
					
				</div>
<div align="center">
		<table width='90%' align='center' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				
				<tr>
					<td colspan="2" class='color'><strong>Loud Speaker Information</strong></td>
					
				</tr>
				<tr>
					<td colspan="2">Name :<span class='style3'>*</span></td>
					<td width="254"><input type='text' name='peti_name' maxlength='100' title='Please enter your name'/></td>
					
				</tr>
				
				
				<tr>
					<td colspan='2'>Purpose For Using Loud Speaker :<span class='style3'>*</span></td>
					<td width="254"><input type="text" name="reason" maxlength="500" title="Enter the puprose of using speakers"/></td>
				</tr>
				<tr>
					<td colspan='2'><strong>Date and Time:</strong><span class='style3'>*</span></td>
				</tr>
				<tr>
					<td width="294">From :&nbsp;<select name="year" onchange="listdate(document.RegistrationForm.month.value,this.value)">
				<option value="0">Year</option>
				<option value="2008">2008</option>
				<option value="2009">2009</option>
				<option value="2010">2010</option>
				<option value="2011">2011</option>
				<option value="2012">2012</option>
				<option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				</select>
				 <select name="month" onchange="listdate(this.value,document.RegistrationForm.year.value)">
				<option value="0">Month</option>
				<option value="01">Jan</option>
				<option value="02">Feb</option>
				<option value="03">March</option>
				<option value="04">April</option>
				<option value="05">May</option>
				<option value="06">June</option>
				<option value="07">July</option>
				<option value="08">Aug</option>
				<option value="09">Sep</option>
				<option value="10">Oct</option>
				<option value="11">Nov</option>
				<option value="12">Dec</option>
			</select><span id="dateselDIV">
					<select name="date">
					<option>dd</option>
					</select> </span>
		</td>
		
	</tr>
		<tr>
					<td width="294">Till :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="year1" onchange="listdate1(document.RegistrationForm.month1.value,this.value)">
				<option value="0">Year</option>
				<option value="2008">2008</option>
				<option value="2009">2009</option>
				<option value="2010">2010</option>
				<option value="2011">2011</option>
				<option value="2012">2012</option>
				<option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				</select>
				 <select name="month1" onchange="listdate1(this.value,document.RegistrationForm.year1.value)">
				<option value="0">Month</option>
				<option value="01">Jan</option>
				<option value="02">Feb</option>
				<option value="03">March</option>
				<option value="04">April</option>
				<option value="05">May</option>
				<option value="06">June</option>
				<option value="07">July</option>
				<option value="08">Aug</option>
				<option value="09">Sep</option>
				<option value="10">Oct</option>
				<option value="11">Nov</option>
				<option value="12">Dec</option>
			</select><span id="datesel1DIV">
					<select name="date1">
					<option>dd</option>
					</select> </span>
		</td>
		
	</tr>
	<tr>
		<td colspan='2'>Location :<span class='style3'>*</span></td>
		<td width="254"><input type='text' name='location' maxlength="200" title='Please enter the time of using the speakers'/></td>
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
					
					

	<table width='90%' align='center' cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%" height="73">&nbsp;</td>
		<td height="73" width="257"><input id="submit" class="contSubmit" onclick="return loadSubmit()"  type="submit" value="Submit"/> <p style="visibility:hidden;" id="progress"><img id="progress_image" style="padding-left:5px;padding-top:5px;" src="images/ajax-loader.gif" alt=""></img></p> </td>
		<td height="73" width="84"><input type="reset" value="Reset"/></td>
		<td height="73" width="20%">&nbsp;</td>
		
	</tr>
	
	</table>

</div>
</form></div>
<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
		
    </div></div>

</body>
</html>