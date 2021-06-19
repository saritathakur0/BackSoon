<%@ page import = "java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS?characterEncoding=utf8","root","root");
	PreparedStatement pstmt = conn.prepareStatement("insert into Signup(name, email, pwd) values(?,?,?)");
	
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, password);

	int cnt = pstmt.executeUpdate();				                
	if(cnt==1){
	out.println("Succcesfull");
	}
}
catch(Exception e){
	out.println(e);
}
%>