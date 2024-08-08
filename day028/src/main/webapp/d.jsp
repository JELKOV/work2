<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.MemberDTO, member.MemberDAO" %>
<%
    String mid = request.getParameter("mid");
    String password = request.getParameter("password");

    // 디버깅 로그: 입력된 사용자 정보
    /*
    if (mid == null || password == null) {
        out.println("입력된 값 중 null이 있습니다. mid: " + mid + ", password: " + password + "<br>");
    } else {
        out.println("입력된 사용자 ID: " + mid + "<br>");
        out.println("입력된 비밀번호: " + password + "<br>");
    }
    */

    // 세션에서 MemberDAO 객체 가져오기
    MemberDAO memberDAO = (MemberDAO) session.getAttribute("memberDAO");
    if (memberDAO == null) {
        memberDAO = new MemberDAO();
        session.setAttribute("memberDAO", memberDAO);
        out.println("새로운 MemberDAO 객체 생성 및 세션에 저장<br>");
    } else {
        out.println("기존 MemberDAO 객체 사용<br>");
    }

    // 로그인 시도
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setMid(mid);
    memberDTO.setPassword(password);
    memberDTO.setCondition("LOGIN");

    // 디버깅 로그: 조회 조건
    //out.println("조회 조건: " + memberDTO + "<br>");

    MemberDTO member = memberDAO.selectOne(memberDTO);

    // 디버깅 로그: 조회 결과
    //out.println("조회 결과: " + member + "<br>");

    if (member != null) {
        // 로그인 성공
        session.setAttribute("loggedInMember", member);
        response.sendRedirect("b.jsp");
    } else {
%>
        <script>
            // 로그인 실패시 알림
            alert('로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.');
            history.go(-1);
        </script>
<%
    }
%>
