<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Status</title>
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
	<div id="mydiv" style="font-size: 20px">
		<%
			out.print("Admin UserID -> admin");
		%>
		<a href="login.html"> <%
 	//session.invalidate();
 %><input type="button" name="logout" value="Logout"  style="border-color: transparent; border-radius: 12px; color: white;background-color: black; width: 80px">
		</a>
	</div>
	</nav> </section>
	
	<section id="welcome">
   		<div class="container">
   		<div class="welcome text-center wow fadeInUp ">
   			<h1>Anti Ragging Portal</h1>
   		</div>	
   		</div>
   </section>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<form method="get" action="update.jsp">
		<center>
			<input type="text" name="grevID" placeholder="Enter GrievanceID" required style="color: black;width: 260px">
			<input type="submit" value="search" name="b1" style="border-radius: 12px; width: 70px"><br><br><br><br>
	</form>
	<h2 style="color: white;">All Accepted Grievances</h2>
	<table border="2" bordercolor="black" cellpadding="50" cellspacing="50"
	bgcolor="blue" align="center" width="1500" height="130"
	style="color: white; text-align: center" >
	<thead>
		<th><h3>Grievance ID</h3></th>
		<th><h3>UserID</h3></th>
		<th><h3>Name</h3></th>
		<th><h3>Date</h3></th>
		<th><h3>Grievance</h3></th>
		<th><h3>Status</h3></th>
	</thead>
	<tbody>
		<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root",
					"Ns422444");
			Statement st = conn.createStatement();
			ResultSet rs = null;
			rs = st.executeQuery("select * from grev where status='accept'");
			while (rs.next()) {
				out.print("<tr><td><h5>" + rs.getString(1) + "</h5></td><td><h5>" + rs.getString(2) + "</h5></td><td><h5>" + rs.getString(3)
				+ "</h5></td><td><h5>" + rs.getString(4) + "</h5></td><td><h5>" + rs.getString(5) + "</h5></td><td><h5>" + rs.getString(6) +"</h5></td></tr>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	</tbody>
</table><br><br><br><br><br><br>
<h2 style="color: white;">All In Progress Grievances</h2>
	<table border="2" bordercolor="black" cellpadding="50" cellspacing="50"
	bgcolor="red" align="center" width="1500" height="130"
	style="color: white; text-align: center" >
	<thead>
		<th><h3>Grievance ID</h3></th>
		<th><h3>UserID</h3></th>
		<th><h3>Name</h3></th>
		<th><h3>Date</h3></th>
		<th><h3>Grievance</h3></th>
		<th><h3>Status</h3></th>
	</thead>
	<tbody>
		<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root",
					"Ns422444");
			Statement st = conn.createStatement();
			ResultSet rs = null;
			rs = st.executeQuery("select * from grev where status='InProgress'");
			while (rs.next()) {
				out.print("<tr><td><h5>" + rs.getString(1) + "</h5></td><td><h5>" + rs.getString(2) + "</h5></td><td><h5>" + rs.getString(3)
				+ "</h5></td><td><h5>" + rs.getString(4) + "</h5></td><td><h5>" + rs.getString(5) + "</h5></td><td><h5>" + rs.getString(6) +"</h5></td></tr>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	</tbody>
</table>
</center>
<br><br><br><br>
</body>
</html>