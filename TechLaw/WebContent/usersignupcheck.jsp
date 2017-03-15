<%@page language="java" import="java.sql.*, java.util.*" %>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" import="java.net.*,java.io.*,java.net.URLEncoder" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page language="java" import="java.sql.*,java.util.*,java.io.*,java.net.*,java.text.*" %>
	

<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
  
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
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

<title>Registration</title>
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
</div> </div>    
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
</div> <!-- end of menu wrapper -->
<!-- Menu Start -->

<!-- Menu End -->
  

    
   <%
   

   
     String email="";	 
	 String password="";
	 String personal="";
	 String name1="";
	 String fathername="";
	 String month="";
	 String date="";
	 String year="";
	 String profession="";
	 String gender="";
	 String maritalstatus="";
	 String areacode="";
	 String phoneno="";
	 String mobileno="";
     String add1="";
	 String add2="";
	 String area="";
	 String proof="";
	 String proofno="";
	String captcha="";	
	String bg="";
	String ImageFile="";
//String itemName = "";
	String itemName="";
	//boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	 String ca=(String)session.getAttribute("captcha");
			// int count1=0,count2=0,count3=0,count4=0,count5=0;

			 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			 if (!isMultipart) {
								 } else {
								 
										   FileItemFactory factory = new DiskFileItemFactory();
										   ServletFileUpload upload = new ServletFileUpload(factory);
										   List items = null;
										   try 
										   {
										   items = upload.parseRequest(request);
										  }
											catch (FileUploadException e) 
											{
											 e.printStackTrace();
											 
										   }
										   Iterator itr = items.iterator();
										   
										   while (itr.hasNext()) 	
										   {
											   FileItem item = (FileItem) itr.next();
											   if (item.isFormField())
											   {
												      String name = item.getFieldName();
													  String value = item.getString();
													  if(name.equals("email"))
											           {
																   email=value;
												            		 
													   }
													  if(name.equals("password"))
									                  {  
													         password=value;            		 
									                        
													  }
													   if(name.equals("name"))
											           {
																   name1=value;
												            		 
													   }
													  if(name.equals("fathername"))
									                  {  
													         fathername=value;            		 
									                         
													  }
													   if(name.equals("month"))
											           {
																    month=value;
												            		// count5=5;
													   }
													  if(name.equals("date"))
									                  {  
													         date=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("year"))
									                  {  
													         year=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("profession"))
									                  {  
													         profession=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("gender"))
									                  {  
													         gender=value;            		 
									                         //count2=2;
													  }
													   if(name.equals("maritalstatus"))
									                  {  
													        maritalstatus=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("areacode"))
									                  {  
													        areacode=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("phoneno"))
									                  {  
													        phoneno=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("mobileno"))
									                  {  
													        mobileno=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("addressLine1"))
									                  {  
													        add1=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("addressLine2"))
									                  {  
													        add2=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("area"))
									                  {  
													        area=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("proof"))
									                  {  
													        proof=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("proofno"))
									                  {  
													        proofno=value;            		 
									                         //count2=2;
													  }
													  if(name.equals("captcha"))
									                  {  
													        captcha=value;            		 
									                         //count2=2;
													  }
													   if(name.equals("bg"))
									                  {  
													        bg=value;            		 
									                         //count2=2;
													  }
											}													  		 		 		    
   									  			 else
	   											{
												    try {
														 itemName = "user.jpg";
												
															// itemName = item.getName();
															   File savedFile = new File(config.getServletContext().getRealPath("/")+"\\upload\\"+itemName);
															   item.write(savedFile);
														    
												   		} 
												   	catch (Exception e) {
												   			out.println("Error"+e.getMessage());
												   		}
											   }
	   }
	   
	   
	   if(captcha.equalsIgnoreCase(ca))
	   {
	   // out.println("correct");
					db.connect();
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		String mobile=request.getParameter("mobileno");
		String name11=request.getParameter("fname");
		String image="user.jpg";
		ResultSet rs=null;
		PreparedStatement ps=null;							 personal+="<all><name>"+name11+"</name>";
													  personal+="<fathername>"+fathername+"</fathername>";
													  personal+="<month>"+month+"</month>";
													  personal+="<date>"+date+"</date>";
													  personal+="<year>"+year+"</year>";
													  personal+="<profession>"+profession+"</profession>";
													  personal+="<gender>"+gender+"</gender>";
													  personal+="<maritalstatus>"+maritalstatus+"</maritalstatus>";
													 
													  personal+="<phoneno>"+areacode+phoneno+"</phoneno>";
													  personal+="<mobileno>"+mobileno+"</mobileno>";
													  
													  personal+="<address>"+add1+add2+"</address></all>";
												
												try{
										   String query="insert into SAKANSHA.SIGNIN(id,username,password,lastsignin,confirm,usertype,image) values((select max(id)+1 from SAKANSHA.SIGNIN),'"+email.toLowerCase()+"','"+password+"',current_timestamp,0,1,'"+image+"')";
										   
										  //  rs=ps.executeUpdate(query);
										   db.updateSQL(query);
										   //out.print(query);
											  String query1="insert into SAKANSHA.SUBJECT(SUBJECT_ID,area,bloodgroup,DETAILS,PERSMISSION,proof,time,prooftype,MOBILE,NAME) values ((select max(id) from SAKANSHA.SIGNIN where username='"+email+"'),2,"+bg+",'"+personal+"',0000000,'"+proofno+itemName+"',current_timestamp,"+proof+","+mobile+","+request.getParameter("fname")+")";
											 // ps=con.prepareStatement(query1);
											//  rs=ps.executeQuery();
											  db.updateSQL(query1);
											    //out.print(query1);
											   %><<br /><br /><br /><<br /><h1 align="center"><%
	 out.print(captions.getString("appsub"));  %>.</h1><br /><font color=green><h3 align="center"><%out.print(captions.getString("appmail"));  %></h3></font>
	 <%
	String  subject="Welcome to LAW & ORDER AUTOMATION";
												String message="  "
										     	+"Welcome to LAW & ORDER AUTOMATION"
										     	+"Your Signup request is accepted and it will be activated soon."
										      	+"  "
										      	+"Your account details"
										     	+"Username (Email) : "+email+" "
										      	+"   Password  : "+password+" "      	      	
										      	+"Thank you";
												mail.GmailSend(email,subject,message);
	
											   String user="archana.saxena30";
String pass=" 9953955325";
String number="9811940702";
String msg="You have successfully registered.We will get back to you soon.Team: TechJustice" ; 
String mURL="http://www.onl9class.com/smsapi/smsir.php?email=archana.saxena30@gmail.com&user=archana.saxena30&pass=9953955325&number="+mobileno+"&msg="+msg+"";
URL url = new URL(mURL);
BufferedReader reader = null;

try {
    reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

    for (String line; (line = reader.readLine()) != null;) {
        out.println(line);
    }
} finally {
    if (reader != null) try { reader.close(); } catch (IOException ignore) {out.print("Error    "+ignore.getMessage());}
}
 
		
		
											    }
											    
												  catch(Exception e)
												   {
												   	out.println("Error 1"+e.getMessage());
												   }
									   con.close();
	   }
	   else
	   {
	   //out.println(captcha);
	   //out.println(c);
	   	out.println("<br/><br/><font color=red><h3 align=center>The image code was entered incorrectly.<b><a onclick='history.back()' style='cursor:pointer'> click here to retype it.</a></b></h3></font>");
	   }
	  }
	   
  
   %>
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
   
   
   