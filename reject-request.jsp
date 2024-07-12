<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    int rid = Integer.parseInt(request.getParameter("rid"));

    PreparedStatement ps = con.prepareStatement("update request set status='Reject' where request_id=?");
    ps.setInt(1,rid);
    ps.executeUpdate();

    response.sendRedirect("view-request.jsp");
%>

