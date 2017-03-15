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
<title>Missing Person | LAW &amp; ORDER</title>
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
        <script type="text/javascript" language="javascript">
function checkform()
	{	
				var str = validateField(document.RegistrationForm.name,'NAME','1','50','Missing Person\'s Name','/\\@#^,&*~-$%!');
				if(str.length > 0)			
				{
					alert(str);	
					document.RegistrationForm.name.focus();
					return false;
				}
			if(document.RegistrationForm.colour.selectedIndex<1)
				{
					alert("Select the colour of missing person");
					document.RegistrationForm.colour.focus();
					return false;
				}
			msg=validateField(document.RegistrationForm.height,'INT','0','3','height of missing person','');
				if(msg.length>0)
					{
						alert(msg);
						document.RegistrationForm.height.focus();
						return false;
					}
					msg=validateField(document.RegistrationForm.weight,'INT','0','3','weight of missing person','');
				if(msg.length>0)
					{
						alert(msg);
						document.RegistrationForm.weight.focus();
						return false;
					}
			
				
				msg = validateField(document.RegistrationForm.lostplace,'STRING','5','200','Lost Place','/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.lostplace.focus();
					return false;
				}
				if(document.RegistrationForm.district.selectedIndex<1)
				{
					alert("Select the district");
					document.RegistrationForm.district.focus();
					return false;
				}
				if(document.RegistrationForm.area.selectedIndex<1)
				{
					alert("Select the Area");
					document.RegistrationForm.area.focus();
					return false;
				}
				if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select your Year of Birth");
					document.RegistrationForm.year.focus();
					return false;
				}
				if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select your Month of Birth");
					document.RegistrationForm.month.focus();
					return false;
				}
				if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select your Date of Birth");
					document.RegistrationForm.date.focus();
					return false;
				}
				
					msg = validateField(document.RegistrationForm.dressing,'STRING','5','1000','Dressing details of missing person','');
					if(msg.length > 0)			
					{
						alert(msg);	
						document.RegistrationForm.dressing.focus();
						return false;
					}					
		return false;
	}	
</script>
<form onsubmit="return checkform()" name="RegistrationForm" method="post" action="missingpersoncheck.jsp"  enctype="multipart/form-data">
<!--content column start -->

				<div align='center'>
		
					<center><h1 align="center">Missing Person Complaint Form</h1></center>
					
				</div>
