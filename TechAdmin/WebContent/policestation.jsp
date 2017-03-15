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

<script type="text/javascript" language="javascript">



	function checkform()
		{
		msg = validateField(document.RegistrationForm.psname,'STRING','5','35','Police Station Name','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.psname.focus();
					return false;
				}
		if(document.RegistrationForm.corz.selectedIndex<1)
				{
					alert("Select city or zone");
					document.RegistrationForm.corz.focus();
					return false;
				}
		if(document.RegistrationForm.list2.selectedIndex<1)
				{
					alert("Select Police Officers");
					document.RegistrationForm.list2.focus();
					return false;
				}
		if(document.RegistrationForm.list4.selectedIndex<1)
				{
					alert("Select Area to be controlled by this police station");
					document.RegistrationForm.list4.focus();
					return false;
				}
		
			return true;
		}
		

function city1()
{
city();
document.getElementById("sel3").innerHTML="";
}
function zone()
{
	//document.getElementById("sel3").innerHTML="";
document.getElementById("sel3").innerHTML="<span>Zone</span><span style='margin-left:35px;' id='zoneDIV'><select name='zone' style='width:175px'>	<option value='0'>Select</option><option value='1'>North</option><option value='2'>Central</option>	<option value='3'>Western</option><option value='4'>Southern</option>	</select></span>";
}

function loadofficer(str)

  { 
 

  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="loadofficer.jsp"

  url=url+"?qparam="+str

  url=url+"&sid="+Math.random()
//alert(url);
  xmlHttp.onreadystatechange=stateChangedofficer

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChangedofficer() 

  { 
   if (xmlHttp.readyState==2 )

  { 
  document.getElementById("oflist1").innerHTML="Loading";
  } 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 


  document.getElementById("oflist1").innerHTML=xmlHttp.responseText 



  } 

  } 

function CreateXmlHttpObject()

  { 

  var objXMLHttp=null

  if (window.XMLHttpRequest)

  {

  objXMLHttp=new XMLHttpRequest()

  }

  else if (window.ActiveXObject)

  {

  objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")

  }

  return objXMLHttp

  }
  function corz(str)
  {
 	 if(str==1)
	  {
	  city1();
	  
	  }
	 else
	 {
	 zone();
	 city();
	
	 }
	 return;
  }
 function loadarea(str)

  { 
 

  xmlHttp=CreateXmlHttpObject()

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")

  return

  } 

  var url="loadarea.jsp"

  url=url+"?q="+str

  url=url+"&sid="+Math.random()
//alert(url);
  xmlHttp.onreadystatechange=stateChangedofficer6

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)

  }

function stateChangedofficer6() 

  { 
  

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 


  document.getElementById("arlist3").innerHTML=xmlHttp.responseText 



  } 

  } 
</script>
<form name="RegistrationForm" action="addpscheck.jsp" method="post" onsubmit="return checkform()">

Add a police station
<table width="500px" cellpadding="5" cellpadding="5">
		<tr>
			<td>Station Name
			</td>
			<td><input name="psname" maxlength="35"  style="width:175px"/> 
			</td>
		</tr>
		<tr>
			<td><!-- Blank Line Added for visual appearance --></td>
		</tr>
		<tr>
			<td>Either Police station is in Zone or direct to City</td>
			<td >
				<select name='corz' >
					<option value='0'>Select</option>
					<option value='1' onclick="city1()">City</option>
					<option value='2' onclick="zone();city()">Zone</option>
				</select>
				
				
			</td>
		</tr>
		<tr >
			<td colspan="2">
				<span id="sel3"></span>
			</td>
		
		</tr>
		<tr >
			<td colspan="2"><span id="sel2"></span></td>
		</tr>
		<tr>
			<td colspan="2">Assign police officers to that station(city should be selected)<br/><br/></td>
		</tr>	
	</table>

		<table class="example" border=0>
			<tr>
 				<td>
  					<input type="hidden" name="movepattern1" size="8" value=""/>
 					<input name="movesort" type="hidden" value="true"/> 
  					<div id="oflist1">
   						 <select style="width: 150px"  name="list1" multiple size=10 ondblclick="Selectbox.moveSelectedOptions(this.form.list2,this.form.list1,this.form.movesort.checked,this.form.movepattern1.value)">
  
  						</select>
  					</div>
 				</td>
				 <td>
					  <input type="button" name="right" value="&gt;&gt;" onclick="Selectbox.moveSelectedOptions(this.form.list1,this.form.list2,this.form.movesort.checked,this.form.movepattern1.value)" /><br/><br/>
					  <input type="button" name="right" value="All &gt;&gt;" onclick="Selectbox.moveAllOptions(this.form.list1,this.form.list2,this.form.movesort.checked,this.form.movepattern1.value)"/><br/><br/>
					  <input type="button" name="left" value="&lt;&lt;"
					   onclick="Selectbox.moveSelectedOptions(this.form.list2,this.form.list1,this.form.movesort.checked,this.form.movepattern1.value)"/><br/><br/>
					  <input type="button" name="left" value="All &lt;&lt;"
					   onclick="Selectbox.moveAllOptions(this.form.list2,this.form.list1,this.form.movesort.checked,this.form.movepattern1.value)"/>
				</td>
 				<td>

  					<select style="width: 150px"  name="list2" multiple size=10 ondblclick="Selectbox.moveSelectedOptions(this.form.list2,this.form.list1,this.form.movesort.checked,this.form.movepattern1.value)">
  
  					</select>
 				</td>
			</tr>
			<tr><td colspan="3"><br/>Assign the areas that can be controlled by this police station</td></tr>
			<tr>
 				<td>
  				
  					<div id="arlist3">
   						 <select style="width: 150px"  name="list5" multiple size=10 ondblclick="Selectbox.moveSelectedOptions(this.form.list3,this.form.list4,this.form.movesort.checked,this.form.movepattern1.value)">
  					<option>option1</option>
  						</select>
  					</div>
 				</td>
				 <td>
					  <input type="button" name="right" value="&gt;&gt;" onclick="Selectbox.moveSelectedOptions(this.form.list3,this.form.list4,this.form.movesort.checked,this.form.movepattern1.value)" /><br/><br/>
					  <input type="button" name="right" value="All &gt;&gt;" onclick="Selectbox.moveAllOptions(this.form.list3,this.form.list4,this.form.movesort.checked,this.form.movepattern1.value)"/><br/><br/>
					  <input type="button" name="left" value="&lt;&lt;"
					   onclick="Selectbox.moveSelectedOptions(this.form.list4,this.form.list3,this.form.movesort.checked,this.form.movepattern1.value)"/><br/><br/>
					  <input type="button" name="left" value="All &lt;&lt;"
					   onclick="Selectbox.moveAllOptions(this.form.list4,this.form.list3,this.form.movesort.checked,this.form.movepattern1.value)"/>
				</td>
 				<td>

  					<select style="width: 150px"  name="list4" multiple size=10 ondblclick="Selectbox.moveSelectedOptions(this.form.list4,this.form.list3,this.form.movesort.checked,this.form.movepattern1.value)">
  
  					</select>
 				</td>
			</tr>
			<tr>
				<td><br/><br/></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		
	<table>

</table><a href="suc.jsp?err1=Police station created">
<input type="submit" value="Create"/></a>
			<script type="text/javascript">
			
			
			function all()
			{
			Selectbox.selectAllOptions(document.RegistrationForm.list2);
			}
			</script>
</form>
<jsp:include page='low.jsp' flush="false"></jsp:include>
</body>
</html>