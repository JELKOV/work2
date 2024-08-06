package test01;

import java.io.IOException;
import java.io.PrintWriter;

import calc.Calc;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calc01
 */
public class Calc01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calc01() {
        super();
        // TODO Auto-generated constructor stub
    }

    /*
    private int calc(int num1,int num2,String op) {
    	int res;
    	if(op.equals("+")) {
			res=num1+num2;
		}
		else if(op.equals("-")) {
			res=num1-num2;
		}
		else {
			res=num1*num2;
		}
    	return res;
    }
    */
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1,num2,res;
		String op;
		
		num1=Integer.parseInt(request.getParameter("num1"));
		num2=Integer.parseInt(request.getParameter("num2"));
		op=request.getParameter("op");
		
		///res=calc(num1,num2,op);
		Calc calc = new Calc(num1,num2,op);
		res=calc.getRes();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>계산결과는?</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<H1>계산결과 : "+res+"</H1>");
		out.println("</BODY>");
		out.println("</HTML>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
