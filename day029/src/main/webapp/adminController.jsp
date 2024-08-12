<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="product.ProductDTO, product.ProductDAO" %>

<%
    // 요청에서 action 파라미터를 받아 처리할 작업을 결정
    String action = request.getParameter("action");
    ProductDAO dao = new ProductDAO();

    if ("addProduct".equals(action)) {
        // 새 상품 추가 로직
        try {
            int productNum = Integer.parseInt(request.getParameter("productNum"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int price = Integer.parseInt(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String seller = request.getParameter("seller");

            ProductDTO product = new ProductDTO();
            product.setNum(productNum);
            product.setName(productName);
            product.setDetails(description);
            product.setPrice(price);
            product.setCnt(stock);
            product.setSeller(seller);

            boolean isAdded = dao.insert(product);

            if (isAdded) {
                out.println("<script>alert('상품이 성공적으로 추가되었습니다.'); location.href='admin.jsp';</script>");
            } else {
                out.println("<script>alert('상품 추가에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('상품 추가 중 오류가 발생했습니다: " + e.getMessage() + "'); history.back();</script>");
        }

    } else if ("deleteProduct".equals(action)) {
        // 상품 삭제 로직
        try {
            int productNum = Integer.parseInt(request.getParameter("productNum"));

            ProductDTO product = new ProductDTO();
            product.setNum(productNum);

            boolean isDeleted = dao.delete(product);

            if (isDeleted) {
                out.println("<script>alert('상품이 성공적으로 삭제되었습니다.'); location.href='admin.jsp';</script>");
            } else {
                out.println("<script>alert('상품 삭제에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('상품 삭제 중 오류가 발생했습니다: " + e.getMessage() + "'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('유효하지 않은 요청입니다.'); location.href='admin.jsp';</script>");
    }
%>
