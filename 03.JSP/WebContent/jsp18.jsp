<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 17에서 넘겨 받은거 출력 : getAttribute();
request.setCharacterEncoding("utf-8");
MemberDTO dto =(MemberDTO) request.getAttribute("dto");
%>

<%
//dto 객체를 jsp19로 넘기자 : forward()동적페이지 전환
request.setAttribute("dto", dto);
%>
<jsp:forward page="jsp19.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP18</title>
</head>
<body>
○ 이름 : <%=dto.getName() %><br/>
○ 주소 : ${dto.addr }<br/>
</body>
</html>