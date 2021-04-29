

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.member.MemberDTO;

/**
 * Servlet implementation class MemeberJoin
 */
@WebServlet("/memberJoin.do")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		//클라이언트의 요청을 받는다 : 매개변수를 가져온다   ▶ HttpServletRequest  
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		
		/*System.out.println("이름 : " + name);
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + pw);
		System.out.println("나이 : " + age);
		System.out.println("주소 : " + addr);*/
		
		//비지니스 로직 : DAO를 통해 DB와 연동하여 겨로가를 리턴받는 작업
		MemberDTO dto = new MemberDTO(name, id, pw, age, addr);
		//DB연동 : MemeberDAO.java -> insertMember(dto); => 생략
		
		//프리젠테이션 로직  : 리턴받은 겨로가를 클라이언트에게 응답 ▶ HttpServletResponse
		// 1. html 문법으로 응답 : Servlet에서 코딩
		// 2. JSP 페이지로 응답 : 페이지 전환(result.jsp)
		request.setAttribute("dto", dto);
	    RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
	    rd.forward(request, response);
		
		
	}

}
