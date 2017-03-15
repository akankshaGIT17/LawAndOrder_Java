
function citizensignup(str)

  { 
  
  document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td colspan='4'><strong>Citizen Signups</strong></td></tr><tr><td align='center' style='valign:top'><button onclick=\"citizensignup(1)\">New Signup Requests</button></td><td align='center'><button onclick=\"citizensignup(2)\">Approved Requests</button></td><td align='center'><button onclick=\"citizensignup(3)\">Rejected Requests</button></td><td align='center' style='valign:top'><button onclick=\"citizensignup(4)\">All Signups</button></td></tr><tr><td colspan='4'><hr /></td></tr></table>";
  
    alert("New"+str);

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return

  } 

  var url="citizensignup.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random();
  
  alert(url)

  xmlHttp.onreadystatechange=changed1 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText; 

  } 

  }
  
   

function CreateXmlHttpObject()

  { 

  var objXMLHttp=null

  if (window.XMLHttpRequest);

  {

  objXMLHttp=new XMLHttpRequest()

  }

  else if (window.ActiveXObject)

  {

  objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP");

  }

  return objXMLHttp;

  }
 function viewsignup(str,from)
 {
 	
 	showsignup(str,from);
 }
 function showsignup(str,from)

  { 
 
alert(from);
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null);

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="showsignup.jsp";

  url=url+"?q="+str;
  
  url=url+"&from="+from;

  url=url+"&sid="+Math.random();

  xmlHttp.onreadystatechange=changed1 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed1() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText; 

  } 

  } 
  function showreason(str)
  {
alert(str);
  	document.getElementById("buttons").innerHTML="<table width='100%'><tr><td valign='top'>Reason</td><td><textarea name='reason' ></textarea></td></tr><tr><td><button onclick=\"approve(2,"+str+",'reason')\">Submit</button></td><td><button onclick='showbuttons("+str+")'>Cancel</button></td></tr></table>";
  }
  function showbuttons(str)
  {
alert(str);  
  document.getElementById("buttons").innerHTML="<button onclick=\"approve(1,"+str+",'notapplicable')\">Approve</button><button onclick=\"javascript:showreason("+str+")\">Reject</button>";
  }
  
  
  function approve(app,user,an)

  { 
  //alert(app)
  //alert(user)
  var reason=null;
  if(app==2)
  {
  reason=document.RegistrationForm.reason.value;
  }
  else if(app=1)
  {
  reason='Not Applicable';
  }
document.getElementById("buttons").innerHTML="Loading";
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null);

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="approvecitizen.jsp";
  


  url=url+"?q="+app ;
 
  url=url+"&user="+user;

  url=url+"&reason="+reason
;
  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed2 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed2() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	//document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td align='center'><button>New</button></td><td align='center'><button>Approved</button></td><td align='center'><button>Rejected</button></td><td align='center'><button>All</button><br/><br/></td></tr></table>";
    document.getElementById("buttons").innerHTML=xmlHttp.responseText;

  } 

  }
  
  function detectivesignup(str)

  { 
  
  document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td colspan='5'>Detective Signups</td></tr><tr><td align='center'><button onclick=\"detectivesignup(1)\">New Signup Requests</button></td><td align='center'><button onclick=\"detectivesignup(2)\">Approved Requests</button></td><td align='center'><button onclick=\"detectivesignup(3)\">Rejected Requests</button></td><td align='center'><button onclick=\"detectivesignup(5)\">Pending Requests</button></td><td align='center'><button onclick=\"detectivesignup(4)\">All Signups</button></td></tr><tr><td colspan='5'><hr/></td></tr></table>";
    alert("New"+str);

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request")
;
  return;

  } 

  var url="detectivesignup.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random()
  ;
  alert(url);;

  xmlHttp.onreadystatechange=changed3;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed3() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText 
;
  } 

  }
  function viewdetectivesignup(str,from)
 {
 	
 	showdetectivesignup(str,from);
 }
 function showdetectivesignup(str,from)

  { 
 
alert(from);
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null);

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="showdetectivesignup.jsp";

  url=url+"?q="+str;
  
  url=url+"&from="+from;

  url=url+"&sid="+Math.random();

  xmlHttp.onreadystatechange=changed4 
