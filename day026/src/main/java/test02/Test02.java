package test02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test02
 */
public class Test02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET요청");
		//변수 선언부
		String id, password, res = null;
		boolean found =false;
		
		//요청부
		id = request.getParameter("id");
		password= request.getParameter("password");
		
		//기능부
		if(id.equals("teemo") && password.equals("1234")) {
			found =true;
		}
		
		if(found) {
			res="로그인 성공";
		}
		else if(!found) {
			res="로그인 실패";
		}// else if로 끝나면 이니셜라이즈를 해야한다.
		
		//응답부
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>로그인할수 있을까?</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<H1>"+ res +"</H1>");
		out.println("</BODY>");
		out.println("</HTML>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
