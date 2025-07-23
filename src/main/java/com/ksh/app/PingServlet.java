package com.ksh.app;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ping")
public class PingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ipAddress = request.getParameter("ip");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (ipAddress != null && !ipAddress.trim().isEmpty()) {
            // --- 취약한 Command Injection 코드 ---
            String command = "ping -c 4 " + ipAddress; // Linux/macOS
            // Windows라면 String command = "ping -n 4 " + ipAddress;

            out.println("<h1>명령어 실행: " + command + "</h1>");
            out.println("<pre>");

            try {
                Process process = Runtime.getRuntime().exec(command);
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                while ((line = reader.readLine()) != null) {
                    out.println(line);
                }
                reader.close();
                int exitVal = process.waitFor();
                out.println("\n명령 종료 코드: " + exitVal);
            } catch (Exception e) {
                out.println("명령 실행 오류: " + e.getMessage());
                e.printStackTrace();
            }
            out.println("</pre>");
        } else {
            out.println("<h1>IP 주소를 입력해주세요.</h1>");
        }
    }
}
