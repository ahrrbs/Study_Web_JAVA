<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP34</title>
</head>
<body>
<%--
JAVA 반복문 : for, while, do~while
JSTL core 반복문 : <c:forEach>실행문</c:forEach>
 --%>
 
 JAVA 반복문(for)<br/>
 <%
 for(int i=1; i<=7; i++){
	 out.println("<font size = '" + i + "'>안녕하세요</font><br/>");
 }
 %>
 <br/>
 <br/>
 JSTL 반복문(c:forEach)<br/>
 <c:forEach var="i" begin="1" end="7">
 <font size="${i}">하윙!!~~~!~!~!~</font><br/>

 </c:forEach>
 
 <c:forEach var="i" begin="1" end="7" step="2">
 <font size="${i}">하윙!!!</font><br/>

 </c:forEach>
</body>
</html>