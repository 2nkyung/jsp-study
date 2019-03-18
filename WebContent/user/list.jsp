<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="test.jsp.study.common.NumberTest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println(NumberTest.COUNTER++);

try{
String sql = "select name, birth, id, pwd from users";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	out.println(rs.getString("name"));
	out.println("," + rs.getString("birth"));
	out.println("," + rs.getString("id"));
	out.println("," + rs.getString("pwd"));
	out.println("<br>");
	}
}catch(Exception e){
	
}finally{
	DBCon.close();
}
%>

</body>
</html>