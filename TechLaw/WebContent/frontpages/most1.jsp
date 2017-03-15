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
function check()
	{	
			var msg = validateField(document.RegistrationForm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.value> 0)			
				{
					alert("Enter correct e-mail id");	
					document.RegistrationForm.email.focus();
					return false;
				}
				if(msg.value=="")
				{
				alert("please enter your e mail id");
				document.RegistrationForm.email.focus();
				return false;
				}
			var msg1 = validateField(document.RegistrationForm.name,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg1.value> 0)			
				{
					alert("Enter proper name");	
					document.RegistrationForm.name.focus();
					return false;
				}
				if(msg1.value=="")
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
				if(msg2.value=="")
				{
				alert("please enter your contact");
				document.RegistrationForm.contact.focus();
				return false;
				}
				if(msg2.value<12)
				{
				alert("please enter 12 digit contact number,in case of mobile add 00");
				document.RegistrationForm.contact.focus();
				return false;
				}
			var msg3 = validateField(document.RegistrationForm.criminal_info);
				if(msg3.value =="");			
				{
					alert("Enter criminal details");	
					document.RegistrationForm.criminal_info.focus();
					return false;
				}
				if(msg3.value<10);			
				{
					alert("Enter criminal details in more than 10 characters");	
					document.RegistrationForm.criminal_info.focus();
					return false;
				}
			var msg4 = validateField(document.RegistrationForm.ip,'STRING','6','15','IP Address','');
				if(msg4.value > 0)			
				{
					alert("Enter correct IP");	
					document.RegistrationForm.ip.focus();
					return false;
				}
				
				
						

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
	        $("#msgbox").removeClass().addClass('myinfo1').text('Please Wait..... ').fadeIn(1000);

			this.timer = setTimeout(function () {
				$.ajax({
				
		          	url: 'most1check.jsp',
		          	data: 'criminal_info='+ $('#criminal_info').val() +'&name=' + $('#name').val()+'&id=' + $('#id').val()+'&cname=' + $('#cname').val()+'&contact=' + $('#contact').val()+'&email=' + $('#email').val()+'&ip=' + $('#ip').val(),
		          	type: 'get',
		   			success: function(msg){
						if(msg != 'ERROR') // Message Sent, check and redirect
						{				// and direct to the success page
							
							$("#msgbox").html('Thank You.'+msg).addClass('myinfo1').fadeTo(900,1,
			                  function()
			                  {
			                     //redirect to secure page
			                    // document.location='login.jsp?user=';
			                  });
	
						}
						else
						{
							$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
		                	{
			                  //add message and change the class of the box and start fading
			                  $(this).html('Sorry, Wrong Combination Of Username And Password.'+msg).removeClass().addClass('myerror').fadeTo(900,1);
			                });
	
						}
					}
				
				});
			}, 200);
			return false;
 		});		

	});



 </script>  



<% 
							try
							{
							
							ResultSet rs=null;
							
							db.connect();
							rs=db.execSQL("select i.id as id1,i.file,t.name1,t.last,t.height,t.weight,t.alias,t.birth,t.sdhname,t.date,t.color,t.haircolor from sakansha.criminal as i,xmltable('$c/criminal' passing i.details as \"c\" columns name1 varchar(100) path 'name1',last varchar(200) path 'last',height varchar(10) path 'height',weight varchar(15) path 'weight',alias varchar(100) path 'alias',birth varchar(100) path 'birth',date varchar(100) path 'date',sdhname varchar(50) path 'sdhname',color varchar(50) path 'color',haircolor varchar(50) path 'haircolor') as t where id="+request.getParameter("id")+" ");
							while(rs.next())
							{%> <input type="hidden"  id="id" readonly="readonly" name='id' value="<%=rs.getString("id1") %>"/>
<form name="RegistrationForm" id="login_frm" action="" method="post" enctype="multipart/form-data" onsubmit="return (check());">
    <div id="login_box">
      <div id="login_header">
           <center> <%out.print(captions.getString("reportwanted"));  %></center>
      </div>
      <div id="form_val"> <center> <b><h1><%out.print(captions.getString("criminaldetail"));  %></h1></b></center>
        <div class="label"><%
	 out.print(captions.getString("wname"));  %></div>
        <div class="control"><input type="text"  id="cname" readonly="readonly" name='cname' value="<%=rs.getString("name1") %>"/><span style="font-size: 10px;"></span></div>
        <div class="label"><%
	 out.print(captions.getString("image"));  %>:</div>
        <div class="control"><img src="http://localhost:9081/TechPolice/upload/criminal/<%=rs.getString("file") %>" width="96" height="96" /><span style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div><br /><br /><br />
        <div class="label"><% out.print(captions.getString("dob"));  %></div>
        <div class="control"><input type="text" name="dob" readonly="readonly" id="dob" value="<%=rs.getString("date") %>" /><span style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div>
        <div class="label"><%out.print(captions.getString("typeinfo"));  %>:</div>
        <div class="control"><textarea rows="3" id="criminal_info" cols="24" name="criminal_info"></textarea><span id="criminaltext" style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div><br /><br />
         
        <%}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>
           <center> <b><h1><%
	 out.print(captions.getString("personalinfo"));  %></h1></b><font color="red"><%
	 out.print(captions.getString("personalinfomsg"));  %></font></center>
      </div>
      <div id="form_val"> 
        <div class="label">
        <%
	 out.print(captions.getString("wname"));  %></div>
        <div class="control"><input type="text" name="name" id="name"/><span style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div>
        <div class="label"><%
	 out.print(captions.getString("contact"));  %></div>
        <div class="control"><input type="text" name="contact" id="contact"/><span style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div>
        <div class="label"><% out.print(captions.getString("email"));  %>:</div>
        <div class="control"><input type="text" name="email" id="email"/><span style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div>
        <div class="label">IP Address:</div>
        <div class="control"><input type="text" name="ip" id="ip"/><span style="font-size: 10px;"></span><font color="red" size="+1" ><b>
<%try {
	
	
	 out.println("IP:"+request.getRemoteAddr());
	 	 
	 }
	catch(Exception e) {
	 out.println("Error"+e.getMessage());
	 }

%></b></font></div>
        <div style="clear:both;height:0px;"></div>
      
      	<div id="msgbox"></div>
      </div>
      <div id="login_footer">
        <label>
        <input type="submit" name="login" id="login" value="Report" class="send_button" />
        </label>
      </div>
    </div>
</form>
</div></div>
<div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="../index.jsp">TechJustice</a> | <a href="" target="_parent">
        Contact Us</a> | <a href="" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
			
			</body>
			</html>