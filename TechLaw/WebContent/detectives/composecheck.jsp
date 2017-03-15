<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />

<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script>
<head>
<title>View Criminal</title>
	<jsp:include page="includehead.jsp" flush="false"></jsp:include>
	<script type="text/javascript">
             function loadSubmit() {
var ProgressImage = document.getElementById('progress_image');
document.getElementById("progress").style.visibility = "visible";
setTimeout("ProgressImage.src = ProgressImage.src",100);
return true;
} </script>
	<link href="../css/style2.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    
</head>
<body>

<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="signin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}
 %>
 
 <% 
 String to =request.getParameter("to");
 String sub=request.getParameter("subject");
  String msg=request.getParameter("msg");
  String from=request.getParameter("from");
    String name=request.getParameter("name");
  		db.connect();				
						try{
						
						ResultSet rs6=null;
						
						
						rs6=db.execSQL("select i.ID as first,i.USERNAME as second from SAKANSHA.SIGNIN as i where i.USERNAME='"+to+"'")  ;
						if(rs6.next())
						{
										
	try
	{
	db.connect();
	ResultSet rs2=null;
	String query="INSERT INTO SAKANSHA.MAIL (ID,TOID,FROMID,DATE,TIME,SUBJECT,MESSAGE,FROM,TO,FROMNAME)   VALUES ( (select max(ID)+1 from SAKANSHA.MAIL),"+rs6.getString("first")+", '"+session.getAttribute("id")+"', current_date, current_time, '"+sub+"','"+msg+"','"+from+"', '"+to+"','"+name+"')";
		db.updateSQL(query);
	
						%>
						
						<jsp:forward	page="suc.jsp"><jsp:param name="err" value="Your Mail was successfully sent." /></jsp:forward>
						
						<%} catch (Exception e) {out.print(e);} %>
						
						
						<% } else {%><jsp:forward	page="compose.jsp"><jsp:param name="err" value="You entered invalid email id." /></jsp:forward><%} %>
						<%db.close();}
						catch(Exception e)
						{
						out.print(e);}
						 %>
						</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; TGMC'12 TechJustice</p>
		<p class="right"><a href="inbox.jsp">Mail</a> | <a href="updateprofile.jsp">Update Profile</a> | <a href="pass.jsp">Update Password</a> | <a href="changepic.jsp">Update Profile Picture</a> </p>
	</div>	
</div>	
</body>
</html>
						