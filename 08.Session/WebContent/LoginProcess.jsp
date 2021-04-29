<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");

//id 존재유무, pw 일치성 => DAO를 통해 DB와 연동해서 이상이 없으면
session.setAttribute("id", id); //session 바인딩 객체를 생성
session.setMaxInactiveInterval(60 * 10 * 1 * 1); // sesison 유지되는 시간 (초단위)

//Cookie(쿠키) 설정 : 사용자쪽(Client)에 쿠키를 넣어준다.
Cookie ck = new Cookie("id", id);
ck.setMaxAge(60 * 60 * 24 * 365); //쿠키의 유효시간 : 1년
response.addCookie(ck);

response.sendRedirect("LoginMain.jsp");
%>
