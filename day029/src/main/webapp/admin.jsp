<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 모드</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: 20px auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #5d9cec;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        button:hover {
            background-color: #4a8cd4;
        }
    </style>
</head>
<body>
    <h1>관리자 모드</h1>

    <form action="adminController.jsp" method="POST">
        <input type="hidden" name="action" value="addProduct">
        <label for="productNum">상품번호:</label>
        <input type="text" id="productNum" name="productNum" required>

        <label for="productName">상품명:</label>
        <input type="text" id="productName" name="productName" required>

        <label for="description">상품 설명:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <label for="price">가격:</label>
        <input type="number" id="price" name="price" required>

        <label for="stock">재고:</label>
        <input type="number" id="stock" name="stock" required>

        <label for="seller">판매자:</label>
        <input type="text" id="seller" name="seller" required>

        <button type="submit">새상품 추가</button>
    </form>

    <form action="adminController.jsp" method="POST" style="margin-top: 20px;">
        <input type="hidden" name="action" value="deleteProduct">
        <label for="deleteProductNum">삭제할 상품번호:</label>
        <input type="text" id="deleteProductNum" name="productNum" required>
        <button type="submit">상품 삭제</button>
    </form>
</body>
</html>
