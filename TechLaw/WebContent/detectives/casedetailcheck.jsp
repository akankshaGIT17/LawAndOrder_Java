<%@page import="java.util.*" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
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
<title> checking</title>
<jsp:include page="includehead.jsp" flush="false"></jsp:include>
<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/othervalids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script></head>

<body>


<% 
	String firno=request.getParameter("fir");
	String password=request.getParameter("pass");
	
	db.connect();

   ResultSet rs = null ; 
   
   
   
			try 
				{ out.print("");
			         rs = db.execSQL("select a.ID as first,a.PASSWORD from SAKANSHA.CASES as a ,SAKANSHA.FIR_DETAILS as f where  f.FIR='"+firno+"'");  
					out.print("");
					if(rs.next())
					{
					out.print ("");
											if(rs.getString("PASSWORD").equals(password))
						{
						
					
	try
	{
	db.connect();
	ResultSet rs2=null;
	String query=("select detail1,detail2,detail3,detail4,j.PASSWORD from SAKANSHA.DETECTIVE_DETAIL as i,SAKANSHA.CASES as j where i.id=j.id");
	rs2=db.execSQL(query);
	if(rs2.next())
	{
	 %>
	
			<table class="back" style="text-align:left">
			<tr><td> <h2><font color=teal><b>FIR NO. <%out.print(firno);%></b></font></h2></td></tr>
				<tr>
				
					<td valign="top">What has been done till now?</td>
					<td>
						<textarea name="detail1" readonly="readonly"><%=rs2.getString("detail1") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">What are the details further necessary</td>
					<td>
						<textarea name="detail2" readonly="readonly"><%=rs2.getString("detail2") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Any Suspecious Person who has to be monitored</td>
					<td>
						<textarea name="detail3" readonly="readonly"><%=rs2.getString("detail3") %></textarea>
					</td>
				</tr>
				<tr>
					<td valign="top">Next action that will be taken</td>
					<td>
						<textarea name="detail4" readonly="readonly"><%=rs2.getString("detail4") %></textarea>
					</td>
				</tr>
				<form method="post" action="casecheckcheck.jsp" name="RegistrationForm" > 
				<tr>
					<td valign="top">Any further information ? </td>
					
					<td>
						<textarea name="detail5" ></textarea>
						<input type="hidden" value=<%out.print(firno);%> name=firno></input>
					</td>
					
				</tr>
						</table>
<input type="submit" name="submit" value="submit" />		</form>

<%}
		}
		catch(Exception e)
		{
		out.print("Error"+e.getMessage());
		}  
						}
						else
						{
						out.print("<br /><br /><center><font color=red size=+2>Password is wrong</font></center>");
						out.print("<br/><center><a href='casedetail.jsp'>Click here to retype it</a></center><br/>");
						}
						
						
					}
					else
					{
						out.print("<br /><br /><center><font color=red size=+2>FIR number not found</font></center>");
						out.print("<br/><center><a href='casedetail.jsp'>Click here to retype it</a></center><br/>");
					}
          		}
          
        	catch(Exception e)
        		 { 
              		out.print("Error"+e.getMessage());        
              	 }  
    

   db.close();

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
