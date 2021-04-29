<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("id"); // 세션 객체에서 id 속성을 제거
session.invalidate(); //모든 세션 객체의 속성 제거
response.sendRedirect("LoginMain.jsp");

%>

