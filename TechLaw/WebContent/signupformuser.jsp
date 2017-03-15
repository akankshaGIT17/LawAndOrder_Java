<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" import="java.sql.*"  %>
<%@ page import="java.util.*,java.io.*"%>

<%
 String locale = (String) session.getAttribute("locale");
 if (locale == null)
  locale = "en";
 Locale c = new Locale(locale, locale);
 ResourceBundle captions = ResourceBundle.getBundle("Locale", c);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sign Up | Techjustice</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<script type="text/javascript" src="techfiles/valids.js"></script>
<script type="text/javascript" src="techfiles/ajax.js"></script>

<link href="style.css" rel="stylesheet" type="text/css" />
 <link rel="stylesheet" type="text/css" href="css/lstyle.css" />
      <link rel="stylesheet" type="text/css" href="css/side.css" />
    
      
        <link rel="stylesheet" type="text/css" href="css/Master.css" />
<link rel="stylesheet" href="css/side.css" type="text/css" />
<script type="text/javascript" src="techfiles/ajax.js"></script>
<script type="text/javascript" src="css/script.js"></script>
</head>
<body>
<!-- Validation Script Start -->
<script type="text/javascript" language="javascript">
function checkform()
	{	
			var form=document.RegistrationForm;
			msg = validateField(document.RegistrationForm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.email.focus();
					return false;
				}
				var str1=document.RegistrationForm.password.value;
				if (str1.length==0)
			{ 
				alert("Please enter the password");
  				form.password.focus();
  				return false;
  			}
  			var str3=document.RestrationForm.proofno.value;
			if(str3.length==0)
			{
			alert("Please enter the proof");
			form.proofno.focus();
			return false;
			}
			var str4=document.RestrationForm.captcha.value;
			if(str4.length==0)
			{
			alert("Please enter the captcha");
			form.proofno.focus();
			return false;
			}
			
			if(str1.length<4)
			{
				alert("Password should be atleast four characters");
  				form.password.focus();
  				return false;
			}
			var str2=document.RegistrationForm.repassword.value;
				if (str2.length==0)
			{ 
				alert("Please Re-enter the password");
  				form.repassword.focus();
  				return false;
  			}
			if(str2!=str1)
			{
				alert("Password does not match with previously typed one");
  				form.repassword.focus();
  				return false;
			}			
			var msg = validateField(document.RegistrationForm.name,'NAME','1','50','Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.name.focus();
					return false;
				}
			var msg = validateField(document.RegistrationForm.fathername,'NAME','1','50','Father Name','\'"/\\@#^,&*~-$%!');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.fathername.focus();
					return false;
				}
				if(document.RegistrationForm.year.selectedIndex<1)
				{
					alert("Select your Year of Birth");
					document.RegistrationForm.year.focus();
					return false;
				}
				if(document.RegistrationForm.month.selectedIndex<1)
				{
					alert("Select your Month of Birth");
					document.RegistrationForm.month.focus();
					return false;
				}
				if(document.RegistrationForm.date.selectedIndex<1)
				{
					alert("Select your Date of Birth");
					document.RegistrationForm.date.focus();
					return false;
				}
				if(document.RegistrationForm.profession.selectedIndex<1)
				{
					alert("Select your Occupation");
					document.RegistrationForm.profession.focus();
					return false;
				}
				msg = validateField(document.RegistrationForm.addressLine1,'STRING','5','200','Address Line-1','');
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.addressLine1.focus();
					return false;
				}
				var msg = validatePincode(document.RegistrationForm.pincode,'Pincode',true,6);
				if(msg.length > 0)			
				{
					alert(msg);	
					document.RegistrationForm.pincode.focus();
					return false;
				}
				if(document.RegistrationForm.area.selectedIndex<1)
				{
					alert("Select your area");
					document.RegistrationForm.area.focus();
					return false;
				}
				if(document.RegistrationForm.bg.selectedIndex<1)
				{
					alert("Select your Blood Group");
					document.RegistrationForm.bg.focus();
					return false;
				}
				if(document.RegistrationForm.proof.selectedIndex<1)
				{
					alert("Select your Proof");
					document.RegistrationForm.proof.focus();
					return false;
				}		
		return true;
	}	
</script>
<!--Script ends-->

<script type="text/javascript" language="javascript">

	</script>
