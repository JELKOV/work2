<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="member.MemberDAO" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" />
<jsp:setProperty property="id" name="memberDTO" />

<%
    String id = request.getParameter("id");
    memberDTO.setId(id);

    if (memberDAO.selectOne(memberDTO) != null) {
        out.print("invalid");
    } else {
        out.print("valid");
    }
%>
