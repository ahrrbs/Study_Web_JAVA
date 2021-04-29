

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumMachine;
import com.hanul.study.SumResultDTO;

@WebServlet("/s06.do")
public class Servlet06 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		SumMachine sm = new SumMachine();
		int sum = sm.getSum(num1, num2);
		
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		request.setAttribute("sum", sum);
		SumResultDTO dto = new SumResultDTO(num1, num2, sum);
		request.setAttribute("dto",	dto);
		
		RequestDispatcher rd = request.getRequestDispatcher("s07.do");
		
		rd.forward(request, response);
		
	}

}
