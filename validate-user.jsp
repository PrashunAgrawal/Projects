<%@page import="java.sql.*"%>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	Statement s = con.createStatement();

	ResultSet rs = s.executeQuery("SELECT * from customer");
%>
<div class="container">
<br><br>
<center><a href="adminh.jsp" class="btn btn-success">Home</a></center><br><br>
<table class="table table-hover">
<tr>
	<th>User Name</th>
	<th>Full Name</th>
    <th>Address</th>
    <th>Email ID</th>
	<th>Mobile No</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
</tr>
<%
	}
%>
</table>
</div>