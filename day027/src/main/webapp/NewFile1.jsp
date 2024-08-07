<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="NewFile2.jsp" method="POST">
 <table border="1">
   <tr>
         <td>이름</td>
         <td><input type="text" name="name" required placeholder="이름을 작성해주세요"></td>
   </tr>
    <tr>
         <td>비밀번호</td>
         <td><input type="password" name="password" required></td>
   </tr>
    <tr>
         <td>성별</td>
         <td><select name="gender">
         <option>남</option>
         <option>여</option>
         </select></td>
   </tr>
    <tr>
         <td>관심언어</td>
         <td><input type="checkbox" name="lang" value="C언어">C언어<input type="checkbox" name="lang" Value="JAVA">JAVA<input type="checkbox" name="lang" value="python">python</td>
   </tr>
    <tr>
         <td  colspan="2" align="right"><input type="submit" value="회원가입"></td>
   </tr>
 </table>
</form>

</body>
</html>