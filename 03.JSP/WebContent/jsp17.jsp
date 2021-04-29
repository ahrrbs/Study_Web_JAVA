<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);

//현재페이지에서만 사용할 바인딩 객체 생성 : EL 표현식에서 사용하기 위해
pageContext.setAttribute("dto",	dto);
%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>

<%
// 현재 페이지와 요청한 페이지에서 사용할 바인딩 객체 : request scope
request.setAttribute("dto", dto);
//RequestDispatcher rd = request.getRequestDispatcher("jsp18.jsp");
//rd.forward(request, response);
%>
<jsp:forward page="jsp18.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
○ 이름(JSP) : <%=name %><br/>
○ 이름(JSP) : <%=dto.getName() %><br/>
○ 이름(JSP) : <%=actionDTO.getName() %><br/>
<br/>
○ 아이디(action Tag) : 매개변수로 전달 받은 상태에서는 사용불가<br/>
○ 아이디(action Tag) : [jsp:useBean]으로 생성된 객체에서만 사용 가능<br/>
○ 아이디(action Tag) : <jsp:getProperty property="name" name="actionDTO"/><br/>
<br/>
○ 주소(EL) : ${param.addr }<br/>
○ 주소(EL) : ${dto.addr }<br/>
○ 주소(EL) : ${actionDTO.addr }<br/>

</body>
</html>