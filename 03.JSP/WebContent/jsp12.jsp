<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//바인딩 객체를 받는다 : Class type, Casting
MemberDTO dto = (MemberDTO) request.getAttribute("dto");

//매개변수를 받는다
String ip = request.getParameter("ip");
pageContext.setAttribute("ip", ip); //현재 페이지에서 사용할 바인징 객체
//scope(공유범위) : pageContext, request, session, application -> EL 표현식에 사용

%>
<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
   <jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP12</title>
</head>
<body>
<%-- getProertry Ation Tag는 반드시 useBean Action Tag로 객체가 생성되어야 사용 가능 --%>
이름(JSP) : <%=dto.getName() %><br />
이름(EL) : ${dto.name}<br />
이름(ActionDTO) : <jsp:getProperty property="name" name="actionDTO"/><br />
이름(ActionDTO JSP) : <%=actionDTO.getName() %><br />
이름(ActionDTO EL) : ${actionDTO.name }<br />
<br/>

IP주소(JSP) : <%=ip%><br/>
IP주소(EL) : ${ip }<br/>
</body>
</html>