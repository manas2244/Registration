<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

function validateUsername()
{
        var y= document.getElementById("1").value;
	
	if(y=="")
         {    
          alert("Please enter username ");
          return false;
		 }
         else
            {
            return true;
            }
}

function validatepassword()
{
        var y= document.getElementById("2").value;
	
	if(y=="")
         {    
          alert("Please enter Password ");
          return false;
		 }
         else
            {
            return true;
            }
}

function validateConfirmPassword()
{
		var o= document.getElementById("2").value;
        var c= document.getElementById("3").value;
		
	if(o!=c)
         {    
          alert("Password not matches");
          return false;
		 }
         else
            {
            return true;
            }
}

function validateFName()
{
        var y= document.getElementById("4").value;
	
	if(y=="")
         {    
          alert("Please enter first Name ");
          return false;
		 }
         else
            {
            return true;
            }
}

function validateLName()
{
        var y= document.getElementById("5").value;
	
	if(y=="")
         {    
          alert("Please enter last Name ");
          return false;
		 }
         else
            {
            return true;
            }
}


function validateEmail()
{

var x1=document.getElementById("6").value;
   
    var atpos = x1.indexOf("@");
    var dotpos = x1.lastIndexOf(".");
    
    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x1.length) 
    {
        alert("Not a valid e-mail address");
        return false;
    }
    
}

function validateMobileNumber()
{
        var ints=/^[0-9]+$/;
        var x= document.getElementById("7").value;

        var mk=x.length;	

	if(x=="")
         {    
          alert("Please enter mobile number");
          return false;
		 }
       if(x.match(ints))
          { 
            if(mk!=10)
                {
                   alert("Mobile number is Invalid");
	          	   return false;
                }
           return true;
           }   
        else
           { 
              alert("Please enter only numbers");
              return false;
           } 
}

function validateLocation()
{
        var y= document.getElementById("8").value;
	
	if(y=="")
         {    
          alert("Please enter Location ");
          return false;
		 }
         else
            {
            return true;
            }
}



function ValidateForm()
{
	if(validateUsername()==false)
		return false;
	if(validatepassword()==false)
		return false;
	if(validateConfirmPassword()==false)
		return false;
	if(validateFName()==false)
		return false;
	if(validateLName()==false)
		return false;
    if(validateEmail()==false)
		return false;
    if(validateMobileNumber()==false)
		return false;
    if(validateLocation()==false)
		return false;
   
}

</script>


<%

String s=request.getParameter("num");
//out.print(s);
long l=Long.parseLong(s);

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "root");
Statement ss=c.createStatement();
ResultSet rs=ss.executeQuery("Select username,password,firstname,lastname,email,mobile_number,location from user where mobile_number="+l);


%>

<form action="register" method="get" onsubmit="return ValidateForm();">

<table>
<% 
while(rs.next())
{
	String username=rs.getString(1);
	String password=rs.getString(2);
	String fname=rs.getString(3);
	String lname=rs.getString(4);
	String email=rs.getString(5);
	long num=rs.getLong(6);
	String location=rs.getString(7);

%>
<tr>
<td>Username</td><td><input type="text" name="username_text" id="1" value="<%=username %>"></td>
</tr>

<tr>
<td>Password </td><td><input type="password" name="password_text" id="2" value="<%=password %>"></td>
</tr>

<tr>
<td>Confirm Password </td><td><input type="password" name="confirmpassword_text" id="3" ></td>
</tr>

<tr>
<td>First Name </td><td><input type="text" name="fname_text" id="4" value="<%=fname %>"></td>
</tr>

<tr>
<td>Last Name </td><td><input type="text" name="lname_text" id="5" value="<%=lname %>"></td>
</tr>

<tr>
<td>Email Id </td><td><input type="text" name="email_text" id="6" value="<%=email %>"></td>
</tr>

<tr>
<td>Phone Number </td><td><input type="text" name="number_text" id="7" value="<%=num %>"></td>
</tr>

<tr>
<td>Location </td><td><input type="text" name="location_text" id="8" value="<%=location %>"></td>
</tr>


<tr><td> <input type="submit" value="Submit"></td> <td><input type="reset"></td></tr>
</table> 
</form>

<%} %>

</body>
</html>