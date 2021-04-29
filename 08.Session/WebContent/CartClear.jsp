<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session.removeAttribute("cart"); //cart 세션객체가 삭제
response.sendRedirect("ShopMallMain.jsp");
%>
