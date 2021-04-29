<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<String> list = new ArrayList<>();
list.add("오렌지");
list.add("바나나");
list.add("멜론");
list.add("사과");
list.add("수박");

//현재 페이지에서만 사용할 바인딩 객체 생성 : EL 표현식에 사용
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP36</title>
</head>
<body>
○ JAVA 단순 for<br/>
<ul>
	<%
		for(int i = 0; i<list.size(); i++){
			out.println("<li>" + list.get(i) + "</li>");
		}
	%>
</ul>

<br/>
○ JAVA 향상된 for<br/>
<ul>
	<%
		for(String str : list){
			out.println("<li>" + str + "</li>");
		}
	%>
</ul>

<br/>
○ EL 표기법<br/>
<ul>
	<li>${list[0]}</li>
	<li>${list[1]}</li>
	<li>${list[2]}</li>
	<li>${list[3]}</li>
	<li>${list[4]}</li>
</ul>

<br/>
○ JSTL core
<ul>
	<c:forEach var="i" items="${list}">
		<li>${i}</li>
	</c:forEach>
</ul>

</body>
</html>















