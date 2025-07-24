<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

// input
String comment = request.getParameter("comment_content");

if (comment != null && !comment.trim().isEmpty()) {
    // CONNECT DB
    String url = "jdbc:mysql://localhost:3306/xssdb";
    String user = "myappuser";
    String password = "myappuser123";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO guestbook (name, comment) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "anonymous"); // 고정 이름
        pstmt.setString(2, comment);     // 사용자 입력
        pstmt.executeUpdate();

    } catch (Exception e) {
        out.println("DB error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comment Submitted</title>
</head>
<body>
    <h3>✅ 코멘트가 등록되었습니다!</h3>
    <p><%= comment %></p>
    <a href="contact.html">← 돌아가기</a>
</body>
</html>

