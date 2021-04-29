<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnTime() {
	var date = new Date();
	//alert(date);
	
	var hour = date.getHours(); //현재 시각의 시
	var minute = date.getMinutes(); //현재 시각의 분
	var second = date.getSeconds();
	//alert("시 : " + hour + "\n분 : " + minute + "\n초 : " + second);
	
	var setTime = hour > 12 ? "오후 " : "오전 ";
	setTime += (hour > 12 ? hour - 12 : hour) + "시 "; 
	setTime += (minute < 10 ? "0" + minute : minute) + "분 ";
	setTime += (second < 10 ? "0" + second : second) + "시 ";
	
	document.getElementById("time").innerHTML = setTime;
	alert(setTime);
}
</script>
</head>
<body onload="fnTime()">
<div align="center" id="time">현재 시간</div>
<div align="center">
	<table border="1">
		<tr align="center">
			<td colspan="2" height="150">회사로고/네이게이션 메뉴</td>
		</tr>
		<tr align="center">
			<td width="30%" height="300">로그인 들어갈 부분</td>
			<td width="70%" >본문영역이 들어갈 부분</td>
		</tr>
		<tr align="center">
			<td colspan="2">
			<!-- 회사로고/네이게이션 메뉴 -->
			<%@ include file="jsp15.jsp" %>
			<br/>
			<jsp:include page="jsp15.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>
</body>
</html>