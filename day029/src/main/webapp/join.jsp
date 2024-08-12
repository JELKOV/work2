<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        #signup-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
        }
        label {
            font-size: 14px;
            color: #555;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #5d9cec;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #4a8cd4;
        }
        .back-button {
            background-color: #f0f2f5;
            color: #333;
            margin-top: 15px;
        }
        .back-button:hover {
            background-color: #e0e3e8;
        }
    </style>
</head>
<body>
    <div id="signup-container">
        <h1>회원가입</h1>
        <form action="joinController.jsp" method="post">
            <label for="userId">ID:</label>
            <input type="text" id="userId" name="userId" required><br>

            <label for="password">PASSWORD:</label>
            <input type="password" id="password" name="password" required><br>

            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required><br>

            <button type="submit">회원가입</button>
        </form>
        <button class="back-button" onclick="location.href='main.jsp'">메인으로 돌아가기</button>
    </div>
</body>
</html>
