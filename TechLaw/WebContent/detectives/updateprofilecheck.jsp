<%@page import="java.util.*" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<jsp:useBean id="mail" class="database.mail" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="GENERATOR" content="IBM WebSphere Studio"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="../css/lstyle.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="db" class="database.dncon" />
<title> Updating</title>
<jsp:include page="includehead.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/othervalids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script></head>

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
	try
	{
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		//String name,password,date,month,year,date1,month1,year1, district,taluk,email,phoneno,education,telephoneno,mobileno,pincode,addressLine1,addressLine2,query;
		String USERNAME=request.getParameter("email");
		String profession=request.getParameter("profession");
		
		String marry = request.getParameter("maritialstatus");
		String phone=request.getParameter("phoneno");
		String mobile=request.getParameter("mobileno");
		String add=request.getParameter("addressline1")+request.getParameter("addressline2");
		//String pin=request.getParameter("pincode");
		String area= request.getParameter("area");
		String blood=request.getParameter("bg");
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		//String query= "select * from SAKANSHA.SIGNUPUSER";
		String query="UPDATE  SAKANSHA.SIGNIN SET  USERNAME='"+USERNAME+"' where ID='"+session.getAttribute("id")+"'";
		String query1="UPDATE  SAKANSHA.SUBJECT SET  AREA='"+area+"',phonenumber='"+phone+"',mobile='"+mobile+"',address='"+add+"' where SUBJECT_ID='"+session.getAttribute("id")+"'";
		
		st1.executeUpdate(query1);
		//ResultSet rs=st.executeQuery(query);
		//while(rs.next())
		//{if (OPASSWORD.equals((String)rs.getString("PASSWORD"))){
		//if (OPASSWORD.equals((String)rs.getString("PASSWORD")))
	//	{
		//query="UPDATE  SAKANSHA.SIGNUPUSER SET  PASSWORD='"+NPASSWORD+"'";
		//out.println("hiiii  "+st.executeUpdate(query));
		if(st.executeUpdate(query)==1)
		{
		%><jsp:forward	page="suc.jsp"><jsp:param name="err" value="Profile Update Was Successfull." /></jsp:forward><%
		//}
		}
		else
		{
		%><jsp:forward	page="suc.jsp"><jsp:param name="err" value="OOPS! Something went wrong please try again." /></jsp:forward><%
		}
		
		//}
		//else{out.println("Enter correct GAS ID");}
		
		
	 
	String  subject="Update in your LAW & ORDER profile";
												String message="  "
										     	+"You have recently updated your profile "
										     	+"     and your id is changed to ."
										      	+"  "
										      	+""
										     	+": "+USERNAME+" "
										      	+"  Now you will get all alerts on this id." +"    Also pplease login from this id only.Previous id would be invalid."   	      	
										      	+"If you want to update your id, then go to ur update profile to make changes.";
												mail.GmailSend(USERNAME,subject,message);
	
											   
											   
		//}
		con.close();
	}
	catch(Exception e)
	{
		out.println("Error"+e.getMessage());
		
	}
	%>
       