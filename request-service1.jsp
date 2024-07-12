<%@page import="java.sql.*"%>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    float lat = Float.parseFloat(request.getParameter("lat"));
    float lon = Float.parseFloat(request.getParameter("lon"));

    float dist = 10;

    String query = "SELECT username, service_center_name, mechanic_fullname, address, phone, latitude, longitude, 3956 * 2 * ASIN(SQRT( POWER(SIN((? - latitude)*pi()/180/2),2)+COS(?*pi()/180 )*COS(latitude*pi()/180)*POWER(SIN((?-longitude)*pi()/180/2),2))) as distance FROM mechanic WHERE longitude between (?-?/cos(radians(?))*69) and (?+?/cos(radians(?))*69) and latitude between (?-(?/69)) and (?+(?/69)) having distance < ? ORDER BY distance limit 100"; 

    PreparedStatement ps = con.prepareStatement(query);

    ps.setFloat(1,lat);
    ps.setFloat(2,lat);
    ps.setFloat(3,lon);
    ps.setFloat(4,lon);
    ps.setFloat(5,dist);
    ps.setFloat(6,lat);
    ps.setFloat(7,lon);
    ps.setFloat(8,dist);
    ps.setFloat(9,lat);
    ps.setFloat(10,lat);
    ps.setFloat(11,dist);
    ps.setFloat(12,lat);
    ps.setFloat(13,dist);
    ps.setFloat(14,dist);

    ResultSet rs = ps.executeQuery();
%>
<div class="container">
    <br><br>
    <center><a href="home.jsp" class="btn btn-success">Home</a></center><br><br>
    <table class="table table-hover">
    <tr>
        <th>Service Center Name</th>
        <th>Owner Name</th>
        <th>Address</th>
        <th>Mobile No</th>
        <th>Distance</th>
        <th></th>
    </tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(8)%></td>
        <td><a href="send-request.jsp?uid=<%=rs.getString(1)%>&dist=<%=rs.getString(8)%>&lat=<%=lat%>&lon=<%=lon%>" class="btn btn-warning">Send Request</a></td>
    </tr>
    <%
        }
    %>
    </table>
    </div>