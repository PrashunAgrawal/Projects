<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="stylesheet" href="css/ml.css">
</head>
<body>
    <div class="full-page">
        <div class="navbar">
            <div>
                <h1>Mechanic Login</h1>
            </div>
            <nav>
                <ul id='MenuItems'>
                    <li><a href='ul.jsp'>Home</a></li>
                </ul>
           </nav>
       </div>
    </div> 
  
     <div class="login-wrapper">
      <!--login form start-->
      <form class="form" action="mlogin.jsp" method="post">
        <i class="fas fa-user-circle"></i>
        <input class="user-input" type="text" name="mid" placeholder="Username" required>
        <input class="user-input" type="password" name="mpwd" placeholder="Password" required>
        <div class="options-01">
          <label class="remember-me"><input type="checkbox" name="">Remember me</label>
          <a href="fp.jsp">Forgot your password?</a>
        </div>
        <input class="btn" type="submit" name="" value="LOGIN">
        <div class="options-02">
          <p>Not Registered? <a href="mr.html">Create an Account</a></p>
        </div>
      </form>
    </div>
  </body>
</html>