<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@page import="com.hanul.Score_A.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

ArrayList<ScoreDTO> list = (ArrayList<ScoreDTO>) request.getAttribute("list");
ArrayList<ScoreDTO> list2 = (ArrayList<ScoreDTO>) request.getAttribute("list2");

Integer onumber = (Integer) request.getAttribute("onumber");
String name = (String) request.getAttribute("name");
Integer score = (Integer) request.getAttribute("score");
String result = (String) request.getAttribute("result");

request.setAttribute("score", score);
request.setAttribute("onumber", onumber);
request.setAttribute("name", name);

String ip = request.getParameter("ip");
pageContext.setAttribute("ip", ip); //현재 페이지에서 사용할 바인딩 객체

//점수 업데이트
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result_A</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
* {
	font-family: 'Do Hyeon', sans-serif;
}

h1 {
	border-bottom: 1px solid black;
	width: 250px;
}
th {
	width: 80px;
	height: 40px;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	font-size: 1.2em;
}

table {
	border: 1px solid black;
}

#num {
	color: black;
}

#answer {
	color: black;
	font-weight: bold;
	font-size: 2em;
}

#btn {
	background-color: #52b1ff;
	padding: 15px 25px;
	border-radius: 5px;
	margin-top: 20px;
}

#btn:hover {
	background-color: white;
	cursor: pointer;
}

#btn:active	{
	background-color: #9c9191;
	cursor: pointer;
}
</style>
</head>
<body>
<div align="center">
<h3>[응시결과 페이지]</h3>
<form action="insert.jsp" method="post">
<table border="1">
	<tr>
		<th>응시자</th>
		<th colspan="10">${dto.name}</th>
	</tr>
	<tr>
		<th>수험번호</th>
		<th colspan="10">${dto.onumber}</th>
	</tr>
	<tr>
		<th>문제</th>
		<c:forEach var="i" begin="1" end="10">
			<th id="num">
				${i}<br/>
			</th>
		</c:forEach>
	</tr>
	<tr>
		<th>정답</th>		
		<c:forEach var="i" items="${list2}">
			<th>
				${i.pass}<br/>
			</th>
		</c:forEach>
	</tr>
	<tr>
		<th>제출한 답</th>		
		<c:forEach var="i" items="${list}">
			<th>
				${i.pass}<br/>
			</th>
		</c:forEach>
	</tr>
	<tr>
		<th>채점</th>
		<c:forEach var="i" begin="1" end="10">
			<th id="answer">
				<c:if test="${list[i-1].pass == list2[i-1].pass }">○</c:if>
				<c:if test="${list[i-1].pass != list2[i-1].pass }">X</c:if>
			</th>
		</c:forEach>
	</tr>
	<tr>
		<th>점수</th>
		<th colspan="4">${score}점</th>
		<th>결과</th>
		<th colspan="5">
			<c:if test="${score < 60}">불합격!<br/></c:if>
			<c:if test="${score >= 60}">합격!<br/></c:if>
		</th>
	</tr>
</table>
	<input type="button" value="응시화면" onclick="location.href='index.jsp'" id="btn"/>
</form>
</div>
</body>
</html>