<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="member.MemberDAO" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="POST">
		아이디 <input type="text" name="id"> <input type="submit"
			value="중복확인">
	</form>
	<hr>
	<%
		if(request.getMethod().equals("POST")){
			if(memberDAO.selectOne(memberDTO) != null){
	%>
			중복입니다...
	<%
			}
			else{
	%>
			중복이 아니므로 사용가능합니다!
	<%
			}
		}
	%>
	
</body>
</html>