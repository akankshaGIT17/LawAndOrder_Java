
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=captions.getString("title")%> | Techjustice</title>
<meta name="keywords" content="Creating a crime free INDIA!" />
<link type='text/css' href='jquery/popup.css' rel='stylesheet' media='screen' />
<jsp:include page='jquery/popup.jsp' flush="false"></jsp:include>
<meta name="description" content="Crime free INDIA!" />

<link href="style.css" rel="stylesheet" type="text/css" />

</head>
<body><!--  
<div id="langholder" style="top:15px;">
Languages:
<a href="Locale.jsp? lang=en">English</a> |
<a href="Locale.jsp? lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp? lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
</div>-->
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

<table border="0" align="center"><tr><td><h1><%=captions.getString("services")%></h1></td></tr></table><br/><br />
<table border="0" align="center">
	<tbody>
		<tr>
			<td width="171"><a href="emergencyhome.jsp"><img src="images/Siren.gif"
				width="149" height="135"></img></a><br/><font color=red><b> <a href="emergencyhome.jsp"><%=captions.getString("emergencycomplaint")%></a></b></font></td>
			<td width="165"><a href="normalcomplaint.jsp"><img src="images/Siren2.jpg"
				width="149" height="135"></img></a><br/><a href="normalcomplaint.jsp"><%=captions.getString("complaint")%></a></td>
			<td width="165"><a href="missingperson.jsp"><img src="images/images.jpg"
				width="149" height="135"></img></a><br/><a href="missingperson.jsp"><%=captions.getString("benifitsofecopmp")%></a></td>
		</tr>
		<tr>
			<td width="171"><a href="missingvaluables.jsp"><img src="images/theif.jpg"
				width="149" height="135"></img></a><br/><a href="missingvaluables.jsp"><%=captions.getString("benifitsofecopmv")%></a></td>
			<td width="165"><a href="" class="popup-link-1"><img src="images/license.jpeg"width="149" height="135"></img><b><%=captions.getString("benifitsofecopli")%>.</b></a>
       <div class="popup-box" id="popup-box-1"><div class="close">X</div><div class="top"><h2><img
		src="images/Gun_Icon_Small.jpg" width="29" height="29" /><%=captions.getString("benifitsofecopli1")%>.</h2></div><div class="bottom"><ul><li><%=captions.getString("benifitsofecopli2")%></li><li><%=captions.getString("benifitsofecopli3")%></li><li><%=captions.getString("benifitsofecopli4")%></li><li><%=captions.getString("benifitsofecopli5")%></li></ul></div></div>
<div id="blackout"></div><br/></td>
			<td  width="165"><a href="complaintstatususer.jsp"><img src="images/status.png"
				width="149" height="135"></img></a><br/><a href="complaintstatususer.jsp"><%=captions.getString("complaintstatus")%></a></td>
		</tr>
	</tbody>
</table>

</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="usercontact.jsp" target="_parent">
        Contact Us</a> | 
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
</div></body>
</html>