;
  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed4() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  } 
 function showdetectivereason(str,from)
  {
alert(str);
alert(from);
  	document.getElementById("buttons").innerHTML="<table width='100%'><tr><td valign='top'>Reason</td><td><textarea name='reason' ></textarea></td></tr><tr><td><button onclick=\"approvedetective(2,"+str+",'reason')\">Submit</button></td><td><button onclick=\"showdetectivebuttons("+str+","+from+")\">Cancel</button></td></tr></table>";
  }
  function showdetectivebuttons(str,from)
  {
alert(str);
alert(from)  ;
	
	

  	document.getElementById("buttons").innerHTML="<button onclick=\"approvedetective(1,"+str+",'notapplicable')\">Approve</button><button onclick=\"approvedetective(3,"+str+",'notapplicable')\">Pending</button><button onclick=\"javascript:showdetectivereason("+str+","+from+")\">Reject</button>";
  	
  	
  	
  	
  } 
  
  function approvedetective(app,user,reason)

  { 
  //alert(app)
  //alert(user)
  var reason=null;
  if(app==2)
  {
  reason=document.RegistrationForm.reason.value;
  }
  else if(app==1)
  {
  reason='Not Applicable';
  }
   else if(app==5)
  {
  reason='Not Applicable for pending';
  }
document.getElementById("buttons").innerHTML="Loading";
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return
;
  } 

  var url="approvedetective.jsp";
  


  url=url+"?q="+app ;
 
  url=url+"&user="+user;

  url=url+"&reason="+reason;

  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed5 ;

  xmlHttp.open("GET",url,true)
;
  xmlHttp.send(null);

  }

function changed5() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	//document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td align='center'><button>New</button></td><td align='center'><button>Approved</button></td><td align='center'><button>Rejected</button></td><td align='center'><button>All</button><br/><br/></td></tr></table>";
    document.getElementById("buttons").innerHTML=xmlHttp.responseText;

  } 

  }
function complaints(str)

  { 
  
  document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td colspan='4'><strong>Complaints</strong></td></tr><tr><td align='center' style='valign:top'><button onclick=\"complaints(1)\">All Complaints</button></td><td align='center'><button onclick=\"complaints(2)\">Only Emergency Complaints</button></td><td align='center'><button onclick=\"complaints(3)\">Only Non Emergency Complaints</button></td></tr><tr><td colspan='4'><hr /></td></tr></table>";
  
    alert("New"+str);

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="complaints.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random();
  
  alert(url);

  xmlHttp.onreadystatechange=changed6;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed6() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  }  
  function viewcomplaint(str,from)
 {
 	
 	showcomplaint(str,from);
 }
 function showcomplaint(str,from)

  { 
 
alert(from);
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)
;
  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="showcomplaint.jsp";

  url=url+"?q="+str;
  
  url=url+"&from="+from;

  url=url+"&sid="+Math.random();

  xmlHttp.onreadystatechange=changed7;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed7() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText 
