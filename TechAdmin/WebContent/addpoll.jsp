<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>addpoll</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:useBean id="db" class="database.dncon" />

<% 

 

try 
	{ 
		String question=request.getParameter("question");
		
		String option1=request.getParameter("answer1");
		String option2=request.getParameter("answer2");
		String option3=request.getParameter("answer3");
		String option4=request.getParameter("answer4");
		String[] check=request.getParameterValues("check");
		int a=0;
		db.connect();
		if (check== null) 
   {
   db.updateSQL("insert into sakansha.polls(polls_id,question,option1,option2,option3,option4,check,time) values ((select max(polls_id)+1 from sakansha.polls),'"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"',"+a+",current_timestamp)");       
   }
   else
   {
		for(int i=0;i<check.length;i++)
		{
			if(check[i].equals("on"))
			{
		 	a=1;
		 	
			}
			
		}
		
		
        	
			db.updateSQL("update sakansha.polls set check=0 ");
		 	db.updateSQL("insert into sakansha.polls(polls_id,question,option1,option2,option3,option4,check,time) values ((select max(polls_id)+1 from sakansha.polls),'"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"',"+a+",current_timestamp)");       
      
       
   		}
   		 out.println("Poll created");
   		db.close();
     }
          
catch(Exception e) { 
    out.println("Your query is not working"+e.getMessage());        
     }  
     

  

%>

<jsp:forward page="polls.jsp">	<jsp:param name="add" value="Poll created" />
</jsp:forward>
</body>
</html>