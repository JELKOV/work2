<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Collections"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 상품</title>
</head>
<body>
<% 
String name = request.getParameter("name");
if (name != null) {
    session.setAttribute("name", name);
} else {
    name = (String) session.getAttribute("name");
}

//배열리스트를 선언해서 상품을 담아줍니다.
ArrayList<String> products = new ArrayList<String>();
products.add("초코칩");
products.add("칸쵸");
products.add("마카롱");
products.add("콜라");
products.add("아메리카노");

Collections.shuffle(products); // 옵션을 랜덤하게 섞습니다.

String logout = request.getParameter("logout");
if (logout != null && logout.equals("true")) {
    session.removeAttribute("cart");
    //d.jsp로 리다이렉션 해줘
    response.sendRedirect("d.jsp");
    return;
}
%>
<p><%= name %>님 환영합니다!</p>
<form action="f.jsp" method="post">
    <select id="products" name="product">
        <% for (String product : products) { %>
            <option value="<%= product %>"><%= product %></option>
        <% } %>
    </select>
    <input type="submit" value="장바구니 추가">
</form>
<form action="g.jsp" method="post">
    <input type="submit" value="계산하기">
</form>
<form action="e.jsp" method="GET">
	    <input type="hidden" name="logout" value="true">
	    <input type="submit" value="로그아웃">
</form>
</body>
</html>
