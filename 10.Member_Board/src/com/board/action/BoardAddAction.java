package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*String saveFolder = "boardupload";
		String realFolder = request.getRealPath(saveFolder);
		System.out.println(realFolder);*/
		
		
		//업로드한 파일이 저장되는 경로(공간, 주소, 위치)
		String realFolder = ""; 
		realFolder = "D:\\\\Study_Web\\\\workspace\\\\10.Member_Board\\\\WebContent\\\\boardupload";
		int filesize = 5 * 1024 * 1024; //최대용량 : 5MB
		
		MultipartRequest multi = null; //파일 업로드 처리
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy(); //파일명의 중복 방지
		multi = new MultipartRequest(request, realFolder, filesize, "utf-8", policy);
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_id(multi.getParameter("board_id"));
		dto.setBoard_subject(multi.getParameter("board_subject"));
		dto.setBoard_content(multi.getParameter("board_content"));
		//System.out.println(multi.getParameter("board_file")); //null : 파일명 중복검사 수행 X
		/*System.out.println(multi.getFilesystemName((String) multi.getFileNames().nextElement()));*/
		dto.setBoard_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		
/*		System.out.println(dto.getBoard_id());
		System.out.println(dto.getBoard_subject());
		System.out.println(dto.getBoard_content());
		System.out.println(dto.getBoard_file());*/
		
		
		
		
		
		
		
		return null;
	}

}
