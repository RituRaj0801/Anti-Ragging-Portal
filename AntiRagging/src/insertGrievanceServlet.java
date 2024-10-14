import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class insertGrievanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession hs=request.getSession();
		try
		{
			Connection conn = DBConnection.dbConnection();
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("select grevID from grev order by grevID DESC LIMIT 1;");
			rs.next();
			String str=rs.getString(1);
			String[] arr=str.split("[-]");
			int grevInt=(Integer.parseInt(arr[1]))+1;
			String grevID = "grev-"+grevInt;
			PreparedStatement pst=conn.prepareStatement("insert into grev values(?,?,?,CURDATE(),?,'pending')");
			pst.setString(1,grevID);
			pst.setString(2,(String)hs.getAttribute("uID"));
			pst.setString(3,(String)hs.getAttribute("name"));
			pst.setString(4, (String)request.getParameter("grievance"));
			pst.execute();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Your Grievance Has been recorded successfully');");
			out.println("location='Homeuser.html';");
			out.println("</script>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}