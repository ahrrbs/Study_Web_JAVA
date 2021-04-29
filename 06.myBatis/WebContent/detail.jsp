<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getById(id);
pageContext.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail JSP</title>
<style type="text/css">
.in {
	background-color: pink;
}
</style>
<script type="text/javascript">
	function fnSubmit() {
		if(confirm("정말 수정하시겠습니까??")){
			return true;
		}
		return false;
	}
</script>
</head>
<body>
<div align="center">
<h3 >[회원정보 수정화면]</h3>
<form action="update.jsp" method="post" onsubmit="return fnSubmit()">
<input type="hidden" name="id" value="${dto.id }" />
<table border="1">
	<tr>
		<th>이름</th>
		<%-- <td><input type="text" name="name" value="<%=dto.getName() %>" class="in" required="required" /></td> --%>
		<td><input type="text" name="name" value="${dto.name}" class="in" required="required"/></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" value="${dto.pw}" class="in" required="required"/></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="number" name="age" value="${dto.age}" class="in" required="required"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" value="${dto.addr}" class="in" required="required"/></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="${dto.tel}" class="in" required="required"/></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="submit" value="수정하기">
			<input type="reset" value="초기화하기">
			<input type="button" value="목록보기" onclick="location.href='list.jsp'">
		</td>
	</tr>

</table>
</form>
</div>
</body>
</html>