package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

//BoardListAction Class → Action interface 상속 ▶ Servlet의 역할 수행
//DAO 연동하여 게시판의 전체목록을 가져오는 작업
//▶ 서블릿(Controller)이 해야할 일을 대신 처리하는 작업
public class BoardListAction implements Action {

   @Override
   public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      // ① 클라이언트의 요청을 받는다 : 전달되는 매개변수가 없다.
      // ② 비지니스 로직 : DAO 연동 → 결과를 리턴
      BoardDAO dao = new BoardDAO();
      List<BoardDTO> list = dao.getAllList();
      request.setAttribute("list", list);

      // ③ 프리젠테이션 로직 : 페이지 전환 ▶ ActionForward Class
      // View Page(path) : board/boardList.jsp
      // 페이지 전환방식(isRedirect) : forward() → false
      ActionForward forward = new ActionForward();
      forward.setPath("board/boardList.jsp");
      forward.setRedirect(false);
      return forward;
   }

}