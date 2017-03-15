<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.sql.*" %>
<%@page import="java.util.*,java.text.*,java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/dropdown-menu.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />


<script type="text/javascript" src="../techfiles/valids.js"></script>
<script type="text/javascript" src="../techfiles/ajax.js"></script>
<head>
<title>Compose Mail |Law &amp; Order</title>
 <style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=100);
        }
        .white_content1 {
            display: none;
            position: absolute;
            top: 35%;
            left: 25%;
            width: 50%;
            height: 50%;
            padding: 16px;
            border: 6px solid orange;
             background:white url(../images/form_top.gif) repeat-x;
            z-index:1002;
            overflow: auto;
        }
    </style>
	<jsp:include page="includehead.jsp" flush="false"></jsp:include>
	<script type="text/javascript">
             function loadSubmit() {
var ProgressImage = document.getElementById('progress_image');
document.getElementById("progress").style.visibility = "visible";
setTimeout("ProgressImage.src = ProgressImage.src",100);
return true;
} </script>
	<link href="../css/style2.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    
</head>
<body>
       
<%
if(session.getAttribute("login")==null)
	{
		 %>
		 <jsp:forward	page="signin.jsp"><jsp:param name="err" value="You must login first or sign up to use our services." /></jsp:forward>
<%
}

 %><h2><a href="compose.jsp">Compose Mail</a></h2>
 <center><h2><font color=green> INBOX</font></h2></center>
<table border="0">
	<tbody>
		<tr bgcolor=teal>
			<th width="149">From</th>
			<th width="244">Subject</th>
			<th width="112">Time</th>
			<th width="189">Date</th>
			<th width="192">FromID</th>
		</tr>
	




<% 
						db.connect();
						ResultSet rs2=null;
						rs2=db.execSQL("select i.TOID,i.SUBJECT,i.MESSAGE,i.FROM,i.DATE,i.TIME,i.FROMNAME from SAKANSHA.MAIL as i where i.TOID="+session.getAttribute("id"));
						while(rs2.next())
						{%>
		
						

<tr>
	<td ><b><%=rs2.getString("FROMNAME")%></b></td>
	<td width="244"><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><%=rs2.getString("SUBJECT")%></a><div id="light" class="white_content1"><b><i>Subject :</i></b><%=rs2.getString("SUBJECT")%> <br /><b><i>Message :</i></b><%=rs2.getString("MESSAGE")%><br /><br /><br /><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><font color=red>CLOSE</font></a></div></td>
	<td width="112"><%=rs2.getString("TIME")%></td>
	<td width="189"><%=rs2.getString("DATE")%></td>
	<td width="192"><%=rs2.getString("FROM")%></td>


<%} %>
				
	</tr></tbody>
</table>				</div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; TGMC'12 TechJustice</p>
		<p class="right"><a href="inbox.jsp">Mail</a> | <a href="updateprofile.jsp">Update Profile</a> | <a href="pass.jsp">Update Password</a> | <a href="changepic.jsp">Update Profile Picture</a> </p>
	</div>	
</div>	
</body>
</html>
              	