<%@page language="java" import="java.sql.*,java.util.*,java.io.*,java.net.*,java.text.*" %>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />


<%@ page import="java.util.*" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="GENERATOR" content="IBM WebSphere Studio"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>

<script type="text/javascript" src="techfiles/ajax.js"></script>
<link href="style.css" rel="stylesheet" type="text/css" />

<%
 String locale = (String) session.getAttribute("locale");
 if (locale == null)
  locale = "en";
 Locale c = new Locale(locale, locale);
 ResourceBundle captions = ResourceBundle.getBundle("Locale", c);
%>

<title>complaint_database</title>
</head>

<body>
<div id="langholder" style="top:15px;">
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
            <li><a href="#" class="current"><span></span><%=captions.getString("home")%></a></li>
            <li><a href="#"><span></span><%=captions.getString("services")%></a></li>
            <li><a href="aboutus.jsp" target="_parent"><span></span><%=captions.getString("aboutus")%></a></li>
            <li><a href="#"><span></span><%=captions.getString("detectives")%></a></li>
            <li><a href="#"><span></span><%=captions.getString("lawacts")%></a></li>
            <li><a href="usersignin.jsp"><span></span><%=captions.getString("login")%></a></li>
            
            <li><a href="#"><span></span><%=captions.getString("contact")%></a></li>
        </ul>    	
    </div> <!-- end of menu -->
</div> <!-- end of menu wrapper -->
<!-- Menu Start -->

<!-- Menu End -->
  <%
db.connect();
String crimetype=request.getParameter("crimetype");
int area=Integer.parseInt(request.getParameter("area"));
String complaint=request.getParameter("complaint");
String ip=request.getParameter("ip");
String email=request.getParameter("email");
String email2=request.getParameter("email2");


Calendar cal = Calendar.getInstance(); 
int year = cal.get(Calendar.YEAR);



DecimalFormat myFormat = new java.text.DecimalFormat("00000");
String area1=myFormat.format(area);
        
        ResultSet rs=null;
        String query1="(select max(comp_id)+1 as id from SAKANSHA.COMPLAINTS)";
       
        rs=db.execSQL(query1);
        while(rs.next())
        {
        DecimalFormat myFormat1 = new java.text.DecimalFormat("000000");
		String id1=myFormat1.format(Integer.parseInt(rs.getString("id")));
		String query="INSERT INTO SAKANSHA.COMPLAINTS (COMP_ID, COMP_TEXT, COMP_BY, COMP_ON, EMERGENCY, TYPE, AREA, COMP_NUM,IP,EMAIL)   VALUES ("+rs.getString("id")+", '"+complaint+"', 1, current_timestamp, 1, "+crimetype+","+area+",'"+year+area1+id1+"', '"+ip+"','"+email+"')";
		db.updateSQL(query);
		
 %>
 <div style="text-align: center">
 <table>
 	<tr>
 		
				
					<table cellspacing='5' cellpadding="5" width="96%" class="back" style="text-align:left">
					<tr><td align="center"><strong>YOUR APPLICATION IS REGISTERED.</strong></td></tr>
					<tr><td align="center"><%
	 out.print(captions.getString("nologin"));  %></td></tr>
					<tr><td align="center"><font color=red>In case you
					provided false details, the police has complEtE right to take
					action and charge you for that</font></td></tr>
					<tr><td align="center">We have sended your complaint ID details to your account.</td></tr>
					</table>
				
 		<td><table class="black" style="text-align:left">
 	<tr>
 	<td>
 	
 	</td>
 	<td>
 	<font color=green>	<h1 align="center" >YOUR COMPLAINT IS REGISTERED WITH US</h1></font>
 		<br/><center><font color=green>
 		HERE ARE YOUR DETAILS.PLEASE KEEP YOUR COMPPLAINT ID SAFELY AS IT WILL BE REQUIRED FOR FURTHER INVESTIGATION.THIS ID IS ALSO SENDED TO <% out.print(email);%>.</font></center>
 		<br/>
 		<font color=green><h1 align="center">YOUR COMPLAINT ID : <% out.print(year+area1+id1);%> </h1></font>
 	</td></tr>
 	<tr><td align="center"><font color=green></font></td></tr>
 </table>
 
 <%
 String  subject="You Complaint is registered at LAW & ORDER AUTOMATION";
												String message="  "
										     	+"Welcome to LAW & ORDER AUTOMATION"
										     	+"     You emregency complaint ID is   ."
										      	+"  "
										      	+""
										     	+"COMPLAINT ID : "+year+area1+id1+" "
										      	+"     Registered from IP address "+ip+" "      	      	
										      	+"Thank you. We will be dealing with your complaint soon.";
												mail.GmailSend(email,subject,message);
												
 String  subject1="EMERGENCY COMPALINT ID : "+year+area1+id1+"";
 
												String message1="  "
										     	+"Complaint : "+complaint
										     	+"       ."
										      	+" From Area :  "+area
										      	+"          "
										     	+"COMPLAINT ID : "+year+area1+id1+" "
										      	+"          Registered from IP address "+ip+" "      	      	
										      	+"   ";
												mail.GmailSend(email2,subject1,message1);
	}
		
		
	//	URL url = new URL("http://site2.way2sms.com/Main.action?id=C56D5726B5D445AB10EB5B360A88092C.w809&msg=EmgergencyComplaint2&to=9953955325&from=Way2Sms.com&unicode=no&send=1");
		//URLConnection conn = url.openConnection();
		//BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//String inputLine;
		//while ((inputLine = in.readLine()) != null) {
		//System.out.println(inputLine);
		//}
		//in.close();
		db.close();
		%>
 		</td>
 	</tr>
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
  