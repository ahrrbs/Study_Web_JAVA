<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<%--dto 객체를 jsp12.jsp로 넘겨서 출력 : 동적페이지 전환 --%>
<%
String ip =request.getRemoteHost();
request.setAttribute("dto", dto); //바인딩(연결) 객체 
//RequestDispatcher rd = request.getRequestDispatcher("jsp12.jsp");
//rd.forward(request, response); //페이지 전환
%>

<jsp:forward page="jsp12.jsp">
	<jsp:param value="<%=ip %>" name="ip"/>
</jsp:forward> <%-- 위에 주석이랑 동일한 역할 --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP11</title>
</head>
<body>

</body>
</html>