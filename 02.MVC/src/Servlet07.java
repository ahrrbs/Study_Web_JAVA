

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumResultDTO;

@WebServlet("/s07.do")
public class Servlet07 extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer num1 = (Integer) request.getAttribute("num1");
		Integer num2 = (Integer) request.getAttribute("num2");
		Integer sum = (Integer) request.getAttribute("sim");
		SumResultDTO dto = (SumResultDTO) request.getAttribute("dto");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<body>");
		out.println("<h3> request forward() </h3>");
		out.println("첫 번째 정수 : " + num1 + "</br>");
		out.println("두 번째 정수 : " + num2 + "</br>");
		out.println("두 수 사이의 누적합 : " + sum + "</br>");
		out.println("첫 번쨰 정수(dto) : " + dto.getNum1() + "</br>");
		out.println("두 번째 정수(dto) : " + dto.getNum2() + "</br>");
		out.println("두 사이의 누적합(dto) : " + dto.getSum() + "</br>");
		
		out.println("</body>");
	}

}
