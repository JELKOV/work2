<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO, member.MemberDAO" %>
<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="memberDTO" class="member.MemberDTO" scope="request"/>
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO" />

<%
    // 회원가입 폼에서 넘어온 데이터 수집
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    String userName = request.getParameter("userName");

    // 아이디 중복 체크를 위한 조건 설정
    memberDTO.setMid(userId);
    memberDTO.setCondition("IDCHECK");
    out.println(memberDTO);

    // 아이디 중복 체크
    MemberDTO existMember = memberDAO.selectOne(memberDTO);
    if (existMember != null) {
        // existMember의 정보를 출력해 중복된 아이디가 있는지 확인
        out.println("중복된 아이디: " + existMember.getMid());
    } else {
        out.println("아이디 중복 없음");
    }

    if (existMember != null) {
        // 아이디가 이미 존재하는 경우
        %>
        <script>
            alert('이미 존재하는 아이디입니다.');
            history.go(-1);
        </script>
        <%
    } else {
        // 회원 정보 DTO 객체 생성 및 설정
        memberDTO.setPassword(password);
        memberDTO.setName(userName);
        memberDTO.setRole("USER"); // 기본적으로 가입자는 USER 역할

        // 회원 정보 DB에 저장
        boolean isInserted = memberDAO.insert(memberDTO);

        if (isInserted) {
            // 회원가입 성공
            out.println("<script>alert('회원가입이 성공적으로 완료되었습니다.'); location.href='main.jsp';</script>");
        } else {
            // 회원가입 실패
            out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
        }
    }
%>