<!-- Validation Script End -->
<!--  
<div id="langholder" align="left" style="top:15px;">
Languages:
<a href="Locale.jsp? lang=en">English</a> |
<a href="Locale.jsp? lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp? lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
</div>-->
<div id="templatemo_header_wrapper">
    <div id="templatemo_header">
        <div id="site_title_section">
            <div id="site_title"><a href="index.jsp" >
            


	          <%=captions.getString("title")%>
            </a></div>
            <div id="salogon">
	            <b><font color="blue" size="+1">&#2360;&#2375;&#2357;&#2366;&#45;&#2360;&#2369;&#2352;&#2325;&#2381;&#2358;&#2366;&#45;&#2360;&#2361;&#2381;&#2351;&#2379;&#2327;</font></b></div>
            <div class="cleaner">&nbsp;</div>
        </div>
        
        <div id="search_section">
             <div id="langholder" style="top:15px;"><font color="white" size=4>
Languages:
<a href="Locale.jsp?lang=en">English</a> |
<a href="Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> </font>
</div>
        </div>    
    </div> <!-- end of header -->
</div>  <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
    <div id="templatemo_banner">
    
        <div id="banner_header_01" align="left"><%=captions.getString("msg1")%></div>
        <div id="banner_header_02"></div>
        <div id="banner_text">
            <p><%=captions.getString("msg")%></p>
            <div class="rc_btn_01"><a href="aboutus.jsp"><%=captions.getString("cr")%>...</a></div>
        </div>
    </div>	<!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_menu_wrapper">    
    <div id="templatemo_menu">
        <ul>
             <li><a href="index.jsp" class="current"><span></span><%=captions.getString("home")%></a></li>
            <li><a href="ourservices.jsp"><span></span><%=captions.getString("services")%></a></li>
            <li><a href="aboutus.jsp" target="_parent"><span></span><%=captions.getString("aboutus")%></a></li>
            <li><a href="homedetective.jsp"><span></span><%=captions.getString("tipsforcitizens")%></a></li>
            <li><a href="homelaw.jsp"><span></span><%=captions.getString("lawacts")%></a></li>
            <li><a href="usersignin.jsp"><span></span><%=captions.getString("login")%></a></li>
            
            <li><a href="contact.jsp"><span></span><%=captions.getString("contact")%></a></li>
        </ul>    	
    </div> <!-- end of menu -->
    
<br /><br /> 
<table width='100%' border="0">
<tr>
	<td width='25%' valign='top'>
	
<h2 align="center"><%=captions.getString("signup")%></h2>
<div id="container">
<form name="RegistrationForm" method="post" action="usersignupcheck.jsp"  enctype="multipart/form-data" onsubmit="return checkform()">
<table width='100%' border="0">
<tr>
	<td valign='top' width="2%">
	

		
</td>
<!-- Left column end -->

<!--content column start -->
<td valign="top" width="98%">
<table width='100%' border="1" >
	<tr>
		<td >
		
			<table width='90%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
				<tr>
					<td colspan="2" class='colour' style='text-align:center'></td>
					
				</tr>
				<tr>
					<td colspan="2"align="center"><h2><%
	 out.print(captions.getString("logininfo"));  %></h2></td>
					
				</tr>
				
				<tr>
					<td style="width: 120px" width="326"><%
	 out.print(captions.getString("username"));  %></td>
					<td width="838"><input type='text' name='email' maxlength='35' onblur="validateusername(this.value)"/><%
	 out.print(captions.getString("egmail"));  %></td>
				</tr>
				<tr>
					<td width="326"></td>
					<td width="838"><span><%
	 out.print(captions.getString("idinfo"));  %></span> </td>
				</tr>
				<tr>
				<td width="326"></td>
					<td colspan='2'><span id="usernameDIV"><input type='button' value='Check id' onclick='validateusername(document.RegistrationForm.email.value)'/></span></td>
				</tr>
				<tr>
					<td width="326"></td>
				</tr>
				<tr>
					<td width="326"><%
	 out.print(captions.getString("pass"));  %></td>
					<td width="838"><input type='password' name='password' maxlength='14'/><span class='style3'> </span></td>
				</tr>
				<tr>
					<td width="326"><%
	 out.print(captions.getString("repass"));  %></td>
					<td width="838"><input type='password' name='repassword' maxlength='14' /></td>
				</tr>
				<tr>
					<td width="326"></td>
					<td width="838"><%
	 out.print(captions.getString("repass1"));  %></td>
				</tr>
				
