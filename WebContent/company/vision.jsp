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
<li><a href="sub.jsp">기업소개</a></li>
<li><a href="introduce.jsp">경영철학</a></li>
<li><a href="values.jsp">핵심가치</a></li>
<li><a href="vision.jsp">비전</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<center><h1>비전</h1></center>
<br>
	<p>
<center>
	<h3>현대자동차그룹이 반드시 성취해야 할 향후 10년 간의 사업 목표로,<br>
	 구체적인 경영전략 및 실행과제를 통해 비전을 달성해나갈 것입니다.</h3><br>
	 <br>
	<h2> 자동차에서 삶의 동반자로<br>
		 Lifetime partner in automobiles and beyond</h2><br>
		 
	<h3>인간중심적이고 환경친화적인 혁신 기술과 포괄적 서비스를 기반으로 <br>
	최상의 이동성을 구현하여 삶을 더욱 편리하고 즐겁게 영위할 수 있는 새로운 공간을 제공한다.</h3>
	<br>
	<br>
	<img src="../images/blue/1.jpg">
	
	 <br>
	</p>
</center>
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