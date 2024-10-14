<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Status Feedback</title>
<link rel="stylesheet" type="text/css" href="user.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
</head>
<body background="images/pic8.jpg">
	<section id="header"> <nav class="navbar navbar-light">
	<a class="navbar-brand" href="Homeadmin.html"><img
		src="images/atp3.jpg"></a>
	<div id="mydiv">
		<%
			out.print("Admin UserID -> admin");
		%>
		<a href="login.html">
			<%
				//session.invalidate();
			%><input type="button" name="logout"
			value="Logout">
		</a>
	</div>
	</nav> </section>
	<a href=Homeadmin.html style="color: white">Home</a>
	<section id="welcome">
   		<div class="container">
   		<div class="welcome text-center wow fadeInUp ">
   			<h1>Anti Ragging Portal</h1>
   		</div>	
   		</div>
   </section>
<%
 String s= request.getParameter("r1");
if(s == null)
{
	Thread.sleep(5000);
	response.sendRedirect("http://localhost:8080/AntiRagging/searchFeedback.jsp");
}
else
{
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root",
		"Ns422444");
PreparedStatement st = conn.prepareStatement("update feedback set status=? where feedID=?");
st.setString(1, s);
st.setString(2, (String)session.getAttribute("feedID"));
st.execute();
out.print("<script type=\"text/javascript\">");
out.println("alert('Your Feedback has been recorded');");
out.println("location='Homeuser.html';");
out.println("</script>");
}
catch(Exception e)
{
	e.printStackTrace();
}
}
%>
</body>
</html>