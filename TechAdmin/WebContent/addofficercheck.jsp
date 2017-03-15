
<html>
<head><title>Add officer | Law &amp; Oreder</title>
<%@page language="java" import="java.sql.*" %>


<%
if(session.getAttribute("login")==null)
{
%>
<jsp:forward page="signout.jsp?err=You should be logged in to see this page"></jsp:forward>
<%
}
 %>
 <jsp:include page='top.jsp' flush="false"></jsp:include>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />
<%@page language="java" import="java.sql.*" %></head><body>

<% 

 

try 
	{ 
		String email=request.getParameter("email");
		String designation=request.getParameter("designation");
		
		
		String zone=request.getParameter("zone");
		String city=request.getParameter("city");
		db.connect();
		double x = Math.random();
		System.out.println("Generated random number: "+x);
		String password = x+"";
		password = password.substring(2,10);
		
        db.updateSQL("insert into sakansha.signin(id,username,password,usertype,lastsignin) values((select max(id)+1 from sakansha.signin),'"+email.toLowerCase()+"','"+password+"',2,current_timestamp)"); 
        db.updateSQL("insert into sakansha.policejob(p_ip,zone,city,designation) values((select max(p_ip)+1 from sakansha.policejob),"+zone+","+city+","+designation+")");
      	
      	ResultSet rs=null;
		String query="select name,(select max(id) from sakansha.signin) as id from sakansha.designation where  id="+designation;
      	rs=db.execSQL(query);
      	
      	double y=Math.random();
      	String code =y+"";
      	code=code.substring(2,10);
      	
      	while (rs.next())
      	{
      	db.updateSQL("insert into sakansha.confirmation(id,code,time) values ("+rs.getString("id")+",'"+code+"',current_timestamp)");
      	
      	String subject="You are appointed";
      	String message="<html><head></head><body><table>"
      	+"<tr><td><h1>Welcome to E COPS</h1></td></tr>"
      	+"<tr><td>You have been appointed as <strong>"+rs.getString("name")+"</strong></td></tr>"
      	+"<tr><td>To confirm your Email Id click the following link </td></tr>"
      	+"<tr><td>Your account details <br/> </td></tr>"
      	+"<tr><td>Username (Email) : "+email+" </td></tr>"
      	+"<tr><td>Password  : "+password+" </td></tr>"
      	+"<tr><td>Above password is automatically generated and it can be changed.<br/><br/></td></tr>"
      	+"<tr><td>You need to have scanned copy of your photo and fingerprint reader while updating the profile. <br/><br/></td></tr>"
      	+"<tr><td><h2><a href='http://localhost:9080/Employee/confirmation.jsp?id="+rs.getString("id")+"&code="+code+"'>http://localhost:9081/TechAdmin/confirmation.jsp?id="+rs.getString("id")+"&code="+code+"</a></h2> </td></tr>"
      	+"</table></body></html>";
      	mail.GmailSend(email,subject,message);
		}												
		 out.println("<h2><font color=green>"+"employee created"+"</font></h2>");
   		db.close();
     }
          
catch(Exception e) { 
    out.println("Your query is not working"+e.getMessage());        
     }  
     

  

%>
<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>