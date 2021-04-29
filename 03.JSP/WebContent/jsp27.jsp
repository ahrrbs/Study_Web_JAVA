<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//study[] 배열을 초기화 -> 바인딩(연결)객체 -> jsp28.jsp 출력
String[] study = {"JAVA", "View", "DB", "Servlet/JSP", "Android", "R", "AI"};
request.setAttribute("study", study);

//ArrayList<> 배열을 생성하고 초기화 -> 바인딩(연결) 객체 -> jsp28.jsp 출력
ArrayList<String> list = new ArrayList<>();
list.add("오랜지");
list.add("바나나");
list.add("사과");
list.add("레몬");
list.add("맬론");
list.add("자두");
request.setAttribute("list", list);

MemberDTO dto = new MemberDTO();
dto.setName("한울");
dto.setId("hanul");
dto.setPw("1234");
dto.setAge(30);
dto.setAddr("광주시 서구 경열로");
dto.setTel("062-376-7797");
request.setAttribute("dto", dto);

//ArrayList<> 컬렉션 구조에 MemeberDTO Element Type을 갖는 객체배열을 생성
ArrayList<MemberDTO> mlist = new ArrayList<>();
mlist.add(new MemberDTO("홍길동", "홍", "1234", 11, "광주시", "010"));
mlist.add(new MemberDTO("홍길동", "홍", "1234", 12, "광주시", "010"));
mlist.add(new MemberDTO("홍길동", "홍", "1234", 13, "광주시", "010"));
mlist.add(new MemberDTO("홍길동", "홍", "1234", 14, "광주시", "010"));
mlist.add(new MemberDTO("홍길동", "홍", "1234", 15, "광주시", "010"));
request.setAttribute("mlist", mlist);

//RequestDispatcher rd = request.getRequestDispatcher("jsp28.jsp"); // 페이지 호출
//rd.forward(request, response); //페이지 전환
%>

<jsp:forward page="jsp28.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP27</title>
</head>
<body>

</body>
</html>