package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	private Connection conn; // DB 연결객체
	private PreparedStatement ps; //전송객체
	private ResultSet rs; 		//결과객체
	
	public Connection getConn() {
		//DB 계정에 접속
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception");
		}
		return conn;
	}//getconn
	
	//DB접속 해제
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!");
		}
	}
	
	//책 정보 입력
	public int BookInsert(BookDTO dto) {
		conn = getConn(); //db 접속
		String sql = "insert into tblBook values(?, ?, ?, ?, ?, ?, ?)"; // sql삽입 문장
		int succ = 0; //성공여부 판단 변수
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getIsbn());
			ps.setString(4, dto.getComp());
			ps.setInt(5, dto.getCost());
			ps.setInt(6, dto.getSu());
			ps.setInt(7, (dto.getCost() * dto.getSu()));
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BookInsert 예외!!!!");
		} finally {
			dbClose();
		}
		return succ;
	}
	//전체 책 목록검색
	public ArrayList<BookDTO> bookserachAll() {
		conn = getConn(); // DB접속
		String sql = "select * from tblBook"; // sql문장 작성
		ArrayList<BookDTO> list = new ArrayList<>(); // 검색 목록을 저장할 컬랜션
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) { // 결과객체(rs)의 값을 list에 저장
				String title = rs.getString("title");
				String name = rs.getString("name");
				String isbn = rs.getString("isbn");
				String comp = rs.getString("comp");
				int cost = rs.getInt("cost");
				int su = rs.getInt("su");
				int price = rs.getInt("price");

				BookDTO dto = new BookDTO(title, name, isbn, comp, cost, su, price);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberSearchAll Exception");
		} finally {
			dbClose();
		}
		return list;
	}

	// 책 정보 삭제
	public int BookDelete(String isbn) {
		conn = getConn();
		String sql = "delete from tblBook where isbn = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BookDelete Exception");
		} finally {
			dbClose();
		}
		return succ;
	}
	
	// ISBN 중복 검사
	public int IsbnCheck(String isbn) {
		conn = getConn();
		String sql = "select * from tblBook where isbn=?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			rs = ps.executeQuery();
			
			if(rs.next()==true){	
				succ = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BookCheck Exception");
		} finally {
			dbClose();
		}
		return succ;
	}

}
