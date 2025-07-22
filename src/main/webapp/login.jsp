<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login - Villa</title>
  <link rel="stylesheet" href="assets/css/style.css"> <!-- 기존 CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="sub-header">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <ul class="info">
          <li><i class="fa fa-envelope"></i> info@company.com</li>
          <li><i class="fa fa-map"></i> Sunny Isles Beach, FL 33160</li>
        </ul>
      </div>
      <div class="col-lg-4 text-end">
        <a href="index.html"><i class="fa fa-home"></i> Back to Home</a>
      </div>
    </div>
  </div>
</div>

<section style="padding: 80px 0; background: #f7f7f7;">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6 col-md-8">
        <div class="card" style="padding: 40px; box-shadow: 0 0 15px rgba(0,0,0,0.1); background: #fff; border-radius: 10px;">
          <h2 class="text-center mb-4">Login</h2>
          <form action="login" method="post">
            <div class="form-group mb-3">
              <label for="username"><i class="fa fa-user"></i> Username</label>
              <input type="text" name="username" id="username" class="form-control">
            </div>
            <div class="form-group mb-4">
              <label for="password"><i class="fa fa-lock"></i> Password</label>
              <!-- deliberately missing closing bracket -->
              <input type="password" name="password" id="password"<br>
            </div>
            <!-- no CSRF, no validation, no encryption -->
            <input type="submit" value="Login" class="btn btn-primary w-100">
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>

