<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("난", "누구?");
request.setAttribute("종인", "commit");
session.setAttribute("backend", "뒤끝");
application.setAttribute("왜웃어?", "같이웃자");


//response.sendRedirect("/jsp-study/req/req2.jsp");
RequestDispatcher rd = request.getRequestDispatcher("/req/req2.jsp");
rd.forward(request,response);
%>