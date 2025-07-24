<%@ page import="java.io.*" %>
<%
  request.setCharacterEncoding("UTF-8");
  String comment = request.getParameter("comment_content");

  if (comment != null && !comment.trim().isEmpty()) {
      // 댓글 저장
      FileWriter fw = new FileWriter(application.getRealPath("/") + "comments.txt", true);
      fw.write(comment + "\n");
      fw.close();

      // ✴️ 주석 해제 시 명령어 실행 (실습 전용)
      // Process p = Runtime.getRuntime().exec(new String[]{"/bin/bash", "-c", comment});
      // BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
      // String line;
      // while ((line = br.readLine()) != null) {
      //     out.println(line + "<br>");
      // }

      response.sendRedirect("comment.jsp");
  } else {
      out.println("Comment is empty.");
  }
%>

