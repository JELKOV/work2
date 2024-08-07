<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="NewFile4.jsp" method="POST">
  포워드(forward) 방식으로 데이터를 전송 <input type="text" name="apple"> <input type="submit" value="전송"> 
</form>
<hr>
<form action="NewFile5.jsp" method="POST">
  리다이렉트(sendRedirect) 방식으로 데이터를 전송 <input type="text" name="apple"> <input type="submit" value="전송">
</form>
</body>
</html>