<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="product.ProductDTO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        #content {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 450px;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin-bottom: 30px;
        }
        li {
            background-color: #f9f9f9;
            margin: 15px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        button, input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 10px;
            transition: background-color 0.3s ease;
        }
        button:hover, input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        input[type="checkbox"] {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div id="content">
        <h1>내 장바구니</h1>
        <form action="purchaseController.jsp" method="POST">
            <ul>
                <%
                // 장바구니에 담긴 상품 목록 출력
                ArrayList<ProductDTO> cartLists = (ArrayList<ProductDTO>) session.getAttribute("carts");
                if (cartLists != null && !cartLists.isEmpty()) {
                    for (ProductDTO product : cartLists) {
                %>
                    <li>
                        <input type="checkbox" name="selectedProducts" value="<%= product.getNum() %>">
                        <input type="hidden" name="selectedCnt_<%= product.getNum() %>" value="<%= product.getCnt() %>">
                        <strong><%= product.getName() %></strong> - <%= product.getPrice() %>원 <%= product.getCnt() %>개 <br>
                        총 가격: <%= product.getPrice() * product.getCnt() %>원
                    </li>
                <%
                    }
                } else {
                %>
                    <li>장바구니가 비어 있습니다.</li>
                <%
                }
                %>
            </ul>
            <div class="button-group">
                <input type="submit" value="구매">
                <button type="button" onclick="location.href='main.jsp'">메인으로 돌아가기</button>
            </div>
        </form>
    </div>
</body>
</html>
