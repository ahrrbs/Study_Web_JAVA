<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="com.hanul.OMR_A.OmrDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UT.F-8">
<title>OMR_A JSP</title>
<script type="text/javascript">
function OnSubmit() {
	if(confirm("확인을 누르시면 제출됩니다.??")){
		return true;
	}
	return false;
}
</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

* {
	font-family: 'Do Hyeon', sans-serif;
}

div {
	overflow: hidden;
	float: left;
}


h1 {
	color: #52b1ff;
	border-bottom: 1px solid black;
	width: 300px;
	margin-bottom: 30px;
	margin-top: 50px;
}

#btn1, #btn2 {
	padding:  9px 25px;
	height: 50px;
	font-size: 1.5em; 
}

#btn1:hover, #btn2:hover  {
	background-color: #52b1ff;
}

th {
	color: #52b1ff;
	width: 70px;
	height: 30px;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}

td {
	width: 50px;
	height: 30px;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}

.icon {
	font-size: 1.9em;
}

span {
	padding-right: -30px;
	cursor: pointer;
}

.icon:hover	{
	background-color: gray;
	cursor: pointer;
}

.icon:active {
	background-color: #9c9191;
	cursor: pointer;
}

input[type="radio"] {
  display:none;
}

input[type="radio"] + span {
  display:inline-block;
  background:none;
  border:1px solid #dfdfdf;  
  text-align:center;
  height:40px;
  width : 50px;
  font-weight:500;
  cursor:pointer;
}

input[type="radio"]:checked + span {
  border:1px solid #23a3a7;
  background: #52b1ff;
  color: yellow;
}

input[type=radio]:checked {
	background-color: red;
}

radio:checked~.icon>td {
	background-color: red;
}

table {
	border: 1px solid black;
	background-color: white;
}

tr {
	border: 3px solid black;
}
</style>
</head>
<body>
<img src="img/text.png" class="png" align="left"/>
<div align="center">

<h1>[OMR 답안 작성페이지]</h1>
<form action="Check.jsp" method="post" onsubmit="return OnSubmit()">
<input type="hidden" name="name" value="<%=dto.getName()%>">
<input type="hidden" name="onumber" value="<%=dto.getOnumber()%>">
<table border="2">
	<tr>
		<th>이름</th>
		<th colspan="4"><%=dto.getName()%></th>
	</tr>
	<tr>
		<th>수험번호</th>
		<th colspan="4"><%=dto.getOnumber()%></th>
	</tr>
	<tr>
		<th>문제번호</th>
		<th colspan="4" id="oknum">정답번호</th>
	</tr>
	
	<%for (int i = 1; i <= 10; i++) {%>
	<tr>
		<th><%=i%>번</th>
		<%for (int j = 1; j <= 4; j++) {%>
		<td class="icon">
			<label><input type="radio" name="<%=i%>" value="<%=j%>" required="required"/><span class="span"><%=j%></span></label>
		</td>
		<%}%>
	</tr>
	<%}%>
	<tr>
		<td colspan="5" align="center">
			<input type="submit" value="제출하기" id="btn1"/>
			<input type="reset" value="초기화하기" id="btn2"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>