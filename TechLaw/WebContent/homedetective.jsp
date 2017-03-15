
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" import="java.sql.*"  %>
<%@ page import="java.util.*,java.io.*"%>
<%
 String locale = (String) session.getAttribute("locale");
 if (locale == null)
  locale ="en";
  
 Locale c = new Locale(locale, locale);
 ResourceBundle captions = ResourceBundle.getBundle("Locale", c);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=captions.getString("title")%> | Techjustice</title>
<script type='text/javascript' src='validations/js/jquery.js'></script>
<script type='text/javascript' src='validations/js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='validations/js/basic.js'></script>
<meta name="keywords" content="Creating a crime free INDIA!" />
<meta name="description" content="Creating a crime free INDIA!" />
<script type="text/javascript" src="techfiles/ajax.js"></script>
<link type='text/css' href='validations/css/demo.css' rel='stylesheet' media='screen' />
<link type='text/css' href='validations/css/basic.css' rel='stylesheet' media='screen' />
<script type="text/javascript" src="techfiles/lightbox.js"></script>
<link type='text/css' href='jquery/popup.css' rel='stylesheet' media='screen' />
<jsp:include page='jquery/popup.jsp' flush="false"></jsp:include>
<link type='text/css' href='validations/css/basic_ie.css' rel='stylesheet' media='screen' />
<link href="style.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</head>
<style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 0%;
            height: 0%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 60%;
            height: 400%;
            padding: 16px;
            border: 16px solid orange;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
<body><!-- 
<div id="langholder" style="top:15px;">
Languages:
<a href="Locale.jsp?lang=en">English</a> |
<a href="Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
</div> -->
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
            
            <li><a href="usercontact.jsp"><span></span><%=captions.getString("contact")%></a></li>
        </ul>    	
    </div> <!-- end of menu -->
</div> <!-- end of menu wrapper -->

<div id="templatemo_content_wrapper">
<div id="templatemo_content">
<table border="0" align="center"><tr><td><img src="images/tip.png"
			height="61" width="61"></img></td><td><h1><u><%=captions.getString("tipsforcitizens")%></u></h1></td></tr></table><br />
<table align="center"><tr><td><font color=maroon><h2><%=captions.getString("homealone")%></h2></font></td></tr></table>
<br />
<font size=3><p><%=captions.getString("homealone1")%></p>
<ul><li><%=captions.getString("homealone2")%></li><br /><li><%=captions.getString("homealone3")%></li><br />
<li><%=captions.getString("homealone4")%></li><br /><li><%=captions.getString("homealone5")%></li><br />
<li><%=captions.getString("homealone6")%></li><br /><li><%=captions.getString("homealone7")%></li></ul>
</font>
<br /><br />
<table align="center"><tr><td><font color=maroon><h2><%=captions.getString("roadsafety")%></h2></font></td></tr></table>
<br />
<font size=3>
<ul><li><%=captions.getString("roadsafety1")%></li><br /><li><%=captions.getString("roadsafety3")%></li><br />
<li><%=captions.getString("roadsafety4")%></li><br /><li><%=captions.getString("roadsafety5")%></li><br />
<li><%=captions.getString("roadsafety6")%></li><br /><li><%=captions.getString("roadsafety7")%></li><br />
<li><%=captions.getString("roadsafety6")%></li><br /><li><%=captions.getString("roadsafety7")%></li><br />
<li><%=captions.getString("roadsafety8")%></li><br /><li><%=captions.getString("roadsafety9")%></li><br />
<li><%=captions.getString("roadsafety10")%></li><br /><li><%=captions.getString("roadsafety11")%></li><br />
<li><%=captions.getString("roadsafety12")%></li><br /><li><%=captions.getString("roadsafety2")%></li></ul>
</font>
<br /><br />
<table align="center"><tr><td><font color=maroon><h2><%=captions.getString("train")%></h2></font></td></tr></table>
<br />
<font size=3>
<ul><li><%=captions.getString("train1")%></li><br /><li><%=captions.getString("train3")%></li><br />
<li><%=captions.getString("train4")%></li><br /><li><%=captions.getString("train5")%></li><br />
<li><%=captions.getString("train6")%></li></ul>
</font>
</div></div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright � TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="usercontact.jsp" target="_parent">
        Contact Us</a> | 
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
</body>
</html>
