<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String depart = request.getParameter("depart");
	String name = request.getParameter("name");
	

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC",
		"root", "1234");

	PreparedStatement stmt = conn.prepareStatement("insert into student(id,name,department,password) values (?,?,?,?)");
	stmt.setString(1, id);
	stmt.setString(2, name);
	stmt.setString(3, depart);
	stmt.setString(4, pw);
	stmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Your profile has been created</h1>
<form method="get" action="register.html">
	<input type="submit" value="Go Back">
</form>
</body>
</html>