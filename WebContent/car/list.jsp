<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차 목록</title>
</head>
<body>
	<%
		String carName = request.getParameter("ci_name");
		String carYear = request.getParameter("ci_year");
		if (carName != null && !"".equals(carName)) {
	%>
	검색한 차 이름 :
	<%=carName%><br> 
	검색한 차 연식 :
	<%=carYear%><br>
	<%
		}
	%>
	<form>
		<!-- form 에 아무것도 안적었을경우, action="", method="get" -->
		차 이름 : <input type="text" name="ci_name"> <br> 
		차 연식 : <input type="text" name="ci_year"> <br>
		
		<button>검색</button>
	</form>
	<%
		String sql = "select ci_num, ci_name, ci_year, ci_vendor, ci_etc from car_info";
		sql += " where 1=1";
		if (carName != null && !"".equals(carName)) {
			sql += " and ci_name like ?";
		}
		if (carYear != null && !"".equals(carYear)) {
			sql += " and ci_year = ?";
		}
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			int cnt = 1;
			if (carName != null && !"".equals(carName)) {
				ps.setString(cnt++, "%" + carName + "%");
			}
			if (carYear != null && !"".equals(carYear)) {
				ps.setString(cnt++, carYear);
				// 데이터베이스에 문자열을 넣어도, 형식이 숫자면 자동변환 
			}
			sql += " order by ci_num";
			ResultSet rs = ps.executeQuery();
			out.write("<table border=\"1\">");
			while (rs.next()) {
				out.write("<tr>");
				out.write("<td>" + rs.getInt("ci_num") + "</td>");
				out.write("<td>");
				out.write("<a href=\"/jsp-study/car/view.jsp?carNum="+rs.getInt("ci_num")+"\">");
				out.write(rs.getString("ci_name") + "</a></td>");
				out.write("<td>" + rs.getInt("ci_year") + "</td>");
				out.write("<td>"+ rs.getString("ci_vendor")+"</td>");
				out.write("<td>" + rs.getString("ci_etc")+"</td>");
				out.write("<td><button onclick=\"carDelete(" + rs.getInt("ci_num")+ ")\">삭제</button></td>");
				out.write("</tr>");
			}
			out.write("</table>");
		} catch (Exception e) {
		} finally {
			DBCon.close();
		}
	%>
<a href="/jsp-study/car/insert.jsp"></a>	
<script>
	function carDelete(carNum){
		var isDelete = confirm("진짜 삭제하게?");
		if (isDelete){
			location.href="/jsp-study/car/delete_ok.jsp?carNum="+carNum;
		}
	}
</script>
</body>
</html>