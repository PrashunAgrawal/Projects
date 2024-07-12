<%@ page import="java.sql.*, java.text.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
    PreparedStatement ps = con.prepareStatement("select * from bill where bill_no=?");
    int bno = Integer.parseInt(request.getParameter("bno"));
    ps.setInt(1, bno);
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
  <body>
  <form class="form" action="pay-bill2.jsp" method="post">
    <b style="color: white;">Bill No:</b>
    <input class="user-input" type="text" name="bid" value="<%=rs.getInt(1)%>" readonly>
    <b style="color: white;">Bill Date:</b>
    <input class="user-input" type="text" name="bdate" value="<%=rs.getString(2)%>" readonly>
    <b style="color: white;">Request ID:</b>
    <input class="user-input" type="text" name="rid" value='<%=rs.getString(3)%>' readonly>
    <b style="color: white;">Vehicle No:</b>
    <input class="user-input" type="text" name="vno" value='<%=rs.getString(4)%>' readonly>
    <b style="color: white;">Bill Amount:</b>
    <input class="user-input" type="text" name="bamt" value='<%=rs.getString(5)%>' readonly>
    <b style="color: white;">Services:</b>
    <p style="text-align: left;">
    <ol style="color:white;">
<%
    ps = con.prepareStatement("select service_name from services, bill_services where bill_services.service_id = services.service_id and bill_no=?");
    ps.setInt(1,bno);
    rs = ps.executeQuery();
    while(rs.next()){
%>
    <li><%=rs.getString(1)%></li>
<%
    }
%>
    </ol>
    </p>
    <b style="color: white;">Card No:</b>
    <input class="user-input" type="text" name="cardno" placeholder="Card No" pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}" required>
    <b style="color: white;">Bank Name:</b>
    <input class="user-input" type="text" name="bname" placeholder="Bank Name" required>
    <input class="btn" type="submit" name="" value="PAY NOW">
  </form>
</body>
</html>