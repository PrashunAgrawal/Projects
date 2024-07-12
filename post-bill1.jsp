<%@ page import="java.sql.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");

    PreparedStatement ps = con.prepareStatement("select * from bill where request_id=?");
    ps.setInt(1,Integer.parseInt(request.getParameter("rid")));
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
%>
    <script language="javascript" type="text/javascript">
    alert("Bill already sent")
    window.location="generate-bill.jsp";
    </script>    					
<%
    }
    else{
        ps = con.prepareStatement("insert into bill(bill_no, bill_date, request_id, vehicle_no, bill_amt) values(?,?,?,?,?)");

        ps.setInt(1,Integer.parseInt(request.getParameter("bid")));
        ps.setString(2, request.getParameter("bdate"));
        ps.setInt(3,Integer.parseInt(request.getParameter("rid")));
        ps.setString(4, request.getParameter("vno"));
        ps.setInt(5, Integer.parseInt(request.getParameter("bamt")));

        ps.executeUpdate();

        ps = con.prepareStatement("insert into bill_services values(?,?)");
        String sids[] = request.getParameterValues("sid");
        for(int i=0; i<sids.length; i++){
            ps.setInt(1, Integer.parseInt(request.getParameter("bid")));
            ps.setInt(2, Integer.parseInt(sids[i]));
            ps.executeUpdate();
        }
%>
        <script language="javascript" type="text/javascript">
        alert("Bill posted successfully!!!")
        window.location="generate-bill.jsp";
        </script>    					
<% 	
    }
%>


