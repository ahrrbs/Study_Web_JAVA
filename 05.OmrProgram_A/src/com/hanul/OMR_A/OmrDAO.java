package com.hanul.OMR_A;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OmrDAO {
	private Connection conn; 		//DB 연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs;			//결과객체

	//DB연결
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception");
		}//try
		return conn;
	}//getConn()

	//DB접속 해제
	public void dbClose() {
		try {
			if (rs != null) rs.close();
			if (ps != null)	ps.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() exception");
		}//try
	}//dbClose()

	//회원가입
	public int memberInsert(OmrDTO dto) {
		conn = getConn();
		String sql = "insert into A_Table(onumber, name) values(?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getOnumber());
			ps.setString(2, dto.getName());
//			ps.setInt(3, dto.getScore());
//			ps.setString(4, dto.getResult());
			succ = ps.executeUpdate(); // sql 쿼리 실행
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert() exception");
		} finally {
			dbClose();
		}//try
		return succ;
	}//memberInsert() 

	//수험생목록 메소드
	public ArrayList<OmrDTO> search() {
		conn = getConn();
		String sql = "select * from A_Table";
		ArrayList<OmrDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				OmrDTO dto = new OmrDTO();
				dto.setName(rs.getString("name"));
	            dto.setOnumber(rs.getInt("onumber"));
	            dto.setScore(rs.getInt("score"));
	            dto.setResult(rs.getString("result"));
	            list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAllList() Exception!!!");
		} finally {
			dbClose();
		}//try
		return list;
	}//searchAllList()
	
	//응시자 정보 업데이트
	public int scoreUp(OmrDTO dto) {
		conn = getConn();
		String sql = "update A_Table set score = ?, result = ? where onumber = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getScore());
			ps.setString(2, dto.getResult());
			ps.setInt(3, dto.getOnumber());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateList() Exception!!!");
		} finally {
			dbClose();
		}//try
		return succ;
	}//scoreUp()


}
