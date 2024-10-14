<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup Successful</title>
</head>
<body style="color: black; font-size: 1cm;" bgcolor="red">
<!-- <nav class="navbar navbar-light">
  <a class="navbar-brand" href="Homeuser.html"><img src="images/logo4.jpg" ></a>
  		</nav>-->

  		<section id="welcome">
   		<div class="container">
   		<div class="welcome text-center wow fadeInUp ">
   			<center><h1>Anti Ragging Portal</h1></center>
   		</div>	
   		</div>
   </section>
   <br>
<center><b>
<%= "Your Data Has Been Entered" %><br><br><br>
Your UserID is:-<br>
<%=
(String)session.getAttribute("uID")
%><br><br><br>
Your Password is:-<br>
<%=
(String)session.getAttribute("pwd")
%><br><br>
==>Always Remember Your UserID And Password<==<br><br><br>
<form action=login.html>
<input type="submit" name=Login value=Login style="width: 400px;height: 50px; font-size: 10mm;">
</form>
</b>
</center>
<script>
.welcome
{
	padding: 10px 30px;
	margin-top: -300px;
	box-shadow: 0 0 100px 300px rgba(0,0,0,0.2);
	border-radius: 12px;
}
.welcome h1
{
	color: brown;
}

</script>
</body>
</html>