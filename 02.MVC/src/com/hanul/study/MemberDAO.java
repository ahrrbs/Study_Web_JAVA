package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn; 		//연결 객체
	private PreparedStatement ps; 	//전속 객체
	private ResultSet rs; 			//결과 객체(select문)
	
	//DB접속 : ojdbc6.jar ▶  webContent > WEB_INF > lib 붙여넣기
	public Connection  getConn() {
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
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
	}// getConn
	
	//DB 접속 해제
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
	
	//회원가입 
	public int memberInsert(MemberDTO dto) {
		conn = getConn();		//db접속
		String sql = "insert into Member values(?, ?, ?, ?, ?, ?)"; //sql 문장 작성
		int succ = 0; //성공여부 판단
		try {
			ps = conn.prepareStatement(sql); //전송객체 생성
			ps.setString(1, dto.getName());	 //매개변수 값 할당(세팅)
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPw());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getTel());
			succ = ps.executeUpdate(); 		//sql 쿼리 실행
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert Exception!!");
		} finally {
			dbClose();
		}
		return succ;
	}
	
	//전체회원목록검새
	public ArrayList<MemberDTO> mamberSearchAll() {
		conn = getConn(); 		//DB접속
		String sql = "select * from Member";		//sql문장 작성
		ArrayList<MemberDTO> list = new ArrayList<>(); //검색 목록을 저장할 컬랜션
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) { //결과객체(rs)의 값을 list에 저장
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);
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
	
	//회원정보 삭제
	public int memberDelete(String id) {
		conn = getConn();
		String sql="delete from member where id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberDelete Exception");
		} finally {
			dbClose();
		}
		return succ;
	}
	
}
