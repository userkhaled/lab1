<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"	
%>

<%@page import="java.sql.*"%>
    
<%	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String marks = null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "1234");
	
	PreparedStatement stmt = conn.prepareStatement("select password,marks from student where id = ?");
	stmt.setString(1, id);
	ResultSet rs = stmt.executeQuery();
	
	while (rs.next()){
		marks = rs.getString("marks");
		String holder = rs.getString("password");
		if (pw.equals(holder)){
			continue;
		}
		else
			out.print(pw);
			out.print(holder);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Your current mark is <%out.print(marks);%></h1><br><br>
	<form method="post" action="process.jsp">
	Enter your Marks:<br>
	<input type="text" name="marks">
	<input type="hidden" name="id" value=<% out.print(id);%>>
	<input type="hidden" name="pw" value=<% out.print(pw);%>>
	<br><br>
	<input type="submit" value="Submit">
	</form>
	<br>
	<form method="get" action="register.html">
	<input type="submit" value="Sign Out">
	</form>
</body>
</html>