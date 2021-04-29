<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">[응시 결과]</h3>
<table border="1" align="center">
	<tr>
		<th>이름</th>
		<th>수험번호</th>
		<th>점수</th>
		<th>응시 결과</th>
	</tr>
<%-- 	<% //안에 넣는거 바꿀 예정
	 for(int i = 0; i< list.size(); i++){
		out.println("<tr align='center'>");
		out.println("<td>" + list.get(i).getId() + "</td>");
		out.println("<td>" + list.get(i).getOnumber() + "</td>");
		out.println("<td>" + list.get(i).getScore() + "</td>");
		out.println("<td>" + list.get(i).getResult() + "</td>");
		out.println("</tr>");
	} 
	%> --%>
	<tr>
		<td colspan="4" align="center">
			<input type="button" value="로그인" onclick="location.href='index.html'"/>
			<input type="button" value="미정" onclick="location.href='#'"/>
			<input type="button" value="미정" onclick="location.href='#'"/>
		</td>
	</tr>


</table>
</body>
</html>