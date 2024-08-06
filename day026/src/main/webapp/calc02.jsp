<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기 실습 02</title>
</head>
<body>
	<%
	int res=0;
	if(request.getMethod().equals("POST") ){
		int num1=Integer.parseInt(request.getParameter("num1"));
		String op=request.getParameter("op");
		int num2=Integer.parseInt(request.getParameter("num2"));
		
		if(op.equals("+")) {
			res=num1+num2;
		}
		else if(op.equals("-")) {
			res=num1-num2;
		}
		else {
			res=num1*num2;
		}
	}
	%>
	<!-- 첫화면 보여주기는 GET 이다  -->
	<!--form 태그의 필수설정인 액션을 안준다 -> 본인 자신페이지로 온다. -->
	<form method="POST">
		정수 01 <input type="number" name="num1"> <br> 
		연산자 <select name="op">
			<option>+</option>
			<option>-</option>
			<option>x</option>
		</select> <br> 정수 02 <input type="number" name="num2"> <br> <input
			type="submit" value="계산하기"> <br>
	</form>

	<hr>

	계산결과 : <%=res%>

</body>
</html>