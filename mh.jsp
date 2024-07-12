<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="stylesheet" href="css/mh.css">
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
                    <li><a href='view-mechanic-profile.jsp'>View Profile</a></li>        
                    <li><a href='generate-bill.jsp'>Generate bill</a></li>
                    <li><a href='view-mechanic-feedback.jsp'>View Feedback</a></li>
                    <li><a href='view-request.jsp'>View User Request</a></li>
                    <li><a href='ml.jsp' class="logout_btn">Logout</a></li>
                </ul>
           </nav>
       </div>
    </div> 
</body>
</html>