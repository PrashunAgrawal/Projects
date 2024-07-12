<%@ page import="java.sql.*"%>
<% 
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
        PreparedStatement ps = con.prepareStatement("select * from mechanic where username=?");
        String muserid = session.getAttribute("muserid").toString();
        ps.setString(1, muserid);
        ResultSet rs = ps.executeQuery();
        rs.next();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="css/ur.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"> 


  </head>
  <body onload="getLocation()">
  <form class="form" action="edit-mechanic-profile.jsp" method="post">
    <i class="fas fa-user-plus"></i>
    <input class="user-input" type="text" name="username" placeholder="Username" value="<%=rs.getString(1)%>" readonly>
    <input class="user-input" type="password" name="password" placeholder="Create Password" value="<%=rs.getString(2)%>" required>
    <input class="user-input" type="text" name="sname" placeholder="Service center name" value="<%=rs.getString(3)%>" required>
    <input class="user-input" type="text" name="fullname" placeholder="Mechanic fullname" value="<%=rs.getString(4)%>" required>
    <input class="user-input" type="text" name="address" placeholder="Address" value="<%=rs.getString(5)%>" required>
    <input class="user-input" type="email" name="email" placeholder="Email" value="<%=rs.getString(6)%>" required>
    <input class="user-input" type="tel" name="phone" placeholder="Phone No" value="<%=rs.getString(7)%>" pattern="[789][0-9]{9}" required>
    <input class="user-input" type="text" name="lat" id="lat" placeholder="Latitude" value="<%=rs.getString(8)%>" readonly>
    <input class="user-input" type="text" name="lon" id="lon" placeholder="Longitude" value="<%=rs.getString(9)%>" readonly>
    <input class="btn" type="submit" name="" value="UPDATE">
  </form>

  <script>
    var x = document.getElementById("lat")
    var y = document.getElementById("lon")

    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition)
      } else {
        x.innerHTML = "Geolocation is not supported by this browser."
      }
    }
    
    function showPosition(position) {
      x.value = position.coords.latitude 
      y.value = position.coords.longitude
    }
    </script>

</body>
</html>
<%
    }
    catch(Exception e){}
%>