<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String url = "jdbc:mysql://localhost:3306/xssdb";
    String user = "myappuser";
    String password = "myappuser123";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comment Log</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h3>📝 Stored Comments</h3>
    <div class="list-group">
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT comment FROM guestbook ORDER BY id DESC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String cmt = rs.getString("comment");
%>
      <div class="list-group-item"><%= cmt %></div>
<%
        }

    } catch (Exception e) {
        out.println("DB error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
    </div>
    <a href="contact.html" class="btn btn-primary mt-3">← Back</a>
  </div>
</body>
</html>

