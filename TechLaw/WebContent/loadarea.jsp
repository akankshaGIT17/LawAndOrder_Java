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

		String city=(String) request.getParameter("q");
		//String zone=(String) request.getParameter("zone");
			db.connect();


 
		
 ResultSet rs1=null;
	 rs1=db.execSQL("select loc_id,loc_name from sakansha.location as a,sakansha.pin as p where a.assigned=0 and p.district="+city+" and a.pin=p.pincode_id");
	 responseText+="<select style='width: 150px' name='list3' multiple size=10   ondblclick='Selectbox.moveSelectedOptions(this.form.list3,this.form.list4,this.form.movesort.checked,this.form.movepattern1.value);' onmouseover='Selectbox.selectAllOptions(document.RegistrationForm.list4);' onkeypress='Selectbox.selectAllOptions(document.RegistrationForm.list4);'>";
	 while(rs1.next())
	 {
	 responseText+="<option  value='"+ rs1.getString("area_id") +"'>"+rs1.getString("area_name")+"</option> ";		
	 }
	 responseText+="</select>";

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