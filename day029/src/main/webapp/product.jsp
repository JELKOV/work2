<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="product.ProductDTO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 설명</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 10px 5px;
        }
        button:hover {
            background-color: #45a049;
        }
        select {
            padding: 5px;
            font-size: 14px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div id="content">
    <%
    // 세션에서 장바구니 목록을 가져옴
    ArrayList<ProductDTO> cartLists = (ArrayList<ProductDTO>) session.getAttribute("carts");
    ProductDTO Selectproduct = (ProductDTO) request.getAttribute("product");
    int existingCntInCart = 0;

    if (cartLists != null && Selectproduct != null) {
        // 장바구니에 동일한 상품이 있는지 확인하고, 있으면 수량을 가져옴
        for (ProductDTO item : cartLists) {
            if (item.getNum() == Selectproduct.getNum()) {
                existingCntInCart = item.getCnt();
                break;
            }
        }
    }

    if (Selectproduct == null) {
        out.println("<script>alert('상품 정보가 없습니다.'); location.href='main.jsp';</script>");
    } else {
    %>
        <h1>상품 설명</h1>
        <p><strong>상품명:</strong> <%= Selectproduct.getName() %></p>
        <p><strong>가격:</strong> <%= Selectproduct.getPrice() %> 원</p>
        <p><strong>상품설명:</strong> <%= Selectproduct.getDetails() %></p>
        <p><strong>판매자:</strong> <%= Selectproduct.getSellerName() %></p>
        <p><strong>재고:</strong> <%= Selectproduct.getCnt() %> 
        <%
        if (existingCntInCart > 0) {
            out.println("(장바구니에 선택된 수량: " + existingCntInCart + "개)");
        }
        %>
        </p>

        <form action="cartController.jsp" method="GET">
            <input type="hidden" name="id" value="<%= Selectproduct.getNum() %>">
            <label for="cnt">수량선택:</label>
            <select name="cnt" id="cnt">
                <%
                for (int i = 1; i <= Selectproduct.getCnt(); i++) {
                    out.println("<option value='" + i + "'>" + i + "</option>");
                }
                %>
            </select>
            <br>
            <button type="submit">장바구니 담기</button>
        </form>
        <button onclick="location.href='main.jsp'">메인으로 돌아가기</button>
    <%
    }
    %>
    </div>
</body>
</html>
