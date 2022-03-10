<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String degree = request.getParameter("degree");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp", "root", "root");
		//out.println("connected..!");
		String insert = "insert into student(id,name,degree) values(?,?,?)";

		ps = conn.prepareStatement(insert);
		ps.setInt(1, id);
		ps.setString(2, name);
		ps.setString(3, degree);

		int n = ps.executeUpdate();
		if (n > 0)
			out.println(n+" record inserted successfully...!");

	} catch (Exception e) {
		out.println("error:" + e);
	}
	%>
</body>
</html>