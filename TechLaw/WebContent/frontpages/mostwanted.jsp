<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" import="java.sql.*"  %>
<%@ page import="java.util.*,java.io.*"%>
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
<title><%=captions.getString("title")%> | Techjustice</title>
<meta name="keywords" content="A Techjustice initiative to a corruption free India!" />
<meta name="description" content="A Techjustice initiative to a corruption free India!" />
<script type="text/javascript" src="../techfiles/ajax.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
</head>
<body>

<!--Script ends-->
<div id="langholder" style="top:15px;">
Languages:
<a href="../Locale.jsp? lang=en">English</a> |
<a href="../Locale.jsp? lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="../Locale.jsp? lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
</div>
<div id="templatemo_header_wrapper">
    <div id="templatemo_header">
        <div id="site_title_section">
            <div id="site_title"><a href="../index.jsp" >
            


	          <%=captions.getString("title")%>
            </a></div>
            <div id="salogon">
	            <b><font color="blue" size="+1">&#2360;&#2375;&#2357;&#2366;&#45;&#2360;&#2369;&#2352;&#2325;&#2381;&#2358;&#2366;&#45;&#2360;&#2361;&#2381;&#2351;&#2379;&#2327;</font></b></div>
            <div class="cleaner">&nbsp;</div>
        </div>
        
        <div id="search_section">
            <form action="#" method="get">
                <input type="text" name="q" size="10" id="searchfield" title="searchfield" />
                <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" />
            </form>
        </div>    
    </div> <!-- end of header -->
</div>  <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
    <div id="templatemo_banner">
    
        <div id="banner_header_01"><%=captions.getString("msg1")%></div>
        <div id="banner_header_02"></div>
        <div id="banner_text">
            <p><%=captions.getString("msg")%></p>
            <div class="rc_btn_01"><a href="../aboutus.jsp"><%=captions.getString("cr")%>...</a></div>
        </div>
    </div>	<!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_menu_wrapper">    
    <div id="templatemo_menu">
        <ul>
            <li><a href="../index.jsp" class="current"><span></span><%=captions.getString("home")%></a></li>
            <li><a href="../ourservices.jsp"><span></span><%=captions.getString("services")%></a></li>
            <li><a href="../aboutus.jsp" target="_parent"><span></span><%=captions.getString("aboutus")%></a></li>
            <li><a href="../homedetective.jsp"><span></span><%=captions.getString("detectives")%></a></li>
            <li><a href="../homelaw.jsp"><span></span><%=captions.getString("lawacts")%></a></li>
            <li><a href="../usersignin.jsp"><span></span><%=captions.getString("login")%></a></li>
            
            <li><a href="#"><span></span><%=captions.getString("contact")%></a></li>
        </ul>    	
    </div> <!-- end of menu -->
</div> <!-- end of menu wrapper -->
<div id="templatemo_content_wrapper">
<div id="templatemo_content">
<center><h1><%out.print(captions.getString("reportwanted"));  %></h1></center>
<!-- Validation Script Start -->
<script type="text/javascript" language="javascript">
function check()
	{	
			var msg = validateField(document.RegistrationForm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.email.focus();
					return false;
				}
				if(msg.legnth==0)
				{
				alert("please enter your e mail id");
				document.RegistrationForm.email.focus();
				return false;
				}
			var msg1 = validateField(document.RegistrationForm.name,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg1.length > 0)			
				{
					alert("Enter proper name");	
					document.RegistrationForm.name.focus();
					return false;
				}
				if(msg1.legnth==0)
				{
				alert("please enter your name");
				document.RegistrationForm.name.focus();
				return false;
				}
			var msg2 = validateField(document.RegistrationForm.contact);
				if(msg2.value =='CONTACT','contact','xyz','0000','0000000000','\'"/\\@#^,&*~-$%!');			
				{
					alert("Enter proper contact number");	
					document.RegistrationForm.contact.focus();
					return false;
				}
				if(msg2.legnth==0)
				{
				alert("please enter your contact");
				document.RegistrationForm.contact.focus();
				return false;
				}
				if(msg2.legnth<12)
				{
				alert("please enter 12 digit contact number,in case of mobile add 00");
				document.RegistrationForm.contact.focus();
				return false;
				}
			var msg3 = validateField(document.RegistrationForm.criminal_info);
				if(msg3.length =='0');			
				{
					alert("Enter criminal details");	
					document.RegistrationForm.ccriminal_info.focus();
					return false;
				}
				if(msg3.length <10);			
				{
					alert("Enter criminal details in more than 10 characters");	
					document.RegistrationForm.ccriminal_info.focus();
					return false;
				}
			var msg4 = validateField(document.RegistrationForm.ip,'STRING','6','15','IP Address','');
				if(msg4.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.ip.focus();
					return false;
				}
				
				
						

	}	
</script>
<form name="RegistrationForm" method="post" action="mostwantedcheck.jsp"  enctype="multipart/form-data" onsubmit="return check()">
<table width='100%' border="0">
<tr>
	<td valign='top' width="2%">
	

		
</td>
<!-- Left column end -->

