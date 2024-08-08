<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.MemberDTO, member.MemberDAO" %>
<%
    String mid = request.getParameter("mid");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    // 디버깅 로그: 입력된 사용자 정보
    /*
    if (mid == null || password == null || name == null) {
        out.println("입력된 값 중 null이 있습니다. mid: " + mid + ", password: " + password + ", name: " + name + "<br>");
    } else {
        out.println("입력된 사용자 ID: " + mid + "<br>");
        out.println("입력된 비밀번호: " + password + "<br>");
        out.println("입력된 사용자 이름: " + name + "<br>");
    }
    */

    // 세션에서 MemberDAO 객체 가져오기
    MemberDAO memberDAO = (MemberDAO) session.getAttribute("memberDAO");
    if (memberDAO == null) {
        memberDAO = new MemberDAO();
        session.setAttribute("memberDAO", memberDAO);
    }

    // 중복검사를 위해 MemberDTO 객체 생성
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setMid(mid);
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
        MemberDTO newMember = new MemberDTO();
        newMember.setMid(mid);
        newMember.setPassword(password);
        newMember.setName(name);
        
        // insert 요청
        boolean insertResult = memberDAO.insert(newMember);

        // 세션에 업데이트된 회원 목록을 저장
        ArrayList<MemberDTO> members = memberDAO.selectAll(); // DAO에서 최신 회원 목록 가져오기
        session.setAttribute("members", members);

%>
        <script>
            alert('회원가입에 성공하였습니다');
            setTimeout(function() {
                window.location.href = 'a.jsp';
            }, 1000); // 1초 후에 리디렉션
        </script>
<%
    }
%>
