<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="product.ProductDAO, product.ProductDTO, java.util.ArrayList" %>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="request" />
<jsp:useBean id="productDTO" class="product.ProductDTO" scope="request" />
<%
    // 사용자로부터 전달된 id와 cnt 파라미터를 가져옴
    int productId = Integer.parseInt(request.getParameter("id"));
    int selectedCnt = Integer.parseInt(request.getParameter("cnt"));

    // 상품 정보 가져오기
    productDTO.setNum(productId);
    ProductDTO productDetails = productDAO.selectOne(productDTO);

    if (productDetails != null) {
        // 장바구니에서 동일한 상품의 기존 수량을 찾기
        ArrayList<ProductDTO> cart = (ArrayList<ProductDTO>) session.getAttribute("carts");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean itemExists = false;
        int existingCnt = 0;

        // 장바구니에 동일한 상품이 있는지 확인
        for (ProductDTO item : cart) {
            if (item.getNum() == productDetails.getNum()) {
                // 동일한 상품이 있으면 기존 수량을 가져옴
                existingCnt = item.getCnt();
                itemExists = true;
                break;
            }
        }

        // 선택한 수량과 기존 수량의 합이 재고를 초과하지 않는지 확인
        if (selectedCnt + existingCnt <= productDetails.getCnt()) {
            if (itemExists) {
                // 동일한 상품이 있으면 수량만 증가
                for (ProductDTO item : cart) {
                    if (item.getNum() == productDetails.getNum()) {
                        item.setCnt(existingCnt + selectedCnt);
                        break;
                    }
                }
            } else {
                // 동일한 상품이 없으면 새로 추가
                productDetails.setCnt(selectedCnt); // 장바구니에 담는 수량 설정
                cart.add(productDetails);
            }

            // 세션에 장바구니 정보 저장
            session.setAttribute("carts", cart);

            // 성공 메시지와 함께 장바구니 페이지로 리다이렉트
            out.println("<script>alert('상품이 장바구니에 추가되었습니다.'); location.href='cart.jsp';</script>");
        } else {
            // 수량 초과 시 에러 메시지
            out.println("<script>alert('선택한 수량이 재고를 초과합니다. 현재 장바구니에 있는 수량을 포함하여 다시 선택해주세요.'); location.href='productController.jsp?action=PRODUCT&num=" + productId + "';</script>");
        }
    } else {
        // 상품이 존재하지 않을 경우 에러 메시지
        out.println("<script>alert('해당 상품이 없습니다.'); location.href='main.jsp';</script>");
    }
%>
