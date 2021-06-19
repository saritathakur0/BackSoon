<%@ page import = "java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS?characterEncoding=utf8","root","root");
	PreparedStatement pstmt = conn.prepareStatement("select email,pwd from Signup where email=? and pwd=?");
	
	pstmt.setString(1, email);
	pstmt.setString(2, password);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
       	out.println("Logged in Succcesfully");
    }
}
catch(Exception e){
	out.println(e);
}
%>