

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumMachine;

@WebServlet("/s08.do")
public class Servlet08 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		SumMachine sm = new SumMachine();
		int sum = sm.getSum(num1, num2);
		//response.sendRedirect("s09.do");
		
		response.sendRedirect("s09.do?num1=" + num1 + "&num2=" + num2 + "&sum=" + sum);
		
	}

}
