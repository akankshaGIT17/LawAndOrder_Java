<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page language="java" import="java.sql.*" %>
	<jsp:useBean id="db" class="database.dncon" />
<html>
<head>
<title>loadcity</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<% response.setDateHeader("Expires",-1);%>
<%

try{
		String responseText=new String("");
		//String responseText2=new String("");

		String city=(String) request.getParameter("qparam");
		//String zone=(String) request.getParameter("zone");
			db.connect();

   ResultSet rs = null ; 
		String query="select d.id,t.Name,p_ip,i.designation from sakansha.policejob as i, sakansha.designation as d,xmltable('$c/Profile' passing i.PROFILE as \"c\" columns name varchar(100) path 'name') as t where i.designation>5 and i.working=0 and d.id=i.designation and i.city="+city+"";
		rs = db.execSQL(query);
		responseText+="<select onchange='loadarea("+city+");' style='width: 150px' name='list1' multiple size=10   ondblclick='Selectbox.moveSelectedOptions(this.form.list1,this.form.list2,this.form.movesort.checked,this.form.movepattern1.value);' onmouseover='Selectbox.selectAllOptions(document.RegistrationForm.list2);' onkeypress='Selectbox.selectAllOptions(document.RegistrationForm.list2);'>";
		
if(rs.next())
		{
		rs = db.execSQL(query);
		while(rs.next())
			{
			responseText+="<option  value='"+ rs.getString("p_ip") +"'>"+rs.getString("name")+"("+rs.getString("designation")+")</option> ";		
			}
			responseText+="</select><br/>";
		}
		else
		{
		responseText="<font style='color:red'>No unemployed officer is available in this city.<br/> Please select another city or first add the employee</font>";
		}
		out.print(responseText);
		// System.out.print(responseText2);
	  //System.out.print(responseText);
	
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>





</body>
</html>
