<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	

	<%
		int id=Integer.parseInt(request.getParameter("delete"));
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp","root","root");
		PreparedStatement ps=conn.prepareStatement("delete from student where id= ?");
		ps.setInt(1, id);
		int n=ps.executeUpdate();
		if(n>0)
			out.print("record Deleted successfully..! ");
		else
			out.println("Data not found: ");
	
	%>
	<br>
	<button><a href="StudentLogin.jsp">Home</a></button>
</body>
</html>