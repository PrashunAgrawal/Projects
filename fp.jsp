<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
    <link rel="stylesheet" type="text/css" href="fp.css">

</head>	
<body>

<div class="form-container">
    <form action="javascript:sendmail()" method="POST" class="form-wrap">
        <h2>Forgot Password</h2>
        <div class="form-box"> 
            <input type="email" id="Sender" placeholder="Enter Email " required>
        </div>
             <div class="form-submit">   
           <button>Send</button>
           </div>
        
 
    </form>
</div>

<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script src="https://smtpjs.com/v3/smtp.js"></script>
 
<script>  

     function sendmail(){
    
			
			var email = $('#Sender').val();
	              

			

			var Body='Email: '+email;
			

			Email.send({
                                Host: "smtp.gmail.com",
                                Username : "vehicleassistance02@gmail.com",
                                Password : "Vehicle1234",
				To: 'vehicleassistance01@gmail.com',
				From: "vehicleassistance02@gmail.com",
				Subject: "Password Recovery",
				Body: Body
			}).then(
				message =>{
					//console.log (message);
					if(message=='OK'){
					alert('Your mail has been send. Thank you for connecting.');
					}
					else{
						console.error (message);
						alert('There is error at sending message. ')
						
					}

				}
			);



		}


    </script>
 </script>

</body>
</html>	