<%@page import="com.hanul.OMR_A.OmrDAO"%>
<%@page import="com.hanul.OMR_A.OmrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* request.setCharacterEncoding("utf-8");
int onumber = Integer.parseInt(request.getParameter("onumber"));
OmrDAO dao = new OmrDAO();

int succ = dao.sameOnumber(onumber);

if(succ > 1 ) {
	out.println("<script>alert('시험 응시합니다.')");
	out.println("location.href='OMR_A.jsp?onumber="+onumber+"'</script>");
} else {
	out.println("<script>alert('시험 응시 실패.')");
	out.println("location.href='index.html'</script>");
} */

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Main</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("정말 응시하시겠습니까??")){
		return true;
	}
	return false;
}

</script>
</head>
<body>
<div align="center">
<h3>[응시하기 입력화면]</h3>
<form action="insert.jsp" method="post" onsubmit="return fnSubmit()">


<table border="1">
  
   <tr>
      <th>수험번호</th>
      <td><input type="number" placeholder="- 없이 입력하세요.(8자)" name="onumber" required="required"/></td>
   </tr>
    <tr>
      <th>이름</th>
      <td><input type="text" name="name" required="required" /></td>
   </tr>
   <!-- <tr>
      <th>점수</th>
      <td><input type="hidden" name="score" required="required" /></td>
   </tr>
   <tr>
      <th>결과</th>
      <td><input type="hidden" name="result" required="required" /></td>
   </tr> -->
   <tr align="center">
      <td colspan="2">
         <input type="submit" value="응시하기"/>
         <input type="reset" value="다시작성"/>
         <input type="button" value="응시결과 보기" onclick="location.href='List_A.jsp'"/>
      </td>
   </tr>
</table>
</form>
</div>
</body>
</html>