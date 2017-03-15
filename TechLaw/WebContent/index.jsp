
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" import="java.sql.*"  %>
<%@ page import="java.util.*,java.io.*"%>
<%
 String locale = (String) session.getAttribute("locale");
 if (locale == null)
  locale ="en";
  
 Locale c = new Locale(locale, locale);
 ResourceBundle captions = ResourceBundle.getBundle("Locale", c);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=captions.getString("title")%> | Techjustice</title>
<script type='text/javascript' src='validations/js/jquery.js'></script>
<script type='text/javascript' src='validations/js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='validations/js/basic.js'></script>
<meta name="keywords" content="Creating a crime free INDIA!" />
<meta name="description" content="Creating a crime free INDIA!" />
<script type="text/javascript" src="techfiles/ajax.js"></script>
<link type='text/css' href='validations/css/demo.css' rel='stylesheet' media='screen' />
<link type='text/css' href='validations/css/basic.css' rel='stylesheet' media='screen' />
<script type="text/javascript" src="techfiles/lightbox.js"></script>
<link type='text/css' href='jquery/popup.css' rel='stylesheet' media='screen' />
<jsp:include page='jquery/popup.jsp' flush="false"></jsp:include>
<link type='text/css' href='validations/css/basic_ie.css' rel='stylesheet' media='screen' />
<link href="style.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="db" class="database.dncon" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</head>
<style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 0%;
            height: 0%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 60%;
            height: 400%;
            padding: 16px;
            border: 16px solid orange;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
<body><!-- 
<div id="langholder" style="top:15px;">
Languages:
<a href="Locale.jsp?lang=en">English</a> |
<a href="Locale.jsp?lang=te">&#3103;&#3142;&#3122;&#3137;&#3095;&#3137;</a> |
<a href="Locale.jsp?lang=hi">&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;</a> 
</div> -->
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
    
        <div id="banner_header_01"><%=captions.getString("msg1")%></div>
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
</div> <!-- end of menu wrapper -->
<marquee><font style="color:#FF0000; font-size:12px;"><%=captions.getString("news2")%>..........|| &nbsp;<%=captions.getString("news2")%>..........||&nbsp;<%=captions.getString("news2")%>..........||&nbsp;<%=captions.getString("news2")%>..........||&nbsp;<%=captions.getString("news2")%>..........||</font></marquee>
<div id="templatemo_content_wrapper">
<div id="templatemo_content">

    <div id="content_left">
        <div class="content_left_section">
            <div class="content_header_01"><%=captions.getString("wanted")%></div>
            <div class="news_section"><%  try{
						db.connect();
						ResultSet rs=null;
						rs=db.execSQL("select i.id,i.wanted,i.file,t.name1,t.last,t.height,t.weight,t.alias,t.birth,t.sdhname,t.color,t.haircolor from sakansha.criminal as i,xmltable('$c/criminal' passing i.details as \"c\" columns name1 varchar(100) path 'name1',last varchar(200) path 'last',height varchar(10) path 'height',weight varchar(15) path 'weight',alias varchar(100) path 'alias',birth varchar(100) path 'birth',sdhname varchar(50) path 'sdhname',color varchar(50) path 'color',haircolor varchar(50) path 'haircolor') as t where i.wanted='2'");
							
						while(rs.next())
						{
						%>
                <div class="news_date">
                <img src="http://localhost:9081/TechPolice/upload/criminal/<%=rs.getString("file") %>" width="185" height="272" width="220" /></div>
                <div class="news_title"><%=captions.getString("wname")%> :<font color="black"><%=rs.getString("name1") %></font>
                <br /><%=captions.getString("whieght")%> :<font color="black"> <%=rs.getString("height") %></font><br /><%=captions.getString("wseen")%> <font
	color="black"><%=rs.getString("last") %></font><br />
	<%=captions.getString("weight1")%> <font	color="black"><%=rs.getString("weight") %> kg</font>
</div>
                <p><%=captions.getString("winfo")%> : <a href="frontpages/mostwanted.jsp"></a></p>
<p><a href='frontpages/most1.jsp?id=<%=rs.getString("id") %>'

><font color="red"><%=captions.getString("report")%></font></a></p>
</div><%
									
							}
							}
							catch(Exception e)
							{
							out.println("Error"+e.getMessage());
							}
							 %>
							 <div class="margin_bottom_20"></div>
           
        <div class="cleaner"></div>
        
            <div class="margin_bottom_30"></div>
        
            <div class="news_section" id="signup">
                <div class="news_date"><font size="+1"></font><a href="signupformuser.jsp"><img border="0" src="images/signup.gif"  /></a><br /></div>
                <div class="news_title"></div></div>
