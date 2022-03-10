<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display.jsp</title>
</head>
<body>
	<!-- 
		<table>
			<th> 
				<td> nah</td>
			</th> -->
		<%
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp", "root", "root");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		out.println("<table border='5px'> <tr> <td> ID</td> <td>Name </td> <td>Degree </td> </tr>");	
		while(rs.next()){
			int id=rs.getInt(1);
			String name=rs.getString(2);
			String degree=rs.getString(3);
			out.println("<tr> <td>"+ id+" </td>");
			out.println("<td>"+ name+ " </td>");
			out.println("<td>"+ degree+ " </td></tr>");
		}
		//out.println("</table>");
		%>
	</table>
 	
</body>
</html>