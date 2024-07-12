<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    String cuserid = session.getAttribute("cuserid").toString();
    String muserid = request.getParameter("uid");
    float dist = Float.parseFloat(request.getParameter("dist"));
	float lat = Float.parseFloat(request.getParameter("lat"));
	float lon = Float.parseFloat(request.getParameter("lon"));

	PreparedStatement ps = con.prepareStatement("insert into request(cust_username, mechanic_username,latitude, longitude, distance) values(?,?,?,?,?)");

    ps.setString(1, cuserid);
    ps.setString(2, muserid);
    ps.setFloat(3, dist);
	ps.setFloat(4, lat);
	ps.setFloat(5, lon);

    ps.executeUpdate();
%>
<script>
    alert("Request submitted successfully.")
    window.location = "home.jsp"
</script>
