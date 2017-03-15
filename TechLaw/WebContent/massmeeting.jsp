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
<script language="javascript" src="techfiles/dateandtime.js"></script>
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<title>Mass Meeting License | LAW &amp; ORDER</title>
<script type="text/javascript">
             function loadSubmit() {
var ProgressImage = document.getElementById('progress_image');
document.getElementById("progress").style.visibility = "visible";
setTimeout("ProgressImage.src = ProgressImage.src",100);
return true;
} </script>
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
<!--Script starts-->

<script type="text/javascript" language="javascript">
function checkform()
	{	
			msg = validateField(document.RegistrationForm.reason,'STRING','5','200','Reason for Meeting','');
			if(msg.length > 0)			
			{
				alert(msg);	
				document.RegistrationForm.reason.focus();
				return false;
			}
			msg = validateField(document.RegistrationForm.place,'STRING','5','1000','Place of Occurance','');
			if(msg.length > 0)			
			{
				alert(msg);	
				document.RegistrationForm.place.focus();
				return false;
			}
			
			if(document.RegistrationForm.s_time.value.length == 0)			
			{
				alert("Enter Starting time of Meeting");	
				document.RegistrationForm.s_time.focus();
				return false;
			}
			if(document.RegistrationForm.e_time.value.length == 0)			
			{
				alert("Enter Ending time of Meeting");	
				document.RegistrationForm.e_time.focus();
				return false;
			}
			msg=validateField(document.RegistrationForm.participants,'INT','0','7','No. of Participants','/\\@#^,&*~-$%!');
			if(msg.length>0)
			{
				alert(msg);
				document.RegistrationForm.participants.focus();
				return false;
			}
		return true;
	}	
</script>
<script language="javascript">
	window.addEvent("domready", function (){
		
		var tp2 = new TimePicker('time2_picker', 's_time', 'time2_toggler', {format24:true});
		var tp2 = new TimePicker('time3_picker', 'e_time', 'time2_toggler', {format24:true});
		
	});
</script>
<!--Script ends-->
        <form name="RegistrationForm" method="post" action="massmeetingcheck.jsp" onsubmit="return checkform()">

				<div align='center'>
		
					<h1><font color="teal">Application for Mass Meeting License</font></h1>
					
				</div>
	<div align="center">
		<table width='90%' align='center' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				
				<tr>
					<td colspan="2" class='color'><strong>Meeting Information</strong></td>
					
				</tr>
				<tr>
					<td colspan='2'>Reason :<span class='style3'>*</span></td>
					<td width="162"><input type='text' name='reason' maxlength='200' title='Please enter the purpose for meeting'/></td>
				</tr>
				<tr>
					<td colspan='2'>Meeting Place :<span class='style3'>*</span></td>
					<td width="162"><textarea name='place' title='Please enter the place of occurance'></textarea></td>
				</tr>
				<tr>
					<td colspan='2'>Meeting Duration : <span class='style3'>*</span></td>
				</tr>
				
				<tr>
				
				
					<td width="93">Start Time :</td>
					<td width="171"><input type="text" name="s_time" id="s_time" /> <div id="time2_picker" class="time_picker_div"></div>	</td>
					<td width="162">End Time:</td>
					<td width="137"><input type="text" name="e_time" id="e_time" /> <div id="time3_picker" class="time_picker_div"></div>	</td>
				</tr>
				<tr>
					<td width="93">Total People:<span class='style3'>*</span></td>
					<td width="171"><input type='text' name='participants' maxlength='8' title='Please enter the total no of participants of meeting'/></td>
				</tr>
				
	</table>
<table class='back' width='90%' style='text-align:center;vertical-align: top' align="center" cellspacing='5' cellpadding="5" >
<tr><td colspan="2" align="left"><strong></strong></td></tr>
	<% 
						try
						{
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
						
						<tr align="left"><td  style="text-align:left" id='name-text'>Name  </td><td> : <%=rs2.getString("name") %> </td></tr>
						<tr align="left"><td  style="text-align:left" id='father-text'>Father Name  </td><td> : <%=rs2.getString("father") %> </td></tr>
						<tr align="left"><td  style="text-align:left" id='dob-text'>D.O.B  </td><td> : <%=rs2.getString("date")+"-"+month+"-"+rs2.getString("year") %> </td></tr>
						<tr align="left"><td  style="text-align:left" id='mobileno-text'>Mobile </td><td> : <%=rs2.getString("mobile") %> </td></tr>
						<tr align="left"><td  style="text-align:left" id='address-text'>Address </td><td> : <%=rs2.getString("address") %> </td></tr>
						<tr align="left"><td  style="text-align:left" id='district-text' height="46">Contact  </td><td height="46"> : <%=rs2.getString("district_name") %> </td></tr>
							<%}
							}
							catch(Exception e)
							{
								out.print(""+e.getMessage());
							}
							 %>
	</table>
	<table width='90%' align='center' cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td width="254"><input id="submit" type="submit" class="contSubmit" onclick="return loadSubmit()" value="Submit"/><p style="visibility:hidden;" id="progress"><img id="progress_image" style="padding-left:5px;padding-top:5px;" src="images/ajax-loader.gif" alt=""></img></p></td>
		<td width="91"><input type="reset" value="Reset"/></td>
		<td width="19%">&nbsp;</td>
		
	</tr>
	</table>
	
</div>

</form></div>
<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div></div>

</body>
</html>