<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Stored Comments</title>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h3 class="mb-4">📝 Stored Comments (XSS Test)</h3>
    <div class="list-group">
<%
  File f = new File(application.getRealPath("/") + "comments.txt");
  if (f.exists()) {
    BufferedReader br = new BufferedReader(new FileReader(f));
    String line;
    while ((line = br.readLine()) != null) {
%>
      <div class="list-group-item"><%= line %></div>
<%
    }
    br.close();
  } else {
%>
    <div class="alert alert-info">No comments yet.</div>
<%
  }
%>
    </div>
    <a href="contact.html" class="btn btn-secondary mt-3">← Back</a>
  </div>
</body>
</html>

