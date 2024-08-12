<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="product.ProductDAO, product.ProductDTO, java.util.ArrayList" %>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="session" />
<jsp:useBean id="productDTO" class="product.ProductDTO" scope="request" />
<%
    // 사용자로부터 전달된 선택된 상품들의 ID를 가져옴
    String[] selectedProducts = request.getParameterValues("selectedProducts");
    ArrayList<ProductDTO> cart = (ArrayList<ProductDTO>) session.getAttribute("carts");

    if (selectedProducts != null && cart != null) {
        for (String productId : selectedProducts) {
            int id = Integer.parseInt(productId);
            int cnt = Integer.parseInt(request.getParameter("selectedCnt_" + id));

            // 해당 상품을 장바구니에서 찾아 처리
            for (int i = 0; i < cart.size(); i++) {
                ProductDTO product = cart.get(i);
                if (product.getNum() == id) {
                    // 여기서 구매 로직을 추가하고, 성공하면 장바구니에서 제거
                    boolean purchaseSuccess = productDAO.update(product);
                    if (purchaseSuccess) {
                        cart.remove(i);
                    }
                    break;
                }
            }
        }
        // 변경된 장바구니를 세션에 다시 저장
        session.setAttribute("carts", cart);

        // 성공 메시지와 함께 메인 페이지로 리다이렉트
        out.println("<script>alert('구매가 완료되었습니다.'); location.href='main.jsp';</script>");
    } else {
        // 선택된 상품이 없거나 장바구니가 비어있는 경우
        out.println("<script>alert('구매할 상품이 선택되지 않았습니다.'); location.href='cart.jsp';</script>");
    }
%>
