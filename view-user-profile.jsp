<%@ page import="java.sql.*"%>
<% 
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
        PreparedStatement ps = con.prepareStatement("select * from customer where username=?");
        String cuserid = session.getAttribute("cuserid").toString();
        ps.setString(1, cuserid);
        ResultSet rs = ps.executeQuery();
        rs.next();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"> 
    <link rel="stylesheet" href="css/ur.css">
  </head>
  <body>

  <form class="form" action="edit-user-profile.jsp" method="post">
    <i class="fas fa-user-plus"></i>
    <input class="user-input" type="text" name="username" placeholder="Username" value="<%=rs.getString(1)%>" required>
    <input class="user-input" type="password" name="password" placeholder="Create Password" value="<%=rs.getString(2)%>" required>
    <input class="user-input" type="text" name="fullname" placeholder="Fullname" value="<%=rs.getString(3)%>" required>
    <input class="user-input" type="text" name="address" placeholder="Address" value="<%=rs.getString(4)%>" required>
    <input class="user-input" type="email" name="email" placeholder="Email" value="<%=rs.getString(5)%>" required>
    <input class="user-input" type="tel" name="phone" placeholder="Phone No" pattern="[789][0-9]{9}" value="<%=rs.getString(6)%>" required>
    <input class="btn" type="submit" name="" value="UPDATE">
  </form>
</body>
</html>
<%
    }
    catch(Exception e){}
%>