import java.io.IOException;
import java.io.PrintWriter;
import java.util.function.Predicate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;

@WebServlet("/is.do")
public class InsertServlet extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      //① 클라이언트의 요청을 받는다
      request.setCharacterEncoding("utf-8");
      String title = request.getParameter("title");
      String name = request.getParameter("name");
      String isbn = request.getParameter("isbn");
      String comp = request.getParameter("comp");
      int cost = Integer.parseInt(request.getParameter("cost"));
      int su = Integer.parseInt(request.getParameter("su"));
      int price = cost * su;
      
      //② 비지니스 로직(도서정보입력)
      BookDTO dto = new BookDTO(title, name, isbn, comp, cost, su, price);
      BookDAO dao = new BookDAO();
      int succ = dao.BookInsert(dto);
      
      //③ 프리젠테이션 로직(결과응답)
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      if (succ > 0) {
    	  out.println("<script>alert('도서정보 입력성공');</script>");
    	  out.println("<a href='BookMain.html'>도서정보 입력하기</a>");
    	  out.println("<br/>");
    	  out.println("<a href='gals.do'>전체도서 정보보기</a>");
      } else {
    	  out.println("<script>alert('도서정보 입력실패');</script>");
    	  out.println("<a href='BookMain.html'>도서정보 입력하기</a>");
    	  out.println("<br/>");
    	  out.println("<a href='gals.do'>전체도서 정보보기</a>");
      }//if
   }//service
}//class