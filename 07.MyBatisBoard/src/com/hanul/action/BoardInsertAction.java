package com.hanul.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardInsertAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//클라이언트의 요청을 받는다 : 매개변수를 가져온다 -> DTO 클래스로 묶는다
		request.setCharacterEncoding("utf-8");
		String b_writer = request.getParameter("b_writer");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		String b_pwd = request.getParameter("b_pwd");
		
		/*BoardDTO dto = new BoardDTO();
		dto.setB_writer(b_writer);
		dto.setB_subject(b_subject);
		dto.setB_content(b_content);
		dto.setB_pwd(b_pwd);*/
		BoardDTO dto = new BoardDTO(b_subject, b_pwd, b_content, b_writer);
		
		//비지니스 로직 : DAO 연동(DB 연동, 쿼리 수행)
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		//프리젠테이션 로직 : alert창을 사용
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0) {
			out.println("<script>alert('등록완료');");
			out.println("location.href='boardList.do';</script>");
		} else {
			out.println("<script>alert('등록실패');");
			out.println("location.href='boardList.do';</script>");
		}
		
		
		return null; // ActionForwar가 필요하지 않는다.
	}
	

}