</table>
<table width='90%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
<tr class="colour">
		<td colspan="4" align="center"><h2><b><%
	 out.print(captions.getString("per"));  %></b></h2></td>
	</tr>

	<tr>
		<td width="332"><%
	 out.print(captions.getString("name"));  %> :<span class='style3'><font
									color="red">*</font></span></td>
		<td width="203"><input name="fname" id="fname" type="text" maxlength="30"	title="Your First name"/></td>
		<td width="248"><%
	 out.print(captions.getString("fname"));  %> :<span class='style3'><font
									color="red">*</font></span></td>
		<td width="268"><input name="fathername" id="fathername" type="text" maxlength="30"			title="Your last name"/></td>
	</tr>

	<tr>
		<td width="332"><%
	 out.print(captions.getString("dob"));  %>:<span class='style3'><font
									color="red">*</font></span></td>

		<td width="203"><select name="year" onchange="listdate(document.RegistrationForm.month.value,this.value)">
				<option value="0"><%
	 out.print(captions.getString("yr"));  %></option>
				
				<option value="1990">1990</option>
				<option value="1989">1989</option>
				<option value="1988">1988</option>
				<option value="1987">1987</option>
				<option value="1986">1986</option>
				<option value="1985">1985</option>
				<option value="1984">1984</option>
				<option value="1983">1983</option>
				<option value="1982">1982</option>
				<option value="1981">1981</option>
				<option value="1980">1980</option>
				<option value="1979">1979</option>
				<option value="1978">1978</option>
				<option value="1977">1977</option>
				<option value="1976">1976</option>
				<option value="1975">1975</option>
				<option value="1974">1974</option>
				<option value="1973">1973</option>
				<option value="1972">1972</option>
				<option value="1971">1971</option>
				<option value="1970">1970</option>
				<option value="1969">1969</option>
				<option value="1968">1968</option>
				<option value="1967">1967</option>
				<option value="1966">1966</option>
				<option value="1965">1965</option>
				<option value="1964">1964</option>
				<option value="1963">1963</option>
				<option value="1962">1962</option>
				<option value="1961">1961</option>
				<option value="1960">1960</option>
				<option value="1959">1959</option>
				<option value="1958">1958</option>
				<option value="1957">1957</option>
				<option value="1956">1956</option>
				<option value="1955">1955</option>
				<option value="1954">1954</option>
				<option value="1953">1953</option>
				<option value="1952">1952</option>
				<option value="1951">1951</option>
				<option value="1950">1950</option>
				<option value="1949">1949</option>
				<option value="1948">1948</option>
				<option value="1947">1947</option>
				<option value="1946">1946</option>
				<option value="1945">1945</option>
				<option value="1944">1944</option>
				<option value="1943">1943</option>
				<option value="1942">1942</option>
				<option value="1941">1941</option>
				<option value="1940">1940</option>
				<option value="1939">1939</option>
				<option value="1938">1938</option>
				<option value="1937">1937</option>
				<option value="1936">1936</option>
				<option value="1935">1935</option>
				<option value="1934">1934</option>
				<option value="1933">1933</option>
				<option value="1932">1932</option>
				<option value="1931">1931</option>
				<option value="1930">1930</option>
				<option value="1929">1929</option>
				<option value="1928">1928</option>
				<option value="1927">1927</option>
				<option value="1926">1926</option>
				<option value="1925">1925</option>
				<option value="1924">1924</option>
				<option value="1923">1923</option>
				<option value="1922">1922</option>
				<option value="1921">1921</option>
				<option value="1920">1920</option>
				<option value="1919">1919</option>
				<option value="1918">1918</option>
				<option value="1917">1917</option>
				<option value="1916">1916</option>
				<option value="1915">1915</option>
				<option value="1914">1914</option>
				<option value="1913">1913</option>
				<option value="1912">1912</option>
				<option value="1911">1911</option>
				<option value="1910">1910</option>
				<option value="1909">1909</option>
				<option value="1908">1908</option>
				<option value="1907">1907</option>
				<option value="1906">1906</option>
				<option value="1905">1905</option>
				<option value="1904">1904</option>
				<option value="1903">1903</option>
				<option value="1902">1902</option>
				<option value="1901">1901</option>
				<option value="1900">1900</option>
			</select> <select name="month" onchange="listdate(this.value,document.RegistrationForm.year.value)">
				<option value="0"><%
	 out.print(captions.getString("month"));  %></option>
				<option value="01">January</option>
				<option value="02">February</option>
				<option value="03">March</option>
				<option value="04">April</option>
				<option value="05">May</option>
				<option value="06">June</option>
				<option value="07">July</option>
				<option value="08">August</option>
				<option value="09">September</option>
				<option value="10">October</option>
				<option value="11">November</option>
				<option value="12">December</option>
			</select><span id="dateselDIV">
					<select name="date">
					<option>dd</option>
					</select> </span>
		</td>
		<td width="248"><%
	 out.print(captions.getString("ocu"));  %><span class='style3'><font
									color="red">*</font></span></td>
		<td width="268"><select name="profession" style="width: 147px">
			<option value="00" selected="selected">--Select--</option>
			<option value='01'>Nil</option>
	<option value="02"><%
	 out.print(captions.getString("student"));  %></option>
	<option value="03"><%
	 out.print(captions.getString("software"));  %></option>
	<option value="04"><%
	 out.print(captions.getString("hardware"));  %></option>
	<option value="05"><%
	 out.print(captions.getString("industrialist"));  %></option>
	<option value="06"><%
	 out.print(captions.getString("government"));  %></option>
	<option value="07"><%
	 out.print(captions.getString("scholar"));  %></option>
	<option value="08"><%
	 out.print(captions.getString("professor"));  %></option>
	<option value="09"><%
	 out.print(captions.getString("teacher"));  %></option>
	<option value="10"><%
	 out.print(captions.getString("private"));  %></option>
	<option value="11"><%
	 out.print(captions.getString("doctor"));  %></option>
	<option value="12"><%
	 out.print(captions.getString("engineer"));  %></option>
	<option value="13"><%
	 out.print(captions.getString("lawyer"));  %></option>
	<option value="14"><%
	 out.print(captions.getString("business"));  %></option>
	<option value="15"><%
	 out.print(captions.getString("nurse"));  %></option>
	<option value="16"><%
	 out.print(captions.getString("artist"));  %></option>
	<option value="17"><%
	 out.print(captions.getString("farmer"));  %></option>
	
	<option value="19"><%
	 out.print(captions.getString("labour"));  %></option>
	<option value="20"><%
	 out.print(captions.getString("housewife"));  %></option>
		</select></td>

	</tr>
	<tr>
		<td width="332"><%
	 out.print(captions.getString("sex"));  %><span class='style3'><font
									color="red">*</font></span></td>
		<td width="203"><input type="radio" name="gender" value="1" checked="checked"/>	<%
	 out.print(captions.getString("male"));  %> <input type="radio" name="gender" value="2"/><%
	 out.print(captions.getString("female"));  %></td>

		<td width="248"><%
	 out.print(captions.getString("marry"));  %>:<span class='style3'><font
									color="red">*</font></span></td>
		<td width="268"><input type="radio" name="maritalstatus" value="2"/><%
	 out.print(captions.getString("mar"));  %>
		<input type="radio" name="maritalstatus" value="1" checked=checked/>		<%
	 out.print(captions.getString("single"));  %></td>

	</tr>
	<tr>
		<td width="332"><%
	 out.print(captions.getString("contact"));  %></td>
		<td width="203"><input type="text" name="stdcode" maxlength="6"	style="width: 60px" value="91"/> <input type="text" name="phoneno"
			maxlength="8" style="width: 85px"
			title="Enter phone no as mentioned below"/></td>
		<td width="248"><%
	 out.print(captions.getString("mobilenumber"));  %>:</td>
		<td width="268"><input type="text" name="countrycode" readonly="readonly" maxlength="2"
			style="width: 22px" value="91"/> <input type="text" name="mobileno"
			maxlength="10" style="width: 120px"
			title="Enter Mobile no as mentioned below"/></td>
	</tr>

	<tr>
		<td width="332"></td>
		<td width="203">0124-1223123</td>
		<td width="248"></td>
		<td width="268">91-989888232</td>
	</tr>
	
