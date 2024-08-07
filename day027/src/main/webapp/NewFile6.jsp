<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 도착페이지</title>
</head>
<body>
<h1>데이터 도착페이지</h1>
<%=request.getParameter("apple") %> <br>
<%=request.getParameter("kiwi") %>
</body>
</html>