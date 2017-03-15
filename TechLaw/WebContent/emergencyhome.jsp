<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
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
		 <script type="text/javascript" language="javascript">
function checkform()
	{	
		if(document.ecomplaint.crimetype.selectedIndex<1)
				{
					alert("Select Crimetype");
					document.ecomplaint.crimetype.focus();
					return false;
				}
		if(document.ecomplaint.district.selectedIndex<1)
				{
					alert("Select District");
					document.ecomplaint.district.focus();
					return false;
				}
		if(document.ecomplaint.area.selectedIndex<1)
			{
				alert("Select Area");
				document.ecomplaint.area.focus();
				return false;
			}
		msg = validateField(document.ecomplaint.complaint,'STRING','5','1000','Complaint','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.ecomplaint.complaint.focus();
					return false;
				}
		msg = validateField(document.ecomplaint.ip,'STRING','6','15','IP Address','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.ecomplaint.ip.focus();
					return false;
				}
				return true;
				msg = validateField(document.ecomplaint.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%',' ');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.ecomplaint.ip.focus();
					return false;
				}
				return true;
				
			
	}	
	
</script>
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
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" /> <%} %><%db.close(); %>  <br/>
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
         
<h2><font color="black">Emergency Complaint</font></h2>
<table cellspacing='5' cellpadding="5" width="96%" class="back" style="text-align:left">
<tr><td><strong>Just enter the fields below.</strong></td></tr>
					<tr><td>The Police officer in charge will be informed immediately about your complaint and action will be taken soon.</td></tr>
					
					
					
					<td width='80%' valign="top">
<table width='100%' border="0" >
	<tr>
		<td >
		<form method="post"     action="emergencyhomecheck.jsp"   id="ecomplaint" name="ecomplaint" onsubmit="return checkform()">

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
<tr class="colour">
		<td colspan="2"><h1>Register emergency complaint.</h1></td>
	</tr>
	<tr>
		<td colspan="2"><b><font color="red" size="+0">In case you
					provided false details, the police has complEtE right to take
					action and charge you for that</font>.</b>.
						</td>
		
	</tr>
	<tr>
		<td colspan="2" class="style3">
			
		</td>
	</tr>
	<tr>
	
	
	
	
		<td width="40%">TYPE OF CRIME</td>
		<td width="60%">
			<%
			db.connect();
			ResultSet rs1=null;
			rs1=db.execSQL("select * from SAKANSHA.COMPLAINTS_TYPE");
			
			%><select   name='crimetype'>
			<option value="0">select</option>
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
		<td width="40%">DISTRICT : </td>
		<td width="60%">
			<%
			db.connect();
			ResultSet rs=null;
			rs=db.execSQL("select * from SAKANSHA.DISTRICT");
			
			%><select  onchange='loadareas(this.value)' name='district'>
			<option value="0">select</option>
			<%
			while(rs.next())
			{
				%><option  value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%> </option><%
			}
			db.close();
			 %>
			 </select>
			
		</td>
	</tr>
	<tr>
		<td>AREA (where the crime occured) </td>
		<td><div id="areaDIV"><select name='area'><option id=1>--Select--</option></select> </div></td>
	</tr>
	<tr>
		<td valign="top">COMPLAINT</td>
		<td><textarea name="complaint" rows="10" cols="20"></textarea></td>
	</tr>
	<tr>
		<td>IP ADDRESS</td>
		<td><input type="text" name="ip"/></td>
	</tr>
	<tr>
	<td  color: black ;font-weight:bold;font-size:15pt">
<%try {
	
	
	 out.println("IP:"+request.getRemoteAddr());
	 	 
	 }
	catch(Exception e) {
	 out.println("Error"+e.getMessage());
	 }

%></td>
	</tr>
	<%
			db.connect();
			ResultSet rs5=null;
			rs5=db.execSQL("select TIME,NAME,MOBILE,USERNAME from SAKANSHA.SUBJECT as i, SAKANSHA.SIGNIN as a where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs5.next())
						{
						%>
		<input type="hidden" value="<%=rs5.getString("USERNAME")%>" name="email"  /><%} %><%db.close(); %>
		<input type="hidden" value="akanksha.saxena16@gmail.com" name="email2"  />
	
	
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table></form></td></tr></table><%} %>
</td></table>
<p>&nbsp;</p>



<p>&nbsp;</p>





<p>&nbsp;</p>
<% 	 			if(session.getAttribute("login")==null)
{
%>
					<jsp:forward	page="usersignin.jsp"><jsp:param name="err" value="Please sign in first." /></jsp:forward>	<%} %>	
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com">florida web design</a> | <a href="http://www.quackit.com">web tutorials</a> | <a href="http://www.htmlcodes.me">html codes</a> | <a href="http://www.free-templates.me">free templates</a></h3></div>
      </div>
   </div>
</body>
</html>
