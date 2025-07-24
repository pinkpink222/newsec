<!-- contect.html 이지만 확장자는 .jsp로 저장하고 서빙하는 것을 권장 -->
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>댓글 기록</title>
</head>
<body>
  <h2>댓글 기록 (최신순)</h2>
  <hr>

<%
String url = "jdbc:mariadb://localhost:3306/myxssdb";
String user = "myappuser";
String password = "myappuser123";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    stmt = conn.createStatement();

    String sql = "SELECT comment, created_at FROM mytable ORDER BY created_at DESC";
    rs = stmt.executeQuery(sql);

    while (rs.next()) {
        String comment = rs.getString("comment");
%>
        <div><%= comment %></div>
<%
    }
} catch (Exception e) {
    out.println("DB 오류: " + e.getMessage());
} finally {
    if (rs != null) try { rs.close(); } catch(Exception e) {}
    if (stmt != null) try { stmt.close(); } catch(Exception e) {}
    if (conn != null) try { conn.close(); } catch(Exception e) {}
}
%>

</body>
</html>
