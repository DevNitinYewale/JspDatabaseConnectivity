<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update.jsp</title>
</head>
<body>
	<%
	int n=0;
	try{
		int id=Integer.parseInt(request.getParameter("id"));
		String degree=request.getParameter("degree");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp","root","root");
		PreparedStatement ps=conn.prepareStatement("update student set degree=? where id=?");
		ps.setString(1, degree);
		ps.setInt(2, id);
		n=ps.executeUpdate();
	}
	catch (Exception e){
		out.println("Error: "+e);
	}
		if(n>0)
			out.println(n+ ": record updated successfully...!");
	
	
	%>
	<br></br>
	<button style="text-decoration: none; color:black;"><a href="StudentLogin.jsp">Home</a></button>&nbsp;&nbsp;
</body>
</html>