<%@page import="com.member.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Detail From</title>
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
<h2>회원정보 수정화면</h2>
<form action="memberUpdateAction.me" method="post" onsubmit="return fnSubmit()">
<input type="hidden" name="member_id" value="${dto.member_id }" /> 
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${dto.member_id }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="member_pw" value="${dto.member_pw }"/></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="member_name" value="${dto.member_name }"/></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="number" name="member_age" value="${dto.member_age }" min="0"/></td>		
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<%-- 	<%if(dto.getMember_gender().equals("남")) {%>
			<input type="radio" name="member_gender" value="남" checked="checked"/>남자
			<input type="radio" name="member_gender" value="여" />여자
			<%}else{ %>
			<input type="radio" name="member_gender" value="남" />남자
			<input type="radio" name="member_gender" value="여" checked="checked"/>여자
			<%} %>	 --%>		
			<c:if test="${dto.member_gender eq '남' }">
				<input type="radio" name="member_gender" value="남" checked="checked"/>남자
				<input type="radio" name="member_gender" value="여" />여자
			</c:if>
			<c:if test="${dto.member_gender eq '여' }">
				<input type="radio" name="member_gender" value="남" />남자
				<input type="radio" name="member_gender" value="여" checked="checked"/>여자
			</c:if> 		 
		</td>		
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<c:if test="${dto.member_email ne null }">
			<input type="text" name="member_email" value="${dto.member_email }" maxlength="30"/>
		</c:if>
		<c:if test="${dto.member_email eq null }">
			<input type="text" name="member_email" value="" maxlength="30"/>
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기"/>
			<input type="reset" value="전체글 보기" onclick="location.href='board/board_list.jsp'"/>
			<input type="button" value="로그인화면 " onclick="location.href='memberLogin.me'"/>
		</td>
	</tr>
</table>
</form>

</div>
</body>
</html>