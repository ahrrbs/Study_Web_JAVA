package com.member.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import net.sf.json.JSONArray;

public class MemberDAO {
	//boardMember Table : mybatis FrameWork ▶ com.hanul.mybatis
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "com/hanul/mybatis/SqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!!!");
		}
	}//static(초기화블럭)
	
	//회원가입
	public int joinMember(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("joinMember", dto);
		session.commit();
		session.close();
		return succ;
	}//joinMember()
	
	
	//회원 존재 유무 파악
	public int isMember(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		MemberDTO isdto = null;
		isdto = session.selectOne("ismember", dto);
		session.close();
		
		int result = -1;
		if(isdto != null) { //일단은 아이디가 존재한다.
			if(isdto.getMember_pw().equals(dto.getMember_pw())) { //왼쪽 : DB, 오른쪽 : 사용자 입력
				result = 1; //비밀번호 일치
			} else {
				result = 0; //비밀번호 불일치
			}
		} else {
			result = -1; //아이디가 존재하지 않는다.
		}
		return result;
	}
	
	//회원정보 조회
	public List<MemberDTO> getAllMember() {
		SqlSession session = sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("getAllMember");
		session.close();
		return list;
	}
	
	// 회원정보 삭제
	public int deleteMember(String member_id) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("deleteMember", member_id);
		session.commit();
		session.close();
		return succ;
	}// deleteMember
	
	//회원 ID 검색(한명의 회원정보를 검색)
	public MemberDTO getDetailMember(String member_id) {
		SqlSession session = sqlMapper.openSession();
		MemberDTO dto = null;
		dto = session.selectOne("getDetailMember", member_id);
		session.close();
		return dto;
	}
	
	//회원의 pw 검색
	public String getMember_pw(String id) {
		SqlSession session = sqlMapper.openSession();
		String member_pw = null;
		member_pw = session.selectOne("getMember_pw", id);
		session.close();
		return member_pw;
		
	}
	
	//회원 정보 업데이트
	public int updateMember(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.update("updateMember", dto);
		session.commit();
		session.close();
		return succ;
	}
	
	public String getJson() {
		SqlSession session = sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("getAllMember");
		session.close();

		JSONArray array = JSONArray.fromObject(list);
		String json = array.toString();
		return json;
	}// getJson
	
	
	
	
	
}//class
