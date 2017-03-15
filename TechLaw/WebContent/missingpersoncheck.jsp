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



<title>check</title>
</head>
<body>

<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select t.name,IMAGE from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k ,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
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
    <li><a href="protecturself.jsp"><b>Protect Yourself</b></a></li>
    <li><a href="usercontact.jsp">Message</a></li>
    <li><a href="gallery.jsp">Gallery</a></li>
    <li><a href="logoutuser.jsp"><font color=red>Logout</font></a></li>

</ul>

        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
               
                <h3><%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="198" height="162" /> <br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">File Complaint</a></li>
                    <li><a href="missingperson.jsp">Missing Persons</a></li>
                    <li><a href="missingvaluables.jsp">Missing Valuables</a></li>
                    <li><a href="complaintstatususer.jsp">Complaint Status</a></li>
                    
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
   
     String name1="";	 
     String gender="";
	 String colour="";
	 
	 String height="";
	 String weight="";
	 String lostplace="";
	 String time="";
	 String date="";
	 String year="";
	 String month=""; 
	
	 String dressing="";
	 String escape="";
	 String reason="";
	 String kidnap="";
	 String kidnap_person="";
	 String kidnapper="";
	 String reward="";
	 String rewarddetails="";
	 String itemName="";
	 String area="";	 

	 
	 
	 
	
	
	
	
	
			 

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
													  if(name.equals("name"))
											           {
																   name1=value;
												            		
													   }
													   if(name.equals("gender"))
									                  {  
													         gender=value;            		 
									                        
													  }
													  if(name.equals("colour"))
									                  {  
													         colour=value;            		 
									                        
													  }
													   if(name.equals("height"))
											           {
																   height=value;
												            		
													   }
													  if(name.equals("weight"))
									                  {  
													         weight=value;            		 
									                       
													  }
													   if(name.equals("month"))
											           {
																    month=value;
												       
													   }
													  if(name.equals("date"))
									                  {  
													         date=value;            		 
									                   
													  }
													  if(name.equals("year"))
									                  {  
													         year=value;            		 
									                   
													  }
													  if(name.equals("lostplace"))
									                  {  
													         lostplace=value;            		 
									                   
													  }
													  if(name.equals("area"))
									                  {  
													         area=value;            		 
									                   
													  }
													  if(name.equals("dressing"))
									                  {  
													         dressing=value;            		 
									                   
													  }
													   if(name.equals("escape"))
									                  {  
													        escape=value;            		 
									                   
													  }
													  if(name.equals("reason"))
									                  {  
													        reason=value;            		 
									                   
													  }
													  if(name.equals("kidnap"))
									                  {  
													        kidnap=value;            		 
									                   
													  }
													  if(name.equals("kidnap_person"))
									                  {  
													        kidnap_person=value;            		 
									                   
													  }
													  if(name.equals("kidnapper"))
									                  {  
													        kidnapper=value;            		 
									                   
													  }
													  if(name.equals("reward"))
									                  {  
													        reward=value;            		 
									                   
													  }
													  if(name.equals("rewarddetails"))
									                  {  
													        rewarddetails=value;            		 
									                   
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
					
					String lost="<all><name>"+name1+"</name>";
					lost+="<gender>"+gender+"</gender>";
					lost+="<colour>"+colour+"</colour>";
					lost+="<height>"+height+"</height>";
					lost+="<weight>"+weight+"</weight>";
					lost+="<month>"+month+"</month>";
					lost+="<date>"+date+"</date>";
					lost+="<year>"+year+"</year>";
					lost+="<time>"+time+"</time>";
					lost+="<lostplace>"+lostplace+"</lostplace>";
					lost+="<dressing>"+dressing+"</dressing>";
					lost+="<escape>"+escape+"</escape>";
					lost+="<reason>"+reason+"</reason>";
					lost+="<kidnap>"+kidnap+"</kidnap>";
					lost+="<kidnap_person>"+kidnap_person+"</kidnap_person>";
					lost+="<kidnapper>"+kidnapper+"</kidnapper>";
					lost+="<reward>"+reward+"</reward>";
					lost+="<rewarddetails>"+rewarddetails+"</rewarddetails></all>";
					
						String query="insert into SAKANSHA.LOSTPEOPLE(LOST_ID,LOST,BY,ON,FOUND,AREA,PHOTO,NAME) values((select max(LOST_ID)+1 from SAKANSHA.LOSTPEOPLE),'"+lost+"','"+session.getAttribute("id")+"',current_timestamp,00,'"+area+"','"+itemName+"','"+name1+"')";
						db.updateSQL(query)	;
												
			 						   
				
 

 out.print("<font color=green align=center>"+"<h1 align=center>"+"YOUR MISSING PERSON COMPLAINT IS REGISTERED"+"</h1>"+"</font>");


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
 <%db.close(); }%>
 
 <table border=0><tr><td></td></tr></table>
<p>&nbsp;</p>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="http://www.quackit.com">Change Password</a> | <a href="http://www.htmlcodes.me">View History</a> | <a href="http://www.free-templates.me"></a></h3></div>
		
      </div>
  </div>
</body>
</html>
