<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@page import="com.hanul.OMR_A.OmrDAO"%>
<%@page import="com.hanul.Score_A.ScoreDAO"%>
<%@page import="com.hanul.Score_A.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="com.hanul.OMR_A.OmrDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<jsp:useBean id="dao" class="com.hanul.OMR_A.OmrDAO">
	<jsp:setProperty property="*" name="dao"/>
</jsp:useBean>

<%
String ip = request.getRemoteHost();
request.setAttribute("dto", dto);

//제출한 값 저장할 배열 list를 만들어서 저장하기
ArrayList<ScoreDTO> list = new ArrayList<>();
//db에 저장된 값 불러와서 배열에 저장하기
ArrayList<ScoreDTO> list2 = new ArrayList<>();

for(int i = 1; i <=10; i++){
	String pass = request.getParameter(""+ i);
	list.add(new ScoreDTO(i,pass));
}

ScoreDAO dao1 = new ScoreDAO();
list2 = dao1.dbCheck();

// OMR_A 라디오 버튼 벨류랑 DB에 있는 리스트를 비교
int score = dao1.Sam(list, list2);

String result="불합격";
if(score >= 60){
	result = "합격";
}

// OmrDAO odao = new OmrDAO();

OmrDTO odto = new OmrDTO();
odto.setOnumber(dto.getOnumber());
odto.setName(dto.getName());
odto.setScore(score);
odto.setResult(result);

//점수 업데이트
int succ = dao.scoreUp(odto);

request.setAttribute("list", list);
request.setAttribute("list2", list2);
request.setAttribute("score", score);
request.setAttribute("result", result);
%>

<jsp:forward page="Result_A.jsp">
	<jsp:param value="<%=ip %>" name="ip"/>
</jsp:forward>