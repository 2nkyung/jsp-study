<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 목록</title>
</head>
<body>
	<%
		String foodName = request.getParameter("food_name");
		String foodPrice = request.getParameter("food_price");
		if (foodName != null && !"".equals(foodName)) {
	%>
	검색한 음식 이름 :
	<%=foodName%><br> 검색한 음식 가격 :
	<%=foodPrice%><br>
	<%
		}
	%>
	<form>
		<!-- form 에 아무것도 안적었을경우, action="", method="get" -->
		<input type="text" name="food_name"> <br> <input
			type="text" name="food_price"> <br>
		<button>검색</button>
	</form>
	<%
		String sql = "select food_num, food_name, food_price from food";
		sql += " where 1=1";
		if (foodName != null && !"".equals(foodName)) {
			sql += " and food_name like ?";
		}
		if (foodPrice != null && !"".equals(foodPrice)) {
			sql += " and food_price = ?";
		}
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			int cnt = 1;
			if (foodName != null && !"".equals(foodName)) {
				ps.setString(cnt++, "%" + foodName + "%");
			}
			if (foodPrice != null && !"".equals(foodPrice)) {
				ps.setString(cnt++, foodPrice);
				// 데이터베이스에 문자열을 넣어도, 형식이 숫자면 자동변환 
			}
			sql += " order by food_num";
			ResultSet rs = ps.executeQuery();
			out.write("<table border=\"1\">");
			while (rs.next()) {
				out.write("<tr>");
				out.write("<td>" + rs.getInt("food_num") + "</td>");
				out.write("<td>");
				out.write("<a href=\"/jsp-study/food/view.jsp?foodNum="+rs.getInt("food_num")+"\">");
				out.write(rs.getString("food_name") + "</a></td>");
				out.write("<td>" + rs.getInt("food_price") + "</td>");
				out.write("<td><button onclick=\"foodDelete(" + rs.getInt("food_num")+ ")\">삭제</button></td>");
				out.write("</tr>");
			}
			out.write("</table>");
		} catch (Exception e) {
		} finally {
			DBCon.close();
		}
	%>
<a href="/jsp-study/food/insert.jsp"></a>	
<script>
	function foodDelete(foodNum){
		var isDelete = confirm("진짜 삭제하게?");
		if (isDelete){
			location.href="/jsp-study/food/delete_ok.jsp?foodNum="+foodNum;
		}
	}
</script>
</body>
</html>