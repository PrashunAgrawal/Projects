<%@page import="java.sql.*" errorPage="err.jsp"%>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	int sid = Integer.parseInt(request.getParameter("sid"));

    PreparedStatement ps = con.prepareStatement("select * from services where service_id=?");
    ps.setInt(1, sid);
     
	ResultSet rs = ps.executeQuery();
    rs.next();
%>
<div class="container">
<br><br>
<center><a href="adminh.jsp" class="btn btn-success">Home</a></center><br>
<form method="POST" action="edit-service1.jsp">
<table align="center" class="table">
    <tr><td><b>Service ID:</b></td><td align="center"><input type="text" name="sid" value="<%=rs.getInt(1)%>" readonly></td></tr>
    <tr><td><b>Service Name:</b></td><td align="center"><input type="text" name="sname" value="<%=rs.getString(2)%>" placeholder="Service name" required</td></tr>
    <tr><td align="center" colspan="2"><input type="submit" value="UPDATE" class="btn btn-info"></td></tr>
</table>
</form>
</div>