<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" import="java.sql.*"  %>
<%@ page import="java.util.*,java.io.*"%>
<jsp:useBean id="db" class="database.dncon" />
<%
 String locale = (String) session.getAttribute("locale");
 if (locale == null)
  locale = "en";
 Locale c = new Locale(locale, locale);
 ResourceBundle captions = ResourceBundle.getBundle("Locale", c);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sign In | Techjustice</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<link href="css/lstyle1.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!-- Validation Script Start -->

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
<!-- Validation Script End -->

<div id="templatemo_header_wrapper">
    <div id="templatemo_header">
        <div id="site_title_section">
            <div id="site_title"><a href="index.jsp" >
            


	          <%=captions.getString("title")%>
            </a></div>
            <div id="salogon">
	            <b><font color="blue" size="+1">&#2360;&#2375;&#2357;&#2366;&#45;&#2360;&#2369;&#2352;&#2325;&#2381;&#2358;&#2366;&#45;&#2360;&#2361;&#2381;&#2351;&#2379;&#2327;</font></b></div>
            <div class="cleaner">&nbsp;</div>
        </div>
        
        <div id="search_section">
             <div id="langholder" style="top:15px;"><font color="white" size=4>
Languages:
<a href="Locale.jsp?lang=en">English</a> |
<a href="Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> </font>
</div>
        </div>    
    </div> <!-- end of header -->
</div>  <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
    <div id="templatemo_banner">
    
        <div id="banner_header_01"><%=captions.getString("msg1")%></div>
        <div id="banner_header_02"></div>
        <div id="banner_text">
            <p><%=captions.getString("msg")%></p>
            <div class="rc_btn_01"><a href="aboutus.jsp"><%=captions.getString("cr")%>...</a></div>
        </div>
    </div>	<!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_menu_wrapper">    
    <div id="templatemo_menu">
        <ul>
       <li><a href="index.jsp" class="current"><span></span><%=captions.getString("home")%></a></li>
            <li><a href="ourservices.jsp"><span></span><%=captions.getString("services")%></a></li>
            <li><a href="aboutus.jsp" target="_parent"><span></span><%=captions.getString("aboutus")%></a></li>
            <li><a href="homedetective.jsp"><span></span><%=captions.getString("tipsforcitizens")%></a></li>
            <li><a href="homelaw.jsp"><span></span><%=captions.getString("lawacts")%></a></li>
            <li><a href="usersignin.jsp"><span></span><%=captions.getString("login")%></a></li>
            <li><a href="contact.jsp"><span></span><%=captions.getString("contact")%></a></li> </ul>    	
    </div> <!-- end of menu -->
<center style="color:red">
	<%
	out.print(request.getParameter("err"));
	 %>
</center>
<table><td>
    
    
<div style="padding: 100px 0 0 250px;">


<div id="login-box">
<h2><font color="black"><%=captions.getString("ecomp")%></font></h2>
<table cellspacing='5' cellpadding="5" width="96%" class="back" style="text-align:left">
<tr><td><strong><%
	 out.print(captions.getString("ecompadv"));  %></strong></td></tr>
					<tr><td><%
	 out.print(captions.getString("nologin"));  %></td></tr>
					
					
					
					<td width='80%' valign="top">
<table width='100%' border="0" >
	<tr>
		<td >
		<form method="post"     action="ecomplaintcheck.jsp"   id="ecomplaint" name="ecomplaint" onsubmit="return checkform()">

<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
<tr class="colour">
		<td colspan="2"><h1><%
	 out.print(captions.getString("ecomp"));  %></h1></td>
	</tr>
	<tr>
		<td colspan="2"><b><font color="red" size="+0"><%
	 out.print(captions.getString("ecompred"));  %></font></b>.
						</td>
		
	</tr>
	<tr>
		<td colspan="2" class="style3">
			<%
	 out.print(captions.getString("ecomp"));  %>
		</td>
	</tr>
	<tr>
	
	
	
	
		<td width="40%"><%
	 out.print(captions.getString("typeofcrime"));  %></td>
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
		<td width="40%"><% out.print(captions.getString("ecompdistrict"));  %> : </td>
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
		<td><% out.print(captions.getString("ecomparea"));  %> :</td>
		<td><div id="areaDIV"><select name='area'><option id=1>--Select--</option></select> </div></td>
	</tr>
	<tr>
		<td valign="top"><% out.print(captions.getString("ecompcomplaint"));  %> :</td>
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
	<tr>
		<td valign="top">E MAIL ID : </td>
		<td><input type=text name="email" /></td>
		<input type="hidden" value="akanksha.saxena16@gmail.com" name="email2"  />
	</tr>
	
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table></form></td></tr></table>
</td></table></div></div></td>



</table>

</div>					
				
		



<div class="cleaner"></div>
                
    
    
            <div class="cleaner">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        
       
        
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div><div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        
       
      
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
        <div class="cleaner_h20">&nbsp;</div>
     <!-- end of content right -->

<div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="http://www.templatemo.com" target="_parent">
        Contact Us</a> | <a href="http://www.templatemo.com" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
			
			</body>
			</html>