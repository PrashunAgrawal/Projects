<%@ page import="java.sql.*"%>
<%
	String uid=request.getParameter("loginUser");
  	String pwd=request.getParameter("loginPassword");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
	
		PreparedStatement ps = con.prepareStatement("select * from admin where admin_id=? and admin_pwd=?");
		ps.setString(1,uid);
		ps.setString(2,pwd);
   
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
     		session.setAttribute("auserid",uid);
	        response.sendRedirect("adminh.jsp");
		}
		else{
%>
<script language="javascript" type="text/javascript">
    alert("Login failed. Invalid details!!!")
    window.location="al.jsp";
</script>
<%
		}
  	}
	catch(Exception e){}
%>