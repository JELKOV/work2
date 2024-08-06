<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" scope="request" />
<jsp:setProperty property="*" name="memberDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
    function validatePassword() {
        var password = document.getElementsByName("password")[0].value;
        var confirmPassword = document.getElementsByName("confirmpassword")[0].value;
        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        return true;
    }

    function checkId() {
        var id = document.getElementsByName("id")[0].value;
        // 서버에 중복 확인 요청을 보냅니다.
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkId.jsp", true); // checkId.jsp는 아이디 중복 확인을 위한 서블릿 또는 JSP 페이지
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (xhr.responseText.trim() === "valid") {
                    alert("사용 가능한 아이디입니다.");
                    document.getElementById("registerButton").style.display = "block";
                } else {
                    alert("이미 사용 중인 아이디입니다.");
                    document.getElementById("registerButton").style.display = "none";
                }
            }
        };
        xhr.send("id=" + encodeURIComponent(id));
    }
</script>
</head>
<body>
    <form method="POST" onsubmit="return validatePassword()">
        아이디 <input type="text" name="id" required> <button type="button" onclick="checkId()">중복확인</button>
        <br>
        비밀번호 <input type="password" name="password" required>
        <br>
        비밀번호 확인 <input type="password" name="confirmpassword" required>
        <br>
        <input type="submit" id="registerButton" value="회원가입" style="display: none;">
    </form>
    <hr>
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            if (memberDAO.selectOne(memberDTO) != null) {
                // 아이디 중복 체크 로직
                out.print(memberDTO.getId());
                out.print(memberDTO.getPassword());
                out.print("이미 사용 중인 아이디입니다.");
            } else {
                // 회원 가입 로직
                if (memberDAO.insert(memberDTO)) {
                    out.print("회원가입이 완료되었습니다.");
                } else {
                    out.print("회원가입이 실패하였습니다.");
                }
            }
        }
    %>
</body>
</html>
