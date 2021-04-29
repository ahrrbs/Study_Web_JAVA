<%@page import="com.hanul.OMR_A.OmrDAO"%>
<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndexJSP</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("정말 응시하시겠습니까??")){
		return true;
	}
	return false;
}
</script>

<style type="text/css">
body {
	background-color: white;
	color: #52b1ff;
}

#bg	{
	background-color: white;
	width: 400px;
	height: 300px;
	margin: 0px auto;	
}

h2 {
	color: #52b1ff;
	border-bottom: 1px solid black;
	width: 200px;
	margin-top: 10px;
}

#btn1, #btn2, #btn3 {
	background-color: #52b1ff;
	padding: 8px 10px;
}

#btn1:hover, #btn2:hover, #btn3:hover {
	background-color: white;
}

#form {
	border: 1px solid black;
	width: 300px;
	padding-bottom: 20px;
	padding-top: 20px;
	margin-top: 40x;
	height: 100px;
}

img {
	width: 300px;
	height: 150px;
	margin-top: 100px;
	border-radius: 10px;
}
</style>
</head>
<body>
<div align="center" id="bg">
<img src="img/omr.jpg" class="png"/>
<h2>시험접수 페이지</h2>
<form action="insert.jsp" method="post" id="form" onsubmit="return fnSubmit()">
<table>
	<tr>
		<th>수험번호</th>
		<td><input type="number" placeholder="- 없이 입력하세요.(8자)" name="onumber" required="required"/></td>
		</tr>
		<tr>
		<th>이름</th>
		<td><input type="text" name="name" required="required" /></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="submit" value="응시하기" id="btn1"/>
			<input type="reset" value="다시작성" id="btn2"/>
			<input type="button" value="응시자 결과 보기" onclick="location.href='List_A.jsp'" id="btn3"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>