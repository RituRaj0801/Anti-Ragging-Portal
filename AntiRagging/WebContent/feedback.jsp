<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="feedback.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
<body
	background="https://images.pexels.com/photos/5836/yellow-metal-design-decoration.jpg?cs=srgb&dl=art-creative-design-5836.jpg&fm=jpg">
	<!-------------------Header------------------>

	<section id="header" style="font-size: 30px">

		<nav class="navbar navbar-light">
			<a class="navbar-brand" href="Homeuser.html"><img
				src="images/atp3.jpg"></a>
			<div id="mydiv" style="font-size: 7mm">
				<%
					out.print("UserID -> " + session.getAttribute("uID"));
				%>
				<a href="login.html"> <%
 //session.invalidate();
 %><input type="button" name="logout" value="Logout" style="border-radius: 12px;border-color: transparent;background-color: black; color: white">
				</a><br>
			</div>
		</nav>
	</section>
	
	<section id="welcome">
   		<div class="container">
   		<div class="welcome text-center wow fadeInUp ">
   			<h1>Anti Ragging Portal</h1>
   		</div>	
   		</div>
   </section>
	
	<!--------------------feedback------------->

	<section id="feedback">
		<div class="container">
			<div class="feedback text-center ">
				<form method="get" action=insertFeedbackServlet>
					<h1>Feedback</h1>
					<br>
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root",
									"Ns422444");
							PreparedStatement st = conn.prepareStatement("select name from user where userID=?");
							st.setString(1, (String)session.getAttribute("uID"));
							ResultSet rs = st.executeQuery();
							rs.next();
							out.print("<h5 style=color:white>Name : " + (String) session.getAttribute("name") + "</h5><br><br>");
							out.print("<h5 style=color:white>UserID : " + (String) session.getAttribute("uID") + "</h5><br><br>");
							//out.print(Calendar.getInstance());
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
						<textarea cols="100" rows="5" name="feedback" placeholder="Enter The FeedBack" required></textarea>
						<br><br> 
						<input type="submit" value="submit" style="color: black; font-size: 20px ;background-color: skyblue; border-color: transparent; border-radius: 12px; width: 80px; height: 40px">
				</form>
			</div>
		</div>
	</section>
	<!----------------Social Media----------------->

	<section id="Social">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h1>Contact</h1>
					<p  style="font-size: 20px">
						<i class="fa fa-phone-square"></i> +91 8800563204
					</p>
					<p style="font-size: 20px">
						<i class="fa fa-envelope"></i> xyz@ABC.com
					</p>
					<p style="font-size: 20px">
						<a href="https://www.kccitm.college/#contact"><i
							class="fa fa-address-card"></i></a> KCC,knowledge park III,2B-2C
					</p>
					<p class="noida">Greater Noida,India</p>
				</div>
				<div class="col-md-3">
					<h1>Follow Us On</h1>
					<p style="font-size: 20px">
						<a href="https://www.facebook.com/"><i
							class="fa fa-facebook-official"></i></a> Facebook
					</p>
					<p style="font-size: 20px">
						<a href="https://www.instagram.com/"><i
							class="fa fa-instagram"></i></a> Instagram
					</p>
					<p style="font-size: 20px">
						<a href="https://twitter.com/?lang=en"><i
							class="fa fa-twitter"></i></a> Twitter
					</p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>