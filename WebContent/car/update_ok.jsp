<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String carNum = request.getParameter("carNum");
    String carName = request.getParameter("carName");
    String carYear = request.getParameter("carYear");
    String sql = "update car_info set ci_name=?, ci_year=? ";
    sql += " where ci_num=?";
    
    PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
    ps.setString(1, carName);
    ps.setString(2, carYear);
    ps.setString(3, carNum);
    int cnt = ps.executeUpdate();
    String result = "수정이 실패했습니다.";
    if(cnt==1){
    	result = "수정이 성공하였습니다.";
    }
    %>
<script>
	alert("<%=result%>");
	location.href="/jsp-study/car/view.jsp?carNum=<%=carNum%>";
</script>