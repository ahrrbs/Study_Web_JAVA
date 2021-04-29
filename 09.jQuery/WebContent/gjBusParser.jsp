<%@page import="com.hanul.study.GjBusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
GjBusDAO dao = new GjBusDAO();
String json = dao.makeJson();

int beginIndex = json.indexOf("[");
int endIndex = json.indexOf("]");
json = json.substring(beginIndex, endIndex + 1);
%>

<%=json %>