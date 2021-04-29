<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int sum = 0;
for(int i = 1; i<=100; i++){
	sum +=i;
}

//sum 겨로가값을 현재 페이지에 출력 : EL표현식을 사용하기 위해 바인딩 객체 생성
pageContext.setAttribute("sum", sum);

//sum 겨로가값을 jsp22.jsp출력 : 동적페이지 전환(forward()) => 바인딩 객체 생성
request.setAttribute("sum", sum);
//RequestDispatcher rd = request.getRequestDispatcher("jsp22.jsp");
//rd.forward(request, response);
%>
<jsp:forward page="jsp22.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP21</title>
</head>
<body>
O JSP 출력 : <%=sum %><br/>
O EL 출력 : ${sum }
</body>
</html>