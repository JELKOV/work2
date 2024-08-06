package test01;

import java.io.IOException;
import java.io.PrintWriter;
/*
세상에 있는 모든 서블릿은 HttpServelt 서블릿을 상속 받는다. 
가볍지 않음 == not POJO
 */
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Test01 extends HttpServlet { 
	private static final long serialVersionUID = 1L;
/*
 모든 Servlet은 기본 생성자로 생성됨
 */
    public Test01() {
        // TODO Auto-generated constructor stub
    }
/*
 웹에서 모든 요청 방식은 GET 이거나 POST 임 
 GET은 주로 검색에 활용됨 selectOne, selectAll
 전송정보를 URL에 OPEN
 POST는 주로 CUD에 활용됨 데이터에 변화가 있을때 주로 화룡
 POST는 전송정보를 보호 -->> 이례적으로 로그인 같은곳에서도 활용됨
 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>실습 탭</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<H1>Servlet 으로 작성한 페이지</H1>");
		out.println("</BODY");
		out.println("</HTML>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
