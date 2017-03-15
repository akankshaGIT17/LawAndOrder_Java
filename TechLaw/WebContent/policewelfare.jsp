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
<title>Welfare | LAW &amp; ORDER</title>
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
						rs2=db.execSQL("select t.NAME,USERNAME,IMAGE,ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as a,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
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
    <table align=center><tr><td> <h1><font color=green> Welfare</font></h1></td></tr></table>
<br/>
<p class="style17" ALIGN="center"><b><font color="#FF0000" face="Verdana" size="3">Haryana Government has provided/granted 
    number of facilities to the police personnel of the State to improve the efficiency 
    and the morale of the police force</font></b></p>
  <font face="Arial, Helvetica, sans-serif"> 
  <ul>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2" face="Arial, Helvetica, sans-serif">Haryana Government vide Notification 
        No. 22/8/2002-3HG-I dated 12.6.2003 have decided that two years/one year 
        extension in service beyond the age of superannuation will be granted 
        to those non-gazetted Police Officers/Personnel who are recipients of 
        Police Medal, subject to physical fitness to discharge police duties and 
        satisfactory service record, as follows:-</font></li>
  </ul>
  <p class="style17" ALIGN="left">&nbsp;</p>
         <table border="1" width="88%">
    <tr> 
      <td class="style17" width="13%"> <p class="style17" align="center"><b> <font color="#FF0000"> &nbsp;<u>Sr.No.</u></font></b></td>
      <td class="style17" width="51%"> <p class="style17" align="center"> <font color="#FF0000"> <b><u>Name 
          of Medals&nbsp;&nbsp;</u></b>&nbsp;&nbsp;&nbsp;</font></td>
      <td class="style17" width="36%"> <p class="style17" align="center"> <font color="#FF0000"> <b><u>Extension 
          in Service&nbsp;</u></b>&nbsp;&nbsp;&nbsp;</font></td>
    </tr>
    <tr> 
      <td class="style17" width="13%"> <font color="#000080"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.</font></td>
      <td class="style17" width="51%"> <font color="#000080"> President's Police Medal for Gallantry 
        and Distinguished Service</font></td>
      <td class="style17" width="36%"> <font color="#000080"> Two year's extension in service</font></td>
    </tr>
    <tr> 
      <td class="style17" width="13%"> <font color="#000080"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.</font></td>
      <td class="style17" width="51%"> <font color="#000080"> Police Medal for Gallantry and Meritorious 
        service</font></td>
      <td class="style17" width="36%"> <font color="#000080"> One Year's extension in service</font></td>
    </tr>
  </table>
  <p class="style17" ALIGN="justify" style="line-height: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font color="#000080" size="2" face="Arial, Helvetica, sans-serif">This will boost the morale of Police Force doing gallantry work &amp; have 
    distinguished service record.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></p>
  <ul>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"> <font color="#000080" size="2" face="Arial, Helvetica, sans-serif"> Haryana Government vide Notification 
        No. 22/8/2002-3HG-I dated 17.05.2005 have decided that two advance increment/one 
        advance increment in service will be granted to those Deputy Superintendent 
        of Police who are recipients of Police Medals immediate after the date 
        of decision, as follows:-</font></li>
  </ul>
  <p class="style17" ALIGN="left"><font face="Verdana">&nbsp;</font></p>
  <table border="1" width="88%">
    <tr> 
      <td class="style17" width="14%"> <p class="style17" align="center"><b> <font color="#FF0000"> &nbsp;<u>Sr.No.</u></font></b></td>
      <td class="style17" width="50%"> <p class="style17" align="center"> <font color="#FF0000"> <b><u>Name 
          of Medals&nbsp;&nbsp;</u></b>&nbsp;&nbsp;&nbsp;</font></td>
      <td class="style17" width="36%"> <p class="style17" align="center"> <font color="#FF0000"> <b><u>
      No. of increments&nbsp;</u></b>&nbsp;&nbsp;&nbsp;</font></td>
    </tr>
    <tr> 
      <td class="style17" width="14%"> <font color="#000080"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.</font></td>
      <td class="style17" width="50%"> <font color="#000080"> President's Police Medal for Gallantry 
        and Distinguished Service</font></td>
      <td class="style17" width="36%"> <font color="#000080"> Two advance increments in service</font></td>
    </tr>
    <tr> 
      <td class="style17" width="14%"> <font color="#000080"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.</font></td>
      <td class="style17" width="50%"> <font color="#000080"> Police Medal for Gallantry and Meritorious 
        service</font></td>
      <td class="style17" width="36%"> <font color="#000080"> One advance increment in service</font></td>
    </tr>
  </table>
  <p class="style17" ALIGN="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font color="#000080" size="2" face="Arial, Helvetica, sans-serif">This will boost the morale of Police officers doing gallantry work &amp; have 
    distinguished service record.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></p>
  <ul>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">Police personnel 
        drawing Ration money @ Rs. 840/- to HAP, Rs. 1200/- to Commando and Rs. 
      600/- to other Police P.M.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">Diet money 
        to the members of Commando force has been increased from Rs. 20 per day 
        to Rs. 40/- per day and the Class IV employees of Commando Force drawing 
        Diet Money @ Rs. 3/- per day will be given Diet Money @ Rs. 20/- per day 
        now.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">Police employees 
        are now eligible to be transferred to districts of their home range except 
        their Home District and old policy of transferring police employees to 
        far away places from their home districts has been discontinued.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">System of 
        written test for selection for list B-1 Test is On line in the Police 
      Department.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">Police Constables 
        having 12 years of service shall automatically be promoted to the next 
        higher rank i.e., as EHC, 22 years as EASI &amp; 30 years as ESI.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%">
      <font size="2" color="#000080">KMA allowance admissible to policemen 
      DSP-Rs. 320/-, Inspr. Rs. 240/-, SI/ASI Rs. 160/- and ORs Rs. 100/-.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">A sum of 
        Rs. 10 lacs will be granted to the dependents of a deceased employee who 
        die in action and Rs. 5 lacs shall be given to those who sustain grievous 
        injuries in similar situations. Further the families of such deceased 
        officials shall be paid family pension equal to the last pay drawn.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%">
      <font size="2" color="#000080">Rs. Ten Lacs paid to the family of ASI Om 
      Parkash No. 17/PWL who sacrificed his life while fighting with anti social 
      elements on 21-02-2011.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%"><font color="#000080" size="2">Henceforth 
        the newly promoted DSP shall be paid uniform allowance from the date of 
        promotion instead of the date of approval of their appointment as DSP 
        by Haryana Public Service.</font></li>
    <li> 
      <p class="style17" ALIGN="justify" style="line-height: 150%">
      <font size="2" color="#000080">180 dependents of deceased Police personnel 
      have given Monthly Financial Assistance during the year 2011-12.</font></p></li>
      
      </div>
<div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div></div>

</body>
</html>