</table>
<table width='90%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
	<tr class="colour">
		<td colspan="4" align="center"><h2><b><%
	 out.print(captions.getString("addinfo"));  %></b></h2></td>
	</tr>
	<tr>
		<td style="width: 120px" width="323"><%
	 out.print(captions.getString("add"));  %>: <span class='style3'><font
									color="red">*</font></span></td>
		<td width="359"><input type="text" name="addressLine1" maxlength="200"			title="Enter your plot no and street address"/></td>
	</tr>
	<tr>
		<td width="323"></td>
		<td width="359"><input type="text" name="addressLine2" maxlength="200"
			title="Location"/></td>
	</tr>
	<tr>
		<td width="323"><%
	 out.print(captions.getString("pincode"));  %>:<span class='style3'><font
									color="red">*</font></span></td>
		 <td width="359"><input type="text" name=pincode maxlength="6" onblur="loadarea(this.value)" /> 
      
	</td>
		 <td><%
	 out.print(captions.getString("area"));  %> :<font color="red">
								<span class="style3">*</span></font></td>
		 <td>
	<span id='arealistDIV'><select name="area"><option value="1"><%
	 out.print(captions.getString("pincode"));  %></option></select></span>
	</td>
	</tr>
	<tr>
		
		<td width="323"><%
	 out.print(captions.getString("state"));  %>:<span class='style3'><font color="red">*</font></span></td>
		<td width="359"><input value='Haryana' readonly="readonly"/>
		</td>
		<td style="height: 26px"><%
	 out.print(captions.getString("blood"));  %></td>
		<td style="height: 26px"><select  name="bg"
			 >
			 <option value='0'>Select</option>
			 <option value='1'>AB + Ve</option>
			 <option value='2'>AB - Ve</option>
			 <option value='3'>A + Ve</option>
			 <option value='4'>A - Ve</option>
			 <option value='5'>B + Ve</option>
			 <option value='6'>B - Ve</option>
			 <option value='7'>O + Ve</option>
			 <option value='8'>O - Ve</option>
			 </select></td>
	</tr>

	
	

