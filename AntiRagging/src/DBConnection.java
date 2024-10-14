import java.sql.*;
public class DBConnection {
	public static Connection dbConnection() throws ClassNotFoundException,SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AntiRagging","root","Ns422444");
		return conn;
	}
}