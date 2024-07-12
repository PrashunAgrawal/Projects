<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	String uid = request.getParameter("uid");
	int status = Integer.parseInt(request.getParameter("status"));

	status = status==0?1:0;

	PreparedStatement ps = con.prepareStatement("UPDATE mechanic SET status=? WHERE username=?");

	ps.setInt(1, status);
	ps.setString(2, uid);

	ps.executeUpdate();

	response.sendRedirect("validate-mechanic.jsp");
%>