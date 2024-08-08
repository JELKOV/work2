<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.MemberDTO" %>
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
</head>
<body>
<%
MemberDTO loggedInMember = (MemberDTO) session.getAttribute("loggedInMember");
// 세션에 업데이트된 회원 목록을 저장
ArrayList<MemberDTO> members = memberDAO.selectAll();
session.setAttribute("members", members);
    // 로그인 세션이 유지되고 있다면
    if (loggedInMember!= null) {
%>
        <h2><%= loggedInMember.getName() %>님, 안녕하세요 ! :D</h2>
        <h3>=== 이 사이트의 회원목록 ===</h3>
        <%
            // 반복문을 통해서 회원 목록을 보여준다.
		for(MemberDTO member: members){
			out.println(member.getMid() + " " + member.getName() + "<br />");
		}
        %>
<%
    } else {
%>
        <h2>로그인이 되어 있지 않습니다.</h2>
<%
    }
%>
<button type="button" onclick="location.href='a.jsp'">처음으로 돌아가기</button>
</body>
</html>

