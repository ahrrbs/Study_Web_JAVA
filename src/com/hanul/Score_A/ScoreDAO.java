package com.hanul.Score_A;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ScoreDAO {
	private Connection conn; // DB 연결객체
	private PreparedStatement ps; //전송객체
	private ResultSet rs; 		//결과객체
	
	//DB 연결
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
		}//try
		return conn;
	}//getConn()
	
	//DB접속 해제
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!!");
		}//try
	}//dbClose()
	
	//db저장 값 불러오기
	public ArrayList<ScoreDTO> dbCheck() {
		conn = getConn();				//DB접속
		String sql = "select * from A_Score order by quiz";
		ArrayList<ScoreDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int quiz = rs.getInt("quiz");
				String pass = rs.getString("pass");
				ScoreDTO dto = new ScoreDTO(quiz, pass);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbCheck() Exception!!!");
		} finally {
			dbClose();
		}//try
		return list;
	}//dbCheck
	
	//일치하는지 확인하기
	public int Sam(ArrayList<ScoreDTO> list, ArrayList<ScoreDTO> list2) {
		int score = 0;
		for(int i = 0; i < list2.size(); i++) {
			String pass1 = list.get(i).getPass();
			String pass2 = list2.get(i).getPass();
			
			if(pass1.equals(pass2)) {
				score += 10;
			}//if
		}//for
		
		return score;
	}//Sam()

}
