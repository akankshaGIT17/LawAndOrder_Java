<!DOCTYPE html>

<html lang="en">
<head>
<link href="style.css" rel="stylesheet" type="text/css" />
	<meta charset="utf-8" />
	<title>Detectives | Law & Order</title>
	<script>
		$(function(){
		  var $form_inputs =   $('form input');
		  var $rainbow_and_border = $('.rain, .border');
		  /* Used to provide loping animations in fallback mode */
		  $form_inputs.bind('focus', function(){
		  	$rainbow_and_border.addClass('end').removeClass('unfocus start');
		  });
		  $form_inputs.bind('blur', function(){
		  	$rainbow_and_border.addClass('unfocus start').removeClass('end');
		  });
		  $form_inputs.first().delay(800).queue(function() {
			$(this).focus();
		  });
		});
	</script>
	<!-- Validation Script Start -->
<script type="text/javascript" language="javascript">
function checkform1()
	{	
		var form=document.RegistrationForm;
		var	msg = validateField(document.RegistrationForm.email,'EMAIL','6','35','E-mail Address','\',"#^&*~, \\/$%');
				if(msg.length > 0)			
				{
					alert("Enter Correct ID");	
					document.RegistrationForm.email.focus();
					return false;
				}
			var str1=document.RegistrationForm.pass.value;
				if (str1.length==0)
			{ 
				alert("Please enter the password");
  				form.pass.focus();
  				return false;
  			}
		return true;
	}	
</script>
<!-- Validation Script End -->
		
	</head>
	<body id="home">
	<table align="center" width="150" height="215"><tr><td ><img
			src="images/h.jpg" height="135" width="128" /></td></tr></table>
		<div class="rain">
			<div class="border start">
				<form  method="post"     action="contactcheck.jsp"   id="login_form" name="RegistrationForm" onsubmit="return checkform1()"><table align=center><tr><td>
				<img src="images/sc.png" width="46" height="58"></img></td><td><label  for=heading><font color=white><a href="in.jsp">
<h3>Police Login</h3></a></font></label></td></tr><tr><td></td><td><label><%
							out.print(request.getParameter("err")); %></label></td></tr></table>
					<label for="email">Name </label>
					<input type='text' name="name" id='name' title="Entert Email ID" placeholder="Name"/>
					<label for="pass">E Mail ID</label>
					<input type='text' name="email" id='email' title="Enter Password" placeholder="E Mail ID"/>
					<label for="pass">Message </label>
					<label><textarea name='msg' placeholder="Message"></textarea></label>
					
					 <input type="submit" onclick="return checkform1()" value="SEND"/>
				</form>
			</div>
		</div>
	</body>
</html>