<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="calc.CalcBean" id="cb"></jsp:useBean> 
<!-- CalcBean cb= new CalcBean(); -->
<!-- jsp 액션태그 -->
<!-- 기본 생성자 밖에 부르지 못한다. -->
<jsp:setProperty property="*" name="cb"/>
<!-- cb.setXxx()를 전부 호출하겠다 -->
<!-- 기본생성자만 부르기 때문에 세터 소환 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기 실습 02</title>
</head>
<body>
	<%
	cb.calc();
	%>
	<!-- 첫화면 보여주기는 GET 이다  -->
	<!--form 태그의 필수설정인 액션을 안준다 -> 본인 자신페이지로 온다. -->
	<form method="POST">
		정수 01 <input type="number" name="num1"> <br> 연산자 <select
			name="op">
			<option>+</option>
			<option>-</option>
			<option>x</option>
		</select> <br> 정수 02 <input type="number" name="num2"> <br> <input
			type="submit" value="계산하기"> <br>
	</form>

	<hr>

	계산결과 : <jsp:getProperty property="res" name="cb"/> <!-- cb.getRes()를 호출하겠다 -->

</body>
</html>