<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글창</title>
</head>
<body>
<%
    // 이름을 파라미터로가져온 이름 변수 설정 
    String name = request.getParameter("name");
    
    // 이름을 세션에 저장 댓글을 쓰고 와도 이름이 유지되려면 .. 이렇게 해야 되는걸까 ?
    if(name !=null){
    	session.setAttribute("name", name);
    }else{
    	//Session 객체에서 데이터를 가져올 때, getAttribute 메서드는 반환 타입이 항상 Object
    	//그렇기 때문에 캐스팅을 통해 이름에 담아줘 
    	name = (String) session.getAttribute("name");
    }

    // 댓글 목록을 세션에서 가져와 캐스팅을 통해서 배열리스트에 담아준다.
    ArrayList<String> comments = (ArrayList<String>) session.getAttribute("comments");
    //댓글 목록이 없을경우 새로운 배열리스트 만들어줌
    if (comments == null) {
        comments = new ArrayList<String>();
        session.setAttribute("comments", comments);
    }
    
    //로그아웃 할시 댓글은 남기고 세션 삭제 해줘
    String logout = request.getParameter("logout");
    if (logout != null && logout.equals("true")) {
    	//리다이랙션 하는데 지울 필요가 있을까? 
    	//리다이랙션을 해도 세션은 유지되기 때문에 지워야 한다.
        session.removeAttribute("name");
        //a.jsp로 리다이렉션 해줘
        response.sendRedirect("a.jsp");
        return;
    }
%>
<h3 align=center>댓글 작성</h3>
 <div align=center>
	    <p><%= name %>님 댓글을 써주세요</p>
	    <table border="1">
	        <tr>
	            <td align="left">
				    <form action="c.jsp" method="POST">
				        댓글: <input type="text" name="comment">
				        <input type="submit" value="등록">
				    </form>
				</td>
		     	<td align="right">
				    <form action="b.jsp" method="GET">
				        <input type="hidden" name="logout" value="true">
				        <input type="submit" value="로그아웃">
			        </form>
	        	</td>
	        </tr>
        </table>
	    <h3 align=center>댓글 목록</h3>
	    <ul>
           <% for (int i = comments.size() - 1; i >= 0; i--) { %>
            <li><%= comments.get(i) %></li>
           <% } %>
	    </ul>
 </div>
</body>
</html>
  

