<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" import="java.sql.*"  %>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.net.*,java.io.*,java.net.URLEncoder;"%>
<%
 String locale = (String) session.getAttribute("locale");
 if (locale == null)
  locale = "hi";
  
 Locale c = new Locale(locale, locale);
 ResourceBundle captions = ResourceBundle.getBundle("Locale", c);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=captions.getString("title")%> | Techjustice</title>
<meta name="keywords" content="A Techjustice initiative to a corruption free India!" />
<meta name="description" content="A Techjustice initiative to a corruption free India!" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script>
<link href="../style.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
</head>

<body>

<script type="text/javascript" language="javascript">
function checkform()
	{
	var form=document.login_frm;
			msg = validateField(document.login_frm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.login_frm.email.focus();
					return false;
				}
  	var str2=document.login_frm.pass.value;
				if (str2.length==0)
			{ 
				alert("Please enter the Password");
  				document.login_frm.pass.focus();
  				return false;
  			}
  			if (str2.length<=4)
			{ 
				alert("Password should be more than 4 letters");
  				document.login_frm.pass.focus();
  				return false;
  			}
	return true;
	}
	</script>
<!--Script ends-->

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
            <font color="white" size=4>
Languages:
<a href="../Locale.jsp?lang=en">English</a> |
<a href="../Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="../Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> </font>
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
<center><h1></h1></center>

<!-- ..//JavaScript Code for this page\\.. -->
 <script type="text/javascript">
	$(document).ready(function(){
		$("#login_frm").submit(function(){

			 //remove previous class and add new "myinfo" class
	        $("#msgbox").removeClass().addClass('myinfo1').text('Validating Your Login ').fadeIn(1000);

			
			this.timer = setTimeout(function () {
				$.ajax({
		          	url: '../usersignincheck.jsp',
		          	data: 'email='+ $('#email').val() +'&pass=' + $('#pass').val()+'&usertype=' + $('#usertype').val(),
		          	type: 'post',
		   			success: function(msg){
						if(msg != null) // Message Sent, check and redirect
						{				// and direct to the success page
							$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
		                	{
			                  //add message and change the class of the box and start fading
			                  $(this).html('Sorry,'+msg).removeClass().addClass('myerror').fadeTo(900,1);
			                }
							);
	
						}
						else
						{
							$("#msgbox").html('Login Verified, Logging in.....').addClass('myinfo1').fadeTo(900,1,
			                  function()
			                  {
			                     //redirect to secure page
			                     document.location='../homepage.jsp';
			                  });
	
						}
					}
				
				});
			}, 200);
			return false;
 		});		

	});



 </script>  


<center style="color:red">
	<%
	String err=request.getParameter("err");
	if(err != null)
	{
	out.print(err);}
	else
	{err=" ";
	out.print(err);}
	 %>
</center>

 
<form name="login_frm" id="login_frm" action="" method="post" enctype="multipart/form-data" onsubmit="return checkform()">
    <div id="login_box">
      <div id="login_header">
           <center> <%=captions.getString("ulogin")%></center>
      </div>
      <div id="form_val"> 
        <div class="label"><%=captions.getString("username")%></div>
        <div class="control"><input type="text"  id="email"  name='email' /><span style="font-size: 10px;"></span></div>
        
        <div class="label"><%=captions.getString("pass")%></div>
        <div class="control"><input type="password" name="pass" id="pass" " /><span style="font-size: 10px;"></span></div>
        
         
       
     <input type="hidden" value="1" name="usertype" id="usertype" />
        <div style="clear:both;height:0px;"></div>
      
      	<div id="msgbox"></div>
      </div>
      <div id="login_footer">
        <label>
        <input type="submit" name="login" id="login" value="Sign In" onclick="checkform()" class="send_button" /><input type="reset" name="reset" id="reset" value="Reset" class="send_button" />
        </label>
      </div>
    </div>
</form>
</div></div>
<div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright � TGMC 2012 <a href="../index.jsp">TechJustice</a> | <a href="" target="_parent">
        Contact Us</a> | <a href="" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
			
			</body>
			</html>