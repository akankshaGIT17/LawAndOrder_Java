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
<meta name="keywords" content="Law and order automation" />
<meta name="description" content="law and order automation" />

<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<link href="frontpages/css/style.css" rel="stylesheet" type="text/css" />
<link href="css/lstyle.css" rel="stylesheet" type="text/css" />
<link href="css/lightbox.css" rel="stylesheet" type="text/css" />
<link href="css/ajax.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
             function loadSubmit() {
var ProgressImage = document.getElementById('progress_image');
document.getElementById("progress").style.visibility = "visible";
setTimeout("ProgressImage.src = ProgressImage.src",100);
return true;
} </script>
</head>
<body>
<!-- Validation Script Start -->
<%@ page language="java" import="java.sql.*" errorPage="" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/
libs/jquery/1.3.0/jquery.min.js">
</script>


<script type="text/javascript" language="javascript">
function checkform()
	{
	var form=document.RegistrationForm;
			msg = validateField(document.RegistrationForm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.email.focus();
					return false;
				}
  	var str2=document.RegistrationForm.pass.value;
				if (str2.length==0)
			{ 
				alert("Please enter the Password");
  				document.RegistrationForm.pass.focus();
  				return false;
  			}
  			if (str2.length<=4)
			{ 
				alert("Password should be more than 4 letters");
  				document.RegistrationForm.pass.focus();
  				return false;
  			}
	return true;
	}
	</script>
<!-- Validation Script End -->
<!-- 
<div id="langholder" style="top:15px;">
Languages:
<a href="Locale.jsp? lang=en">English</a> |
<a href="Locale.jsp? lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp? lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
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
            <font color="white" size=4>
Languages:
<a href="Locale.jsp?lang=en">English</a> |
<a href="Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> </font>
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
            
            <li><a href="contact.jsp"><span></span><%=captions.getString("contact")%></a></li>
        </ul>    	
    </div> <!-- end of menu -->
</div> <!-- end of menu wrapper --><!--<div style="height:500px; overflow:auto ;   background-color:white; padding: 10px">   -->

<center style="color:red">
	<%
	String err=request.getParameter("err");
	if(err != null)
	{
	out.print(err);}
	else
	{err=" ";
	out.print(err);}
	 %></center>

    <form method="post"     action="usersignincheck.jsp"   id="login_form" name="RegistrationForm" onsubmit="return checkform()">
    

<div id="login_box">
      <div id="login_header">

<!-- <div id="login-box">  -->
<center> <%=captions.getString("ulogin")%></center>
</div>
      <div id="form_val"> 
      	<center style="color:red">
	<%
	String err1=request.getParameter("err1");
	if(err1 != null)
	{
	out.print(err1);}
	else
	{err1=" ";
	out.print(err1);}
	 %></center>
<!-- <h2><font color="black"><%=captions.getString("ulogin")%></font></h2>
<font color="black"><%=captions.getString("loginmsg")%></font>. 
<br />
<br />-->
<div class="label" ><%=captions.getString("username")%></div>
<div class="control" ><input type="text" name="email" id="email" title="email" value="" size="30" maxlength="2048" /><span style="font-size: 10px;"></span></div>
<div class="label"><%=captions.getString("pass")%></div><div class="control"><input name="pass" id="pass" type="password" title="pass" value="" size="30" maxlength="2048" /><span style="font-size: 10px;"></span></div>
 <center><font color=red><a href="forgotpassworduser.jsp"><%=captions.getString("fpass")%></a> | <a href="signupformuser.jsp"><%=captions.getString("signup")%></a></font></center>
      
	 
      </div>
<!-- <span class="login-box-options"> <a href="forgotpassworduser.jsp" style="margin-left:30px;"><%=captions.getString("fpass")%></a>      |<a href="signupformuser.jsp" style="margin-left:30px;"><%=captions.getString("signup")%></a></span> -->
<input type="hidden" value="1" name="usertype"  />
<!-- <br />
<br />
<a href="usersignincheck.jsp"><input type="submit" class="contSubmit" onclick="return loadSubmit()" style="margin-left:90px;"  name="login" value="Sign In"/> <p style="visibility:hidden;" id="progress"><img id="progress_image" style="padding-left:5px;padding-top:5px;" src="images/ajax-loader.gif" alt="">Please Wait..</img></p> </a>







</div>

</div></form> -->

 <div id="login_footer">
        <label>
        <input type="submit" name="login" id="login" value="Sign In" onclick="return loadSubmit()" class="send_button" /><input type="reset" name="reset" id="reset" value="Reset" class="send_button" />
        </label>
      </div>
    </div>
</form>

<br /><br />
<div class="cleaner">&nbsp;</div>
<div class="cleaner">&nbsp;</div><div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="" target="_parent">
        Contact Us</a> | <a href="" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
			
			</body>
			</html>