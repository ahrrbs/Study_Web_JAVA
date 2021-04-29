<%@page import="java.text.DecimalFormat"%>
<%@page import="com.hanul.cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

ArrayList<CartDTO> cart = null;
Object obj = session.getAttribute("cart"); //세션객체에서 cart값을 가져온다.

if(obj == null){ //세션정보가 없다 : 최초주문 ▶  cart 배열 생성
	cart = new ArrayList<CartDTO>();
	
} else { //세션정보가 있다 : 추가주문 ▶  obj의 값을 cart 배열 타입으로 캐스팅
	cart = (ArrayList<CartDTO>) obj;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CartView JSP</title>
<script type="text/javascript">

function fnPay(totalSum) {
	/* alert("결제 금액 : " + totalSum); */
	if(confirm(totalSum + "을 결제하시겠습니까??")){
		alert("결제 API를 발급 받으시기 바랍니다.");
	}else {
		alert("결제가 취소되었습니다.");
	}
}

function fnClear() {
	if(confirm("장바구니를 비우시겠습니까??")){
		location.href="CartClear.jsp";
	}
	return false;
}

function fnShop() {
	location.href="ShopMallMain.jsp";
}
</script>
</head>
<body>
<div align="center">
<h2>[장바구니 보기]</h2>
<table border="1" style="width: 80%">
	<tr>
		<th>번호</th>
		<th>과일명</th>
		<th>단가</th>
		<th>주문수량</th>
		<th>가격</th>
	</tr>
	<%
	if(cart.size() == 0) {
		out.println("<tr align='center'>");
		out.println("<td colspan='5'>");
		out.println("주문하신 내역이 없습니다.<br/>");
		out.println("<a href='ShopMallMain.jsp'>주문하기</a>");
		out.println("</td>");
		out.println("</tr>");
		
		
	}else{
		int total = 0, totalSum = 0;
		DecimalFormat df = new DecimalFormat("￦#,###원");
		for(int i=0; i<cart.size(); i++){
			CartDTO dto = cart.get(i);
			out.println("<tr align='center'>");
			out.println("<td>" + (i+1) + "</td>");
			out.println("<td>" + dto.getName() + "</td>");
			out.println("<td>" + df.format(dto.getPrice()) + "</td>");
			out.println("<td>" + dto.getCnt() + "</td>");
			total = dto.getPrice() * dto.getCnt();
			out.println("<td>" + df.format(total) + "</td>");
			out.println("</tr>");
			totalSum += total;
			
		}
		out.println("<tr>");
		out.println("<td colspan='4' align='right' >");
		
		out.println("<input type='button' value='주문계속하기' ");
		out.println("onclick='fnShop()' />");
		
		out.println("<input type='button' value='장바구니 비우기' ");
		out.println("onclick='fnClear()' />");
		
		out.println("<input type='button' value='결제하기' ");
		out.println("onclick='fnPay(\""+df.format(totalSum)+"\")' />");
		
		out.println("</td>");
		out.println("<td align='center' style='font-weight: bold'>" + df.format(totalSum) + "</td>");
		
		out.println("</tr>");
	
	}
	%>


</table>

</div>
</body>
</html>