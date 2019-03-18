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
String name = "ㅇㄹ";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "osfu";
String pwd = "12345678";
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection(url, user, pwd);
String sql = "delete from users where name=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,name);
int cnt = ps.executeUpdate();
String result = "실패";
if(cnt==1){
	result = "성공";
}
%>
삭제 결과 : <%=result %>
</body> 
</html>