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
<title>Organization | LAW &amp; ORDER</title>
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
      <table align=center><tr><td>  <h1><font color=green>Police Organization</font></h1></td></tr></table><br /><br />
<table border="0" cellpadding="0" cellspacing="0" width="81%" height="16">
  <tr>
    <td width="100%" height="30" valign="top">
      <p align="center"><b><i><font face="Verdana" size="4" color="#FF0000">
      POLICE HEADQUARTERS</font></i></b></p><p align="center">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="100%" height="1" valign="top">
    <font face="Verdana" size="2">The State Police is presently headed by</font><font face="Verdana" color="#800000" size="2">
    <b>Shri Shriniwas Vashisht, IPS, Director General of Police.</b> </font>
    <font face="Verdana" size="2">At State Police Headquarters located in Sector 
    6, Panchkula and in the field units, he is assisted by the following senior 
    officers:</font><p>&nbsp;</p>
    <table border="2" cellpadding="3" cellspacing="3" bordercolor="#808080" width="100%" id="AutoNumber1" height="62">
      <tr>
    <td width="10%" height="23" valign="baseline" align="left">
      <p align="center"><b><font size="2" color="#800000" face="Verdana">S. No.</font></b></p></td>
    <td width="30%" height="23" valign="baseline" align="center">
      <p align="left"><b><font face="Verdana" color="#800000" size="2">Posting</font></b></p></td>
    <td width="35%" height="23" valign="baseline" align="left">
      <p style="margin-top: 0; margin-bottom: 0">
      <b><font face="Verdana" color="#800000" size="2">Name</font></b></p>
      <p style="margin-top: 0; margin-bottom: 0">
      <b><font face="Verdana" color="#800000" size="2">S/Shri</font></b></p></td>
      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" color="#000080" size="2">1.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">
      DG/OSD Rules</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">R.K. Vachher, IPS</font></td>
      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" color="#000080" size="2">2.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">
      DG/</font><span><font face="Verdana" size="2" color="#000080">Administration</font></span></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Anil Dawra, IPS</font></td>

      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" color="#000080" size="2">3.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">ADGP/HR &amp; Litigation</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Mohinder Singh Mann, IPS</font></td>

      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">4.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">ADGP/</font><span><font face="Verdana" size="2" color="#000080">Operations</font></span></td>
    <td width="35%" height="13" valign="top" align="left">
<span>
      <font face="Verdana" size="2" color="#000080">Dr. Rajwant Singh, IPS</font></span></td>

      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">5.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">ADGP/Crime against Women</font></td>
    <td width="35%" height="13" valign="top" align="left">
<span><font face="Verdana" size="2" color="#000080">K. Selvaraj, IPS</font></span></td>

      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">6.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">ADGP/Law &amp; Order</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">K. K. Sharma, IPS</font></td>

      </tr>


      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">7.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">IGP/Law &amp; Order-II</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Muhammad Akil, IPS</font></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">8.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">IGP/Modernization</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Dr. R.C. Mishra, IPS </font></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">9.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">IGP/Provisioning</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Kuldeep Singh Siag, IPS</font></td>

      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
<span>
      <font face="Verdana" size="2" color="#000080">10.</font></span></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">IGP/Crime Against Women</font></td>
    <td width="35%" height="13" valign="top" align="left">
<span>
      <font face="Verdana" size="2" color="#000080">Dr. Suman Manjari, IPS</font></span></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">11.</font></td>
    <td width="30%" height="13" valign="top">
<span>
      <font face="Verdana" size="2" color="#000080">AIG/Welfare</font></span></td>
    <td width="35%" height="13" valign="top" align="left">
<span>
      <font face="Verdana" size="2" color="#000080">Ved Parkash, IPS</font></span></td>

      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">12.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">DSP/Law &amp; Order</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Surender Vats, HPS</font></td>

      </tr>

      <tr>
    <td width="75%" height="39" valign="top" align="center" colspan="3" bordercolor="#FFFFFF">
      <b><i><font face="Verdana" size="4" color="#FF0000">CID</font></i></b></td>
      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <b><font color="#800000" size="2"><font face="Verdana">S. No.</font></font></b></td>
    <td width="30%" height="13" valign="top">
      <b><font color="#800000" size="2"><font face="Verdana">Posting </font>
      </font></b></td>
    <td width="35%" height="13" valign="top" align="left">
      <p style="margin-top: 0; margin-bottom: 0">
      <b><font face="Verdana" color="#800000" size="2">Name</font></b></p>
      <p style="margin-top: 0; margin-bottom: 0">
      <b><font face="Verdana" color="#800000" size="2">S/Shri</font></b></p></td>
      </tr>
      <tr>
    <td width="10%" height="13" valign="top" align="center">
      <font size="2" color="#000080"><font face="Verdana">1.</font></font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">ADGP/CID</font></td>
    <td width="35%" height="13" valign="top" align="left">
<span><font face="Verdana" size="2" color="#000080">Anant Kumar Dhul, IPS</font></span></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">2.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">IGP/CM's Flying Squad</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">P.K. Agrawal, IPS</font><span><font face="Verdana" size="2" color="#000080"> 
      (Additional Charge)</font></span></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">3.</font></td>

    <td width="30%" height="13" valign="top">
      <p align="left"><font face="Verdana" size="2" color="#000080">IGP/CID</font></p></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Ajay Singhal, IPS</font></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">4.</font></td>
    <td width="30%" height="13" valign="top">
      <p align="left"><font face="Verdana" size="2" color="#000080">IGP/CID</font></p></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Sat Parkash Ranga, IPS</font></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">5.</font></td>
    <td width="30%" height="13" valign="top">
      <p align="left"><font face="Verdana" size="2" color="#000080">DIG/CID</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Sandeep Khirwar, IPS</font></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">6.</font></td>

    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">DIG/CID</font></td>
    <td width="35%" height="13" valign="top" align="left">
<span>
      <font face="Verdana" size="2" color="#000080">K.K. Rao, IPS</font></span></td>
      </tr>
      <tr>

<td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">7.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">SP/CID</font></td>
    <td width="35%" height="13" valign="top" align="left">
<font face="Verdana" size="2" color="#000080">V</font><span><font face="Verdana" size="2" color="#000080">ikas Arora, IPS</font></span></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">8.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">SP/CID</font></td>
    <td width="35%" height="13" valign="top" align="left">
<font face="Verdana" size="2" color="#000080">Saurabh Singh, IPS</font></td>

      </tr>
      <tr>

    <td width="10%" height="13" valign="top" align="center">
      <font face="Verdana" size="2" color="#000080">9.</font></td>
    <td width="30%" height="13" valign="top">
      <font face="Verdana" size="2" color="#000080">Additional SP/CID</font></td>
    <td width="35%" height="13" valign="top" align="left">
      <font face="Verdana" size="2" color="#000080">Arun Singh, IPS</font></td>

      </tr>
     
     </table></td></tr></table></div>
      
<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div></div>

</body>
</html>