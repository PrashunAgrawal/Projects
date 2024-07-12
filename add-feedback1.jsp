<%@ page import="java.sql.*"%>
<% 
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
        PreparedStatement ps = con.prepareStatement("insert into feedback values(?,?,?,?,?)");

        int fid = Integer.parseInt(request.getParameter("fid"));
        String fdate = request.getParameter("fdate");
        String cid = session.getAttribute("cuserid").toString();
        String mid = request.getParameter("muserid");
        String msg = request.getParameter("msg");

        ps.setInt(1,fid);
        ps.setString(2, fdate);
        ps.setString(3, cid);
        ps.setString(4, mid);
        ps.setString(5, msg);

        ps.executeUpdate();
%>
        <script language="javascript" type="text/javascript">
        alert("Feedback posted successfully!!!")
        window.location="home.jsp";
        </script>    					
<% 	
            con.close();
    }
    catch(Exception e){
%>
        <script language="javascript" type="text/javascript">
        alert("Error in posting feedback")
        window.location="home.jsp";
        </script>
<%
    }
%>


