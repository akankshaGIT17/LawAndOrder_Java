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
<title>Contact Us | Techjustice</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<link href="css/lstyle.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="frontpages/JS/jquery-1.4.2.min.js"></script>
<link href="frontpages/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!-- Validation Script Start -->

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
				msg = validateField(document.RegistrationForm.name);
				if(msg.length > 0)			
				{
					alert("enter name");	
					document.RegistrationForm.name.focus();
					return false;
				}
			msg = validateField(document.RegistrationForm.msg,'STRING','5','1000','Complaint','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.msg.focus();
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
           <div id="langholder" style="top:15px;"><font color="white" size=4>
Languages:
<a href="Locale.jsp?lang=en">English</a> |
<a href="Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> </font>
</div>
        </div>    
    </div>  <!-- end of header -->
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
    </div> <!-- end of menu wrapper -->
<div id="templatemo_content_wrapper">
<div id="templatemo_content">
   <!-- ..//JavaScript Code for this page\\.. -->
 <script type="text/javascript">
	$(document).ready(function(){
		$("#login_frm").submit(function(){

			 //remove previous class and add new "myinfo" class
	        $("#msgbox").removeClass().addClass('myinfo1').text('Please Wait..... ').fadeIn(1000);

			this.timer = setTimeout(function () {
				$.ajax({
				
		          	url: 'contactcheck.jsp',
		          	data: 'name='+ $('#name').val() +'&email=' + $('#email').val()+'&msg=' + $('#msg').val()+'&usertype=' + $('#usertype').val(),
		          	type: 'get',
		   			success: function(msg){
						if(msg) // Message Sent, check and redirect
						{				// and direct to the success page
							
							$("#msgbox").html(msg).addClass('myinfo').fadeTo(900,1,
			                  function()
			                  {
			                     //redirect to secure page
			                    // document.location='login.jsp?user=';
			                  });
	
						}
						
	
						
					}
				
				});
			}, 200);
			return false;
 		});		

	});



 </script>  




<form name="RegistrationForm" id="login_frm" action="" method="post" onsubmit="return checkform()">
<div id="login_box">
      <div id="login_header">
            <%=captions.getString("contact")%>
      </div>
      <div id="form_val">
        <div class="label">Name :</div>
        <div class="control"><input type="text" name="name" id="name"/><span style="font-size: 10px;"></span></div>
        <input type="hidden" value="1" name="usertype"  />
        <div class="label">Email:</div>
        <div class="control"><input type="text" name="email" id="email"/><span style="font-size: 10px;"></span></div>
         <div class="label">Message:</div>
        <div class="control"><textarea  name="msg" id="msg"></textarea><span style="font-size: 10px;"></span></div>
        
        <div style="clear:both;height:0px;"></div>
      
      	<div id="msgbox"></div>
      </div>
      <div id="login_footer">
        <label>
        <input type="submit" name="login" id="login" value="Send" class="send_button" />
        </label>
      </div>
    </div>
</form>
</div></div>
<br /><br />
<div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="contact.jsp" target="_parent">
        Contact Us</a> | <a href="http://www.templatemo.com" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
			
			</body>
			</html>