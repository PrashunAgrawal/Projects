<%@ page import="java.sql.*, java.text.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
    Statement s = con.createStatement();
    ResultSet rs = s.executeQuery("select count(*) from feedback");
    rs.next();
    int fid = rs.getInt(1)+1;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="css/ur.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"> 

  </head>
  <body>
  <form class="form" action="add-feedback1.jsp" method="post">
    <b style="color: white;">Feedback ID:</b>
    <input class="user-input" type="text" name="fid" value="<%=fid%>" readonly>
    <b style="color: white;">Feedback Date:</b>
    <input class="user-input" type="text" name="fdate" value="<%=format.format(new java.util.Date())%>" readonly>
    <b style="color: white;">Mechanic:</b>
    <select class="user-input" name="muserid" style="color: black" required>
    <option value="">Select Mechanic</option>
<%
    s = con.createStatement();
    rs = s.executeQuery("select username, mechanic_fullname from mechanic where status=1");

    while(rs.next()){
%>
    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
<%
    }
%>
    </select>
    <b style="color: white;">Feedback:</b>
    <input class="user-input" type="text" name="msg" placeholder = "Enter your feedback here" required>
    <input class="btn" type="submit" name="" value="POST">
  </form>
</body>
</html>