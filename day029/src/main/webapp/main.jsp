<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="product.ProductDTO, java.util.ArrayList, member.MemberDTO"  %>
<jsp:useBean id="memberDTO" class="member.MemberDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Icons');

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
		#header {
		    width: 100%;
		    background-color: #5d9cec;
		    padding: 10px 20px;
		    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		    display: flex;
		    justify-content: space-between; /* 왼쪽과 오른쪽 요소들을 균등하게 배치 */
		    align-items: center;
		    box-sizing: border-box; /* 패딩과 테두리를 포함하여 크기 계산 */
		}
		
		#login {
		    display: flex;
		    align-items: center;
		    gap: 10px; /* 아이콘 간격 축소 */
		    flex-wrap: wrap; /* 필요한 경우 요소를 줄 바꿈 가능 */
		}
		
		#login a, #login button {
		    display: flex;
		    align-items: center;
		    gap: 5px; /* 아이콘과 텍스트 사이 간격 축소 */
		    background-color: transparent;
		    color: white;
		    padding: 8px 10px; /* 패딩을 조정하여 공간 절약 */
		    text-decoration: none;
		    border: 2px solid transparent;
		    border-radius: 8px;
		    cursor: pointer;
		    font-size: 14px;
		    box-sizing: border-box;
		    transition: background-color 0.3s, border 0.3s;
		}
		
		#login a:hover, #login button:hover {
		    background-color: rgba(255, 255, 255, 0.2);
		    border: 2px solid white;
		}

        .material-icons {
            font-size: 18px;
        }
        #content {
            background-color: #fff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 600px;
            margin: 20px auto;
        }
        h2 {
            color: #fff;
            background-color: #5d9cec;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            letter-spacing: 1px;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product-item {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            width: calc(50% - 20px);
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transition: box-shadow 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: #333;
        }
        .product-item:hover {
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
        }
        .product-item .product-name {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .product-item .product-stock {
            font-size: 14px;
            color: #888;
        }
        .out-of-stock {
            background-color: #ffc107;
            color: #fff;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div id="header">
        <div id="login">
            <%
            // 로그인 여부 확인
            MemberDTO loginUser = (MemberDTO) session.getAttribute("member");

            if (loginUser != null) {  // 로그인 상태
            %>
            <a href="cart.jsp">
                <span class="material-icons">shopping_bag</span> 장바구니
            </a>
            <a href="mypage.jsp">
                <span class="material-icons">person</span> 마이페이지
            </a>
            <a href="logoutController.jsp">
                <span class="material-icons">logout</span> 로그아웃
            </a>
            <%
            // 로그인한 사용자가 ADMIN일 경우 관리자 모드 버튼 추가
            if ("ADMIN".equals(loginUser.getRole())) {
            %>
                <a href="admin.jsp">
                    <span class="material-icons">admin_panel_settings</span> 관리자 모드
                </a>
            <%
            }
        } else {  // 로그인하지 않은 상태
            %>
            <form action="mainController.jsp" method="POST" style="display: flex; align-items: center; gap: 10px;">
                <input type="text" name="mid" required placeholder="아이디">
                <input type="password" name="password" required placeholder="비밀번호">
                <button type="submit">
                    <span class="material-icons">login</span> 로그인
                </button>
            </form>
            <a href="join.jsp">
                <span class="material-icons">person_add</span> 회원가입
            </a>
            <%
            }
            %>
        </div>
    </div>
    
    <div id="content">
        <div id="search">
            <form action="productController.jsp" method="GET">
                <input type="hidden" name="action" value="MAIN">
                카테고리 
                <select name="searchKeyword">
                    <option value="NAME">상품명</option>
                    <option value="SELLER">판매자 이름</option>
                </select>
                <input type="text" name="searchContent" placeholder="검색어를 입력하세요.">
                <input type="submit" value="검색하기">
            </form>
        </div>

        <h2>상품 목록</h2>

        <div class="product-list">
            <%
            // 상품 목록을 가져와서 출력하는 부분
            ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>) request.getAttribute("datas");
            if (datas != null) {
                for (ProductDTO data : datas) {
            %>
                    <a href="productController.jsp?action=PRODUCT&num=<%=data.getNum()%>" class="product-item">
                        <div class="product-name"><%=data.getName()%></div>
                        <div class="product-seller"><%=data.getSellerName()%></div>
                        <div class="product-stock">
                            <%
                            if (data.getCnt() <= 0) {
                            %>
                                <span class="out-of-stock">품절</span>
                            <%
                            } else {
                            %>
                                재고: <%=data.getCnt()%>개
                            <%
                            }
                            %>
                        </div>
                    </a>
            <%
                }
            } else {
            %>
                <p>상품이 없습니다.</p>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>
