<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<MemberDTO> list = new ArrayList<>();
list.add(new MemberDTO("한울", "hanul", "1234", 11, "광주시", "062-362-7797"));
list.add(new MemberDTO("한울", "hanul", "1234", 22, "광주시", "062-362-7797"));
list.add(new MemberDTO("한울", "hanul", "1234", 33, "광주시", "062-362-7797"));
list.add(new MemberDTO("한울", "hanul", "1234", 44, "광주시", "062-362-7797"));
list.add(new MemberDTO("한울", "hanul", "1234", 55, "광주시", "062-362-7797"));

pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
JAVA 단순 for<br/>
<ul>
	<%
		for(int i=0; i<list.size(); i++){
			out.println("<li>" + list.get(i).getName());
			out.println(list.get(i).getId());
			out.println(list.get(i).getPw());
			out.println(list.get(i).getAge());
			out.println(list.get(i).getAddr());
			out.println(list.get(i).getTel() + "</li>");
		}
	%>
</ul>

JAVA 향상된 for<br/>
<ul>
	<%
		for(MemberDTO dto : list){
			out.println("<li>" + dto.getName());
			out.println(dto.getId());
			out.println(dto.getPw());
			out.println(dto.getAge());
			out.println(dto.getAddr());
			out.println(dto.getTel() + "</li>");
		}
	%>
</ul>

EL 표기법<br/>
<ul>
	<li>${list[0].name} ${list[0].id} ${list[0].pw} ${list[0].age}</li>
	<li>${list[1].name} ${list[1].id} ${list[1].pw} ${list[1].age}</li>
	<li>${list[2].name} ${list[2].id} ${list[2].pw} ${list[2].age}</li>
	<li>${list[3].name} ${list[3].id} ${list[3].pw} ${list[3].age}</li>
	<li>${list[4].name} ${list[4].id} ${list[4].pw} ${list[4].age}</li>
</ul>


JSTL core<br/>
<ul>
	<c:forEach var="i" items="${list}">
		<li>${i.name} ${i.id} ${i.pw} ${i.age} ${i.addr} ${i.tel}</li>
	</c:forEach>
</ul>
</body>
</html>