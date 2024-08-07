<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList"%>

<%
    // 세션에서 댓글 목록을 가져와서 캐스팅을 통해 새로운 배열에 담아준다.
    ArrayList<String> comments = (ArrayList<String>) session.getAttribute("comments");
    // 댓글목록이 없을 경우
    if (comments == null) {
    	// 첫 댓글일 경우 새로운 배열리스트를 만들어서 세션에 담아줘
        comments = new ArrayList<String>();
        session.setAttribute("comments", comments);
    }

    // 새로운 댓글과 아이디를 화면에 추가해줘
    String newComment = request.getParameter("comment");
    // 캐스팅을 사용해 문자열 변수에 담아줘 !
    String name = (String) session.getAttribute("name");
    comments.add(name + ": " + newComment);

    // b.jsp로 리다이렉트
    response.sendRedirect("b.jsp");
%>

