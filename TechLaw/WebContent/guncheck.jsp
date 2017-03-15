<%@page language="java" import="java.sql.*,java.util.*" %>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail"/>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <% 
   //Files can be uploaded in multipart/form-data and by doing that the input fileds will go null if we use request.getParameter
   // To avoid that problem
   // Here we have used Apache library for handling file upload together with input fields
   //We have not used Apache web server
   %>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>



<title>Arms License | Law &amp; Order</title>
</head>
<body>

<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select t.name from SAKANSHA.SUBJECT as i,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID="+session.getAttribute("id"));
						while(rs2.next())
						{
						%>
<div id="container">
		<div id="header">
        	<h1><img src="images/sciren.png"></h1>
            <h2>Welcome <%=rs2.getString("name") %></h2>
        </div>   
        
       <ul id="navigation" class="nav-main">
	<li><a href="homepage.jsp">Home</a></li>
    
    <li class="list"><a href="#">Licenses</a>
	<ul class="nav-sub">
    <li><a href="hotel.jsp">Lodge/Hotel License</a></li>
		<li><a href="gunlicense.jsp">Arms License</a></li>
		<li><a href="loudspeakers.jsp">Loud Speaker License</a></li>
		<li><a href="massmeeting.jsp">Mass meeting License</a></li>
	</ul>
	</li>
    

    
    <li class="list"><a href="#">Police Department</a>
	<ul class="nav-sub">
    <li><a href="messagefromdgp.jsp">Message From DGP</a></li>
 		<li><a href="policehistory.jsp">History</a></li>
		<li><a href="policeorganisation.jsp">Organization</a></li>
		<li><a href="policewelfare.jsp">Welfare</a></li>
	</ul>
	</li>
    
    <li><a href="userservices.jsp">Services</a></li>
    <li><a href="lawsandacts.jsp">Law &amp; Acts</a></li>
    <li><a href="http://www.psdgraphics.com/contact/"><b>Protect Yourself</b></a></li>
    <li><a href="http://www.psdgraphics.com/contact/">Message</a></li>
    <li><a href="gallery.jsp">Gallery</a></li>
    <li><a href="logoutuser.jsp"><font color=red>Logout</font></a></li>

</ul>

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
                <h3><%=rs2.getString("name") %></h3><%} %>
                     <img src="images/user.jpg" align="middle" width="198" height="162" />   <br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">Normal Complaint</a></li>
                    <li><a href="missingperson.jsp">Missing Persons</a></li>
                    <li><a href="#">Missing Valuables</a></li>
                    <li><a href="#">Complaint Status</a></li>
                    
                </ul>
</div>
                
                
              <div id="leftmenu_bottom"></div>
        </div>
        
        
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
           <%
   
try
{
   
     String convict="";	 
     String convictdetails="";
	 String licensebefore="";
	 
	 String licensebeforedetails="";
	 String cancelled="";
	 String licenseprob="";
	 String weapon1="";
	 String otherweapon="";
	 String weaponneed="";
	 String previousweapon="";
	 String itemName=""; 
	
	 	 

	 
	 
	 
	
	
	
	
	
			 

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
													  if(name.equals("convict"))
											           {
																   convict=value;
												            		
													   }
													   if(name.equals("convictdetails"))
									                  {  
													         convictdetails=value;            		 
									                        
													  }
													  if(name.equals("licensebefore"))
									                  {  
													         licensebefore=value;            		 
									                        
													  }
													   if(name.equals("licensebeforedetails"))
											           {
																   licensebeforedetails=value;
												            		
													   }
													  if(name.equals("cancelled"))
									                  {  
													         cancelled=value;            		 
									                       
													  }
													   if(name.equals("previousweapon"))
											           {
																    previousweapon=value;
												       
													   }
													  if(name.equals("otherweapon"))
									                  {  
													         otherweapon=value;            		 
									                   
													  }
													  if(name.equals("weaponneed"))
									                  {  
													         weaponneed=value;            		 
									                   
													  }
													  if(name.equals("licenseprob"))
									                  {  
													         licenseprob=value;            		 
									                   
													  }
													  if(name.equals("weapon1"))
									                  {  
													         weapon1=value;            		 
									                   
													  }
													  
												}													  		 		 		    
   									  			 else
	   											{
												    try {
														 itemName = item.getName();
												
															// itemName = item.getName();
															   File savedFile = new File(config.getServletContext().getRealPath("/")+"\\upload\\"+itemName);
															   
															   item.write(savedFile);
														    
												   		} 
												   	catch (Exception e) {
												   			out.println("Error"+e.getMessage());
												   		}
											   }
	   }
	   
	   
	  

					db.connect();	
					
					String arms="<all><convict>"+convict+"</convict>";
					arms+="<convictdetails>"+convictdetails+"</convictdetails>";
					arms+="<licensebefore>"+licensebefore+"</licensebefore>";
					arms+="<licensebeforedetails>"+licensebeforedetails+"</licensebeforedetails>";
					arms+="<cancelled>"+cancelled+"</cancelled>";
					arms+="<previousweapon>"+previousweapon+"</previousweapon>";
					arms+="<otherweapon>"+otherweapon+"</otherweapon>";
					arms+="<weaponneed>"+weaponneed+"</weaponneed>";
					arms+="<weapon1>"+weapon1+"</weapon1>";
					arms+="<licenseprob>"+licenseprob+"</licenseprob> </all>";
					
					
						String query="insert into SAKANSHA.ARMS(ARMS_ID,ARMS,BY,ON,CONVICT,CONVICTDETAILS,LICENSEBEFORE,LICENSEBEFOREDETAILS,CANCELLED,LICENSEPROB,WEAPON1,OTHERWEAPON,WEAPONNEED,PREVIOUSWEAPON,PHOTO) values((select max(ARMS_ID)+1 from SAKANSHA.ARMS),'"+arms+"','"+session.getAttribute("id")+"',current_timestamp,'"+convict+"','"+convictdetails+"','"+licensebefore+"','"+licensebeforedetails+"','"+cancelled+"','"+licenseprob+"','"+weapon1+"','"+otherweapon+"','"+weaponneed+"','"+previousweapon+"','"+itemName+"')";
						db.updateSQL(query)	;
												
			 						   
				
 

 out.print("<font color=green align=center>"+"<h1 align=center>"+"YOUR APPLICATION FOR ARMS LICENSE IS REGISTERED"+"</h1>"+"</font>");


	  }
	   
  }
  catch(Exception e)
  {
  	out.println("Error"+e.getMessage());
  }
   %><%String email=request.getParameter("mmm");
   
 String  subject="You Complaint is registered at LAW & ORDER AUTOMATION";
												String message="  "
										     	+"Welcome to LAW & ORDER AUTOMATION"
										     	+"     You Complaint ID is   ."
										      	+"  "
										      	+""
										     	+"COMPLAINT ID : "
										      	+"     Registered from IP address "	      	
										      	+"Thank you. We will be dealing with your complaint soon.";
												mail.GmailSend(email,subject,message);%>
 <%db.close(); %>
 
 <table border=0><tr><td></td></tr></table>
<p>&nbsp;</p>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
		
      </div>
  </div>
</body>
</html>
