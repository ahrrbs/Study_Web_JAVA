<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="com.hanul.OMR_A.OmrDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<jsp:useBean id="dao" class="com.hanul.OMR_A.OmrDAO"/>

<%
int succ = dao.memberInsert(dto);
if(succ > 0){
	out.println("<script>alert('응시 할 수 있습니다!!');");
	out.println("location.href='OMR_A.jsp?onumber="+dto.getOnumber()+"&name="+dto.getName()+"';");
	out.println("</script>");		
}else{
	out.println("<script>alert('이미 등록된 아이디거나 수험번호입니다.');");
	out.println("location.href='index.jsp';</script>");
}
%>