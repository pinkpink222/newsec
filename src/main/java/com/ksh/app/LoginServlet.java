package com.ksh.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // --- 취약한 SQL Injection 코드 ---
        String sql = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";

        String dbUrl = "jdbc:mariadb://localhost:3306/mydb";
        String dbUser = "myappuser";
        String dbPass = "myappuser123"; // <-- 여기를 실제 비밀번호로 바꿔주세요!

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
