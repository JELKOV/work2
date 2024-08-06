<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="member.MemberDAO" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h2>회원가입</h2>
<form method="POST">
    아이디: <input type="text" name="id" required><br><br>
    비밀번호: <input type="password" name="password" required><br><br>
    비밀번호 확인: <input type="password" name="passwordConfirm" required><br><br>
    <input type="submit" value="가입">
</form>
<hr>
<%
    if(request.getMethod().equals("POST")){
    	String id=request.getParameter("id");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");

       
        if (!password.equals(passwordConfirm)) {
            out.println("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
        } else if (memberDAO.selectOne(memberDTO) != null) {
            out.println("아이디가 이미 존재합니다. 다른 아이디를 선택해주세요.");
        } else {
            if(memberDAO.insert(memberDTO)){
            	out.println("회원가입이 성공적으로 완료되었습니다!");
            }else{
            	out.println("회원가입이 실패 하였습니다!");
            }      
        }
    }
%>

</body>
</html>
