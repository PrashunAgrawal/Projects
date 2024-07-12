<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="stylesheet" href="css/ul.css">
</head>
<body>
  <div class="full-page">
    <div class="navbar">
      <div><h1>Vehicle Assistance</h1></div>
      <nav>
        <ul id='MenuItems'>
          <li><a href='index.jsp'>Home</a></li>
          <li><a href='ml.jsp'>Mechanic</a></li>
          <li><a href='al.jsp'>Admin</a></li>
        </ul>
      </nav>
      </div>
    </div> 
  
    <div class="login-wrapper">
      <form class="form" action="login.jsp" method="post">
        <i class="fas fa-user-circle"></i>
        <input class="user-input" type="text" name="uid" placeholder="Username" required>
        <input class="user-input" type="password" name="pwd" placeholder="Password" required>
        <div class="options-01">
        <label class="remember-me"><input type="checkbox" name="">Remember me</label><a href="fp.jsp">Forgot your password?</a>
        </div>
        <input class="btn" type="submit" name="" value="LOGIN">
        <div class="options-02">
          <p>Not Registered? <a href="ur.html">Create an Account</a></p>
        </div>
      </form>
    </div>
  </body>
</html>