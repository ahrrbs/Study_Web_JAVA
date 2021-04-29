<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);

pageContext.setAttribute("dto", dto);

%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP20</title>
</head>
<body>
○JSP 기본 출력<br/>
이름(parameter) : <%=name %><br/>
아이디(dto) : <%=dto.getId() %><br/>
주소(acitonDTO) : <%=actionDTO.getAddr() %><br/>
<br/>
○ Action Tag 출력 : [jsp:useBean]으로 객체가 생성되어야지만 사용 가능<br/>
이름 : <jsp:getProperty property="name" name="actionDTO"/><br/>
아이디 : <jsp:getProperty property="id" name="actionDTO"/><br/>
주소 : <jsp:getProperty property="addr" name="actionDTO"/><br/>
<br/>
○ EL 표현식 출력 <br/>
이름 : ${param.name }(parameter), <br/>
아이디 : ${param.id }(parameter),<br/>
주소 : ${param.addr }(parameter),<br/>

</body>
</html>