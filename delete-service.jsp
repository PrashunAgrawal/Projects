<%@page import="java.sql.*"%>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	int sid = Integer.parseInt(request.getParameter("sid"));

    PreparedStatement ps = con.prepareStatement("delete from services where service_id=?");
    ps.setInt(1, sid);

    ps.executeUpdate();

    response.sendRedirect("view-service.jsp");
%>
