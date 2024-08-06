<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="test02.SignUp" id="sb" />
<jsp:setProperty property="*" name="sb" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
    <%
        sb.sign();
    %>
    <form method="POST">
        ID: <input type="text" name="id" required placeholder="아이디를 입력하세요" value="<%= sb.getId() %>"> <br>
        Password: <input type="password" name="password" required placeholder="비밀번호를 입력하세요"> <br>
        <input type="submit" value="회원가입"> <br>
    </form>
    <hr>
    회원가입 결과: <jsp:getProperty property="res" name="sb" />
                 <%=sb.getRes() %><!-- 주로 이렇게 쓰임 -->
</body>
</html>
