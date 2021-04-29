<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구구구구구구국구구구단 JSP</title>
</head>
<body>
<div align="center">
<h3>[구구구구구구구국구구구구단단단단단다나다나단 출추루추룿루출 력려결결겨력]</h3>
<table border="1">
	<tr bgcolor="silver">
		<%for(int i = 2; i<=9; i++){  %>
			<th><font color="red"><%=i %>단</font></th>
		<%} %>
	</tr>
	<tr>
		<%for(int i = 1; i<=9; i++){  %>
			<%if(i % 2 != 1) { %>
			<tr align="center" bgcolor="pink">
				<%for(int j=2; j<=9; j++) {%>
					<%if(i*j < 10){ %>
					<th> <%=j %> X <%=i %> = 0<%=i*j %> </th>
					<%} else {%>
					<th> <%=j %> X <%=i %> = <%=i*j %> </th>
					<%} %> 
				<%}// j for %>
			</tr>
			<%} else {%>
				<tr align="center" bgcolor="yellow">
				<%for(int j=2; j<=9; j++) {%>
					<%if(i*j < 10){ %>
					<th> <%=j %> X <%=i %> = 0<%=i*j %> </th>
					<%} else {%>
					<th> <%=j %> X <%=i %> = <%=i*j %> </th>
					<%} %> 
				<%}// j for %>
			</tr>
			<%} %>
		<%}//i for %>
	</tr>
</table>
</div>
</body>
</html>