<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.Date" %>
 <%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
  <%@page import="java.util.Date" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="techfiles/othervalids.js"></script>
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Citizen Sign Ups Today| LAW &amp; ORDER</title>

<script  type="text/javascript" language="javascript" >
function ajax(a)
{

	
	 if(a==1)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		citizensignup(1);
		}
		if(a==2)
		{
		
		
		
		document.getElementById("listall").innerHTML="";
		detectivesignup(1);
		}
		if(a==3)
		{
		
		
		document.getElementById("listall").innerHTML="";
		complaints(1);
		}
	else
		{
		document.getElementById("listall").innerHTML="element"+a+" Loading...";
		}
	
	a='menu-item'+a;
	
	
		for(i=1;i<7;i++)
	{
	
	b="menu-item"+i;
	
	var elem=document.getElementById(b);
	elem.style.background="none";
	
	}
	
	var elem1 = document.getElementById(a);
	 elem.style.background = "#f3f3f3";
	
	 




}
</script>


</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        <script type="text/javascript" src="techfiles/othervalids.js"></script>
        
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        <table align="center"><tr><td><h2><font color=teal>Citizen SignUps</font></h2></td></tr></table>
<%

try
{
		String responseText=new String("");
		String q=(String) request.getParameter("q");
		db.connect();
// get the officers police station and  working area
		ResultSet rs1=null;		
		
		rs1=db.execSQL("select c.area,o.p_ip from SAKANSHA.POLICEJOB as o,SAKANSHA.POWER as c where o.policestation=c.policestation and o.p_ip="+session.getAttribute("id"));
		
		responseText+="<table width='100%'   >";
		 responseText+="<tr bgcolor=orange><td ><strong></strong></td><td><strong><font color=maroon>Name</font></strong></td><td><strong><font color=maroon>Area</font></strong></td><td><strong><font color=maroon>Type of Proof</font></strong></td><td><strong><font color=maroon>Time</font></strong></td><td><strong><font color=maroon>Status</font></strong></td></tr>";
		 responseText+="<tr><td colspan='6'><hr/></td></tr>";
		 ResultSet rs=null;
		while(rs1.next())
		{
//request.getRemoteAddr();
				
				 ///ResultSet rs=null;
				 if(Integer.parseInt(q)==1)
				 {
				 //show only new signup requests
				 rs=db.execSQL("select t.name,i.time,p.proofname,a.loc_name,pe.status,i.subject_id from SAKANSHA.SUBJECT as i,SAKANSHA.PROOFS as p,SAKANSHA.LOCATION as a,SAKANSHA.ALLOWANCE as pe,xmltable('$c/all' passing i.DETAILS as \"c\" columns name varchar(100) path 'name') as t where i.persmission=0 and i.persmission=pe.id  and p.id=i.prooftype and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==2)
				 {
				
				 
				 rs=db.execSQL("select t.name,i.time,p.proofname,a.loc_name,pe.status,i.subject_id from sakansha.subject as i,sakansha.proofs as p,sakansha.location as a,sakansha.allowance as pe,xmltable('$c/all' passing i.details as \"c\" columns name varchar(100) path 'name') as t where i.persmission=1 and i.persmission=pe.id  and p.id=i.prooftype and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 if(Integer.parseInt(q)==3)
				 {
				 
				 
				 rs=db.execSQL("select t.name,i.time,p.proofname,a.loc_name,pe.status,i.subject_id from sakansha.subject as i,sakansha.proofs as p,sakansha.location as a,sakansha.allowance as pe,xmltable('$c/all' passing i.details as \"c\" columns name varchar(100) path 'name') as t where i.persmission=2 and i.persmission=pe.id  and p.id=i.prooftype and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				  if(Integer.parseInt(q)==4)
				 {
				
				 
				 rs=db.execSQL("select t.name,i.time,p.proofname,a.loc_name,pe.status,i.subject_id from sakansha.subject as i,sakansha.proofs as p,sakansha.location as a,sakansha.allowance as pe,xmltable('$c/all' passing i.details as \"c\" columns name varchar(100) path 'name') as t where  i.persmission=pe.id  and p.id=i.prooftype and i.area="+rs1.getString("area")+" and a.loc_id="+rs1.getString("area"));
				 }
				 
			
     
      
				 while(rs.next())
				 {
				
				 responseText+="<tr style='cursor:pointer' onclick='javascript:showsignup("+rs.getString("subject_id")+","+q+");'><td ></td><td>"+rs.getString("name")+"</td><td>"+rs.getString("loc_name")+"</td><td>"+rs.getString("proofname")+"</td><td>"+rs.getString("time")+"</td><td>"+rs.getString("status")+"</td></tr>";		
				
				  responseText+="<tr><td colspan='6'><hr/></td></tr>";
			
				
					
				 }
				 
				
				
		}
		
		 responseText+="</table>";
	  	out.print(responseText);
 	
	%>
	
	
	
	
	
	
	<%
  	db.close();
 
 } 
 catch(Exception e)
	{
		out.println("Error "+e.getMessage());
		
	}
	
%>

<table align="right"><tr><td> <span><a onclick="javascript:history.back()" style="cursor:pointer">Back</a></span><br /></td></tr><tr><td><br/><br/></td></tr></table>
<span id="listall"></span>

<jsp:include page='foot.jsp' flush="false"></jsp:include>

</body>
</html>