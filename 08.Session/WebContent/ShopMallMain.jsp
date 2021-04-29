<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] img = {"apple1.jpg", "apple2.jpg", "apple3.jpg", "banana1.jpg", "banana2.jpg",
					"banana3.jpg", "pear1.jpg", "pear2.jpg", "pear2.jpg"};
String[] name = {"사과1", "사과2", "사과1", "바나나1", "바나나2",
					"바나나3", "배1", "배2", "배3"};
String[] price = {"1,500", "1,600", "1,700", "3,000", "3,500",
					"3,500", "5,000", "6,000", "7,000" };
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopMallMain JSP</title>
<script type="text/javascript">
function fnCart(name, price) {
	/* alert("Name : " + name + "\nPrice : " + price + "원"); */
	if(confirm("장바구니에 담으시겠습니까??")){
		location.href="CartProcess.jsp?name="+name+"&price="+price;
	}
	return false;
	
}

function fnView() {
	if(confirm("장바구니 보기를 하시겠습니까??")){
		location.href="CartView.jsp";
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
<h3>[과일 과일 과일 과일 과일 과일 과일 과일 과일 과일 과일]</h3>
<table border="1">
	<tr align="right">
		<td colspan="3">
			<input type="button" value="장바구니 보기" onclick="fnView()"/>
		</td>
	</tr>
	
	<%for(int i=0; i<img.length; i++) {
		if(i % 3 == 0){
			out.println("<tr align='center'>");
			
		}
		out.println("<td>");
		
		out.println("<table>");
		out.println("<tr align='center'>");
		out.println("<td>");
		out.println("<img src='images/" + img[i] + "'>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr align='center'>");
		out.println("<td>");
		out.println("<b>" + name[i] + "</b>");
		out.println("</td>");
		out.println("</tr>");
		

		out.println("<tr align='center'>");
		out.println("<td>");
		out.println("<b>￦" + price[i] + "원</b>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		
		out.println("<input type='button' value='장바구니 담기'");
		out.println("onclick='fnCart(\""+name[i]+"\", \""+price[i]+"\")' />");
		
		
		
		out.println("</td>");
		if(i % 3 == 2){
			out.println("</tr>");
		}
		
	
	}%>

</table>
</div>
</body>
</html>