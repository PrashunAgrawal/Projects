<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/al.css">
  <title>Login Form Demo</title>
</head>
<body>
  <div class="full-page">
        <div class="navbar">
            <div>
                <h1>Admin Login</h1>
            </div>
            <nav>
                <ul id='MenuItems'>
                    <li><a href='ul.jsp'>Home</a></li>
                </ul>
           </nav>
       </div>
    </div>    
  <div class="login-wrapper">
    <form action="alogin.jsp" class="form"method="POST">
      <img src="images/avatar.png" alt="">
      <h2>Login</h2>
      <div class="input-group">
        <input type="text" name="loginUser" id="loginUser" required>
        <label for="loginUser">User Name</label>
      </div>
      <div class="input-group">
        <input type="password" name="loginPassword" id="loginPassword" required>
        <label for="loginPassword">Password</label>
      </div>
      <input type="submit" value="Login" class="submit-btn">
    </form>
 </body>
</html>