<!--content column start -->
<td valign="top" width="98%">
<table width='100%' border="1" align="center" >

<tr>
		<td >
		
			<table width='90%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'align="center">
				<tr>
					<td colspan="2" class='colour' style='text-align:center'></td>
					
				</tr>
				<tr>
					<td colspan="2"align="center"><h3><strong><%out.print(captions.getString("criminaldetail"));  %></strong></h3></td>
					
				</tr>
				
				<tr><% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select i.id as id1,i.file,t.name1,t.last,t.height,t.weight,t.alias,t.birth,t.sdhname,t.date,t.color,t.haircolor from sakansha.criminal as i,xmltable('$c/criminal' passing i.details as \"c\" columns name1 varchar(100) path 'name1',last varchar(200) path 'last',height varchar(10) path 'height',weight varchar(15) path 'weight',alias varchar(100) path 'alias',birth varchar(100) path 'birth',date varchar(100) path 'date',sdhname varchar(50) path 'sdhname',color varchar(50) path 'color',haircolor varchar(50) path 'haircolor') as t where id="+request.getParameter("id")+" ");
							while(rs.next())
							{%>
					<td style="width: 120px" width="326"><%
	 out.print(captions.getString("wname"));  %></td>
					<td width="500"><input type='text' id="cname" readonly="readonly" name='cname' value="<%=rs.getString("name1") %>" maxlength='35' />
					<input type='hidden' id="id1" name='id1' value="<%=rs.getString("id1") %>" maxlength='35' /></td>
					<td></td><td width="365"><img
			src="../upload/criminal/<%=rs.getString("file") %>" width="96"
			height="96" /> </td>
				</tr>
				<tr>
					<td width="326"></td>
					<td width="838"><span></span> </td>
				</tr>
				<tr>
				<td width="326"></td>
					<td colspan='2'><span id="usernameDIV"></span></td>
				</tr>
				<tr>
					<td width="326"></td>
				</tr>
				<tr>
					<td width="326"><% out.print(captions.getString("dob"));  %></td>
					<td width="838"><input type='text' id="dob" readonly="readonly" name='dob' value="<%=rs.getString("date") %>" maxlength='14'/><span class='style3'> </span></td>
				</tr>
				<tr>
					<td width="326"><%
	 out.print(captions.getString("foundplace"));  %></td>
					<td width="838"><input type='text' id="placefound" name='placefound' maxlength='14' /></td>
				</tr>
				<tr>
					<td width="326" height="56"><%out.print(captions.getString("typeinfo"));  %></td>
					<td width="838" height="56"><textarea rows="3" id="criminal_info" cols="24"
							name="criminal_info"></textarea></td>
				</tr>
				
</table>
<table width='90%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top' align="center">
	<tr class="colour">
		<td colspan="4" align="center"><b><h3><%
	 out.print(captions.getString("personalinfo"));  %></h3></b></td></tr><tr><td colspan="4" align="center"><font color="red"><%
	 out.print(captions.getString("personalinfomsg"));  %></font></td>
	</tr>
	<tr>
		<td style="width: 120px" width="323"><%
	 out.print(captions.getString("wname"));  %>: <span class='style3'><font
									color="red"></font></span></td>
		<td width="310"><input type="text" name="name" id="name" maxlength="200"			title="Enter your name"/></td>
	</tr>
	<tr>
		<td width="323"><%
	 out.print(captions.getString("contact"));  %>: <span class='style3'><font
									color="red"></font></span></td>
		<td width="310"><input type="text" name="contact" id="contact" maxlength="200"			title="Enter your contact number"/></td>
	</tr>
	<tr>
		<td width="323"><% out.print(captions.getString("email"));  %>:<span class='style3'><font
									color="red">*</font></span></td>
		 <td width="310"><input type="text" id=email name=email maxlength="60" " /> <%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>
      
	</td>
		 
	
	</tr>
		<tr>
		<td>IP ADDRESS</td>
		<td><input type="text" name="ip"/></td>
	</tr>
	<tr>
	<td  color: "black" ;font-weight:"bold";font-size:"15pt"><font color="red" size="+1" ><b>
<%try {
	
	
	 out.println("IP:"+request.getRemoteAddr());
	 	 
	 }
	catch(Exception e) {
	 out.println("Error"+e.getMessage());
	 }

%></b></font></td>
	</tr>
	
	<tr>
		<td width="334"><img id="image" src="../captcha.jsp"/><br/><a href="#" onclick="document.getElementById('image').src = '../captcha.jsp?sid=' + Math.random(); return false">Reload image</a></td>
		<td width="310"><input type='text' maxlength="5" name='captcha'/> <span class="style3"></span></td>
	</tr>
	<tr>
		<td width="25%">&nbsp;</td>
		<td width="310"><input id="submit" type="submit" value="Submit" onclick="return check()" /></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	
	
	

</table>

</td></tr></table></td></tr></table></form></div></div>
<div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="../index.jsp">TechJustice</a> | <a href="" target="_parent">
        Contact Us</a> | <a href="" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
			
			</body>
			</html>