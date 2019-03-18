<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String carNum = request.getParameter("carNum");
String sql = "select ci_num, ci_name, ci_year, ci_vendor, ci_etc"
		+" from food where ci_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,carNum);
ResultSet rs = ps.executeQuery();
if(rs.next()){
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
니가 보고 싶은 메뉴 번호 : <%=carNum%>
<form method="post" action="/jsp-study/car/update_ok.jsp">
	번호 : <input type="number" name="carNum" value="<%=carNum%>" readonly="readonly"><br>
	메뉴명 : <input type="text" name="carName" value="<%=rs.getString("ci_name")%>"><br>
	메뉴가격 : <input type="number" name="carYear" value="<%=rs.getString("ci_	year")%>"><br>
	<button>수정</button>
</form>
<a href="/jsp-study/car/list.jsp">차 목록</a>
</body>
</html>
<%
}else{
	out.write("<b>조회하신 " + carNum + "번 번호는 존재하지 않습니다!</b>");
	out.write("<a href=\"/jsp-study/car/list.jsp\">메뉴리스트</a>");
}
%>