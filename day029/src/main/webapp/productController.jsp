<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="product.ProductDAO, product.ProductDTO, java.util.ArrayList" %>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="session" />
<jsp:useBean id="productDTO" class="product.ProductDTO" scope="session" />
<%
    String action = request.getParameter("action");

    ArrayList<ProductDTO> datalists = new ArrayList<>(); // 초기화

    if (action.equals("MAIN")) {
        // 검색 기능 처리
        String searchKeyword = request.getParameter("searchKeyword");
        out.println(searchKeyword);
        String searchContent = request.getParameter("searchContent");

        // 검색 키워드에 따라 다른 검색 로직 적용
        if (searchKeyword.equals("NAME")) {
            productDTO.setName(searchContent);
            productDTO.setCondition("NAME");
            datalists = productDAO.selectAll(productDTO);
        } 
        else if (searchKeyword.equals("SELLER")) {
            productDTO.setSeller(searchContent);
            productDTO.setCondition("SELLER");
            datalists = productDAO.selectAll(productDTO);
        }else{
        	datalists = productDAO.selectAll(productDTO);
        }

        // 검색 결과를 main.jsp에 포워드
        request.setAttribute("datas", datalists);
        pageContext.forward("main.jsp");

    } else if (action.equals("PRODUCT")) {
        // 특정 상품의 상세 정보 조회 처리
        int num = Integer.parseInt(request.getParameter("num"));
        productDTO.setNum(num);
        ProductDTO productDetails = productDAO.selectOne(productDTO);
        if (productDetails != null) {
            request.setAttribute("product", productDetails);
            pageContext.forward("product.jsp");
        } else {
            out.println("<script>alert('해당 상품이 없습니다.'); location.href='main.jsp';</script>");
        }
    } else {
        out.println("<script>alert('잘못된 접근입니다.'); location.href='main.jsp';</script>");
    }
%>
