package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardUpdateAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//클라이언트의 요청을 받는다 : 매개변수를 전달 받는다.
		request.setCharacterEncoding("utf-8");
		BoardDTO dto = new BoardDTO();
		dto.setB_num(Integer.parseInt(request.getParameter("b_num")));
		dto.setB_writer(request.getParameter("b_writer"));
		dto.setB_subject(request.getParameter("b_subject"));
		dto.setB_content(request.getParameter("b_content"));
		dto.setB_pwd(request.getParameter("b_pwd"));
		
		//비지니스 로직
		BoardDAO dao = new BoardDAO();
		dao.boardUpdate(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("boardList.do");
		
		
		return forward;
	}

}










