<%@page language="java" import="java.sql.*" %>

<jsp:useBean id="mail" class="database.mail" />
<jsp:useBean id="db" class="database.dncon" />
<html>   
<head><TITLE>Checking log in</TITLE></HEAD>  
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<body>

<center>  
 
<hr>  
<br><br>  
<%
try
	{	

		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		
		ResultSet rs=null;
		PreparedStatement ps=null;
	String username=request.getParameter("email");
	String password=request.getParameter("pass");
	String usertype=request.getParameter("usertype");
	

   
   
   
   
			
			         String query;
		query=("select id,password,usertype,CONFIRM from SAKANSHA.SIGNIN where usertype="+usertype+" and username='"+username+"'");  
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
							if(rs.next())
							{
								ResultSet rs1=null;
								query=("select PERSMISSION from SAKANSHA.SUBJECT where SUBJECT_ID="+rs.getString("id"));
								ps=con.prepareStatement(query);
								rs1=ps.executeQuery();
								if(rs1.next())
								{
								if(rs1.getString("persmission").equals("0"))
								{ %><jsp:forward	page="usersignin.jsp"><jsp:param name="err1" value="Your login details are not still verified. Police Officer approval usually takes 1 or 2 days for citizens login" /></jsp:forward> <%
									//out.print("HELLO");
									//out.print("Your account is not yest varified.");
								}
								else
								{
									if(rs.getString("CONFIRM").equals("1"))
										{
												if(rs.getString("password").equals(password))
												{
												session.setAttribute("id",rs.getString("id"));
												session.setAttribute("login","1");
												session.setAttribute("usertype",rs.getString("usertype"));
												//Password is correct
											
											//out.print("Success"); %>
												<jsp:forward page="homepage.jsp"></jsp:forward>
																	
												<%	
												}
												else
												{
												//Alert the user that an invalid login attempt is made.
												//Asking him to secure his password
												String  subject="Invalid Login Attempt";
												String message="   "
										      	+"  Invalid Login Attempt  "
										      	+"We found that someone has made an invalid login attempt with your email."
										      	+"If you mistyped the password, ignore this message.Else change your password to secure one."
										      	+"Your account details"
										      	+"   Username (Email) : "+username+"    "
										      	+"    Password  : "+rs.getString("password")+"  "      	      	
										      	+" ";
												mail.GmailSend(username,subject,message);
												
											//out.print("Password is incorrect");
											//out.print("HELLO");
											 %><jsp:forward	page="usersignin.jsp"><jsp:param name="err1" value="Your password is incorrect" /></jsp:forward> <%	
												}
											}
											else
											{//out.print("HELLO");
											// He has not clicked the confirmation link that was sent to his mail
									//out.print("You have not confirmed your account.Please check your mail.");	
									 %><jsp:forward	page="usersignin.jsp"><jsp:param name="err1" value="You have not confirmed your account.Please check mail" /></jsp:forward> <%
											}
										}
								}
							}
							else
							{
						 %><jsp:forward	page="usersignin.jsp"><jsp:param name="err1" value="Username is invalid." /></jsp:forward> <%
							
							}         
          		}
          
        	catch(Exception e)
        		 { 
             	out.print("Error"+e.getMessage());        
              	 }  
    

   

%>



</center>

</body>

</HTML>