<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Insert Form</title>
</head>
<body>
<div align="center">
<h3>[게시판 글쓰기]</h3>
<form action="boardInsert.do" method="post">
<table border="1" style="width: 80%">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="b_writer" maxlength="20" required="required"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="b_subject" maxlength="50" required="required"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="50" name="b_content" required="required"></textarea></td>
		
		
	</tr>
	<tr>
	
		<th>비밀번호</th>
		<td><input type="password" name="b_pwd" maxlength="20" required="required"></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="submit" value="등록하기"/>
			<input type="reset" value="내용지우기"/>
			<input type="button" value="목록보기" onclick="location.href='boardList.do'"/>
		</td>
		
	</tr>
</table>


</form>
</div>
</body>
</html>