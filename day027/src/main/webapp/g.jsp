<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매하기</title>
</head>
<body>
    <h1>장바구니 출력</h1>
    <ul>
    <%
        ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
        session.removeAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
            for (String cartProduct : cart) {
                out.println("<li>" + cartProduct + "</li>");
            }
        } else {
            out.println("나의 카드는 비어 있습니다..");
        }
    %>
    </ul>
<form action="e.jsp" method="get">
    <input type="submit" value="상품구매로 돌아가기">
</form>
</body>
</html>
