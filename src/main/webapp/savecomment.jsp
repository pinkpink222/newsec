<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

String comment = request.getParameter("comment");

if (comment != null && !comment.trim().isEmpty()) {
    String url = "jdbc:mariadb://localhost:3306/myxssdb";
    String user = "myappuser";
    String password = "myappuser123";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO mytable (comment) VALUES (?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, comment);
        pstmt.executeUpdate();
    } catch (Exception e) {
        out.println("DB Error: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
}
response.sendRedirect("reply.jsp");
%>
