<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Blue Hands</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function check(){
	if(document.fr.USER_ID.value==""){
		alert("아이디를 입력해주세요.");
		document.fr.USER_ID.focus();
		return false;
	}
	if(document.fr.USER_PW.value==""){
		alert("비밀번호를 입력해주세요.");
		document.fr.USER_PW.focus();
		return false;
	}
}

</script>
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
<!-- 헤더들어가는 곳 -->
<jsp:include page="/inc/top.jsp"></jsp:include>
<br>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<%
	String id = (String) session.getAttribute("USER_ID");

if(id == null){

%>
<li><a href="loginForm.jsp">로그인</a></li>
<li><a href="join.jsp">회원가입</a></li>
<%
}else{
%>
<li><a href="deleteForm.jsp">회원탈퇴</a></li>

<%
}
%>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>로그인</h1>
<form action="logninPro.jsp" id="join" name="fr" method="post" onsubmit="return check();">
<fieldset>

<label>아이디</label>
<input type="text" name="USER_ID"><br>
<label>비밀번호</label>
<input type="password" name="USER_PW"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="로그인" class="submit">
<input type="button" value="초기화" class="cancel" onclick="location.href='loginForm.jsp'">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="/inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>