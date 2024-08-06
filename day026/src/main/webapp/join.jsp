<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
    <%
        String id = "";
        String password = "";
        String res = "";
        boolean found = false;

        // 샘플 회원 데이터베이스 (배열을 이용한 시뮬레이션)
        String[] registeredUsers = {"teemo", "ari", "jaeho"};

        if(request.getMethod().equals("POST")){
            id = request.getParameter("id");
            password = request.getParameter("password");

            // 입력된 아이디가 데이터베이스에 존재하는지 확인
            for (String registeredId : registeredUsers) {
                if (id.equals(registeredId)) {
                    found = true;
                    break;
                }
            }

            if(found) {
                res = "이미 있는 아이디 입니다.";
            } else {
                res = "이건 없어요 괜찮아요";
            }
        }
    %>
    <form method="POST">
        ID: <input type="text" name="id" required placeholder="아이디를 입력하세요" value="<%= id %>"> <br>
        Password: <input type="password" name="password" required placeholder="비밀번호를 입력하세요" value="<%= password %>"> <br>
        <input type="submit" value="회원가입"> <br>
    </form>
    <hr>
    회원가입 결과: <%= res %>
</body>
</html>