;
  } 

  } 
  function loadfir(id,complaint)
  {

  	document.getElementById("buttons").innerHTML="  	<table width='100%' cellspacing='5' cellpadding='5' class='back' style='text-align:left;vertical-align: top'>"
+"			<tr>"
+"					<td colspan='4' align='center'><h3 style='display:inline'>First Information Report</h3></td>"
+"					</tr>"
+"		<tr><td colspan='4' align='center'>( under section 154 Cr.P.C)</td></tr>	"
+"			"	
+"				<tr>"
+"					"
+"		<td>Date of Occurrence:<span class='style3'>*</span></td>"
+""
+"		<td><select name='year' onchange='listdate(document.RegistrationForm.month.value,this.value)'>"
+"				<option value='0'>year</option>"
+"				<option value='2008'>2008</option>"
+"				<option value='2009'>2009</option>"
+"				<option value='2010'>2010</option>"
+"				<option value='2011'>2011</option>"
+"				<option value='2012'>2012</option>"
+"				<option value='2013'>2013</option>"
+"				<option value='2014'>2014</option>"
+"				<option value='2015'>2015</option>"
+"				<option value='2016'>2016</option>"
+"				<option value='2017'>2017</option>"
+"				<option value='2018'>2018</option>"
+"				<option value='2019'>2019</option>"
+"				<option value='2020'>2020</option>	"						
+"			</select> <select name='month' onchange='listdate(this.value,document.RegistrationForm.year.value)'>"
+"				<option value='0'>mon</option>"
+"				<option value='01'>jan</option>"
+"				<option value='02'>feb</option>"
+"				<option value='03'>mar</option>"
+"				<option value='04'>apr</option>"
+"				<option value='05'>may</option>"
+"				<option value='06'>jun</option>"
+"				<option value='07'>jul</option>"
+"				<option value='08'>aug</option>"
+"				<option value='09'>sep</option>"
+"				<option value='10'>oct</option>"
+"				<option value='11'>nov</option>"
+"				<option value='12'>dec</option>"
+"			</select> <span id='dateselDIV'>"
+"					<select name='date'>"
+"					<option>dd</option>"
+"					</select> </span> "
+"		</td>"
+"		<td >Time of occurrence:<span class='style3'>*</span></td>"
+"					<td><input type='text' name='time_occurance' maxlength='5' title='Please enter the time of occurance'/></td>"
+"		</tr>"
+"			"
+"				<tr>"
+"					<td style='width: 120px'>Date of reporting: <span class='style3'>*</span></td>"
+"							<td><select name='year1' onchange='listdate1(document.RegistrationForm.month1.value,this.value)'>"
+"				<option value='0'>year</option>"
+"				<option value='2008'>2008</option>"
+"				<option value='2009'>2009</option>"
+"				<option value='2010'>2010</option>"
+"				<option value='2011'>2011</option>"
+"				<option value='2012'>2012</option>"
+"				<option value='2013'>2013</option>"
+"				<option value='2014'>2014</option>"
+"				<option value='2015'>2015</option>"
+"				<option value='2016'>2016</option>"
+"				<option value='2017'>2017</option>"
+"				<option value='2018'>2018</option>"
+"				<option value='2019'>2019</option>"
+"				<option value='2020'>2020</option>"							
+"			</select> <select name='month1' onchange='listdate1(this.value,document.RegistrationForm.year1.value)'>"
+"				<option value='0'>mon</option>"
+"				<option value='01'>jan</option>"
+"				<option value='02'>feb</option>"
+"				<option value='03'>mar</option>"
+"				<option value='04'>apr</option>"
+"				<option value='05'>may</option>"
+"				<option value='06'>jun</option>"
+"				<option value='07'>jul</option>"
+"				<option value='08'>aug</option>"
+"				<option value='09'>sep</option>"
+"				<option value='10'>oct</option>"
+"				<option value='11'>nov</option>"
+"				<option value='12'>dec</option>"
+"			</select> <span id='datesel1DIV'>"
+"					<select name='date1'>"
+"					<option>dd</option>"
+"					</select> </span> "
+"		</td>"
+"					<td>Time of reporting:<span class='style3'>*</span></td>"
+"					<td><input type='text' name='time_report' maxlength='5' /><!-- current time --></td>"
+"				</tr>"
+"	<tr>"
+"		<td style='text-align: top' valign='top'>Crime Sections<span class='style3'>*</span></td>"
+"		<td colspan='3'><textarea name='crime_sections' title='Please enter the crimesections' cols='46' rows='5' ></textarea> Example 420,302</td>"
+"	</tr>"
+"	<tr>"
+"		<td style='text-align: top' valign='top'>Place of occurrence details:<span class='style3'>*</span></td>"
+"		<td colspan='3'><textarea name='occu_place' title='Please enter the place of occurance' cols='46' rows='5' ></textarea></td>"
+"	</tr>"
+"	<tr>"
+"	<td valign='top'>Details of Complaint<span class='style3'>*</span></td>"
+"	<td colspan='3'><textarea name='particulars' title='Please enter the particulars of stolen property' cols='46' rows='5'></textarea></td>"
+"	</tr>"
+"	<tr>"
+"	<td>Total value of the properties stolen:<span class='style3'>*</span></td>"
+"	<td colspan='3'><input type='text' name='totalvalue' maxlength='10' title='Please enter the particulars of stolen property' /></td>"
+"	</tr>"

+"	<tr class='colour'>"
+"		<td colspan='4'><b>Complainant Information</b></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>Name: <span class='style3'>*</span></td>"
+"		<td><input type='text' name='name' maxlength='50'			title='Please enter the complainant's name'/></td>"
+"		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>"
+"		<td><input type='text' name='sdhname' maxlength='50' title='Please enter the complainant's name' /></td>"
+"	</tr>"


+"	<tr>"
+"		<td>Nationality:<span class='style3'>*</span></td>"
+"		 <td><input type='text' name='nationality' maxlength='30' />     "
+"	</td>"
+"	<td>Occupation:<span class='style3'>*</span></td>"
+"		<td>"
+"			<input type='text' name='occupation' maxlength='150'/>"
+"		</td>		 "
+"	</tr>"

+"	<tr class='colour'>"
+"		<td colspan='4'><b>Suspect Information (if known)</b></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>FirstSuspect <span class='style3'>*</span></td>"
+"		<td><input type='text' name='first' maxlength='50'	title='Please enter the complainant's name'/></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>SecondSuspect <span class='style3'></span></td>"
+"		<td><input type='text' name='second' maxlength='50'	title='Please enter the complainant's name'/></td>"
+"	</tr>"



+"	<tr>"
+"		<td>FIR Summary:<span class='style3'>*</span></td>"
+"		<td colspan='2'><textarea name='firsummary' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	"
+"	</tr>"
+"</table>"
+"<table width='97%' class='back' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>"
+"	<tr>"
+"		<td width='25%'>&nbsp;</td>"
+"		<td><div id='try' onclick=\"clickfir("+id+","+complaint+")\"><button >Add FIR</button></div></td>"
+"		<td></td>"
+"		<td width='25%'><button onclick='showfirbuttons()'>cancel</button></td>		"
+"	</tr>"
+"	</table>";
  }
  
  function showfirbuttons()
  {
document.getElementById("buttons").innerHTML="<button onclick=\"loadfir()\">Make an FIR</button><button onclick=\"loadpettycase()\">Make Petty case</button><button onclick=\"loadnon()\">Non Cognizable</button> </span>";
  }
    function loadpettycase()
  {
  	document.getElementById("buttons").innerHTML="<table width='100%' cellspacing='5' cellpadding='5' class='back' style='text-align:left;vertical-align: top'>"
+"  				<tr>"
+"					<td colspan='4' align='center'><h3 style='display: inline'>Petty Case</h3></td>"
					
+"				</tr>"
			
				
+"				<tr>"
					
+"		<td>Date of Arrest <span class='style3'>*</span></td>"

+"		<td><select name='year' onchange='listdate(document.RegistrationForm.month.value,this.value)'>"
+"				<option value='0'>year</option>"
+"				<option value='2008'>2008</option>"
+"				<option value='2009'>2009</option>"
+"				<option value='2010'>2010</option>"
+"				<option value='2011'>2011</option>"
+"				<option value='2012'>2012</option>"
+"				<option value='2013'>2013</option>"
+"				<option value='2014'>2014</option>"
+"				<option value='2015'>2015</option>"
+"				<option value='2016'>2016</option>"
+"				<option value='2017'>2017</option>"
+"				<option value='2018'>2018</option>"
+"				<option value='2019'>2019</option>"
+"				<option value='2020'>2020</option>"
				
				
+"			</select> <select name='month' onchange='listdate(this.value,document.RegistrationForm.year.value)'>"
+"				<option value='0'>mon</option>"
+"				<option value='01'>jan</option>"
+"				<option value='02'>feb</option>"
+"				<option value='03'>mar</option>"
+"				<option value='04'>apr</option>"
+"				<option value='05'>may</option>"
+"				<option value='06'>jun</option>"
+"				<option value='07'>jul</option>"
+"				<option value='08'>aug</option>"
+"				<option value='09'>sep</option>"
+"				<option value='10'>oct</option>"
+"				<option value='11'>nov</option>"
+"				<option value='12'>dec</option>"
+"			</select> <span id='dateselDIV'>"
+"					<select name='date'>"
+"					<option>dd</option>"
+"					</select> </span> "
+"		</td>"
+"		<td>Time of arrest:<span class='style3'>*</span></td>"
+"					<td><input type='text' name='time_arrest' maxlength='5' title='Please enter the time of occurance'/></td>"
+"		</tr>"
			
+"	<tr class='colour'>"
+"		<td colspan='4'><b>Complainant Information</b></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>Name: <span class='style3'>*</span></td>"
+"		<td><input type='text' name='name' maxlength='50'			title='Please enter the complainants name'/></td>"

+"		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>"
+"		<td><input type='text' name='sdhname' maxlength='50' title='Please enter the father/husband name' /></td>"
+"	</tr>"

+"	<tr>"
+"		<td>Reason For Arrest<span class='style3'>*</span></td>"
+"		<td colspan='2'><textarea name='reason' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	"
+"	</tr>"
	

+"</table>"
+"<table width='97%' class='back' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>"
+"	<tr>"
+"		<td width='25%'>&nbsp;</td>"
+"		<td><button onclick='submitpettycase()'>Submit</button></td>"
+"		<td><input type='reset' value='Reset'/></td>"
+"		<td width='25%'><button onclick='showfirbuttons()'>cancel</button></td>		"
+"	</tr>"
+"	</table>";
  	}
function loadnon()
  {
  	document.getElementById("buttons").innerHTML="<table width='100%' cellspacing='5' cellpadding='5' class='back' style='text-align:left;vertical-align: top'>"  
+"<tr>		<td colspan='2' valign='top'>Do you want to enter any additional details</td>"
+"		<td colspan='2'><textarea name='reason' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	"
+"	</tr>"
	

+"</table>"
  +"<table width='97%' class='back' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>"
+"	<tr>"
+"		<td width='25%'>&nbsp;</td>"
+"		<td><button onclick='submitnon()'>Submit</button></td>"
+"		<td><input type='reset' value='Reset'/></td>"
+"		<td width='25%'><button onclick='showfirbuttons()'>cancel</button></td>		"
+"	</tr>"
+"	</table>";
  }

function submitpettycase()
{
document.getElementById("buttons").innerHTML="pettycase";
}
}

  
