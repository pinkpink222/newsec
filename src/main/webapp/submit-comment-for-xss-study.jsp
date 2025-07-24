<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8 %>
<% request.setCharacterEncoding("UTF-8");

// input
String commetn = request.getParameter("comment_content");

if (comment != null && !comment.trim().isEmpty()) {
	// CONNECT DB
	String url = "jdbc:mysql://localhost:3306/xssdb";
	String user = "myappuser";
	String password = "myappuser123";

	Connetcion conn = null;
	PreparedStatement pstmt = null;

	try {
	     Class.fomName("com.mysql.cj.jdbc.Driver");
	     conn = DriverManager.getConnection(url, user, password);

	     String sql = "INSERT INTO guestbook (name, comment) VALUES (?, ?)";
	     pstmt = conn.prepareStatement(sql);
	     pstmt.setString(1, "annony"); //
	     pstmt.setString(2, comment);
	     pstmt.executeUpdate();

	 } catch (Exception e) {
	 	out.println("DB error: " + e. getMessage());
	 } finally {
	 	if (pstmt != null) pstmt,close();
		if (conn != null) conn.close();
         }
}
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>comment</title>
</head>
<body>
	<h3>COMMENT</h3>
	<p><%= comment %></p>
	<a href="contact.html">
</body>
</html>
