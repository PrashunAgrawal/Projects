<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="stylesheet" href="css/adminh.css">
    <!---we had linked our css file----->
</head>
<body>
    
    <div class="full-page">
        <div class="navbar">
            <div>
                <h1>Vehicle Assistance</h1>
            </div>
            <nav>
                <ul id='MenuItems'>
                    <li><a href='validate-mechanic.jsp'>View Mechanic</a></li>
                    <li><a href='validate-user.jsp'>View Users</a></li>
                    <li><a href='view-admin-feedback.jsp'>View Feedback</a></li>
                    <li><a href='view-service.jsp'>View Service</a></li>
                    <li><a href='view-admin-request.jsp'>View Request</a></li>
                    <li><a href='al.jsp' class="logout_btn">Logout</a></li>
                </ul>
           </nav>
       </div>
    </div> 
  
       </body>
</html>