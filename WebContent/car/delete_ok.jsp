<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    request.setCharacterEncoding("utf-8");
    String carNum = request.getParameter("carNum");
    String sql = "delete from car_info";
    sql += " where ci_num=?";
    
    PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
    ps.setString(1, carNum);
    int cnt = ps.executeUpdate();
    String result = "삭제가 실패했습니다.";
    if(cnt==1){
    	result = "삭제가 성공하였습니다.";
    }
    %>
    
<script>
	alert("<%=result%>");
	location.href="/jsp-study/car/list.jsp";
</script>