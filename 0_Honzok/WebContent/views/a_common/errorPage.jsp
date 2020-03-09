<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"><%= msg %></h1>
	<img src="<%= request.getContextPath() %>/images/errorPage.png" width="100%" style="margin:0;">
</body>
</html>