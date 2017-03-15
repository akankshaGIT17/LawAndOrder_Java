<%@page import="java.util.*" language="java" %>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />


 
<%

String var1="",var2="",var3="",var4="";

	String var=request.getParameter("page");
	
	if(var.equals("1"))
	{
	var1="<img src='images/general/pointright.gif'>";
	}
	else if(var.equals("2"))
	{
	var2="<img src='images/pointright.gif'>";
	}
	else if(var.equals("3"))
	{
	var3="<img src='images/pointright.gif'>";
	}
	else if(var.equals("4"))
	{
	var4="<img src='images/pointright.gif'>";
	}
out.println("<table width='100%'>"
+"	<tr>"
+"		<td valign='top'>"
+"<table cellspacing='5' cellpadding='5' class='back' style='text-align:left;' width='100%' >"
+"	<tr>"
+"		<td colspan='2'>"
+"<h3>Signup Process</h3>"
+"		</td>"
+"	</tr>"
+"	<tr><td>"+var1+"</td><td><span>Requirements and TOS</span></td></tr>"
+"	<tr><td>"+var2+"</td><td></span><span>Complete the signup form</span></td></tr>"
+"	<tr><td>"+var3+"</td><td><span>click the link on confirmation mail</span></td></tr>"
+"	<tr><td>"+var4+"</td><td><span>Your are completed</span></td></tr>"	
+"</table>");
out.println("	<table class='back' cellspacing='5' cellpadding='5' style='text-align:left' width='100%'>"
+"				<tr><td><h3>Benifits of having Login</h3>"
+"				<ul><li>Can submit emergency/Non emergency Complaint "
+"				and you can check the status of the complaint, you will be alerted via Email/SMS in emergency situation<br/>"
+"				</li>"
+"				<li>Report about missing valuables/ missing persons</li>"
+"				<li>Ask for Servant/Tenant Verification</li>"
+"				<li>Blood Group search is more customizable</li>"
+"				<li><b>All the above services are completely free of cost.</b></li></ul></td></tr>"
+"			</table>");
%>