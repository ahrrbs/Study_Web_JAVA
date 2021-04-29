<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@page import="com.hanul.Score_A.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

ArrayList<ScoreDTO> list = (ArrayList<ScoreDTO>) request.getAttribute("list");
ArrayList<ScoreDTO> list2 = (ArrayList<ScoreDTO>) request.getAttribute("list2");
Integer score = (Integer) request.getAttribute("score");
Integer onumber = (Integer) request.getAttribute("onumber");
String name = (String) request.getAttribute("name");


request.setAttribute("score", score);
request.setAttribute("onumber", onumber);
request.setAttribute("name", name);


String ip = request.getParameter("ip");
pageContext.setAttribute("ip", ip); //현재 페이지에서 사용할 바인징 객체

%>

