<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--

/* request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");

MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel); */

request.setCharacterEncoding("utf-8");
MemberDTO dto = new MemberDTO();
dto.setName(request.getParameter("name"));
dto.setId(request.getParameter("id"));
dto.setPw(request.getParameter("pw"));
dto.setAge(Integer.parseInt(request.getParameter("age")) );
dto.setAddr(request.getParameter("addr"));
dto.setTel(request.getParameter("tel"));


--%>   

<%
request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<%-- <jsp:setProperty property="name" name="dto"/> --%>
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<jsp:useBean id="dao" class="com.hanul.study.MemberDAO"/>

<%
int succ = dao.memberInsert(dto);
if(succ > 0){
	out.println("<script>alert('회원가입 성공!');");
	out.println("location.href = 'jsp05Main.html';</script>");
}else {
	out.println("<script>alert('회원가입 실패!');");
	out.println("location.href = 'jsp05Main.html';</script>");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp05</title>
</head>
<body>

</body>
</html>