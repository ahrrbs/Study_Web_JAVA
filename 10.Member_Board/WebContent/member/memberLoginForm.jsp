<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
function fnJoin(){
	if(confirm("회원가입을 하시겠습니까?")){
		location.href = "memberJoin.me";
	}
	return false;
}


</script>
<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

* {
	font-family: 'Black Han Sans', sans-serif;
	margin: 0px;
	padding: 0px;	
}

body {
	background-image: url('images/image1.png');
    background-size: cover;
    background-repeat : no-repeat;
}

#FD {
	width: 450px;
	padding: 10px;
	font-size: 1.2rem;
	text-align: center;
	border-radius: 20px;
	
	position: absolute;
	top: 30%;
	left: 46%;
	
	transform: translate(-50%, -50%);
	
	box-shadow: 5px 5px 20px gray;

	
}

table {
	width: 445px;
	text-align: center;
	
}

th{
	width: 120px;
	height: 30px;
	line-height: 30px;
}
td{
	height: 30px;
	line-height: 30px;
}

input[type="text"],
input[type="password"] {
	background: none;
	display: inline-block;
	text-align: center;
	border: 2px solid #e48325;
	width: 250px;
	height: 25px;
	line-height: 25px;
	outline: none;
	border-radius: 20px;
	transition-duration: 0.25s;
	margin: 5px auto;
}


input[type="text"]:focus,
input[type="password"]:focus {
	display: inline-block;
	background: none;
	border-color: black;
	color: red;
}  

input[type="submit"],
input[type="button"] {
	background: none;
	border: 2px solid #8c4e12;
	color: black;
	border-radius: 25px;
	transition-duration: 0.25s;
	text-align: center;
	display: inline-block;
	outline: none;
	cursor: pointer;
	margin: 10px auto;
	
	width: 170px;
	height: 35px;
	line-height: 35px;
	font-size: 1.1rem;
}

input[type="submit"]:hover,
input[type="button"]:hover {
	background-color: #e48325;	
} 


</style>
</head>
<body>
<div id="FD">
<form action="memberLoginAction.me" method="post">
<table>
	<tr>
		<th>아&nbsp;이&nbsp;디</th>
		<td><input type="text" name="member_id" required="required"/></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="member_pw" required="required"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인"/>
			<input type="button" value="회원가입" onclick="fnJoin()"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>