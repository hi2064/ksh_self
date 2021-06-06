<%@page import="com.hyundai.board.boardBean"%>
<%@page import="com.hyundai.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Blue Hands</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<br>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="board.jsp">리스트</a></li>
<li><a href="boardForm.jsp">글쓰기</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
String id = (String) session.getAttribute("USER_ID");

	int num = Integer.parseInt(request.getParameter("NUM"));
	String pageNum = request.getParameter("pageNum");


	boardDAO bdao = new boardDAO();
	
	boardBean bb = bdao.getboard(num);
	
%>

<!-- 내용 -->
<article>
<h1>글수정하기</h1>
<fieldset>
<form action="updatePro.jsp?NUM=<%=bb.getNUM() %>&pageNum=<%=pageNum %>" method="post">
글쓴이 : <input name="NAME" value="<%=id %>" readonly><br>
<hr>
 제목 : <input type="text" name="SUBJECT" size="79" value="<%=bb.getSUBJECT() %>"><br>
 <hr>
 파일 : <input type="file" value="<%=bb.getFILE() %>">
<br>
<br>
<textarea rows="30" cols="87" name="CONTENT" ><%=bb.getCONTENT() %></textarea>
<br>

<center>
<input type="submit" value="수정하기">
</center>
<center>
</center>


</form>
</fieldset>

</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="/inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>