<div class="margin_bottom_20"></div>
           
        <div class="cleaner"></div>
        
            <div class="margin_bottom_30"></div>
        
            <div class="news_section" id="lll">
                <div class="news_date"><font size="+1"><%=captions.getString("nps1")%></font><br /></div>
                <div class="news_title"><br />
                <%
			db.connect();
			ResultSet rs1=null;
			rs1=db.execSQL("select * from SAKANSHA.DISTRICT");
			
			%>
<%=captions.getString("npsdis")%> <select  onchange='loadareas2(this.value)' name='district'>
			<option value="0">select</option>
	<%
			while(rs1.next())
			{
				%><option  value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%> </option><%
			}
			db.close();
			 %>
</select><br />
<br />
<%=captions.getString("po")%>:<div id="areaDIV"><select name='area'><option id=1>--Select--</option></select></div> 
	
<br />
<br />

</div>
                <p></p>
<p><%=captions.getString("npsline1")%><a href="#"><font
	color="red"></font></a></p>
</div>
        
            <div class="margin_bottom_20"></div>
            
        <div class="cleaner"></div>
        
        </div>   <!-- end of news section -->
        
        <div class="margin_bottom_20 border_bottom"></div><div class="margin_bottom_20"></div>
        
        <div class="content_left_section">
            <a href="http://validator.w3.org/check?uri=referer"></a>
            <a href="http://jigsaw.w3.org/css-validator/check/referer"></a>
        <img border="0" src="images/100.gif" width="120" height="61" /></div>
    
        <div class="cleaner_h30">&nbsp;</div>
    </div> <!-- end of content left -->

    <div id="content_right">
    
        <div class="content_right_280_section margin_right_60">
            <div class="content_header_01"><%=captions.getString("wecops")%></div>
            <div class="image_wrapper"><img border="0"
	src="images/india.jpg" width="263" height="174" /></div>
            <p><font><font color="black" size="2"><%=captions.getString("msg2")%></font><font color="#990000">.</font></font><a href="aboutus.jsp"><%=captions.getString("readmore")%>...</a></p>
  <br /><br />
  
       <div class="content_header_01"><%=captions.getString("beniftsofecops")%></div>
       <p><font size=2><%=captions.getString("benifitsofecops1")%> <br />
       <font color=red> <%=captions.getString("benifitsofecops2")%></font></font></p>
       <ul><li><img border="0" src="images/comp.jpg"
	width="32"height="32" /><%=captions.getString("complaint")%></li>
       <li><img src="images/Gun_Icon_Small.jpg" width="32"
		height="32" /><a href="#" class="popup-link-1"><b><%=captions.getString("benifitsofecopli")%>.</b></a></li>
       <div class="popup-box" id="popup-box-1"><div class="close">X</div><div class="top"><h2><img
		src="images/Gun_Icon_Small.jpg" width="29" height="29" /><%=captions.getString("benifitsofecopli1")%>.</h2></div><div class="bottom"><ul><li><%=captions.getString("benifitsofecopli2")%></li><li><%=captions.getString("benifitsofecopli3")%></li><li><%=captions.getString("benifitsofecopli4")%></li><li><%=captions.getString("benifitsofecopli5")%></li></ul></div></div>
<div id="blackout"></div>
      
       <li><img border="0" src="images/finkertons_missing_person_posters.png"
	width="32"height="32" /><%=captions.getString("benifitsofecopmp")%></li>
        <li><img border="0" src="images/lost_found.jpg"
	width="32"height="32" /><%=captions.getString("benifitsofecopmv")%></li>
       </ul>
      
      </div>
    
        <div class="content_right_280_section" id="polls">
            <div class="content_header_01"><%=captions.getString("poll")%></div>     
            <script language="JavaScript" ></script>
<script type="text/javascript" language=javascript></script>
            
           <table width="100%" id="poll" cellpadding="5%" cellpadding="5%">
            <tr>
								<td style="width: 33%" valign="top">
<% 
try
	{	

		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con = DriverManager.getConnection("jdbc:db2:LAW");
		
		ResultSet rs=null;
		PreparedStatement ps=null;
		String[] ans=request.getParameterValues("ANSWER");
		
		int q=0;
		

		String responseText=new String("");
		String query;
		query=("select * from SAKANSHA.POLLS where CHECK=1") ;
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		while(rs.next())
	{
	%>
	<table border='0' cellpadding="5%" cellpadding="5%"style="width: 100%" width="100%">
	<tr>
	<td><strong><u></u></strong></td>
	</tr>
	<!-- Question start -->
	<tr>
<tr>
<td><strong><font size="2"><%=rs.getString("QUESTION") %></font></strong></td>
</tr>
<!-- Question end -->
							<!-- Answer start -->
							<tr>
								<td style="text-align: left;"><font size="2"><input type='radio'
									onclick="answerpoll(1)" name='poll1' /><%=rs.getString("option1") 
									%></font></td>
							</tr>
							<tr>
								<td style="text-align: left;"><font size="2"><input type='radio'
								
									onclick="answerpoll(2)" name='poll1' /><%=rs.getString("option2") %></font></td>
							</tr>
<tr></tr>

						</table>
						<%}con.close(); }
