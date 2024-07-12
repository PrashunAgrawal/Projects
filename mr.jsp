<%@ page import="java.sql.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/ur.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    </head>
<body>
<% 
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
        PreparedStatement ps = con.prepareStatement("insert into mechanic values(?,?,?,?,?,?,?,?,?,0)");
        String sname = request.getParameter("sname");
        String fname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        float lat = Float.parseFloat(request.getParameter("lat"));
        float lon = Float.parseFloat(request.getParameter("lon"));

        ps.setString(1,username);
        ps.setString(2,password);
        ps.setString(3,sname);
        ps.setString(4,fname);
        ps.setString(5,address);
        ps.setString(6,email);
        ps.setString(7,phone);
        ps.setFloat(8, lat);
        ps.setFloat(9, lon);

	    ps.executeUpdate();
%>
    <script language="javascript" type="text/javascript">
    alert("You are registered successfully!!!")
    window.location="ml.jsp";
    </script>    					
<% 	
	    con.close();
    }
    catch(Exception e){
	%>
	<script language="javascript" type="text/javascript">
    alert("Error in creating account")
    window.location="mr.html";
    </script>
<%
    }
%>
</body>
</html>