<%@page import="java.sql.*"%>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	Statement s = con.createStatement();

	ResultSet rs = s.executeQuery("SELECT * from mechanic");
%>
<div class="container">
<br><br>
<center><a href="adminh.jsp" class="btn btn-success">Home</a></center><br><br>
<table class="table table-hover">
<tr>
	<th>User Name</th>
    <th>Service Center Name</th>
	<th>Owner Name</th>
    <th>Address</th>
    <th>Email ID</th>
	<th>Mobile No</th>
	<th></th>
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
    <td><%=rs.getString(7)%></td>
	<td><a href="validate-mechanic1.jsp?status=<%=rs.getInt(10)%>&uid=<%=rs.getString(1)%>" class="btn btn-warning"><%=rs.getInt(10)==0?"Activate":"Deactivate"%></a></td>
</tr>
<%
	}
%>
</table>
</div>