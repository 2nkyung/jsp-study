<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String[] ciNums = request.getParameterValues("ci_num");

String sql = "delete from car_info where 1=1";
sql += " and ci_num in(";
for(int i=0; i<ciNums.length; i++){
	sql += "?,";
}
sql = sql.substring(0,sql.length()-1);
sql += ")";

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
for(int i=0; i<ciNums.length; i++){
	ps.setString(i+1, ciNums[i]);
}
int cnt = ps.executeUpdate();
String result = "삭제가 실패했습니다.";
if(cnt==ciNums.length){
	result = "삭제가 성공하였습니다.";
}
out.write(sql);
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/cart/list.jsp";

</script>