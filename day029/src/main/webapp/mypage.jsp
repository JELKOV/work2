<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #content {
            background-color: #ffffff;
            padding: 30px;
            margin-top: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5); /* 배경을 더 어둡게 */
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }
        .modal-content {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2); /* 더 깊은 그림자 */
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-sizing: border-box;
            position: relative;
            animation: modalFadeIn 0.3s ease; /* 모달이 부드럽게 나타나도록 애니메이션 */
        }
        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .modal-content input[type="text"],
        .modal-content input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        .modal-content input[type="text"]:focus,
        .modal-content input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }
        .modal-content button {
            background-color: #007bff;
            color: white;
            padding: 12px 0;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover {
            background-color: #0056b3;
        }
        .close {
            color: #aaa;
            position: absolute;
            right: 20px;
            top: 20px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover,
        .close:focus {
            color: black;
        }
    </style>
</head>
<body>
    <div id="content">
        <h2>마이 페이지</h2>
        <button onclick="openNameChangeModal()">이름 변경</button>
        <button onclick="openDeleteAccountModal()">계정 삭제</button>
        <button onclick="location.href='main.jsp'">메인 페이지로 돌아가기</button>
    </div>

    <!-- 이름 변경 모달 -->
    <div id="nameChangeModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('nameChangeModal')">&times;</span>
            <h3>이름 변경</h3>
            <form action="mypageController.jsp?action=changeName" method="POST">
                <input type="text" name="newName" placeholder="새 이름 입력" required>
                <button type="submit">확인</button>
            </form>
        </div>
    </div>

    <!-- 계정 삭제 모달 -->
    <div id="deleteAccountModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('deleteAccountModal')">&times;</span>
            <h3>계정 삭제</h3>
            <p>계정을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.</p>
            <form action="mypageController.jsp?action=deleteAccount" method="POST">
                <input type="text" name="username" placeholder="아이디 입력" required>
                <input type="password" name="password" placeholder="비밀번호 입력" required>
                <button type="submit">계정 삭제</button>
            </form>
        </div>
    </div>

    <script>
        // 모달 열기
        function openNameChangeModal() {
            document.getElementById('nameChangeModal').style.display = 'flex';
        }

        function openDeleteAccountModal() {
            document.getElementById('deleteAccountModal').style.display = 'flex';
        }

        // 모달 닫기
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            var nameChangeModal = document.getElementById('nameChangeModal');
            var deleteAccountModal = document.getElementById('deleteAccountModal');
            if (event.target === nameChangeModal) {
                closeModal('nameChangeModal');
            } else if (event.target === deleteAccountModal) {
                closeModal('deleteAccountModal');
            }
        }
    </script>
</body>
</html>
