<%@ page import="java.sql.*"%>

<%
	try
  	{
		String uid=request.getParameter("mid");
		String pwd=request.getParameter("mpwd");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle","root","");
	
   		PreparedStatement ps=con.prepareStatement("select * from mechanic where username=? and password=? and status=1");
		ps.setString(1,uid);
		ps.setString(2,pwd);

		ResultSet rs = ps.executeQuery();
   		
		if(rs.next()){
	        session.setAttribute("muserid",uid);
	        response.sendRedirect("mh.jsp");
		}
		else{
%>
<script language="javascript" type="text/javascript">
	alert("Login failed. Invalid details or account not activated yet!!!")
	window.location="ml.jsp"
</script>
<%
		} 
  	}
	catch(Exception e){}
%>