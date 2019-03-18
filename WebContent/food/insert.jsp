<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String foodName = request.getParameter("foodName");
String foodPrice = request.getParameter("foodPrice");
if(foodName==null){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
</head>
<body>
<form method= "post">
	메뉴이름 : <input type="text" name="foodName"><br>
	메뉴가격 : <input type="number" name="foodPrice"><br>
	<button>메뉴등록</button>
</form>
</body>
</html>
<%
}else{
	String sql =" insert into food(food_num, food_name, food_price)";
		sql += " values((select nvl(max(food_num),0)+1 from food),?,?)";
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1,foodName);
	ps.setString(2,foodPrice);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		out.println("메뉴 등록 성공!");
	}else{
		out.println("메뉴 등록 실패!");
	}
		out.println("<a href=\"/jsp-study/food/list.jsp\">메뉴리스트</a>");	
}
%>