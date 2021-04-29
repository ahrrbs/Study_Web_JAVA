<%@page import="com.hanul.study.MemberDAO"%>
<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
/* 
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel); */

/* MemberDTO dto = new MemberDTO();
dto.setName(request.getParameter("name"));
dto.setId(request.getParameter("id"));
dto.setPw(request.getParameter("pw"));
dto.setAge(Integer.parseInt(request.getParameter("age")));
dto.setAddr(request.getParameter("addr"));
dto.setTel(request.getParameter("tel")); */
%>

<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<%
MemberDAO dao = new MemberDAO();
int succ = dao.memberInsert(dto);

if(succ > 0){
	out.println("<script>alert('회원가입 성공!!');");
	out.println("location.href='list.jsp';</script>");
}else{
	out.println("<script>alert('회원가입 실패!!');");
	out.println("location.href='list.jsp';</script>");
}
%>