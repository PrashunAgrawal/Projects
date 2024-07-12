<%@page import="java.sql.*" %>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    String muserid = session.getAttribute("muserid").toString();

    PreparedStatement ps = con.prepareStatement("select request_id, request_date, fullname, phone, request.latitude, request.longitude,distance"+
                " from customer, request"+
                " where customer.username = request.cust_username and request.mechanic_username=? and request.status='Pending'");
    ps.setString(1,muserid);
	ResultSet rs = ps.executeQuery();
%>
<div class="container">
<br><br>
<center><a href="mh.jsp" class="btn btn-success">Home</a></center><br><br>
<table class="table table-hover">
<tr>
    <th>Request ID</th>
	<th>Request Date</th>
	<th>Name</th>
	<th>Phone</th>
	<th>Latitude</th>
	<th>Longitude</th>
	<th>Distance</th>
    <th></th>
    <th></th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><a href="accept-request.jsp?rid=<%=rs.getInt(1)%>" class="btn btn-warning">Accept</a></td>
    <td><a href="reject-request.jsp?rid=<%=rs.getInt(1)%>" class="btn btn-warning">Reject</a></td>
</tr>
<%
	}
%>
</table>
</div>