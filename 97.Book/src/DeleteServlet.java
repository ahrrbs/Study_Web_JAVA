import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;

@WebServlet("/ds.do")
public class DeleteServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//클라이언트의 요청을 받는다 : 매개변수를 가져온다
		request.setCharacterEncoding("utf-8");
		String isbn = request.getParameter("isbn");
		
		//비지니스 로직 : 회원정보 삭제
		BookDAO dao = new BookDAO();
		int succ = dao.delete(isbn);
		
		//프리젠테이션 로직 : 결과를 응답 → html
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0) {
			out.println("<script>alert('삭제성공!');</script>");
			out.println("<a href='BookMain.html'>도서정보 입력하기</a>");
			out.println("<br/><br/>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
		}else {
			out.println("<script>alert('삭제실패!');</script>");
			out.println("<a href='BookMain.html'>도서정보 입력하기</a>");
			out.println("<br/><br/>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
			
		}
	}
}//class
