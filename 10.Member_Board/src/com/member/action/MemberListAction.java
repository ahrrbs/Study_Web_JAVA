package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.member.study.MemberDAO;
import com.member.study.MemberDTO;

public class MemberListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("memberLogin.me");
			forward.setRedirect(true);
			return forward;
		} else if(!id.equals("admin")) { //관라자가 아닌 id로 로그인되어 있는 경우
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아입니다.!!');");
			out.println("location.href='boardList.bo';");
			out.println("</script>");
			return null;
		} else { //관리자로 로그인한 상태
			/*response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자로 로그인하셨습니다!!');");
			out.println("</script>");
			return null;*/
			
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getAllMember();
			request.setAttribute("list", list);
			forward.setPath("member/member_list.jsp");
			forward.setRedirect(false);
			return forward;
		}
		
		
		
	}
}
