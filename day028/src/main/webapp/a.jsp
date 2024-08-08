<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="d.jsp" method="post">
	아이디:<input type="text" name="mid" required placeholder="아이디를 입력하세요"> <br>
	비밀번호:<input type="password" name="password" required placeholder="비밀번호를 입력하세요"> <br>
	<input type="submit" value="로그인">  <button type="button" onclick="location.href='c.jsp'">회원가입</button>
</form>
</body>
</html>
