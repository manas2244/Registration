import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Register extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out=resp.getWriter();
		
	try{	
		Class.forName("com.mysql.jdbc.Driver");
		Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","root");
		
		String usename=req.getParameter("username_text");
		String password=req.getParameter("password_text");
		String fname=req.getParameter("fname_text");
		String lname=req.getParameter("lname_text");
		String email=req.getParameter("email_text");
		long mobile_number=Long.parseLong(req.getParameter("number_text"));
		String location=req.getParameter("location_text");
		
		
		PreparedStatement ps=c.prepareStatement("insert into user values(?,?,?,?,?,?,?)");
		ps.setString(1, usename);
		ps.setString(2, password);
		ps.setString(3, fname);
		ps.setString(4, lname);
		ps.setString(5, email);
		ps.setLong(6,mobile_number);
		ps.setString(7, location);
		
		ps.executeUpdate();
		
		c.close();
		
		RequestDispatcher rd=req.getRequestDispatcher("UserRegistration.jsp");
		rd.forward(req, resp);
	}
	catch(Exception e)
	 {
		out.print(e); 
	 }
	
		
	 
	}
	

}
