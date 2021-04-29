

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;

@WebServlet("/gals.do")
public class GetAllListServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청을 받는다 : 매개변수를 가져온다 => 전달되는 매개변수가 없다.
		// 비지니스 로직 : 전체회원 목록을 검색
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.bookserachAll();
		
		//프리젠테이션 로직 : 결과를 응답 ▶ list의 값을 출력 -> html
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<div align ='center'>");
				out.println("<h3>[전체회원 목록보기]</h3>");
				out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>책 이름</th>");
				out.println("<th>저자</th>");
				out.println("<th>ISBN</th>");
				out.println("<th>출판사</th>");
				out.println("<th>가격</th>");
				out.println("<th>수량</th>");
				out.println("<th>총 가격</th>");
				out.println("<th>삭제</th>");
				out.println("</tr>");
				for (BookDTO dto : list) {
					out.println("<tr align='center'>");
					out.println("<td>" + dto.getTitle() + "</td>");
					out.println("<td>" + dto.getName() + "</td>");
					out.println("<td>" + dto.getIsbn() + "</td>");
					out.println("<td>" + dto.getComp() + "</td>");
					out.println("<td>" + dto.getCost() + "</td>");
					out.println("<td>" + dto.getSu() + "</td>");
					out.println("<td>" + dto.getPrice() + "</td>");
					out.println("<th><a href='ds.do?isbn="+dto.getIsbn()+"'>삭제</a></th>");
					// 자바코드를 쓸려면      "+자바코드+" 이렇게 해야한다.
					out.println("</tr>");
					
				}
				out.println("<tr align='center'>");
				out.println("<td colspan='8'>");
				out.println("<input type ='button' value='책 정보 입력 화면'");
				out.println("onclick='location.href=\"BookMain.html\"'/>");
				out.println("</td>");
				
				out.println("</tr>");
				out.println("</table>");
				out.println("</div>");
	}

}
