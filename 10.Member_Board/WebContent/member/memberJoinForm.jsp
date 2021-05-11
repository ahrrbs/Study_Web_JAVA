<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Form</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function() {
	
	var regId = /^[a-z0-9]{8,15}$/;
	var regPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
	
	$("#member_id").blur(function() {
		if(!regId.test(member_id.value)) {
			var msg = "숫자와 영어 소문자로 8~15글자 입니다.";
			$("#idCheck").text(msg);
			$("#member_id").val("");
		}else {
			$.ajax({
				dataType : "json",
				url : "checkReg.jsp",
				success : function(data){
					resultHtml_id(data);
				},
				error : function(){
					alert("로딩실패!!!");
				}
			});//ajax
		}//if
	});//blur_id
	
	
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

	$("#member_pwCheck").blur(function() {
		if(!regPw.test(member_pwCheck.value)) {
			var msg = "숫자, 영문자, 특수문자를 모두 포함해 8~15글자 입니다.";
			$("#pwCheck2").text(msg);
			$("#member_pwCheck").val("");
		}else {
			$("#pwCheck2").text("");
			if (!member_pw.value) {
				$("#pwCheck2").text("먼저 위의 비밀번호를 입력하세요.");
			} else if (member_pw.value == member_pwCheck.value) {
				$("#pwCheck2").text("비밀번호가 일치합니다.");
			} else {
				$("#pwCheck2").text("비밀번호가 불일치합니다.");
				$("#member_pwCheck").val("");
			}//if pw, pwCheck 비교
		}
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

function resultHtml_id(data) {
	var result = false;
	$.each(data, function(key, value) {
		if (value.member_id == member_id.value) {
			result = true;
		}//if
	});//each
	
	if (result) {
		$("#idCheck").text("사용불가능한 아이디입니다.");
		$("#member_id").val("");
		$("#member_id").focus();
	} else {
		$("#idCheck").text("사용가능한 아이디입니다.");
	}//if	
}//resultHtml_id

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
#idCheck, #pwCheck, #pwCheck2, #emailCheck {
	display: block;
	color: red;
	text-align: center;
	font-size : 0.5em;
}
</style>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

body {
   background-image: url('images/quokka3.jpg');
}

#idCheck, #pwCheck, #pwCheck2, #emailCheck {
   display: block;
   color: red;
   text-align: center;
   font-size : 0.5em;
}

h3 {
   font-family: 'Jua', sans-serif;
   font-size: 2em;
}

table {
   width: 500px;
   height: 500px;
   background-color: white;
   border: 2px solid black;
   padding : 0px;
   margin: 0px;
   
}

table th {
   width : 25%;
   background-color: #FFE392;
}



table input[type="text"], input[type="password"] {
   width: 90%;
   margin-left: 10px;
}

input[type="number"] {
   margin-left : 10px;
}

input[type="button"]:hover, input[type="reset"]:hover, input[type="submit"]:hover  {
   background-color: #FFE392;
}

input[type="button"], input[type="reset"], input[type="submit"]  {
   width: 70px;
   height: 50px;
   font-family: 'Jua', sans-serif;
}

</style>
</head>
<body>
<div align="center">
<h3>회원가입</h3>
<form action="memberJoinAction.me" method="post">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="member_id" required="required" id="member_id"/>
			<span id="idCheck">&nbsp;&nbsp;</span></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="member_pw" required="required" id="member_pw"/>
			<span id="pwCheck">&nbsp;&nbsp;</span></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="member_pwCheck" required="required" id="member_pwCheck"/>
			<span id="pwCheck2">&nbsp;&nbsp;</span></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="member_name" required="required"/></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="number" name="member_age" required="required" min="0"/></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name="member_gender" value="남" checked="checked"/>남자
			<input type="radio" name="member_gender" value="여"/>여자
		</td>	
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="member_email" maxlength="30" id="member_email"/>
			<span id="emailCheck">&nbsp;&nbsp;</span></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="회원가입"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="로그인" onclick="location.href='memberLogin.me'"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>