<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO, member.MemberDAO" %>
<jsp:useBean id="memberDTO" class="member.MemberDTO" scope="request"/>
<jsp:setProperty property="*" name="memberDTO" />
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session" />
<%
    memberDTO.setCondition("LOGIN");
    MemberDTO member = memberDAO.selectOne(memberDTO);

    if (member != null) {
        // 로그인 성공
        session.setAttribute("loggedInMember", member);
        response.sendRedirect("b.jsp");
    } else {
%>
        <script>
            alert('로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.');
            history.go(-1);
        </script>
<%
    }
%>
