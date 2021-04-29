<%@page import="com.hanul.study.SumMachine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//1. 클라이언트의 요청을 받는다
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));

//2. 비지니스 로직 : 별도의 클래스에서 작성 후 결과값을 리턴
SumMachine sm = new SumMachine();
int sum = sm.getSum(num1, num2);

//3. 프리젠테이션 로직 : 결과를 출력 => jsp04.do
request.setAttribute("num1", num1);
request.setAttribute("num2", num2);
request.setAttribute("sum", sum);

RequestDispatcher rd = request.getRequestDispatcher("jsp04.jsp");

rd.forward(request, response); //페이지 전환
%>
