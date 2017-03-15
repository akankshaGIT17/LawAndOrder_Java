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
<title>Sign In | Techjustice</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>

<link href="style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/side.css" type="text/css" />

</head>
<body>
<!-- Validation Script Start -->

<script type="text/javascript" language="javascript">

	</script>
<!-- Validation Script End -->

<div id="langholder" align="left" style="top:15px;">
Languages:
<a href="Locale.jsp? lang=en">English</a> |
<a href="Locale.jsp? lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp? lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
</div>
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
            <form action="#" method="get">
                <input type="text" name="q" size="10" id="searchfield" title="searchfield" />
                <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" />
            </form>
        </div>    
    </div> <!-- end of header -->
</div>  <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
    <div id="templatemo_banner">
    
        <div id="banner_header_01" align="left"><%=captions.getString("msg1")%></div>
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
            <li><a href="#" class="current"><span></span><%=captions.getString("home")%></a></li>
            <li><a href="#"><span></span><%=captions.getString("services")%></a></li>
            <li><a href="aboutus.jsp" target="_parent"><span></span><%=captions.getString("aboutus")%></a></li>
            <li><a href="#"><span></span><%=captions.getString("detectives")%></a></li>
            <li><a href="#"><span></span><%=captions.getString("lawacts")%></a></li>
            <li><a href="usersignin.jsp"><span></span><%=captions.getString("login")%></a></li>
            
            <li><a href="#"><span></span><%=captions.getString("contact")%></a></li>
        </ul>    	
    </div> <!-- end of menu -->
<br /><br /> 
<table width='100%' border="0">
<tr>
	<td width='25%' valign='top'>
	
<!-- Left column start-->

			<jsp:include page="leftside.jsp?page=1" flush="false">
					
				</jsp:include>
</td>   
    <td width='80%' valign="top">
<table width='100%' border="0" >
	<tr>
		<td >
   <table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				<tr><td class='colour' style='text-align:center'><h2><%
	 out.print(captions.getString("requirement"));  %></h2></td></tr>
		<tr><td align="left">
				 <ul type="square">
				 	<li><%
	 out.print(captions.getString("validid"));  %></li>
				 	<li><b><% 
	 out.print(captions.getString("teen"));  %></b></li>
		 		 	<li>
		 		 	<%
	 out.print(captions.getString("proof"));  %>
		 		 		<ul>
		 		 			<li><%
	 out.print(captions.getString("driving"));  %></li>
		 		 			<li><%
	 out.print(captions.getString("voter"));  %></li>
		 		 			<li><%
	 out.print(captions.getString("passport"));  %></li>
		 		 			<li><%
	 out.print(captions.getString("noproof"));  %> 
		 		 			<br/> <font color=red><span class='style3'><%
	 out.print(captions.getString("noproofnote"));  %></span></font>
		 		 			</li>
		 		 		</ul>
		 		 	</li>
		 		 	       
				 </ul>
				</td></tr>
				
			</table>
			<table width='97%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
			<tr><td class='colour' style='text-align:center'><h2></h2></td></tr>
				<tr>
				<td align="center">
					<span><button style="vertical-align: middle;cursor:pointer" onclick="javascript:window.location='signupform.jsp'">I meet the requirements and ready to provide my true details, <br/> Take me to the signup form</button></span>
					<span style="margin-left: 50px"><button style="vertical-align: middle" onclick="javascript:window.location='index.jsp'">I disagree<br/>&nbsp;</button></span>
					
		</td>
    </tr></table></td></tr></table></td></tr></table></div>
    <div class="cleaner"></div>
                
    
    
            <div class="cleaner">&nbsp;</div>
                         
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
    