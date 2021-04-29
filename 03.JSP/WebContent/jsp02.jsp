<%@page import="com.hanul.study.SumMachine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
SumMachine sm = new SumMachine();
int sum = sm.getSum(1, 100);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP02</title>
</head>
<body>
첫 번째 정수부터 두 분째 정수까지의 누적합 : <%= sum %>
</body>
</html>