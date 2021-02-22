<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
    
<%	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int marks = Integer.parseInt(request.getParameter("marks"));
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "1234");
	
	PreparedStatement stmt = conn.prepareStatement("update student set marks = ? where id = ?;");
	stmt.setInt(1, marks);
	stmt.setString(2, id);
	stmt.executeUpdate();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Your marks has been updated</h1>
<p>New Marks: <%out.print(marks); %></p>
<form method="get" action="studentInfo.jsp">
	<input type="hidden" name="id" value=<% out.print(id);%>>
	<input type="hidden" name="pw" value=<% out.print(pw);%>>
	<input type="submit" value="Go Back">
</form>
</body>
</html>