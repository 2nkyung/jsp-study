<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String,String> user = (Map<String,String>)session.getAttribute("user");
if(user==null){
	response.sendRedirect("/jsp-study/login/login.jsp");
}else{
	out.print(user.get("ui_name") + "님 환영합니다.");
}
%>
<c:set var="str" value="abc"/>
<c:out value="${str}"/>
${str}
</body>
</html>