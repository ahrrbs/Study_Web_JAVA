package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;
import com.hanul.dto.SearchDTO;

public class BoardSearchAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//클라이언트의 요청을 받는다 : 매개변수를 전달 받는다.
		request.setCharacterEncoding("utf-8");
		String part = request.getParameter("part");
		String searchData = request.getParameter("searchData");
		SearchDTO dto = new SearchDTO();
		dto.setPart(part);
		dto.setSearchData("%" + searchData + "%");
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardSearch(dto);
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardSearchList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
