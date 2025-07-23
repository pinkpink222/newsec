package com.ksh.app;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("name");
        if (userName == null || userName.isEmpty()) {
            userName = "손님";
        }
        request.setAttribute("displayUserName", userName);
        request.getRequestDispatcher("/welcome.jsp").forward(request, response);
    }
}
