import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		int flag = 0;
		String userID = request.getParameter("userID");
		String pwd = request.getParameter("pwd");
		if(userID.isEmpty() || pwd.isEmpty())
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You must fill both the fields');");
			out.println("location='login.html';");
			out.println("</script>");
		}
		if(userID.equals("admin") && pwd.equals("admin"))
		{
			response.sendRedirect("http://localhost:8080/AntiRagging/admin.jsp");
		}
		else
		{
			try
			{
				Connection conn = DBConnection.dbConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery("select userID, pwd, name from user");
				while(rs.next())
				{
					if(userID.equals(rs.getString(1)) && pwd.equals(rs.getString(2)))
					{
						HttpSession hs = request.getSession();
						hs.setAttribute("uID", userID);
						hs.setAttribute("name", rs.getString(3));
						response.sendRedirect("http://localhost:8080/AntiRagging/user.jsp");
					}
				}
				st.close();
				conn.close();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('UserID or password incorrect');");
				out.println("location='login.html';");
				out.println("</script>");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}
