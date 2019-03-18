<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
Connection con;
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "osfu";
String password ="12345678";
Class.forName("oracle.jdbc.OracleDriver");
con = DriverManager.getConnection(url, user, password);
String sql = "insert into users(name, birth, id, pwd)";
sql += " values(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,birth);
ps.setString(3,id);
ps.setString(4,pwd);
int cnt = ps.executeUpdate();
String result = "실패";
if(cnt==1){
	result = "성공";
}
%>
name : <%=name%><br>
birth : <%=birth %><br>
id : <%=id %><br>
pwd : <%=pwd %><br>  
회원가입여부 : <%=result %><br>
<a href="join.jsp">회원가입 돌아가기</a>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>