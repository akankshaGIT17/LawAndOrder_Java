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
<link href="css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<title>Detective SignUps| LAW &amp; ORDER</title>
</head>

<body>
<jsp:include page='head.jsp' flush="false"></jsp:include>
      
        
    
    	<div id="content" >
        
        
        <div id="content_top"></div>
        <div id="content_main">
        
        
        <table align="center"><tr ><td><img
			src="images/url.jpg" width="65" height="54" /></td><td><h3><font color=maroon><i>Detective Signups</i></font></h3></td></tr></table>
<table align="center">
	<tr>
		<td></td><td>
		</td>
		<td></td>
		</tr>
	<tr>
		<td><img src="images/arrow-right.gif" height="16" width="18"></img></td>
		<td><a href='detectivesign.jsp?q=1' >New Detective SignUps</a></td>
		<td></td>
	</tr>
	<tr>
		<td><img src="images/arrow-right.gif" height="16" width="18"></img></td>
		<td><a href='detectivesign.jsp?q=2' >Approved Requests</a></td>
		<td></td>
	</tr>
	<tr>	
		<td><img src="images/arrow-right.gif" height="16" width="18"></img></td>
		<td><a href='detectivesign.jsp?q=3' >Pending SignUps</a></td>
		<td></td>
	</tr>
	<tr>	
		<td><img src="images/arrow-right.gif" height="16" width="18"></img></td>
		<td><a href='detectivesign.jsp?q=5' >Rejected Requests</a></td>
		<td></td>
	</tr>
	<tr>	
		<td><img src="images/arrow-right.gif" height="16" width="18"></img></td>
		<td><a href='detectivesign.jsp?q=4' >All SignUps</a></td>
		<td></td>
	</tr>
		
</table>

<jsp:include page='foot.jsp' flush="false"></jsp:include>
</body>
</html>