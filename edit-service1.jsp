<%@page import="java.sql.*"%>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

	int sid = Integer.parseInt(request.getParameter("sid"));
    String sname = request.getParameter("sname");

    PreparedStatement ps = con.prepareStatement("update services set service_name=? where service_id=?");
    ps.setString(1, sname);
    ps.setInt(2, sid);

    ps.executeUpdate();

    response.sendRedirect("view-service.jsp");
%>
