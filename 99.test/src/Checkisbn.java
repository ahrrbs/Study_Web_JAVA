

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;

@WebServlet("/ck.do")
public class Checkisbn extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청을 받는다 : 매개변수를 가져온다.
		request.setCharacterEncoding("utf-8");
		String isbn = request.getParameter("isbn");

		// 비지니스 로직 : ISBN 중복검사
		BookDAO dao = new BookDAO();
		int succ = dao.IsbnCheck(isbn);


		// 프리젠테이션 로직 : 결과를 응답 -> html
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0){
			out.print("<script>alert('중복된 ISBN 입니다');");
			out.print("history.back();</script>");
		}else{
			out.print("<script>alert('사용가능한 ISBN 입니다');");
			out.print("history.back();</script>");
		}

	}

}
