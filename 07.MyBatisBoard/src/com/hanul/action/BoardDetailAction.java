package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardDetailAction implements Action{
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//클라이언트의 요청을 받는다 : 매개변수를 전달 받는다
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		// 비지니스 로직
		BoardDAO dao = new BoardDAO();
		dao.boardCount(b_num); // 조회수 증가
		BoardDTO dto = dao.boardDetail(b_num);
		request.setAttribute("dto", dto);
		
		//프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardDetail.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}
	

}
