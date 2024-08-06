<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<jsp:useBean class="member.MemberBean" id="mb" />
<jsp:setProperty property="*" name="mb" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		mb.check();
	%>

	<form method="POST">
		아이디 <input type="text" name="id"> <input type="submit"
			value="중복확인">
	</form>
	<hr>
	<jsp:getProperty property="msg" name="mb" />
	<%=mb.getMsg()%>

</body>
</html>