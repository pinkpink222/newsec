<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Welcome - Villa</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CSS: 동일한 테마 적용 -->
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
  <link rel="stylesheet" href="assets/css/owl.css">
  <link rel="stylesheet" href="assets/css/animate.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<!-- 서브헤더 -->
<div class="sub-header">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-8">
        <ul class="info">
          <li><i class="fa fa-envelope"></i> info@villa.co</li>
          <li><i class="fa fa-map"></i> Sunny Isles Beach, FL 33160</li>
        </ul>
      </div>
      <div class="col-lg-4 col-md-4 text-end">
        <a href="index.html" class="text-white"><i class="fa fa-home"></i> Back to Home</a>
      </div>
    </div>
  </div>
</div>

<!-- 환영 메시지 -->
<section class="contact section" style="background-color: #f9f9f9;">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="section-heading text-center">
          <h6>| Login Success</h6>
          <h2>Welcome, <%= request.getAttribute("username") %>!</h2>
          <p class="text-muted mt-3">You have successfully logged in. Explore our features and enjoy your stay!</p>
          <a href="profile.jsp" class="btn btn-success mt-4 me-2"><i class="fa fa-user-circle"></i> My Profile</a>
          <a href="index.html" class="btn btn-outline-secondary mt-4"><i class="fa fa-sign-out-alt"></i> Log Out</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 스크립트 -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/custom.js"></script>

</body>
</html>

