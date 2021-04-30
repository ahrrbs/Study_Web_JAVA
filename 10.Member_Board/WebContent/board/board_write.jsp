<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
if(id == null) {
	response.sendRedirect("memberLogin.me");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>
<script type="text/javascript">

function fnSubmit() {
	if(confirm("작성하신 글을 등록하시겠습니까??")){
		return true;
	}
	return false;
	
}
function fnRest() {
	if(confirm("작성하신 글을 삭제하시겠습니까??")){
		return true;
	}
	return false;
	
}

</script>
</head>
<body>
<div align="center">
<h2>글 쓰 기 ~~~~~~~~~~!!!!!!!!!!</h2>
<form action="boardAddAction.bo" method="post" onsubmit="return fnSubmit()" onreset="return fnRest()"
	enctype="multipart/form-data"><!-- 파일 업로드 할거면 enctype 추가  -->
<input type="hidden" name="board_id" value="${id}" />
<table border="1">
	<tr><th>작성자</th><td>${id}</td></tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="board_subject" required="required" maxlength="50"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="15" cols="50" name="board_content" required="required"></textarea> </td>
	</tr>
	<tr>
		<th>파일첨부</th>
		<td><input type="file" name="board_file" /> </td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="submit" value="글등록" />
			<input type="reset" value="다시작성" />
			<input type="button" value="목록보기"  onclick="location.href='boardList.bo'" />
			
		</td>
	
	</tr>


</table>
</form>

</div>

</body>
</html>