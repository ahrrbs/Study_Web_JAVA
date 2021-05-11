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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="jquery-3.4.1.js"></script>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("정말 수정하시겠습니까??")){
		return true;
	}
	return false;
}


$(function() {
	
	var regPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
	
	
	$("#member_pw").blur(function() {
		if(!regPw.test(member_pw.value)) {
			var msg = "숫자, 영문자, 특수문자를 모두 포함해 8~15글자 입니다.";
			$("#pwCheck").text(msg);
			$("#member_pw").val("");
		}else {
			$.ajax({
				dataType : "json",
				url : "checkReg.jsp",
				success : function(data){
					resultHtml_pw(data);
				},
				error : function(){
					alert("로딩실패!!!");
				}
			});//ajax
		}//if
	});//blur_pw

	
	$("#member_email").blur(function() {
		if(!regEmail.test(member_email.value)) {
			var msg = "잘못된 이메일 형식입니다.";
			$("#emailCheck").text(msg);
			$("#member_email").val("");
		}else {
			var msg = "올바른 이메일 형식입니다.";
			$("#emailCheck").text(msg);
		}//if
	});//blur_email
});//ready


function resultHtml_pw(data) {
	var result = false;
	$.each(data, function(key, value) {
		if (value.member_pw == member_pw.value) {
			result = true;
		}//if
	});//each
	
	if (result) {
		$("#pwCheck").text("사용불가능");
		$("#member_pw").val("");
		$("#member_pw").focus();
	} else {
		$("#pwCheck").text("사용가능");
	}//if
}//resultHtml_pw


</script>
<style type="text/css">
 @import url("css/base.css");
 @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
 
#pwCheck , #emailCheck {
   display: block;
   color: red;
   text-align: center;
   font-size : 0.5em;
}


</style>
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
		<td><input type="password" name="member_pw" value="${dto.member_pw }" id="member_pw"/>
			<span id="pwCheck">&nbsp;&nbsp;</span>
		</td>
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
			<input type="text" name="member_email" value="${dto.member_email }" maxlength="30"
				id="member_email" />
				<span id="emailCheck">&nbsp;&nbsp;</span>
		</c:if>
		<c:if test="${dto.member_email eq null }">
			<input type="text" name="member_email" value="" maxlength="30"
				id="member_email"/>
				<span id="emailCheck">&nbsp;&nbsp;</span>
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기"/>
			<input type="button" value="전체글 보기" onclick="location.href='boardList.bo'"/>
			<input type="button" value="로그인화면 " onclick="location.href='memberLogin.me'"/>
		</td>
	</tr>
</table>
</form>

</div>
</body>
</html>