

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumMachine;
import com.hanul.study.SumResultDTO;


@WebServlet("/s02.do")
public class Servlet02 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 클라이언트의 요청을 받는다 : 매개변수 값을 가져온다
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		// 2. 비지니스 로직 : 별도의 클래스로 작성 => 
		SumMachine sm = new SumMachine();
		int sum = sm.getSum(num1, num2);
		
		// 3. 프리젠테이션 로직 : 결과를 응답(HttpServletResponse) => result.jsp
		SumResultDTO dto = new SumResultDTO(num1, num2, sum);
		request.setAttribute("dto", dto); // 바인딩(연결) 객체
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		rd.forward(request, response);
		
	}

}
