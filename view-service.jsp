<%@page import="java.sql.*"%>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	String sname = request.getParameter("sname");

    if(sname!=null){
        PreparedStatement ps = con.prepareStatement("insert into services(service_name) values(?)");
        ps.setString(1,sname);
        ps.executeUpdate();
    }
    
    Statement s = con.createStatement();

	ResultSet rs = s.executeQuery("SELECT * from services");
%>
<div class="container">
<br><br>
<center><a href="adminh.jsp" class="btn btn-success">Home</a></center><br>
<form method="POST" action="view-service.jsp">
<table align="center" class="table">
    <tr><td><b>Service Name:</b></td><td align="center"><input type="text" name="sname" required></td></tr>
    <tr><td align="center" colspan="2"><input type="submit" value="ADD" class="btn btn-info"></td></tr>
</table>
</form>
<table class="table table-hover">
<tr>
	<th>Service ID</th>
	<th>Service Name</th>
	<th></th>
    <th></th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><a href="delete-service.jsp?sid=<%=rs.getString(1)%>" class="btn btn-warning">Delete</a></td>
	<td><a href="edit-service.jsp?sid=<%=rs.getString(1)%>" class="btn btn-warning">Edit</a></td>
</tr>
<%
	}
%>
</table>
</div>