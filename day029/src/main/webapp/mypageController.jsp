<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="member.MemberDAO, member.MemberDTO"%>


<%
    // 세션에서 로그인된 사용자 정보를 가져옵니다.
    MemberDTO loginMember = (MemberDTO) session.getAttribute("member");
    
    // 로그인이 되어 있지 않으면 메인 페이지로 리다이렉트
    if (loginMember == null) {
        response.sendRedirect("main.jsp");
        return;
    }

    // 요청 파라미터에서 action 값을 가져와 해당 동작을 수행할 수 있도록 설정
    String action = request.getParameter("action");
    
    // MemberDAO 인스턴스 생성 (DB와의 연동을 위한 객체)
    MemberDAO memberDAO = new MemberDAO();

    // action 값에 따라 각각의 처리 분기
    if (action.equals("changeName")) {
        // 이름 변경 처리 로직

        // 새로 입력된 이름을 폼에서 받아옴
        String newName = request.getParameter("newName");

        // 입력된 새 이름이 null이 아니고 비어있지 않은 경우에만 처리
        if (newName != null && !newName.isEmpty()) {
            // 현재 로그인된 사용자의 이름을 새 이름으로 업데이트
            loginMember.setName(newName);
            // 업데이트 조건 설정 (여기서는 이름 변경)
            loginMember.setCondition("CHANGENAME");

            // 업데이트 성공 여부에 따라 사용자에게 피드백 제공
            boolean isUpdated = memberDAO.update(loginMember);
            if (isUpdated) {
                // 이름 변경 성공 시 경고창 출력 후 마이페이지로 리다이렉트
                out.println("<script>alert('이름이 성공적으로 변경되었습니다.'); location.href='mypage.jsp';</script>");
            } else {
                // 이름 변경 실패 시 경고창 출력 후 마이페이지로 리다이렉트
                out.println("<script>alert('이름 변경에 실패했습니다. 다시 시도해주세요.'); location.href='mypage.jsp';</script>");
            }
        } else {
            // 새 이름이 입력되지 않은 경우 경고창 출력 후 마이페이지로 리다이렉트
            out.println("<script>alert('새 이름을 입력하세요.'); location.href='mypage.jsp';</script>");
        }

    } else if (action.equals("deleteAccount")) {
        // 계정 삭제 처리 로직

        // 폼에서 입력된 아이디와 비밀번호를 받아옴
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 입력된 아이디와 비밀번호가 현재 로그인된 사용자 정보와 일치하는지 확인
        if (username != null && password != null &&
            username.equals(loginMember.getMid()) && password.equals(loginMember.getPassword())) {

            // 일치하는 경우, 계정 삭제 시도
            boolean isDeleted = memberDAO.delete(loginMember);
            if (isDeleted) {
                // 계정 삭제 성공 시 세션을 무효화하고 메인 페이지로 리다이렉트
                session.invalidate();
                out.println("<script>alert('계정이 성공적으로 삭제되었습니다.'); location.href='main.jsp';</script>");
            } else {
                // 계정 삭제 실패 시 경고창 출력 후 마이페이지로 리다이렉트
                out.println("<script>alert('계정 삭제에 실패했습니다. 다시 시도해주세요.'); location.href='mypage.jsp';</script>");
            }
        } else {
            // 입력된 아이디 또는 비밀번호가 일치하지 않을 경우 경고창 출력 후 마이페이지로 리다이렉트
            out.println("<script>alert('아이디 또는 비밀번호가 올바르지 않습니다. 다시 확인해주세요.'); location.href='mypage.jsp';</script>");
        }

    } else {
        // 정의되지 않은 action 값이 들어왔을 경우 경고창 출력 후 마이페이지로 리다이렉트
        out.println("<script>alert('올바르지 않은 요청입니다.'); location.href='mypage.jsp';</script>");
    }
%>
