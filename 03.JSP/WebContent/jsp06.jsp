<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDAO dao = new MemberDAO();
ArrayList<MemberDTO> list = dao.memberSearchAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp06</title>
<script type="text/javascript">
function fnDelete(id) {
	   //alert("id : "+ id);
	   if (confirm("정말 삭제하시겠습니까?")) {
	      location.href = "jsp07.jsp?id=" +id;
	   }//if
	   return false;
	}
</script>
</head>
<body>
<div align="center">
<h3>[전체회원 목록 보기]</h3>
<table border="1">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>나이</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>삭 제</th>
		<th>수 정</th>
	</tr>
	
	<%for(MemberDTO dto : list) { %>
		<tr align="center">
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPw() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getTel() %></td>
			<%-- <td><a href="jsp07.jsp?id<%=dto.getId()%>">삭 제 삭 제 삭 제</a></td> --%>
			<td><input type="button" value="삭제" onclick="fnDelete('<%=dto.getId()%>')"/></td>
			<td><input type="button" value="수정" onclick="location.href='jsp08.jsp?id=<%=dto.getId()%>'"/></td>
		</tr>
	<%} %>
	<tr align="center">
		<td colspan="8">
			<input type="button" value="회원가입" onclick="location.href='jsp05Main.html'"/>
		</td>
	</tr>
</table>
</div>
</body>
</html>