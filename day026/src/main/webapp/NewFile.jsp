<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>안녕하세요 !</h1>
<h2><%=new Date() %></h2>
<!--JSP에서는 HTML 뿐만 아니라, JAVA도 가능 -->
<%--JSP 주석 (개발자만 볼떄 쓰인다 안보이기 때문에)--%>
<%@  %> page 지시어
<%= %>  표현식

결론)WEB에서 JAVA를 사용하는 이유 ? 
HTML은 제어문이 없기 때문

초기)Servlet이라는 notPOJO 클래스 활용하여 JAVA안에 HTML을 작성
현재) JSP 언어를 사용 HTML 안에 JAVA를 작성
</body>
</html>