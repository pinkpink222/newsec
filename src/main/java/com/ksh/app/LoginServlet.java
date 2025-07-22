package com.ksh.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // --- 취약한 SQL Injection 코드 ---
        String sql = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";

        String dbUrl = "jdbc:mysql://localhost:3306/mydb";
        String dbUser = "root";
        String dbPass = "YOUR_MYSQL_ROOT_PASSWORD"; // <-- 여기를 실제 비밀번호로 바꿔주세요!

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                out.println("<h1>로그인 성공! 환영합니다, " + username + "님!</h1>");
            } else {
                out.println("<h1>로그인 실패. 아이디 또는 비밀번호가 틀렸어요.</h1>");
            }
        } catch (SQLException e) {
            out.println("<h1>데이터베이스 오류: " + e.getMessage() + "</h1>");
            e.printStackTrace();
        }
    }
}
