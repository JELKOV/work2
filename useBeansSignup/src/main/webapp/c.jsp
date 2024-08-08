<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="e.jsp" method="post">
        아이디: <input type="text" name="mid" /><br />
        비밀번호: <input type="password" name="password" /><br />
        이름: <input type="text" name="name" /><br />
        <input type="submit" value="회원가입" />
        <button type="button" onclick="location.href='a.jsp'">처음으로 돌아가기</button>
    </form>
</body>
</html>