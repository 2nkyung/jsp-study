<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Map<String,String[]> map = request.getParameterMap();
Set<String> keys = map.keySet();
Iterator<String> it = keys.iterator();
while(it.hasNext()){
	String key = it.next();
	String[] values = map.get(key);
	if("content".equals(key)){
		out.write(key + ":" + values[0].replace("\r", "<br>")+"<br>");
	}else{
		out.write(key + ":" + values[0]+"<br>");
	}
}
%>