import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class insertFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int feedId;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession hs=request.getSession();
		try
		{
			Connection conn = DBConnection.dbConnection();
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("select feedID from feedback order by feedID DESC LIMIT 1;");
			while(rs.next())
			{
				String str=rs.getString(1);
				String[] arr=str.split("[-]");
				feedId=(Integer.parseInt(arr[1]))+1;
			}
			String feed = "feed-"+feedId;
			PreparedStatement pst=conn.prepareStatement("insert into feedback values(?,?,?,CURDATE(),?,'pending')");
			pst.setString(1, feed);
			pst.setString(2,(String)hs.getAttribute("uID"));
			pst.setString(3,(String)hs.getAttribute("name"));
			pst.setString(4,(String)request.getParameter("feedback"));
			pst.execute();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Your Feedback has been recorded successfully');");
			out.println("location='Homeuser.html';");
			out.println("</script>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}