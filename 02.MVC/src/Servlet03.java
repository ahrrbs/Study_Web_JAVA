

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.MemberDAO;
import com.hanul.study.MemberDTO;


@WebServlet("/s03.do")
public class Servlet03 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		//1. 클라이언트의 요청을 받는다 : HttpServletRequest
		// 매개변수를 가져온다 : getParameter();
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		
		//2. 비지니스 로직 : DateBase 연동 -> DAO Class 구현
		MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberInsert(dto);
		
		//3. 프리젠테이션 로직(겨로가를 응답) : html, jsp
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0) {
			out.println("<script>alert('회원가입 성공!!!!!');</script>");
			out.println("<a href ='memberMain.html'>회원가입 화면</a>");
			out.println("<br/><br/>");
			out.println("<a href='s04.do'>회원목록보기</a>");
		} else {
			out.println("<script>alert('회원가입 실패!!!!!');</script>");
			out.println("<a href ='memberMain.html'>회원가입 화면</a>");
			out.println("<br/><br/>");
			out.println("<a href='s04.do'>회원목록보기</a>");
		}
	}

}
