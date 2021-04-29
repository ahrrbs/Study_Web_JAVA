package com.hanul.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.action.Action;
import com.hanul.action.ActionForward;
import com.hanul.action.BoardDeleteAction;
import com.hanul.action.BoardDetailAction;
import com.hanul.action.BoardInsertAction;
import com.hanul.action.BoardListAction;
import com.hanul.action.BoardSearchAction;
import com.hanul.action.BoardUpdateAction;
import com.hanul.action.BoardUpdateFormAction;

@WebServlet("/BoardFrontController.do")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.클라이언트의 요청을 받는다  => 어떤 요청을 하였는지를 파악
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI(); //uri-pattern 값  : /mbb/xx.do
		String ctx = request.getContextPath(); //context root 값 : /mbb
		String command = uri.substring(ctx.length()); //실제 요청한 페이지
		
		/*System.out.println("uri : " + uri);
		System.out.println("ctx : " + ctx);
		System.out.println("command : " + command);*/
		
		//2. 클라이언트의 요청(*.do -> command)과 실제 요청을 처리할 Action Class와 연결
		// => BoardxxxAction.java
		Action action = null;
		ActionForward forward = null;
		if(command.equals("/boardList.do")) {
			action = new BoardListAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardInsertForm.do")) {
			//글을 작성하는 페이지로 화면 전환만 필요(DB연동x)
			forward = new ActionForward();
			forward.setPath("board/boardInsertForm.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/boardInsert.do")) {
			action = new BoardInsertAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardDetail.do")) {
			action = new BoardDetailAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardDelete.do")) {
			action = new BoardDeleteAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardUpdateForm.do")) {
			action = new BoardUpdateFormAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardUpdate.do")) {
			action = new BoardUpdateAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardSearch.do")) {
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		}
		
		//3. 프리젠테이션 로직(결과출력 -> 페이지전환)
		if(forward != null) {
			if(forward.isRedirect()) { // true : sendRedirect()
				response.sendRedirect(forward.getPath());
			} else { // false : forward()
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}
