<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.OMR_A.OmrDAO"%>
<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
OmrDAO dao = new OmrDAO();
ArrayList<OmrDTO> list = dao.search();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List_A</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

* {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 1.1em;
}

body {
	color: #52b1ff;
}   

h1 {
	border-bottom: 1px solid black;
	width: 250px;
	font-size: 2.0em; 
}

th {
	width: 150px;
	height: 40px;  
	color : black;
}

#btn {
	background-color: #52b1ff;
	border-radius: 5px;
	margin: 5px;
}

#btn:hover {
	background-color: white;
	cursor: pointer;
}

#btn:active {
	background-color: #9c9191;
	cursor: pointer;
}
</style>

</head>
<body>
<div align="center">
<h1>[응시 결과]</h1>
<table border="2">
	<tr>
		<th>이름</th>
		<th>수험번호</th>
		<th>점수</th>
		<th>응시 결과</th>
	</tr>
	
	<%for(OmrDTO dto : list){ %>
		<tr align="center">
			<td><%=dto.getName() %></td>
			<td><%=dto.getOnumber() %></td>
			<td><%=dto.getScore() %></td>
			<td id="re"><%=dto.getResult() %></td>
		</tr>
	<%} %>
</table>
<input type="button" value="시험접수 페이지" onclick="location.href='index.jsp'" id="btn"/>
</div>
</body>
</html>