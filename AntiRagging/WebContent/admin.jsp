<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anti Ragging Portal</title>
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
<body background="images/yel.jpeg">
	<section id="header"> <nav class="navbar navbar-light">
	<a class="navbar-brand" href="Homeadmin.html"><img
		src="images/atp3.jpg"></a>
	<div id="mydiv" style="font-size: 7mm">
		<%
			out.print("Admin UserID -> admin");
		%>
		<a href="login.html"> <input type="button" name="logout"
			value="Logout" style="border-radius: 12px;background-color: black; color:white; border-color: transparent;border-width: 5px"></a>
	</div>
	</nav> </section>
	
	<section id="welcome">
   		<div class="container">
   		<div class="welcome text-center wow fadeInUp ">
   			<h1>Anti Ragging Portal</h1>
   		</div>	
   		</div>
   </section>

	<!-------------------Button 3D--------------->

	<ul>
			<li><a href="viewPendingRequest.jsp"> <i class="fa fa-eye" aria-hidden="true"></i>
					<span>View Pending Request</span>
			</a></li>
			<li><a href="viewFeedback.jsp"> <i class="fa fa-commenting"
					aria-hidden="true"></i> <span> View Feedback </span>
			</a></li>
			<li><a href="updateStatus.jsp"> <i class="fa fa-pencil-square-o"
					aria-hidden="true"></i> <span> Update Status </span>
			</a></li>
	</ul>
	<!-----------------Social Media----------------->

	<section id="Social">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h1 style="font-size: 20px">Contact</h1>
				<p style="font-size: 20px">
					<i class="fa fa-phone-square"></i> +91 8800563204
				</p>
				<p style="font-size: 20px">
					<i class="fa fa-envelope"></i> xyz@ABC.com
				</p>
				<p style="font-size: 20px">
					<a href="https://www.kccitm.college/#contact"><i
						class="fa fa-address-card"></i></a> KCC,knowledge park III,2B-2C
				</p>
				<p class="noida" style="font-size: 20px">Greater Noida, India</p>
			</div>
			<div class="col-md-3" style="font-size: 20px">
				<h1 style="font-size: 20px">Follow Us On</h1>
				<p style="font-size: 20px">
					<a href="https://www.facebook.com/"><i
						class="fa fa-facebook-official"></i></a> Facebook
				</p>
				<p style="font-size: 20px">
					<a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
					Instagram
				</p>
				<p style="font-size: 20px">
					<a href="https://twitter.com/?lang=en"><i class="fa fa-twitter"></i></a>
					Twitter
				</p>
			</div>
		</div>
	</div>
	</section>
</body>
</html>