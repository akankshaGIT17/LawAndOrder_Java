<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.sql.*,java.util.*,java.io.*,java.net.*,java.text.*" %>
	<%@page	language="java" import="java.net.*,java.io.*,java.net.URLEncoder;" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="db" class="database.dncon" />
<jsp:useBean id="mail" class="database.mail" />
<html>
<head>
<title>mostwantedcheck</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
db.connect();
out.print("rrrr");
String id=request.getParameter("id");
String cname=request.getParameter("cname");
String criminalinfo=request.getParameter("criminal_info");
//String placefound=request.getParameter("placefound");
//int area=Integer.parseInt(request.getParameter("area"));
String name=request.getParameter("name");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String ip=request.getParameter("ip");
//String responseText=new String("");

//Calendar cal = Calendar.getInstance(); 
//int year = cal.get(Calendar.YEAR);



//DecimalFormat myFormat = new java.text.DecimalFormat("00000");
//String area1=myFormat.format(area);
        try
							{out.print("rrrr");
        ResultSet rs=null;
       // String query1="(select max(comp_id)+1 as id from SAKANSHA.COMPLAINTS)";
       
       // rs=db.execSQL(query1);
        
       // DecimalFormat myFormat1 = new java.text.DecimalFormat("000000");
		//String id1=myFormat1.format(Integer.parseInt(rs.getString("id")));
		String query="INSERT INTO SAKANSHA.CRIMINAL_REPORTED (ID,CRIMINAL_ID,CRIMINAL_NAME,FOUND_PLACE,INFORMATION,NAME_PERSON,CONTACT_INFO,EMAIL,IP)   VALUES ((select max(id)+1 from SAKANSHA.CRIMINAL_REPORTED),'"+id+"', '"+cname+"', '1', '"+criminalinfo+"', '"+name+"', '"+contact+"','"+email+"','"+ip+"')";
		db.updateSQL(query);
			//out.print("is RECORDED! Thank you");
 %>

 
 <%{
 String  subject="You Complaint is registered at LAW & ORDER AUTOMATION";
												String message="  "
										     	+"Most wanted criminal recorded LAW & ORDER AUTOMATION"
									     	+"     Your most wanted information criminal   ."
								      	+"  "
							      	+""
					     	+"criminal name : "+cname+" "
								      	+"     Registered from IP address "+ip+" "      	      	
							      	+"Thank you for your support. Keep on helping us to create a crime free INDIA!.";
									mail.GmailSend(email,subject,message);
												
 
	}
		
		
	//	URL url = new URL("http://site2.way2sms.com/Main.action?id=C56D5726B5D445AB10EB5B360A88092C.w809&msg=EmgergencyComplaint2&to=9953955325&from=Way2Sms.com&unicode=no&send=1");
		//URLConnection conn = url.openConnection();
		//BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//String inputLine;
		//while ((inputLine = in.readLine()) != null) {
		//System.out.println(inputLine);
		//}
		//in.close();
		
		
 }
		
							catch(Exception e)
							{
							out.print("Error    "+e.getMessage());
							}db.close();
		
		%>
</body>
</html>