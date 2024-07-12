<%@ page import="java.sql.*, java.text.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
    Statement s = con.createStatement();
    ResultSet rs = s.executeQuery("select count(*) from bill");
    rs.next();
    int bid = rs.getInt(1)+1;

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
  <form class="form" action="post-bill1.jsp" method="post">
    <b style="color: white;">Bill No:</b>
    <input class="user-input" type="text" name="bid" value="<%=bid%>" readonly>
    <b style="color: white;">Bill Date:</b>
    <input class="user-input" type="text" name="bdate" value="<%=format.format(new java.util.Date())%>" readonly>
    <b style="color: white;">Request ID:</b>
    <input class="user-input" type="text" name="rid" value='<%=request.getParameter("rid")%>' readonly>
    <b style="color: white;">Vehicle No:</b>
    <input class="user-input" type="text" name="vno" placeholder="Vehicle No" pattern="[A-Z]{2} [0-9]{2} [A-Z]{2} [0-9]{4}" required>
    <b style="color: white;">Bill Amount:</b>
    <input class="user-input" type="number" name="bamt" placeholder="Bill Amount" min=500 required>
    <b style="color: white;">Select Services:</b>
    <select class="user-input" name="sid" multiple>
<%
    s = con.createStatement();
    rs = s.executeQuery("select * from services");
    while(rs.next()){
%>
    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
<%
    }
%>
    </select>
    <input class="btn" type="submit" name="" value="SEND">
  </form>
</body>
</html>