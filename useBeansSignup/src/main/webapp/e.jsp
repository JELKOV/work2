<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ page import="member.MemberDTO, member.MemberDAO" %>
<jsp:useBean id="memberDTO" class="member.MemberDTO" scope="request"/>
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session" />
<jsp:setProperty property="*" name="memberDTO" />

<%
    // 중복검사
    memberDTO.setCondition("CHECKID");
    MemberDTO existingMember = memberDAO.selectOne(memberDTO);

    if (existingMember != null) {
%>
        <script>
            alert('이미 존재하는 아이디입니다.');
            history.go(-1);
        </script>
<%
    } else {
        // 새로운 회원 추가
        boolean insertResult = memberDAO.insert(memberDTO);

        if (insertResult) {
%>
        <script>
            alert('회원가입에 성공하였습니다');
            setTimeout(function() {
                window.location.href = 'a.jsp';
            }, 1000); // 1초 후에 리디렉션
        </script>
<%
        } else {
%>
        <script>
            alert('회원가입에 실패하였습니다');
            history.go(-1);
        </script>
<%
        }
    }
%>
