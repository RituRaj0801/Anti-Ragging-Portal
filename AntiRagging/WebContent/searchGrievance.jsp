<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Grievance</title>
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
		<a href="login.html"> <%
 	//session.invalidate();
 %><input type="button" name="logout" value="Logout" style="border-radius: 12px; background-color: black;color: white;border-width: 5px;border-color: transparent">
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
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div style="color: white; background: black; background-image: inherit; font-size: 20px">
		<%
			String s = request.getParameter("grevID");
		if(s==null)
		{
			s = (String)session.getAttribute("grevID");
		}
			String que = "select * from grev where grevID='" + s + "' and status='pending'";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging", "root",
						"Ns422444");
				Statement st = conn.createStatement();
				ResultSet rst = st.executeQuery(que);
				if(rst.next() == false) {
					out.println("<script type=\"text/javascript\">");
					   out.println("alert('Incorrect Grievance ID');");
					   out.println("location='viewPendingRequest.jsp';");
					   out.println("</script>");
					}else{
					out.print("<center>Grievance ID : " + rst.getString(1) + "</center><br>");
					out.print("<center>User ID : " + rst.getString(2) + "</center><br>");
					out.print("<center>Name : " + rst.getString(3) + "</center><br>");
					out.print("<center>Date : " + rst.getDate(4) + "</center><br>");
					out.print("<center>Text : " + rst.getString(5) + "</center><br>");
					out.print("<center>Status : " + rst.getString(6) + "</center><br>");
					session.setAttribute("grevID", rst.getString(1));
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	<b>
		<center>
			<form action="statusGrievance.jsp" method=get style="color: white">
				Accept Grievance&nbsp;&nbsp;<input type="radio" name="r1"
					value="accept" align="middle" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Reject Grievance&nbsp;&nbsp;<input type="radio" name="r1"
					value="reject" align="middle" required><br> <br> 
					<input type="submit" value="submit" name="b1" style="font-size: 20px; border-width: 7px;border-color: transparent;border-radius: 12px;background-color: black;color: white">
			</form>
		</center>
	</b>
	</div>
</body>
</html>