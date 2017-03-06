<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Book</title>

</head>
<body>

<form action="purchase" method="get" onsubmit="return ValidateForm()">
<table align="center">

<% 

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "root");
Statement ss=c.createStatement();
ResultSet rs=ss.executeQuery("Select firstname,lastname,email,mobile_number,location from user");

while(rs.next())
{
%>
	<tr><td>First Name</td> <td>Last Name</td> <td>Email</td> <td>Mobile Number</td> <td>Location</td> <td></td> </tr>
	<tr> <td> <% out.print(rs.getString(1)); %> </td> 
			<td><% out.print(rs.getString(2)); %> </td> 
				<td><% out.print(rs.getString(3)); %> </td> 
					<td><% out.print(rs.getLong(4)); long l=rs.getLong(4);%> </td> 
						<td><% out.print(rs.getString(5)); %> </td> <td> <a href=Edit.jsp?num=<%=l %> > Edit </a> 
																		 <a href=Delete.jsp?num=<%=l %> > Delete</a> 
															        </td> 
	</tr>

	<% 
}
	%>
</table>
</form>
</body>
</html>