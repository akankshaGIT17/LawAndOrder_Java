<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<link href="css/lightbox.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Homepage | LAW &amp; ORDER</title>
</head>

<body>
<script>
		function toggle () {
			var shadow = document.getElementById("shadow");
			if (shadow.style.display != "block")
				shadow.style.display = "block";
			else
				shadow.style.display = "none";
		}
	</script>
<%
if(session.getAttribute("login")!=null)
	{
		 %>
<%  try{
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.NAME,IMAGE from SAKANSHA.SUBJECT as i,SAKANSHA.SIGNIN as k ,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where k.ID="+session.getAttribute("id")+" and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs2.next())
						{
						%>
<div id="container">
		<div id="header">
        	<h1><img src="images/sciren.png"></h1>
            <h2>Welcome <%=rs2.getString("NAME") %></h2>
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
               
                <h3>Hi,  <%=rs2.getString("name") %></h3>
                     <img src="upload/<%=rs2.getString("IMAGE") %>" align="middle" width="200" height="167" />   <br/>
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
        	<h2>Jai hind, <%=rs2.getString("name") %>. </h2><%}}catch(Exception e){out.print(e);}; %><%db.close(); %>
        	<p>&nbsp;</p>
           	<p>&nbsp;</p>
       	  <h3>Your Account Details.</h3>
       	  <p> Here are the account details that you provided at the time of registration.You can update your informartion any time.</p>
<p><font color=maroon>On update of email id your userid will also change with the email id.</font> </p>
<% 
						db.connect();
						ResultSet rs3=null;
						rs3=db.execSQL("select TIME,NAME,MOBILE,USERNAME,LASTSIGNIN from SAKANSHA.SUBJECT as i, SAKANSHA.SIGNIN as a where i.SUBJECT_ID=a.ID and i.SUBJECT_ID="+session.getAttribute("id"));
						
						while(rs3.next())
						{
						%>
<table border="0">

	<tbody>
		<tr>
			<td>Name : <%=rs3.getString("NAME") %></td>
			<td></td>
		</tr>
		<tr>
			<td>Mobile No. : <%=rs3.getString("MOBILE") %></td>
			<td></td>
		</tr>
		<tr>
			<td>E Mail Id : <%=rs3.getString("USERNAME") %></td>
			<td></td>
		</tr>
		<tr>
			<td>Registered On : <%=rs3.getString("TIME") %></td> <td></td>
			</tr>
			<tr>
			<td>Last Signin : <%=rs3.getString("LASTSIGNIN") %></td><%} %><%db.close(); %>
			<td></td>
		</tr>
	</tbody>
</table>
<p>&nbsp;</p>



<p>&nbsp;</p>



<h3><font color=green></font></h3>
<table border="1">
	<tbody>
		<tr>
			<td bgcolor="yellow" align="center"><center><font color="green" ><b>TIP OF THE DAY!</b></font></center></td>
		</tr>
		<tr>
			<td><% 
						db.connect();
						ResultSet rs4=null;
						rs4=db.execSQL("select tip,LIVE from sakansha.tips");
						while(rs4.next())
						{
						if(rs4.getString("LIVE").equals("1")){
						%><%=rs4.getString("tip") %></td><%}%><%}%><%db.close(); %>
		</tr>
	</tbody>
</table>
<% 
	try
	{
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		//String name,password,date,month,year,date1,month1,year1, district,taluk,email,phoneno,education,telephoneno,mobileno,pincode,addressLine1,addressLine2,query;
		//String OPASSWORD=request.getParameter("pass1");
		//String NPASSWORD=request.getParameter("pass2");
		
		//String CPASSWORD = request.getParameter("CPASSWORD");
		//String GASID=request.getParameter("GASID");
		//out.println(GASID);
		Statement st=con.createStatement();
		//String query= "select * from SAKANSHA.SIGNUPUSER";
		String query="UPDATE  SAKANSHA.SIGNIN SET  LASTSIGNIN=current_timestamp where ID='"+session.getAttribute("id")+"'";
		//ResultSet rs=st.executeQuery(query);
		//while(rs.next())
		//{if (OPASSWORD.equals((String)rs.getString("PASSWORD"))){
		//if (OPASSWORD.equals((String)rs.getString("PASSWORD")))
	//	{
		//query="UPDATE  SAKANSHA.SIGNUPUSER SET  PASSWORD='"+NPASSWORD+"'";
		//out.println("hiiii  "+st.executeUpdate(query));
		st.executeUpdate(query);
		
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

<p>&nbsp;</p>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="updateprofileuser.jsp">Update Profile</a> | <a href="changepassword.jsp">Change Password</a> | <a href="userhistory0.jsp">View History</a> | <a href="userimage.jsp"> Profile Pic</a></h3></div>
		
      </div>
  </div><%} %>
  <div>
  <%if(session.getAttribute("login")==null)
  { %>
 <jsp:forward	page="usersignin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
   <%} %></div>
</body>
</html>
