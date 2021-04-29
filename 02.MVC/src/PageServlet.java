

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/page.do")
public class PageServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//클라이언트의 요청을 받는다 : 매개변수를 전달
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//비지니스 로직 : DB연동 -> 별도의 클래스(DAO)에 작성(생략)
		
		//프리젠테이션 로직 : 결과를 응답 -> html
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<body>");
		out.println("pageTurn.html에서 전달된 ID : " + id + "</br>");
		out.println("pageTurn.html에서 전달된 PW : " + pw);
		out.println("</body>");
	}

}
