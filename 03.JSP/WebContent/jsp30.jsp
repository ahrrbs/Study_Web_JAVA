<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JSTL core 변수를 선언한 수, jsp31.jsp로 넘겨서 출력 : 동적페이지 전환 --%>

<c:set var="name" value="컴퓨텨" scope="request"/>
<c:set var="code" value="abc001" scope="request"/>
<c:set var="price" value="500000" scope="request"/>
<jsp:forward page="jsp31.jsp"/>

</body>
</html>