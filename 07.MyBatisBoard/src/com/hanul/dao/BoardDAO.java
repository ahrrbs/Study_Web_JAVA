package com.hanul.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.BoardDTO;
import com.hanul.dto.SearchDTO;

public class BoardDAO {
	
	// 기존 JDBC모델에서는 Connection을 먼저 만들었지만,
	// myBatis 경우 SqlSessionFactiory 객체를 먼저 생성

	private static SqlSessionFactory sqlMapper;

	static {
		String resource = "com/hanul/mybatis/SqlMapConfig.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!!");
		}

	}// 초기화블럭
	
	// 전체목록 조회
	public List<BoardDTO> getAllList() {
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;
		list = session.selectList("getAllList");
		session.close();
		return list;
	}// getAllList()
	
	//새글 등록
	public int boardInsert(BoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		
		//alert 창을 사용할 경우에는 succ를 return해야한다.
		//PrintWriter를 이용한 script코드 구현하여 페이지 전환
		//alert창을 사용하지 않을 경우에는 succ가 필요없다.
		//Actionfoward를 이용한 페이지 전환
		int succ = 0;
		succ = session.insert("boardInsert", dto);
		session.commit();
		session.close();
		return succ;
		
	}
	
	// 특정 글 검색
	public BoardDTO boardDetail(int b_num) {
		SqlSession session = sqlMapper.openSession();
		BoardDTO dto = null;
		dto = session.selectOne("boardDetail", b_num);
		session.close();
		return dto;
	}
	
	//조회수 증가
	public void boardCount(int b_num) {
		SqlSession session = sqlMapper.openSession();
		session.update("boardCount", b_num);
		session.commit();
		session.close();
		
	}
	
	//글 삭제
	public void boardDelete(int b_num) {
		SqlSession session = sqlMapper.openSession();
		//alert창을 사용하지 않을 경우에는 succ가 필요없다.
		//=> ActionForward를 이용한 페이지 전환
		session.delete("boardDelete", b_num);
		session.commit();
		session.close();
	}
	
	
	//글 수정
	public void boardUpdate(BoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		session.update("boardUpdate", dto);
		session.commit();
		session.close();
		
	}
	
	//조건 검색
	public List<BoardDTO> boardSearch(SearchDTO dto) {
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;
		list = session.selectList("boardSearch", dto);
		session.close();
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
