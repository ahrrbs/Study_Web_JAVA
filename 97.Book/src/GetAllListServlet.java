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
   protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      //① 클라이언트의 요청을 받는다
      //② 비지니스 로직(전체도서 정보보기)
      BookDAO dao = new BookDAO();
      ArrayList<BookDTO> list = dao.getAllList();
      
      //③ 프리젠테이션 로직(결과응답)
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.println("<div align='center'>");
      out.println("<h3>[도서정보 전체보기]</h3>");
      out.println("<table border='1'>");
      out.println("<tr>");
      out.println("<th>도서명</th>");
      out.println("<th>저자</th>");
      out.println("<th>ISBN</th>");
      out.println("<th>출판사</th>");
      out.println("<th>단가</th>");
      out.println("<th>수량</th>");
      out.println("<th>가격</th>");
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
         out.println("<td>" + (dto.getCost() * dto.getSu()) + "</td>");
         out.println("<td><a href='ds.do?isbn=" + dto.getIsbn() + "'>삭제</a></td>");
      }//for

      out.println("</table>");
      out.println("<a href='BookMain.html'>도서정보 입력하기</a>");
      out.println("</div>");
      
   }//service
}//class