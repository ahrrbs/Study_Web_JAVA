<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@page import="com.hanul.OMR_A.OmrDAO"%>
<%@page import="com.hanul.Score_A.ScoreDAO"%>
<%@page import="com.hanul.Score_A.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%


//제출한 값 저장할 배열 list를 만들어서 저장하기
ArrayList<ScoreDTO> list = new ArrayList<>();



for(int i = 1; i <=10; i++){
	String pass = request.getParameter(""+i);
	list.add(new ScoreDTO(i,pass));
}

//db에 저장된 값 저장할 배열
ArrayList<ScoreDTO> list2 = new ArrayList<>();

//db 값 불러오기
ScoreDAO dao1 = new ScoreDAO();
list2 = dao1.dbCheck();

//비교
int score = dao1.Sam(list, list2);

// String result="합격입니다.";
// if(score < 60){
// 	result="불합격입니다.";
// }

int onumber = Integer.parseInt(request.getParameter("onumber"));
String name = request.getParameter("name");

OmrDTO dto = new OmrDTO();
OmrDAO dao = new OmrDAO();
dto.setName(name);
dto.setOnumber(onumber);
dto.setScore(score);

dao.scoreUp(dto);


request.setAttribute("list", list);
request.setAttribute("list2", list2);
request.setAttribute("score", score);








%>

<jsp:forward page='Conn.jsp'></jsp:forward>