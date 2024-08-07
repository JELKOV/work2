<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%
    String cartProduct = request.getParameter("product");
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<String>();
        session.setAttribute("cart", cart);
    }
    if (cartProduct != null) {
        cart.add(cartProduct);
    }
%>
<script>
    alert('장바구니에 상품을 추가했습니다!');
    setTimeout(function() {
        window.location.href = 'e.jsp';
    }, 1000); // 1초 후에 리디렉션
</script>

