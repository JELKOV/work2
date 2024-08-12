<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 무효화 (세션 지우기)
    session.invalidate();
%>
	<script>
	    alert('로그아웃 되었습니다.');
	</script>
<%
	response.sendRedirect("main.jsp");
%>
