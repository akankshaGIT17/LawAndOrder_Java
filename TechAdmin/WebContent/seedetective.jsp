<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="db" class="database.dncon" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<html>
<head>
<title>Police Option|Law &amp; Order</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:include page='top.jsp' flush="false"></jsp:include>
<br /><br />
<%

try
{
		
		String q=request.getParameter("id");
		
		
		db.connect();

				 ResultSet rs=null;
				 rs=db.execSQL("select i.rejection,t.name,t.fathername,t.date,t.month,t.year,t.address,i.agency,i.time,i.members,a.loc_name,pe.status,i.id,i.flag from sakansha.detectives as i,sakansha.location as a,sakansha.allowance as pe ,xmltable('$c/all' passing i.detective as \"c\" columns name varchar(100) path 'name',fathername varchar(100) path 'fathername',date varchar(2) path 'date',month varchar(2) path 'month',year varchar(4) path 'year',address varchar(1000) path 'address') as t where  i.flag=pe.id   and i.area=a.loc_id  and i.id="+q);
				 
				out.print("<table width='98%' cellspacing='5' cellpadding='5' class='back' style='text-align:left'>");
				
				 while(rs.next())
				 {
				 out.print("<tr ><td colspan='2'><strong>Detective Agency Details</strong></td></tr>");
				 out.print("<tr ><td width='50%'>Agency Name</td><td width='50%'>"+rs.getString("agency_name")+"</td></tr>");
				 out.print("<tr><td>Members in the agency</td><td>"+rs.getString("members")+"</td></tr>");				 
				 out.print("<tr><td>Address</td><td>"+rs.getString("address")+"</td></tr>");
				 out.print("<tr><td>Area</td><td>"+rs.getString("area_name")+"</td></tr>");
				 out.print("<tr ><td colspan='2'><strong>Detective Details (Incharge person of detective agency)</strong></td></tr>");
				 out.print("<tr ><td width='50%'>Name</td><td width='50%'>"+rs.getString("name")+"</td></tr>");
				 out.print("<tr><td>Father Name</td><td>"+rs.getString("fathername")+"</td></tr>");
				 String[] monthName = {"zero","January", "February",
            "March", "April", "May", "June", "July",
            "August", "September", "October", "November",
            "December"};
 
        
        String month = monthName[Integer.parseInt(rs.getString("month"))];
				 
				 out.print("<tr><td>Date of Birth</td><td>"+rs.getString("date")+"/"+month+"/"+rs.getString("year")+"</td></tr>");
				
				 out.print("<tr><td>Time of signup</td><td>"+rs.getString("time")+"</td></tr>");
				 
			
				 
				 //String var="";
				 
				 
					 
							
				 
				 }
				
					 out.print("<tr><td><a onclick=\"window.location='detectives.jsp'\" style='cursor:pointer'>Back to Results</a></td></tr>");
				

		 out.print("</table>");
	  	//out.print(responseText);

	
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>

<jsp:include page='low.jsp' flush="false"></jsp:include>

</body>
</html>