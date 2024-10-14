<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
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
	<div id="mydiv" style="font-size: 7mm">
		<%
			out.print("Admin UserID -> admin");
		%>
		</a> <a href="login.html">
		<%//session.invalidate();%>
	<input type="button" name="logout" value="Logout" style="border-radius: 12px;background-color: black; color:white; border-color: transparent;border-width: 5px">
		</a>
	</div>
	</nav> </section>
	
	<section id="welcome">
   		<div class="container">
   		<div class="welcome text-center wow fadeInUp ">
   			<h1>Anti Ragging Portal</h1>
   		</div>	
   		</div>
   </section><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<center style="color:white;font-size: 25px">
	<%
		
		String que = "select * from grev where grevID='" + request.getParameter("grevID") + "' and (status='accept' or status='InProgress')";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root",
					"Ns422444");
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(que);
			if (rst.next() == false) {
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Grievance ID is not correct');");
				   out.println("location='updateStatus.jsp';");
				   out.println("</script>");
			} else {
				out.print("Grievance ID : " + rst.getString(1) + "<br><br>");
				out.print("User ID : " + rst.getString(2) + "<br><br>");
				out.print("Name : " + rst.getString(3) + "<br><br>");
				out.print("Date : " + rst.getDate(4) + "<br><br>");
				out.print("Text : " + rst.getString(5) + "<br><br>");
				out.print("Current Status : " + rst.getString(6) + "<br><br></body>");
				session.setAttribute("grevID", rst.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<center>
	<form action="updateGrievanceStatus.jsp" method=get style="color: white">
				In Progress&nbsp;&nbsp;<input type="radio" name="r1"
					value="InProgress" align="middle" required style="size: 7mm;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Resolved&nbsp;&nbsp;<input type="radio" name="r1"
					value="Resolved" align="middle" required style="size: 7mm"><br> <br> <input
					type="submit" value="submit" name="b1" style="border-radius: 12px; width: 120px">
			</form>
</center>
</body>
</html>