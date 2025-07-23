package com.ksh.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

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
		request.setAttribute("username", username);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mysec/success.jsp");
		dispatcher.forward(request, response);
            } else  {
		request.setAttribute("username", username);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/mysec/fale.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            out.println("<h1>Database error: " + e.getMessage() + "</h1>");
            e.printStackTrace();
        }
    }
}
