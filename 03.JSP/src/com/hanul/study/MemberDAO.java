package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn; // DB 연결객체
	private PreparedStatement ps; //전송객체
	private ResultSet rs; 		//결과객체
	
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
		}
		return conn;
	}//getconn
	
	//DB 접속 해재
	public void dbClose() {
		try {
			if(rs !=null) rs.close();
			if(ps !=null) ps.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose 예외");
		}
	}
	
	//가입
	public int memberInsert(MemberDTO dto) {
		conn = getConn();
		String sql="insert into Member values(?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPw());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getTel());
			succ = ps.executeUpdate(); 		//sql 쿼리 실행
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert exception");
		} finally {
			dbClose();
		}
		return succ;
	}
	
	//전체회원 검색
	public ArrayList<MemberDTO> memberSearchAll() {
		conn = getConn();
		String sql = "select * from Member";
		ArrayList<MemberDTO> list = new ArrayList<>(); //검색 목록을 저장할 컬렉션
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); // sql 쿼리 실행 수 결과객체 생성
			while(rs.next()) {
				/*String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);
				list.add(dto);*/
				
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberSearchAll() Exception");
		} finally {
			dbClose();
		}
		return list;
	}
	
	//회원정보 삭제
	public int memberDelete(String id) {
		conn = getConn();
		String sql ="delete from Member where id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberDelete() Exception");
		} finally {
			dbClose();
		}
		return succ;
	}
	
	//ID검색
	public MemberDTO getById(String id) {
		conn = getConn();
		String sql = "select * from Member where id = ?";
		MemberDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getById Exception");
		} finally {
			dbClose();
		}
		return dto;
	}
	
	//회원정보 수정
	public int memberUpdate(MemberDTO dto) {
		conn = getConn();
		String sql = "update Member set name=?, pw=?, age=?, addr=?, tel=? where id=?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPw());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			ps.setString(6, dto.getId());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberupdate exception");
		} finally {
			dbClose();
		}
		return succ;
		
	}
}


















