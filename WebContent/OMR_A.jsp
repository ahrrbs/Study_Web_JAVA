<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%
request.setCharacterEncoding("utf-8");

/* OmrDTO dto = new OmrDTO();
dto.setOnumber(Integer.parseInt(request.getParameter("onumber")));
dto.setName(request.getParameter("name"));
 */

%>
<jsp:useBean id="dto" class="com.hanul.OMR_A.OmrDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UT.F-8">
<title>OMR_A JSP</title>

</head>
<body>
<div align="center">
<h3>[OMR 답안 작성페이지]</h3>
<form action="Check.jsp" method="post" >
<table	border="1">
	<tr>
		<th><input type="text" name="onumber" value="<%=dto.getOnumber()%>"></th>
		<th colspan="4"><input type="text" name="name" value="<%=dto.getName()%>"></th>
	</tr>
	<tr>
		<th>문제번호</th>
		<th colspan="4" id="oknum">정답번호</th>
	</tr>
	
	<%for (int i = 1; i <= 10; i++) {%>
	<tr>
		<th><%=i%>번</th>
		<%for (int j = 1; j <= 4; j++) {%>
		<td><label><input type="radio" name="<%=i%>" value="<%=j%>"/><span><%=j%></span></label></td>
		<%}%>
	</tr>
	<%}%>
	<tr>
		<td colspan="5" align="center">
			<input type="submit" value="제출하기"/>
			<input type="reset" value="초기화하기"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>