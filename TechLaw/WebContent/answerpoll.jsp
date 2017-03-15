<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>poll connection</title>



</head>
<body>

<% response.setDateHeader("Expires",-1);%>
<%
String responseText=new String("");
try{
//out.print("here");
		

		String sel=(String) request.getParameter("q");//out.print("here");
			db.connect();
//out.print("here");
   ResultSet rs = null ; 
   String query="";
   if(Integer.parseInt(sel)==1)
   {//out.print("here11");
		 query="update SAKANSHA.POLLS set total=(select total from SAKANSHA.POLLS where check=1)+1,opt1=(select opt1 from SAKANSHA.POLLS where check=1)+1 where check=1";
		}
		else
		{
		 query="update SAKANSHA.POLLS set total=(select total from SAKANSHA.POLLS where check=1)+1,opt2=(select opt2 from SAKANSHA.POLLS where check=1)+1 where check=1";
		 }
	db.updateSQL(query);
		String query1="select * from SAKANSHA.POLLS where check=1";
		rs=db.execSQL(query1);
		while(rs.next())
		{
			int total=Integer.parseInt(rs.getString("total"));
			int opt1=Integer.parseInt(rs.getString("opt1"));
			int opt2=Integer.parseInt(rs.getString("opt2"));
			
			float yes=(float)(opt1*100)/(total);
			float no=(float)(opt2*100)/(total);
			
			responseText+="<table   border='0' cellpadding='5%' cellpadding='5%' style='width: 100%' >";
			
			responseText+="<tr ><td colspan='2'><h2> <font color=maroon>Poll Results</font></h3></td></tr>";
			responseText+="<tr><td><b>"+rs.getString("option1")+"</b>: </td><td><font color=green><b>"+yes+"%</b></font></td></tr>";
			responseText+="<tr><td><b>"+rs.getString("option2")+"</b> : </td><td><font color=red><b>"+no+"%</b></font></td></tr>";
		}

	

  	out.print(responseText);
  	db.close();
 
 } 
 catch(Exception e)
	{
		responseText="Error "+e.getMessage();
		out.print(responseText);
	}
	
%>





</body>
</html>
		