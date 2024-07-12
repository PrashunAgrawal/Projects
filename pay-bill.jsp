<%@page import="java.sql.*" %>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    String cuserid = session.getAttribute("cuserid").toString();

    PreparedStatement ps = con.prepareStatement("select bill_no, bill_date, bill.request_id, vehicle_no, bill_amt from bill, request where bill.request_id = request.request_id and bill_status='Pending' and cust_username=?");
    ps.setString(1,cuserid);
	ResultSet rs = ps.executeQuery();
%>
<div class="container">
<br><br>
<center><a href="home.jsp" class="btn btn-success">Home</a></center><br><br>
<table class="table table-hover">
<tr>
    <th>Bill No</th>
	<th>Bill Date</th>
	<th>Request ID</th>
	<th>Vehicle No</th>
	<th>Bill Amt</th>
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
	<td><a href="pay-bill1.jsp?bno=<%=rs.getInt(1)%>" class="btn btn-warning">Pay Bill</a></td>
</tr>
<%
	}
%>
</table>
</div>