catch(Exception e)
	{
	//	out.println("Error"+e.getMessage());

	}
	
%><a href=answerpoll.jsp></a>
		</td></tr></table>		
<br />
<br />
<div class="cleaner"></div>

<img border="0" src="images/line.png" width="280" height="1" /></div>    <br />
<div class="content_right_280_section"> <br /><div class="content_header_01"><%=captions.getString("emergencycomplaint")%></div> 
            <div class="content_header_01"><center>
<img border="0" src="images/Siren.gif" width="108" height="99" /></center><br /><center><font size=3>
<a href="ecomplaint.jsp"><%=captions.getString("emergencycomplaint")%></a></font></center>
</div>   
		
<div class="cleaner"></div>

<img border="0" src="images/line.png" width="280" height="0" /></div>    <br />
<div class="content_right_280_section">
           
           
            
            <div class="cleaner"></div>
    
            <div class="rc_btn_02"></div>   
    
            <div class="cleaner"><img border="0" src="images/line.png" width="280" height="1" /></div>    <br />     
        </div>    
        <div class="content_right_280_section">
            <div class="content_header_01"><br />
<%=captions.getString("emerg11")%></div>     
            <p align="left"  ><b><%=captions.getString("po")%></b> 			- 100 	  <br /><br />
<b><%=captions.getString("tp")%></b>- 103 	 <br /><br />
<b><%=captions.getString("p1")%></b> 	- 108 	 <br /><br />
<b><%=captions.getString("fc")%></b>- 101 	 <br /><br />
<b><%=captions.getString("ambu")%></b>- 102 	  <br /><br />
<b><%=captions.getString("cl")%></b>- 1098 	  <br /><br />
<b><%=captions.getString("whl")%></b> 	 	- 1091</p>
            
            <div class="cleaner"></div>
    
           
    
            <div class="cleaner"></div>       
        </div>    
    
        <div class="margin_bottom_40 border_bottom"></div>
        <div class="margin_bottom_40"></div>
    
        <div class="content_right_section">
            <div class="content_header_02"><%=captions.getString("gallery")%></div>
            
            <div class="content_right_w620_wrapper">
                <div class="content_right_w620_inner">
                   <marquee direction="left"  onmouseover="this.setAttribute('scrollamount', 0, 0);" onmouseout="this.setAttribute('scrollamount', 6, 0);" > <div class="box_w170 margin_right_25">
                        <div class="image_wrapper">   <a href="gallery/gal (2).jpg" rel="lightbox" title="Image 1"><img src="gallery/gal (2).jpg" width="160" height="101"></img></a>
                        </div>
                        
                    </div>
        
                    <div class="box_w170 margin_right_25">
                        <div class="image_wrapper"><a href="gallery/gal (1).jpg" rel="lightbox" title="Image 2"><img src="gallery/gal (1).jpg" width="160" height="101"></img></a></div>
                       
                    </div>
                    
                    
    
                    <div class="box_w170">
                        <div class="image_wrapper"><a href="gallery/gal (3).jpg" rel="lightbox" title="Image 3"><img src="gallery/gal (3).jpg" width="160" height="101"></img></a></div>
                    <div id='container'>   <div id='basic-modal'>
                    </div></div></div></marquee>
    
                    <div class="margin_bottom_10"></div>
    
                    <div class="rc_btn_02"><a href="#"><%=captions.getString("viewall")%></a></div>
    
                    <div class="cleaner"></div>
                </div>
            </div>
    
    
            <div class="cleaner">&nbsp;</div>
        </div>                    
        <div class="cleaner_h20">&nbsp;</div>
    </div> <!-- end of content right -->

<div class="cleaner">&nbsp;</div>

</div> <!-- end of content -->
</div> <!-- end of content wrapper -->

<div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer">
        Copyright © TGMC 2012 <a href="index.jsp">TechJustice</a> | <a href="http://www.templatemo.com" target="_parent">
        Contact Us</a> | <a href="http://www.templatemo.com" target="_parent">Site Map</a>
    </div><!-- end of footer -->
</div><!-- end of footer wrapper -->
</body>
</html>