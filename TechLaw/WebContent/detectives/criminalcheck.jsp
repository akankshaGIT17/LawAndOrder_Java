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
 String id =request.getParameter("id1");
 String name=request.getParameter("id2");
						
						try{
						db.connect();
						ResultSet rs6=null;
						
						
						rs6=db.execSQL("select i.ID,NAME,FINGER,LEFT,RIGHT,FRONT,DOB,FATHER,ISINJAIL,ISALIVE,GENDER,NATIONALITY,b.ID,b.JAILNO,b.INDATE,b.OUTDATE,b.REASON,b.COURT,b.CASE from SAKANSHA.CRIMINAL_DETAIL as i,SAKANSHA.CRIMINAL_IO as b where i.ID='"+id+"' and b.ID=i.ID")  ;
						while(rs6.next())
						{%>
						<center>  <h1>CRIMINAL NAME :<font color=red><%=rs6.getString("NAME")%></font></h1></center>
						<center> <h2>Image Details</h2></center>
					<table align="center">
			<thead>
			<tr> </tr>
				<tr>
					<th scope="col">Left Image</th>
					<th scope="col">Front Image</th>
					<th scope="col">Right Image</th>
					<th scope="col">Fringer Print</th>
				</tr>
			</thead>	
			<tr>
					<td><img src="../upload/<%=rs6.getString("LEFT") %>" alt="An image" width="95" height="95" /></td>
					<td><img src="../upload/<%=rs6.getString("FRONT") %>" alt="An image" width="95" height="95" /></td>
					<td><img src="../upload/<%=rs6.getString("RIGHT") %>" alt="An image" width="95" height="95" /></td>
					<td><img src="../upload/<%=rs6.getString("FINGER") %>" alt="An image" width="95" height="95" /></td>
				</tr></table>
				<center> <h2>Criminal Details</h2></center>
				<table align=center>
				<thead>
				<tr>
				
				<th scope="col">Name</th>
				<th scope="col">Father Name</th>
				<th scope="col">Nationality</th>
				<th scope="col">Gender</th>
				<th scope="col">In Jail?</th>
				<th scope="col">Alive?</th>
				
				</tr>
				</thead>
				<tr>
				<td><%=rs6.getString("NAME")%></td>
				<td><%=rs6.getString("FATHER")%></td>
				<td><%=rs6.getString("NATIONALITY")%></td>
				<td><% if(rs6.getString("GENDER").equals("1")){out.print("Male");} else {out.print("female");}%></td>
				<td><font color=red><%=rs6.getString("ISINJAIL")%></font></td>
				<td><%=rs6.getString("ISALIVE")%></td>
				</tr>
				</table>
				<center> <h2>Crime Details</h2></center>
		<table align=center>
				<thead>
				<tr>
				
				<th scope="col">Case No.</th>
				<th scope="col">Jail No.</th>
				<th scope="col">In Date</th>
				<th scope="col">Release Date</th>
				<th scope="col">Crime</th>
				<th scope="col">Court Oder</th>
				
				</tr>
				</thead>
				<tr>
				<td><%=rs6.getString("CASE")%></td>
				<td><%=rs6.getString("JAILNO")%></td>
				<td><%=rs6.getString("INDATE")%></td>
				<td><%=rs6.getString("OUTDATE")%></td>
				<td><%=rs6.getString("REASON")%></td>
				<td><%=rs6.getString("COURT")%></td>
				</tr>
				</table>
		
		
		
						<% }
			
			
			db.close(); 
			%>
			
		
			<% }catch(Exception e)
        		 { %> 
              		<%out.print(e);        
              	 } %> 
              	 
              	 
              	 

		</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; TGMC'12 TechJustice</p>
		<p class="right"><a href="inbox.jsp">Mail</a> | <a href="updateprofile.jsp">Update Profile</a> | <a href="pass.jsp">Update Password</a> | <a href="changepic.jsp">Update Profile Picture</a> </p>
	</div>	
</div>	
</body>
</html>
              	 