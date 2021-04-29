<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@page import="com.hanul.Score_A.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

ArrayList<ScoreDTO> list = (ArrayList<ScoreDTO>) request.getAttribute("list");
ArrayList<ScoreDTO> list2 = (ArrayList<ScoreDTO>) request.getAttribute("list2");
Integer score = (Integer) request.getAttribute("score");
Integer onumber = (Integer) request.getAttribute("onumber");
String name = (String) request.getAttribute("name");


request.setAttribute("score", score);
request.setAttribute("onumber", onumber);
request.setAttribute("name", name);


String ip = request.getParameter("ip");
pageContext.setAttribute("ip", ip); //현재 페이지에서 사용할 바인징 객체
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result_A</title>
</head>
<body>
<div align="center">
<h3>[응시결과 페이지]</h3>
<form action="insert.jsp" method="post">
<table border="1">
	<tr>
		<th>문제</th>
		<c:forEach var="i" begin="1" end="10">
			<th>
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
			<th>
				<c:if test="${list[i-1].pass == list2[i-1].pass }">○</c:if>
				<c:if test="${list[i-1].pass != list2[i-1].pass }">X</c:if>
			</th>
		</c:forEach>
	</tr>
	<tr>
		<th>결과</th>
		<th colspan="10">
			<c:if test="${score < 60}">불합격!<br/>${dto.name}님의 점수는 ${score}점입니다.</c:if>
			<c:if test="${score >= 60}">합격!<br/>${dto.name}님의 점수는 ${score}점입니다.</c:if>
		</th>
	</tr>
</table>
	<input type="button" value="응시화면" onclick="location.href='index.jsp'" />
</form>
</div>
</body>
</html>