<div align="center">
		<table width='90%' align='center' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				
				<tr>
					<td colspan="2" class='color'><strong><font color=red>Enter all the fields marked as *. Registering a fake complaint is Punishable Offence. You could be charged heavily for that.</font></strong></td>
					
				</tr>
				<tr>
					<td>Name:<span class='style3'>*</span></td>
					<td ><input type='text' name='name' maxlength='100' title='Please enter the name of the lost person'/></td>
				</tr>
				<tr>
					<td>Gender:<span class='style3'>*</span></td>
					<td >
						<input type='radio' name='gender' value="1" maxlength='100' checked="checked"/>Male
						<input type='radio' name='gender' value="2" maxlength='100'/>Female
					</td>
				</tr>
				<tr>
					<td >Colour: <span class='style3'>*</span></td>
					<td><select style="width: 147" name="color" >
				<option value="0">Select</option>
				<option value="1">Black</option>
				<option value="2">White</option>
				<option value="3">Brown</option>
				<option value="4">Black</option></select></td>
				</tr>
				<tr>
					<td>Height(in cm):<span class='style3'>*</span></td>
					<td><input type="text" name="height" maxlength="3" title="Pleae enter the height of missing person"/></td>
				</tr>
				<tr>
					<td>Weight(in kg):<span class='style3'>*</span></td>
					<td><input type="text" name="weight" maxlength="3" title="Pleae enter the weight of missing person"/></td>
				</tr>
				<tr>
					<td>Lost Place:<span class='style3'>*</span></td>
					<td><input type="text" name="lostplace" maxlength="200" title="Pleae enter the lost place of missing person"/></td>
				</tr>
				<tr>
		<td width="40%">District
		
			<%
			db.connect();
			ResultSet rs=null;
			rs=db.execSQL("select * from SAKANSHA.DISTRICT");
			
			%><select  onchange='loadareas(this.value)' name='district'>
			<option value="0">Select</option>
			<%
			while(rs.next())
			{
				%><option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%> </option><%
			}
			db.close();
			 %></select>
			
		</td>
	
		<td>Area <span id="areaDIV"><select name='area'><option>Select district first</option></select> </span></td>
	</tr>
				<tr>
					<td>Date and Time when he/she lost:<span class='style3'>*</span></td>
					<td ><select name="year" onchange="listdate(document.RegistrationForm.month.value,this.value)">
				<option value='0'>year</option>
				<%
			Date date=new Date();


			SimpleDateFormat simpleDateformat=new SimpleDateFormat("yyyy");
			int a=Integer.parseInt(simpleDateformat.format(date));
			for(int i=a;i>=1947;--i)
			{
			%>
			<option value='<%=i %>'><%=i %></option>
			<%}
			}
			
			 %>
				</select>
				 <select name="month" onchange="listdate(this.value,document.RegistrationForm.year.value)">
				<option value="0">mon</option>
				<option value="01">jan</option>
				<option value="02">feb</option>
				<option value="03">mar</option>
				<option value="04">apr</option>
				<option value="05">may</option>
				<option value="06">jun</option>
				<option value="07">jul</option>
				<option value="08">aug</option>
				<option value="09">sep</option>
				<option value="10">oct</option>
				<option value="11">nov</option>
				<option value="12">dec</option>
			</select><span id="dateselDIV">
					<select name="date">
					<option>dd</option>
					</select> </span>
		</td></tr>
			<tr >
					<td >Dressings when he/she was lost:<span class='style3'>*</span></td>
		 			<td><textarea name="dressing" name="dressing"></textarea></td>
		 		</tr>
		 		<tr>	
				 	<td >Photo of missing person: <span class='style3'></span></td>
		 			<td><input type="file" name="photo" /></td>
				</tr>
				<tr>
					<td >Do you think whether the person has gone willingly:<span class='style3'>*</span></td>
					<td  ><input type="radio" onclick="load3(this.value)" name="escape" value="Yes"/> Yes <input type="radio" onclick="load3(this.value)" name="escape"  value="No" />No</td>
				</tr>
						<tr><td>
					<script type='text/javascript' language="javascript">
				function load3(str)
					{
					if(str=="Yes")
						{
						document.getElementById("leftDIV3").innerHTML="Reason: <span class='style3'>*</span>";
						document.getElementById("rightDIV3").innerHTML="<textarea  name='reason' ></textarea>";
						}
					if(str=="No")
						{
						document.getElementById("leftDIV3").innerHTML="";
						document.getElementById("rightDIV3").innerHTML="";
						}
					}
					</script>
				</td></tr>
				<tr>
					<td valign="top" >
						<span id="leftDIV3"></span>
					</td>
					<td>
						<span id="rightDIV3"></span>
					</td>
				</tr> 
				<tr>
					<td>Do you think whether the person has kidnapped:<span class='style3'>*</span></td>
					<td  ><input type="radio" name="kidnap"  value="yes"/> Yes <input type="radio" name="kidnap"  value="No" />No</td>
				</tr>
						
				<tr>
					<td valign="top" >
						<span id="leftDIV4"></span>
					</td>
					<td>
						<span id="rightDIV4"></span>
					</td>
				</tr>
				<tr>
					<td>Do you know any details about Kidnapper:<span class='style3'>*</span></td>
					<td  ><input type="radio" name="kidnap_person" onclick="load2(this.value)" value="Yes"/> Yes <input type="radio" onclick="load2(this.value)" name="kidnap_person" value="No" />No
					<script type='text/javascript'>
				function load2(str)
					{
					if(str=="Yes")
						{
						document.getElementById("leftDIV2").innerHTML="Kidnappers Details: <span class='style3'>*</span>";
						document.getElementById("rightDIV2").innerHTML="<textarea  name='kidnapper' ></textarea>";
						}
						
						
						if(str=="No")
						{
						document.getElementById("leftDIV2").innerHTML="";
						document.getElementById("rightDIV2").innerHTML="";
						}
					}
					</script>
					</td>
				</tr>
				 
					
				
				<tr>
					<td valign="top" >
						<span id="leftDIV2"></span>
					</td>
					<td>
						<span id="rightDIV2"></span>
					</td>
				</tr> 
		 		<tr>
					<td >Do you want to give any reward:<span class='style3'>*</span></td>
					<td  ><input  type="radio" name="reward" onclick="load(this.value)" value="Yes"/> Yes <input type="radio" onclick="load(this.value)" name="reward"  value="No" />No</td>
				</tr>
				<tr>
					<td>
						<script type='text/javascript'>
								function load(str)
						{
						if(str=="Yes")
							{
							document.getElementById("leftDIV").innerHTML="Reward Details: <span class='style3'>*</span>";
							document.getElementById("rightDIV").innerHTML="<textarea  name='rewarddetails' ></textarea>";
							}
							if(str=="No")
							{
							document.getElementById("leftDIV").innerHTML="";
							document.getElementById("rightDIV").innerHTML="";
							}
						}
						</script>
					</td>
				</tr>
				<tr>
					<td valign="top" >
						<span id="leftDIV"></span>
					</td>
					<td>
						<span id="rightDIV"></span>
					</td>
				</tr>
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

<p>&nbsp;</p>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
		
      </div>
  </div>
</body>
</html>
