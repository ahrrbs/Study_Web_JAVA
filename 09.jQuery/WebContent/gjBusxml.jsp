<%@page import="com.hanul.study.GjBusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
GjBusDAO dao = new GjBusDAO();
String xml = dao.makeXml();

/* int beginIndex = xml.indexOf("<LINE_LIST>"); */
/* int endIndex = xml.indexOf("</LINE_LIST>"); */


/* xml = xml.substring(beginIndex, endIndex + 12); */

int beginIndex = xml.indexOf("<ns2:LINE_INFO xmlns:ns2=\"net.gjcity.bus\">");
xml = xml.substring(beginIndex);

%>

<%=xml %>

