package com.hanul.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
   //기존 JDBC모델에서는 Connection을 먼저 만들었지만,
   //myBatis 경우 SqlSessionFactiory 객체를 먼저 생성
   
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
   
   //회원가입
   public int memberInsert(MemberDTO dto) {
      //SqlSessionFactory(sqlMapper)에서 session 활성화 : DB접속
      SqlSession session = sqlMapper.openSession();
      
      int succ = 0;
      //insert 작업(SQL 문장작성) ▶ memberMapper.xml
      succ = session.insert("memberInsert", dto);
      
      session.commit();    //커밋
      
      session.close();    //session 종료
      
      return succ;
   }//memberInsert()
   
   //전체 회원 목록검색
   public List<MemberDTO> memberSearchAll() {
	   SqlSession session = sqlMapper.openSession();
	   List<MemberDTO> list = null;
	   list = session.selectList("memberSearchAll");
	   
	   session.close();
	   return list;
			 
   }
   
   //회원 정보 삭제
   public int memberDelete(String id) {
	   SqlSession session = sqlMapper.openSession();
	   int succ = 0;
	   succ = session.delete("memberDelete", id);
	   session.commit();
	   session.close();
	   return succ;
   }
   
   //회원 수정
   public MemberDTO getById(String id) {
	   SqlSession session = sqlMapper.openSession();
	   MemberDTO dto = null;
	   dto = session.selectOne("getById", id);
	   session.close();
	   return dto;
	   
   }
   
   //회원정보 수정
   public int memberUpdate(MemberDTO dto) {
	   SqlSession session = sqlMapper.openSession();
	   int succ = 0;
	   succ = session.update("memberUpdate", dto);
	   session.commit();
	   session.close();
	   return succ;
	   
	   
   }
   
   //조건 검색
   public List<MemberDTO> memberSearch(SearchDTO dto) {
	   SqlSession session = sqlMapper.openSession();
	   List<MemberDTO> list = null;
	   list = session.selectList("memberSearch", dto);
	   session.close();
	   return list;
   }
   
}






























