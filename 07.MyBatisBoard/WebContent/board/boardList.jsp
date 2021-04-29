<%@page import="com.hanul.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri ="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
</head>
<body>
<div align="center">
<h3>[게시판 목록 보기]</h3>
<table border="1" style="width: 80%">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<%-- 
	JSTL core 문법을 이용한 출력 -> b_num_seq에 의ㅐㅎ서 번호의 순서가 맞지 않다.
	<c:if test="${empty list}">
		<tr align="center">
			<td colspan="5"> 작성된 글이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty list}">
		<c:forEach var="i" items="${list}">
			<tr align="center">
				<td>${i.b_num}</td>
				<td>${i.b_subject}</td>
				<td>${i.b_writer}</td>
				<td>${i.b_date}</td>
				<td>${i.b_readcount}</td>
			</tr>
		</c:forEach>
	</c:if>
	 --%>
	 <%if(list.size() == 0) { %>
	 	<tr align="center">
			<td colspan="5"> 작성된 글이 없습니다.</td>
		</tr>
	 <%} else {%>
			<%for(int i=0; i<list.size(); i++) { %>
				<tr align="center">
					<%-- <td><%=list.get(i).getB_num() %></td> --%>
					<td><%=list.size() - i %></td>
					<td><a href="boardDetail.do?b_num=<%=list.get(i).getB_num()%>">
					<%=list.get(i).getB_subject() %></a></td>
					<td><%=list.get(i).getB_writer() %></td>
					<td><%=list.get(i).getB_date() %></td>
					<td><%=list.get(i).getB_readcount() %></td>
				</tr>
			<%} %>
	 <%} %>
	 <tr align="center">
	 	<td colspan="5">
	 		<form action="boardSearch.do" method="post">
	 			<select name="part">
	 				<option value="b_subject">제목</option>
	 				<option value="b_content">내용</option>
	 				<option value="b_writer">작성자</option>
	 			</select>
	 			<input type="text" name="searchData" required="required"/>
	 			<input type="submit" value="검색하기"/>
	 			<input type="button" value="글쓰기" onclick="location.href='boardInsertForm.do'"/>
	 		</form>
	 			
	 		
	 	</td>
	 </tr>
</table>

</div>
</body>
</html>













