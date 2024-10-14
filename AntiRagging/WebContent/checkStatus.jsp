<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
	<link rel="stylesheet" type="text/css" href="checkStatus.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</head>
<body>
<nav class="navbar navbar-light">
  <a class="navbar-brand" href="Homeuser.html"><img src="images/atp3.jpg" style="width: 90px; border-radius: 12px"></a>
  		</nav>
	<div class="checkBox">
	<center>
		<h1 style="color: yellow; font-family: sans-serif; font-size: 2cm">Anti Ragging Portal</h1>
	</center>
	</div>
	<br><br><br><br>
	<h2 style="color: red"><center><%=
		"The Status of Your Grievances are:-"
		%></center></h2>
		<table border="2" bordercolor="black" cellpadding="0" cellspacing="0"
		bgcolor="blue" align="center" width="1500" height="100"
		style="color: white; text-align: center">
		<b><th><h3>Grievance ID</h3></th>
		<th><h3>UserID</h3></th>
		<th><h3>Name</h3></th>
		<th><h3>Date</h3></th>
		<th><h3>text</h3></th>
		<th><h3>status</h3></th></b>
		<%
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String s = (String)session.getAttribute("uID");
		String que = "select * from grev where userID='"+ s +"'";
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root","Ns422444");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(que);
		while(rs.next())
		{
			out.print("<tr><td><h5>" + rs.getString(1) + "</h5></td><td><h5>" + rs.getString(2) + "</h5></td><td><h5>" + rs.getString(3)
			+ "</h5></td><td><h5>" + rs.getDate(4) + "</h5></td><td><h5>" + rs.getString(5) + "</h5></td><td><h5>" + rs.getString(6) +"</h5></td></tr>");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
		</table><br><br><br><br><br><br>
		<h2 style="color: white"><center><%=
		"The Status of Your Feedbacks Are:-"
		%></center></h2>
		<table border="2" bordercolor="black" cellpadding="0" cellspacing="0"
		bgcolor="red" align="center" width="1500" height="100"
		style="color: white; text-align: center">
		<th><h3>Feedback ID</h3></th>
		<th><h3>UserID</h3></th>
		<th><h3>Name</h3></th>
		<th><h3>Date</h3></th>
		<th><h3>text</h3></th>
		<th><h3>status</h3></th>
		<%
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String s = (String)session.getAttribute("uID");
		String que = "select * from feedback where userID='"+ s +"'";
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root","Ns422444");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(que);
		while(rs.next())
		{
			out.print("<tr><td><h5>" + rs.getString(1) + "</h5></td><td><h5>" + rs.getString(2) + "</h5></td><td><h5>" + rs.getString(3)
			+ "</h5></td><td><h5>" + rs.getDate(4) + "</h5></td><td><h5>" + rs.getString(5) + "</h5></td><td><h5>" + rs.getString(6) +"</h5></td></tr>");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
		</table><br><br><br><br>
</body>
</html>