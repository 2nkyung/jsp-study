<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String foodNum = request.getParameter("foodNum");
String sql = "select food_num, food_name, food_price"
		+" from food where food_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,foodNum);
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
니가 보고 싶은 메뉴 번호 : <%=foodNum%>
<form method="post" action="/jsp-study/food/update_ok.jsp">
	번호 : <input type="number" name="foodNum" value="<%=foodNum%>" readonly="readonly"><br>
	메뉴명 : <input type="text" name="foodName" value="<%=rs.getString("food_name")%>"><br>
	메뉴가격 : <input type="number" name="foodPrice" value="<%=rs.getString("food_price")%>"><br>
	<button>수정</button>
</form>
<a href="/jsp-study/food/list.jsp">메뉴리스트</a>
</body>
</html>
<%
}else{
	out.write("<b>조회하신 " + foodNum + "번 번호는 존재하지 않습니다!</b>");
	out.write("<a href=\"/jsp-study/food/list.jsp\">메뉴리스트</a>");
}
%>