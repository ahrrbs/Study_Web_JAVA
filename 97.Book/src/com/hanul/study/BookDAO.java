package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	private Connection conn;		//연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs;			//결과객체(select문)
	
	//DB접속 : ojdbc6.jar → WebContent > Web-INF > lib 붙여넣기(등록)
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!!");
		}
		return conn;
	}//getConn()
	
	//DB 접속해제
	public void dbClose() {
		try {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!");
		}
	}//dbClose
	
	//회원가입
	public int insert(BookDTO dto) {
		conn = getConn();	//DB접속(연결)
		String sql = "insert into tblBook values(?, ?, ?, ?, ?, ?, ?)"; //SQL 문장 작성
		int succ = 0;	//성공여부 판단
		try {
			ps = conn.prepareStatement(sql);	//전송객체생성
			ps.setString(1, dto.getTitle()); 	//매개변수 값 할당(세팅)
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getIsbn());
			ps.setString(4, dto.getComp());
			ps.setInt(5, dto.getCost());
			ps.setInt(6, dto.getSu());
			ps.setInt(7, (dto.getCost()*dto.getSu()));
			
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert() Exception!!!");
		}finally {
			dbClose();
		}
		return succ;
	}//insert
	
	   //전체 도서 목록검색
	   public ArrayList<BookDTO> getAllList() {
	      conn = getConn();
	      String sql = "select * from tblBook";
	      ArrayList<BookDTO> list = new ArrayList<>();
	      try {
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();
	         while(rs.next()) {
	            String title = rs.getString("title");
	            String name = rs.getString("name");
	            String isbn = rs.getString("isbn");
	            String comp = rs.getString("comp");
	            int cost = rs.getInt("cost");
	            int su = rs.getInt("su");
	            //int price = rs.getInt("price");
	            BookDTO dto = new BookDTO(title, name, isbn, comp, cost, su);
	            list.add(dto);
	         }//while
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("getAllList() Exception!!!");
	      } finally {
	         dbClose();
	      }//try
	      return list;
	   }//getAllList()

	
	//회원정보 삭제
	public int delete(String isbn) {
		conn = getConn();
		String sql = "delete from tblBook where isbn = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete() Exception!!");
		}finally {
			dbClose();
		}
		return succ;
	}//delete()
	
}//class
