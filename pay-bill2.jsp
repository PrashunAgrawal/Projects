<%@ page import="java.sql.*, java.text.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    int bid = Integer.parseInt(request.getParameter("bid"));
    int rid = Integer.parseInt(request.getParameter("rid"));
    String cardno = request.getParameter("cardno");
    String bname = request.getParameter("bname");

    PreparedStatement ps = con.prepareStatement("update bill set card_no=?, bank_name=?, bill_status='Paid' where bill_no=?");
    ps.setString(1,cardno);
    ps.setString(2,bname);
    ps.setInt(3,bid);
    ps.executeUpdate();

    ps = con.prepareStatement("update request set status='Closed' where request_id = ?");
    ps.setInt(1, rid);
    ps.executeUpdate();
%>
<script language="javascript" type="text/javascript">
    alert("Bill paid successfully!!!")
    window.location="home.jsp";
</script>    					



