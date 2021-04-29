package com.hanul.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MemberDAO {
	// 기존 JDBC모델에서는 Connection을 먼저 만들었지만,
	// myBatis 경우 SqlSessionFactiory 객체를 먼저 생성

	private static SqlSessionFactory sqlMapper;

	static {
		try {
			String resource = "com/hanul/mybatis/SqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!!");
		}

	}// 초기화블럭

	// memberSearchAllJson01 : 전체 회원 목록을 검색한 후 JSON 구조로 리턴
	public String memberSearchAllJson01() {
		SqlSession session = sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("memberSearchAllJson01");
		session.close();

		JSONArray array = new JSONArray();
		JSONObject object = null;

		for (MemberDTO dto : list) {

			object = new JSONObject();
			object.put("member", dto);
			array.add(object);
		}
		
		String json = array.toString();
		return json;

	}
	
	
	//memberSearchAllJson02
	public String memberSearchAllJson02() {
		SqlSession session = sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("memberSearchAllJson02");
		session.close();
		
		JSONArray array = JSONArray.fromObject(list);
		String json = array.toString();
		return json;
	}

}

