</table>
<table width='90%' cellspacing='5' cellpadding="5" class='back' style='text-align:left;vertical-align: top'>
	<tr>
		<td colspan="2" align="center"><strong><%
	 out.print(captions.getString("idproof"));  %></strong></td>
	</tr>
	<tr>
		<td width="334"><%
	 out.print(captions.getString("selectone"));  %> <span class='style3'><font color="red">*</font></span></td>
		<td width="747">
			<select name='proof' onchange="load(this.value)">
				<option value='0'>--Select--</option>
				<optgroup label="Only Number">
				<option value='1'>Rationcard</option>
				<option value='2'>Driving License</option>
				<option value='3'>Voter Id Card</option>
				<option value='4'>Passport</option>
				</optgroup>
				<optgroup label="Attachment is required">
					<option value='5'>Other</option>
				</optgroup>
			</select>
			<script type='text/javascript'>
		function load(str)
		{
		if(str==1)
			{
			document.getElementById("leftDIV").innerHTML="Ration Card Number <span class='style3'>*</span>";
			document.getElementById("rightDIV").innerHTML="<input type='text' maxlength='25' name='proofno' /> Example : 24/W/0061813";
			}
		if(str==2)
			{
			document.getElementById("leftDIV").innerHTML="Driving License Number <span class='style3'>*</span>";
			document.getElementById("rightDIV").innerHTML="<input type='text' maxlength='25' name='proofno' /> Example : HR5920080013369";
			}
		if(str==3)
			{
			document.getElementById("leftDIV").innerHTML="Voter-Id Number <span class='style3'>*</span>";
			document.getElementById("rightDIV").innerHTML="<input type='text' maxlength='25' name='proofno' /> Example : HR/24/144/0168383";
			}
		if(str==4)
			{
			document.getElementById("leftDIV").innerHTML="Passport Number <span class='style3'>*</span>";
			document.getElementById("rightDIV").innerHTML="<input type='text' maxlength='25' name='proofno' /> Example : H0533176";
			}
		if(str==5)
			{
			document.getElementById("leftDIV").innerHTML="Equivalent proof <span class='style3'>*</span>";
			document.getElementById("rightDIV").innerHTML="<input type='file' name='proofno' />";
			document.getElementById("rightDIV").innerHTML+="<br/><br/>Equivalent proof may be Bank Pass Book, college Identity Card, etc <span class='style3'>where Applicant Photo,Name,Date of Birth is Provided.</span>";
			}
			
		}
		</script>
		</td>
		
	</tr>
	<tr>
		<td valign="top" width="334">
			<span id="leftDIV"></span>
		</td>
		<td width="747">
			<span id="rightDIV"></span>
		</td>
	</tr>
	<tr>
		<td width="334"><img id="image" src="captcha.jsp"/><br/><a href="#" onclick="document.getElementById('image').src = 'captcha.jsp?sid=' + Math.random(); return false">Reload image</a></td>
		<td width="747"><input type='text' maxlength="5" name='captcha'/> <span class="style3"></span></td>
	</tr>
	
	
</table>
<table width='97%' class="back" cellspacing='5' cellpadding="5"  style='text-align:center;vertical-align: top'>
	<tr>
		<td width="25%">&nbsp;</td>
		<td><input id="submit" type="submit" value="Submit"/></td>
		<td><input type="reset" value="Reset"/></td>
		<td width="25%">&nbsp;</td>
		
	</tr>
	</table>
</td>


</tr>

</table>
</td></tr></table>
</form>

<div class="cleaner">&nbsp;</div>
<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="http://www.templatemo.com" target="_parent">
        Contact Us</a> | <a href="http://www.templatemo.com" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
		</div></td></tr></table></div>	
			</body>
			</html>