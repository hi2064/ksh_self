<%@page import="com.hyundai.board2.BoardBean2"%>
<%@page import="com.hyundai.board2.Board2DAO"%>
<%@page import="com.hyundai.comment.commentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hyundai.comment.commentDAO"%>
<%@page import="com.hyundai.board.boardBean"%>
<%@page import="com.hyundai.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Blue Hands</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"></jsp:include>
<br>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int NUM = Integer.parseInt(request.getParameter("NUM"));
		String pageNum = request.getParameter("pageNum");
		
		Board2DAO bdao = new Board2DAO();
		
		BoardBean2 bb = bdao.getboard(NUM);
		
		String id = (String) session.getAttribute("USER_ID");
		
	%>

<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<%
if(id != null){
%>
<li><a href="board2.jsp">리스트</a></li>
<%
if(id.equals("admin")){
%>
<li><a href="boardForm2.jsp">글쓰기</a></li>
<%
}
}
%>
<% 
if(id.equals(bb.getNAME())){
%>
<li><a href="upDateForm2.jsp?NUM=<%=bb.getNUM() %>&pageNum=<%=pageNum %>">글수정</a></li>
<li><a href="deletePro2.jsp?NUM=<%=bb.getNUM() %>&pageNum=<%=pageNum %>" onclick="return confirm('삭제하시겠습니까?')" >글삭제</a></li>
<%
}
%>
</ul>
</nav>
	<article>
	<h1>공지글</h1>
	<fieldset>
	제목 : <%=bb.getSUBJECT() %>	<br>
	<hr>
	글쓴이 : <%=bb.getNAME() %>	<br>
	<hr>
	<textarea rows="30" cols="85" readonly="readonly">
	<%=bb.getCONTENT() %>
	</textarea>

	</fieldset>	
	
	</article>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>