<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String[] study = (String[]) request.getAttribute("study");
ArrayList<String> list = (ArrayList<String>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP28</title>
</head>
<body>
[배열에 저장된 내용을 출력(JSP)-1]<br/>
<%
for(int i = 0; i < study.length; i++){
   out.println("study[] 배열의 " + i + "번지(인덱스) 값 : " + study[i] + "<br/>");
}
%>
<br/>

[배열에 저장된 내용을 출력(JSP)-2]<br/>
<%for(int i = 0; i < study.length; i++){ %>
   study[] 배열의 <%=i%>번지(인덱스) 값 : <%=study[i]%><br/>
<%} %>
<br/>

[배열에 저장된 내용을 출력(EL)]<br/>
study[] 배열의 0번지(인덱스) 값 : ${study[0]}<br/>
study[] 배열의 1번지(인덱스) 값 : ${study[1]}<br/>
study[] 배열의 2번지(인덱스) 값 : ${study[2]}<br/>
study[] 배열의 3번지(인덱스) 값 : ${study[3]}<br/>
study[] 배열의 4번지(인덱스) 값 : ${study[4]}<br/>
study[] 배열의 5번지(인덱스) 값 : ${study[5]}<br/>
study[] 배열의 6번지(인덱스) 값 : ${study[6]}<br/>
study[] 배열의 7번지(인덱스) 값 : ${study[7]}<br/>
<br/>
[ArrayList&lt;&gt; 배열을 받는 방법(JSP)]<br/>
<%
for(int i=0; i< list.size(); i++){
	out.println("ArrayList<> 배열의 " + i + "번지 값 : " + list.get(i) + "<br/>");
}
%>
<br/>
[ArrayList&lt;&gt; 배열을 받는 방법(EL)]<br/>
ArrayList&lt;&gt; 배열의  0번지(인덱스) 값 : ${list[0]}<br/>
ArrayList&lt;&gt; 배열의  1번지(인덱스) 값 : ${list[1]}<br/>
ArrayList&lt;&gt; 배열의  2번지(인덱스) 값 : ${list[2]}<br/>
ArrayList&lt;&gt; 배열의  3번지(인덱스) 값 : ${list[3]}<br/>
ArrayList&lt;&gt; 배열의  4번지(인덱스) 값 : ${list[4]}<br/>
ArrayList&lt;&gt; 배열의  5번지(인덱스) 값 : ${list[5]}<br/>
ArrayList&lt;&gt; 배열의  6번지(인덱스) 값 : ${list[6]}<br/>
<br/>

[바인딩 객체(dto)를 받는 방법(EL)]<br/>
이름 : ${dto.name}<br/>
아이디 : ${dto.id}<br/>
비밀번호 : ${dto.pw}<br/>
나이 : ${dto.age}<br/>
주소 : ${dto.addr}<br/>
전화번호 : ${dto.tel}<br/>
<br/>

[컬렉션 구조에 객체가 저장된 객체배열(mlist)을 받는 방법(EL)]<br/>
mlist 0번지 값 : ${mlist[0].name}, ${mlist[0].id}, ${mlist[0].pw}, ${mlist[0].age }<br/>
mlist 1번지 값 : ${mlist[1].name}, ${mlist[1].id}, ${mlist[1].pw}, ${mlist[1].age }<br/>
mlist 2번지 값 : ${mlist[2].name}, ${mlist[2].id}, ${mlist[2].pw}, ${mlist[2].age }<br/>
mlist 3번지 값 : ${mlist[3].name}, ${mlist[3].id}, ${mlist[3].pw}, ${mlist[3].age }<br/>
mlist 4번지 값 : ${mlist[4].name}, ${mlist[4].id}, ${mlist[4].pw}, ${mlist[4].age }<br/>
</body>
</html>







