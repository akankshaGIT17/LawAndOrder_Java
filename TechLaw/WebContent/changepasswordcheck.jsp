<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<title>Change Password | LAW &amp; ORDER</title>
</head>

<body>

	

<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="usersignin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}
 %>
		 
<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select t.NAME,USERNAME,ID from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as a,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
						while(rs2.next())
						{
						%><input type="hidden" value="<%=rs2.getString("USERNAME")%>" name="mmm"  />
<div id="container">
		<div id="header">
        	<h1><img src="images/sciren.png"></h1><input type="hidden" value="<%=rs2.getString("USERNAME")%>" name="email1" value="email1"  />
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
                     <img src="images/user.jpg" align="middle" width="198" height="162" />   <br/>
                <ul>
                    <li><a href="#"></a></li>
                    <li><a href="emergencyhome.jsp">Emergency Complaint</a></li>
                    <li><a href="normalcomplaint.jsp">Normal Complaint</a></li>
                    <li><a href="missingperson.jsp">Missing Persons</a></li>
                    <li><a href="missingvaluables.jsp">Missing Valuables</a></li>
                    <li><a href="complaintstatususer.jsp">Complaint Status</a></li><%} %>
                    
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
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		//String name,password,date,month,year,date1,month1,year1, district,taluk,email,phoneno,education,telephoneno,mobileno,pincode,addressLine1,addressLine2,query;
		String OPASSWORD=request.getParameter("pass1");
		String NPASSWORD=request.getParameter("pass2");
		
		//String CPASSWORD = request.getParameter("CPASSWORD");
		//String GASID=request.getParameter("GASID");
		//out.println(GASID);
		Statement st=con.createStatement();
		//String query= "select * from SAKANSHA.SIGNUPUSER";
		String query="UPDATE  SAKANSHA.SIGNIN SET  PASSWORD='"+NPASSWORD+"' where ID='"+session.getAttribute("id")+"' AND PASSWORD='"+OPASSWORD+"'";
		//ResultSet rs=st.executeQuery(query);
		//while(rs.next())
		//{if (OPASSWORD.equals((String)rs.getString("PASSWORD"))){
		//if (OPASSWORD.equals((String)rs.getString("PASSWORD")))
	//	{
		//query="UPDATE  SAKANSHA.SIGNUPUSER SET  PASSWORD='"+NPASSWORD+"'";
		//out.println("hiiii  "+st.executeUpdate(query));
		if(st.executeUpdate(query)==1)
		{
		%><jsp:forward	page="successuser.jsp"><jsp:param name="err1" value="Password Was Changed Successfylly." /></jsp:forward><%
		//}
		}
		else
		{
		%><jsp:forward	page="successuser.jsp"><jsp:param name="err" value="You entered a invalid password." /></jsp:forward><%
		}
		//}
		//else{out.println("Enter correct GAS ID");}
		//}
		con.close();
	}
	catch(Exception e)
	{
		out.println("Error"+e.getMessage());
		
	}
	%>
       
        
        </div>
            
        <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userhistory0.jsp"></a></h3></div>
		
    </div></div>

</body>
</html>
        