<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String carName = request.getParameter("carName");
String carYear = request.getParameter("carYear");
String carVendor = request.getParameter("carVendor");
String carEtc = request.getParameter("carEtc");
if(carName==null){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 차 등록</title>
</head>
<body>
<form method= "post">
	차 이름 : <input type="text" name="carName"><br>
	차 연식 : <input type="number" name="carYear"><br>
	차 회사 : <input type="text" name="carVendor"><br>
	메모 : <input type="text" name="carEtc"><br>
	<button>메뉴등록</button>
</form>
</body>
</html>
<%
}else{
	String sql =" insert into car_info(ci_num, ci_name, ci_year, ci_vendor, ci_etc)";
		sql += " values((select nvl(max(ci_num),0)+1 from car_info),?,?,?,?)";
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1,carName);
	ps.setString(2,carYear);
	ps.setString(3,carVendor);
	ps.setString(4,carEtc);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		out.println("메뉴 등록 성공!");
	}else{
		out.println("메뉴 등록 실패!");
	}
		out.println("<a href=\"/jsp-study/car/list.jsp\">차 목록</a>");	
}
%>