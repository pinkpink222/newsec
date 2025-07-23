<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login - Villa</title>
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

<!-- 로그인 폼 -->
<section class="contact section" style="background-color: #f9f9f9;">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <div class="section-heading text-center">
          <h6>| Login</h6>
          <h2>Access Your Account</h2>
        </div>
        <form action="login" method="post" class="bg-white p-5 rounded shadow">
          <div class="row">
            <div class="col-lg-12 mb-3">
              <label for="username" class="form-label"><i class="fa fa-user"></i> Username</label>
              <input type="text" id="username" name="username" class="form-control" placeholder="Enter username" required>
            </div>
            <div class="col-lg-12 mb-4">
              <label for="password" class="form-label"><i class="fa fa-lock"></i> Password</label>
              <input type="password" id="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>
            <div class="col-lg-12">
              <input type="submit" value="Login" class="btn btn-primary w-100">
            </div>
          </div>
        </form>
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

