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
<title>Message From DGP | LAW &amp; ORDER</title>
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
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />      <br/>
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
       <table align=center><tr><td> <h1><font color=green>Message From DGP</font></h1></td></tr></table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" height="89">
  <tr>
    <td width="25%" rowspan="3" height="89" valign="top">
      <p class="style17" class="style17" align="center">&nbsp;</p>
    </td>
    <td width="75%" height="22" colspan="2">
      <p class="style17" class="style17" align="center"><img border="0" src="sureksha.jpg" width="94" height="24"></td>
  </tr>
  <tr>
    <td width="75%" height="25" colspan="2">
      <p class="style18" align="center"><font color="#FF8000" ><b>Service,
      Security and Cooperation&nbsp;</b></font></p></td>
  </tr>
  <tr>
    <td width="75%" height="42" colspan="2">
      <p class="style17" align="center"><b>Message
from the DGP, Haryana</b></p>
    </td>
  </tr>
  <tr>
    <td width="25%" valign="top" height="641">
      <p class="style17"  align="center" style="line-height: 100%">
        <img border="0" src="images/DGP_0142.JPG" width="134" height="195">
      <p class="style17" align="center" style="line-height: 100%"><font color="#800040"><font face="Verdana"><b><small>
      Shriniwas Vashisht, IPS<br/>
      DGP, Haryana</small></b><br/>
      </font><br/>
      </font></p>
                 <br/>
      <p class="style17" >&nbsp;</p>
      <p class="style17" >&nbsp;</p>
      <p class="style17" >&nbsp;</p>
      <p class="style17" >&nbsp;</p>
      <p class="style17" >&nbsp;</p>
      <p class="style17" >&nbsp;</p></td>
		<td width="75%" colspan="2" valign="top" align="justify" height="641">
		<p class="MsoNormal" style="text-align: justify; line-height: 150%">
		<span
			style="font-size: 10.0pt; line-height: 150%; font-family: Verdana; color: navy">I
		extend a hearty welcome to all on the website of Law &amp; Order Automation.&nbsp;
		I am a firm believer that without public support, no Police force in
		the country can be effective. No operation against criminals,
		terrorists, anti-socials elements, economic offenders, smugglers etc.
		can be successful without the active cooperation of the public. It is
		the duty of Senior Police Managers to create an environment where
		public willingly co-operates with law-enforcing agencies. Our
		objective is to provide a fair, impartial, efficient, transparent and
		accountable Police administration.</span></p>
		<p class="MsoNormal" style="text-align: justify; line-height: 150%">
		<font face="Verdana" size="2" color="#000080">&nbsp;</font><span
			style="font-size: 10.0pt; line-height: 150%; font-family: Verdana; color: navy">Officers
		and men of Haryana Police worked hard tirelessly during the year and
		maintained effective control on crime and criminals on one hand and
		strived hard to maintain peace and harmony amidst challenging and
		provocative situations.</span></p>
		<p class="MsoNormal" style="text-align: justify; line-height: 150%">
		<span
			style="font-size: 10.0pt; line-height: 150%; font-family: Verdana; color: navy">Police
		department made good progress in use of Information Technology in its
		day-to-day working.&nbsp; FIRs relating to theft of vehicles and
		accidents have been put on Police Website to make it easier for the
		public to get the copy of the FIR instantly without approaching the
		Police Stations. Since November, 2007 computerized FIRs are being
		recorded on CIPA (Common Integrated Police Application) in all Police
		Stations of the State. The computerized copies of FIRs are being given
		to the complainants. The challans generated on CIPA are being put in
		Courts. Haryana is the first State in India to implement all modules
		of CIPA in all Police Stations.</span></p>
		<p class="MsoNormal" style="text-align: justify; line-height: 150%">
		<font face="Verdana" size="2" color="#000080">&nbsp;</font><span
			style="font-size: 10.0pt; line-height: 150%; font-family: Verdana; color: navy">During
		the year 2011, 37 DSP offices of the sub-divisions and all 263 Police
		Stations of the State have been linked on State Wide Area Network for
		transfer of voice on Telephone, document on FAX and for data transfer.</span></p>
		<p class="MsoNormal" style="text-align: justify; line-height: 150%">
		<font face="Verdana" size="2" color="#000080">&nbsp;</font><span
			style="font-size: 10.0pt; line-height: 150%; font-family: Verdana; color: navy"></span>
		<font face="Verdana" size="2" color="#000080"></font>&nbsp;</p>
		</td>
	</tr>
  <tr>
    <td width="25%" height="139">&nbsp;</td>
    <td width="44%" height="139"><font color="#000080" size="2">
    <span style="font-family: Arial; ">Date : 31.10.2012</span></font></td>
    <td width="31%" height="139">
      <p class="style17" class="style17" align="center">&nbsp;
      <p class="style17" class="style17" align="center">&nbsp; <b><font color="#0000FF" FACE="Century Gothic">
      Shriniwas Vashisht&nbsp;<br/></font></b></p><font color="#008080" FACE="Century Gothic"><strong><small>Director
      General of Police,</small><br/>
      <small>Haryana.</small></strong></font></td>
  </tr>
</table> </div><div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div>
</div>


</body>
</html>