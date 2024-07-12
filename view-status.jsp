<%@page import="java.sql.*" %>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    String cuserid = session.getAttribute("cuserid").toString();

    PreparedStatement ps = con.prepareStatement("select request_id, request_date, status from request where cust_username=?");
    ps.setString(1,cuserid);
	ResultSet rs = ps.executeQuery();
%>
<div class="container">
<br><br>
<center><a href="home.jsp" class="btn btn-success">Home</a></center><br><br>
<table class="table table-hover">
<tr>
    <th>Request ID</th>
	<th>Request Date</th>
	<th>Status</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
</tr>
<%
	}
%>
</table>
</div>