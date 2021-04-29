<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
MemberDAO dao = new MemberDAO();
List<MemberDTO> list = dao.memberSearchAll();

//현재 페이지에서만 사용할 바인딩 객체 : EL 표현식에 사용
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<script type="text/javascript">
	function fnDelete(id) {
		if(confirm("정말 삭제하시겠습니까??")){
			location.href="delete.jsp?id=" + id;
		}
		return false;
	}
	
	function fnUpdate(id) {
		location.href="detail.jsp?id=" + id;
	}
</script>
</head>
<body>
<h3 align="center">[전체 회원 목록 보기]</h3>
<table border="1" style="width:80%" align="center">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>나이</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	
	<%
	/* for(int i = 0; i< list.size(); i++){
		out.println("<tr align='center'>");
		out.println("<td>" + list.get(i).getName() + "</td>");
		out.println("<td>" + list.get(i).getId() + "</td>");
		out.println("<td>" + list.get(i).getPw() + "</td>");
		out.println("<td>" + list.get(i).getAge() + "</td>");
		out.println("<td>" + list.get(i).getAddr() + "</td>");
		out.println("<td>" + list.get(i).getTel() + "</td>");
		out.println("</tr>");
	} */
	
/* 	for(MemberDTO dto : list){
		out.println("<tr align='center'>");
		out.println("<td>" + dto.getName() + "</td>");
		out.println("<td>" + dto.getId() + "</td>");
		out.println("<td>" + dto.getPw() + "</td>");
		out.println("<td>" + dto.getAge() + "</td>");
		out.println("<td>" + dto.getAddr() + "</td>");
		out.println("<td>" + dto.getTel() + "</td>");
		out.println("</tr>");
	} */
	%>
	
	<c:forEach var="i" items="${list}">
		<tr align="center">
			<td>${i.name}</td>
			<td>${i.id}</td>
			<td>${i.pw}</td>
			<td>${i.age}</td>
			<td>${i.addr}</td>
			<td>${i.tel}</td>
			<td><input type="button" value="삭제" onclick="fnDelete('${i.id}')"/></td>
			<td><input type="button" value="수정" onclick="fnUpdate('${i.id}')"/></td>
		</tr>
	</c:forEach>
	
	<tr align="center">
		<td colspan="8">
			<form action="Search.jsp" method="post">
				<select name="part">
					<option value="name">이름</option>
					<option value="id">아이디</option>
					<option value="addr">주소</option>
					<option value="tel">전화번호</option>
				</select>
				<input type="text" name="searchData" required="required" />
				<input type="submit" value="검색하기"/>
				<input type="button" value="회원가입" onclick="location.href='memberMain.html'"/>	
			</form>
			
		</td>
	</tr>
</table>
</body>
</html>