<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<div class="container">
<%@ page import="java.sql.*, java.text.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    String cid = session.getAttribute("cuserid").toString();

    PreparedStatement ps = con.prepareStatement("select bill_no, bill_date, vehicle_no, bill_amt, card_no, bank_name, bill_status from bill, request where bill.request_id = request.request_id and cust_username = ?");
    ps.setString(1, cid);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>
<table class="table">
<tr>
    <td><b>Bill No:</b></td><td><%=rs.getString(1)%></td>
</tr>
<tr>
    <td><b>Bill Date:</b></td><td><%=rs.getString(2)%></td>
</tr>
<tr>
    <td><b>Vehicle No:</b></td><td><%=rs.getString(3)%></td>
</tr>
<tr>
    <td><b>Bill Amount:</b></td><td><%=rs.getString(4)%></td>
</tr>
<tr>
    <td><b>Card No:</b></td><td><%=rs.getString(5)%></td>
</tr>
<tr>
    <td><b>Bank Name:</b></td><td><%=rs.getString(6)%></td>
</tr>
<tr>
    <td><b>Bill Status:</b></td><td><%=rs.getString(7)%></td>
</tr>
</table>
<table class="table">
<tr>
	<th>Services</th>
</tr>
<%
	ResultSet rs1 = con.createStatement().executeQuery("select service_name from services, bill_services where bill_services.service_id = services.service_id and bill_no="+rs.getInt(1));
	while(rs1.next()){
%>
<tr>
	<td><%=rs1.getString(1)%></td>
</tr>
<%
	}
%>
</table>
<%
    }
%>
</div>