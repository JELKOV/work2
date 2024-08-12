<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.MemberDTO" import="product.ProductDTO" import="java.util.ArrayList"%>
<jsp:useBean id="memberDTO" class="member.MemberDTO" scope="request"/>
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session"/>
<jsp:useBean id="productDTO" class="product.ProductDTO" scope="request"/>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO" />

<%
   // main.jsp는 로그인 정보와 상품 목록을 필요로 한다. 
   // 1. 컨트롤러는 Model 해당 정보를 요청한다.
   	memberDTO.setCondition("LOGIN");
    MemberDTO joinMember = memberDAO.selectOne(memberDTO);
	ArrayList<ProductDTO> productsList = productDAO.selectAll(productDTO);
   // 1-1. 만약 해당 로그인에 성공하면(null이 아닌값이 오면)
   // 1-1. 로그인에 성공하고 로그인이 성공하고, 상품 목록은 없어도 되잖아...
   if (joinMember != null) {
       // 2. 로그인 정보를 세션에 저장 (세션을 통해 로그인 상태를 유지)
       session.setAttribute("member", joinMember);

       // 3. 상품 목록을 request에 저장 (요청 동안 유지)
       request.setAttribute("datas", productsList);

       // 4. main.jsp로 forward
       pageContext.forward("main.jsp");
   } else {
       // 5. 로그인 실패 또는 상품 목록 불러오기 실패 시
       // 에러 메시지를 출력하거나 다른 페이지로 리다이렉트
       %>
        <script>
            alert('아이디와 비밀번호 확인해주세요');
        </script>
      <%
       response.sendRedirect("main.jsp");
   }
%>