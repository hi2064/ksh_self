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
<%
String id = (String) session.getAttribute("USER_ID");

request.setCharacterEncoding("UTF-8");
%>

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
</ul>
</nav>
<!-- 왼쪽메뉴 -->


<!-- 내용 -->
<article>
<h1>게시판</h1>
<fieldset>
<form action="boardPro2.jsp" method="post">
글쓴이 : <input name="NAME" value="<%=id %>" readonly><br>
<hr>
 제목 : <input type="text" name="SUBJECT" size="83"><br>
 <hr>
<br>
<textarea rows="30" cols="86" name="CONTENT"></textarea>
<center>
<input type="submit" value="게시하기">
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