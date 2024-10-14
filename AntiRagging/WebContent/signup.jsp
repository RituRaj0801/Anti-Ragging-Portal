<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!public boolean checkName(String name) {
		String specialChars = "~`!@#$%^&*()-_=+\\|[{]};:'\",<.>/?";
		char currentCharacter;
		boolean n = true;
		for (int i = 0; i < name.length(); i++) {
			currentCharacter = name.charAt(i);
			if (Character.isDigit(currentCharacter))
				n = false;
			else if (specialChars.contains(String.valueOf(currentCharacter)))
				n = false;
		}
		return n;
	}

	public boolean checkAge(int age) {
		boolean n = true;
		if (age > 40)
			n = false;
		return n;
	}

	public boolean checkNum(long num) {
		boolean n = true;
		if (String.valueOf(num).length() != 10) {
			n = false;
		}

		return n;
	}%>
	<%
		String pwd = request.getParameter("pwd");
		String cpwd = request.getParameter("cpwd");
		if (pwd.equals(cpwd)) {
			String name = request.getParameter("name");
			boolean status_name = checkName(name);
			if (status_name == false) {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('Name must not have special characters or numbers');");
				   out.println("location='signup.html';");
				   out.println("</script>");
			} else {
				long pno = Long.parseLong(request.getParameter("pno"));
				boolean status_pno = checkNum(pno);
				if (status_pno == false) {
					out.println("<script type=\"text/javascript\">");
					   out.println("alert('Length of Phone Number cannot exceed 10');");
					   out.println("location='signup.html';");
					   out.println("</script>");
				} else {
					long fno = Long.parseLong(request.getParameter("fno"));
					boolean status_fno = checkNum(fno);
					if (status_fno == false) {
						out.println("<script type=\"text/javascript\">");
						   out.println("alert('Length of Phone Number must not exceed 10');");
						   out.println("location='signup.html';");
						   out.println("</script>");
					} else {
						int age = Integer.parseInt(request.getParameter("age"));
						boolean status_age = checkAge(age);
						if (status_age == false) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Age must not be more than 40');");
							   out.println("location='signup.html';");
							   out.println("</script>");
						} else {
							String gender = request.getParameter("gender");
							String Fname = request.getParameter("Fname");
							String email = request.getParameter("email");
							String curAdd = request.getParameter("curAdd");
							String perAdd = request.getParameter("perAdd");
							String college = request.getParameter("college");
							String univ = request.getParameter("univ");
							String state = request.getParameter("state");
							String city = request.getParameter("city");
							try {
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection(
										"jdbc:mysql://localhost:3306/AntiRagging", "root", "Ns422444");
								Statement st = conn.createStatement();
								ResultSet rst = st
										.executeQuery("select userID from user order by userID DESC LIMIT 1");//fetch last userID
								rst.next();
								String str = rst.getString(1);
								String[] str_spl = str.split("[-]");
								int id = Integer.parseInt(str_spl[1]) + 1;
								String userID = "usr-" + id;
								st.close();
								PreparedStatement pst = conn
										.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
								pst.setString(1, userID); //userID as provided by developers
								pst.setString(2, pwd); //password as given by user
								pst.setString(3, name); //name as given by user
								pst.setLong(4, pno); //phone number as given by user
								pst.setString(5, email); //email as given by user
								pst.setInt(6, age); //age as given by user
								pst.setString(7, gender); //gender as given by user
								pst.setString(8, Fname); //father's name as given by user
								pst.setLong(9, fno); //father's phone number as given by user
								pst.setString(10, curAdd); //current address as given by user
								pst.setString(11, perAdd); //permanent address as given by user
								pst.setString(12, college); //college name as given by user
								pst.setString(13, univ); //university name as given by user
								pst.setString(14, state); //state as given by user
								pst.setString(15, city); //city as given by user
								pst.execute();
								pst.close();
								session.setAttribute("uID", userID);
								session.setAttribute("pwd", pwd);
								response.sendRedirect("http://localhost:8080/AntiRagging/display.jsp");
							} //TRY for database connection ends here
							catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
				}
			}
		} //IF ends here
		else {
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Password and Confirm Password does not match');");
			   out.println("location='signup.html';");
			   out.println("</script>");
		}
	%>
</body>
</html>