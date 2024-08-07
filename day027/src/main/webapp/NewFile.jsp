<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  int n1=10;
  int n2=0;
  int res= n1/n2;
  out.println("<h1>"+n1+"/"+n2+"="+res+"</h1>");
  // 웹에서 간단한 에러는 페이지 이동으로 해결한다.
%>

</body>
</html>