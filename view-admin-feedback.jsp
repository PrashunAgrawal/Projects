<%@page import="java.sql.*" %>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    PreparedStatement ps = con.prepareStatement("select feedback_id, feedback_date, fullname, feedback_msg from feedback, customer where feedback.cust_userid = customer.username order by feedback_id");
	ResultSet rs = ps.executeQuery();
%>
<div class="container">
<br><br>
<center><a href="adminh.jsp" class="btn btn-success">Home</a></center><br><br>
<table class="table table-hover">
<tr>
    <th>Feedback ID</th>
	<th>Feedback Date</th>
	<th>Customer Name</th>
	<th>Feedback</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
</tr>
<%
	}
%>
</table>
</div>