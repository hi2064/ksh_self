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
<center>
<h1>What makes you move?</h1>
<br>
<p>
당신과 함께 세상을 움직입니다.<br>
<br>
자동차는 단순한 이동수단이 아닙니다.<br>
누군가에게 휴식이 되고<br>
생계를 영위하는 수단이며<br>
가족, 친구, 연인과의 소중한 시간을 쌓는 공간입니다.<br>
<br>
<hr>
<br>
현대자동차는 고객의 평범한 일상을 공유하고,<br>
가능성을 현실로 이루는 과정에 함께합니다.<br>
<br>
손에 겨우 잡힐만한 작은 부품을 만드는 일에서부터<br>
어린이들에게 자동차 만화를 보여주는 일까지<br>
현대자동차에는 정말 많은 일이 있고, 그보다 더 많은 수만 명의 사람들이 있습니다.<br>
그리고 하나의 제품을 위해 모두 한 마음으로 연결되어 일합니다.<br>

우리의 일이 미칠 영향을 무겁게 인식하는 책임감,<br>
우리의 자동차가 고객의 삶에 파트너로서 함께하는 자부심.<br>
<br>
미래의 구성원들도 이 힘을 같이 느낄 수 있도록 우리는 끊임없이 노력할 것입니다.<br>
<br>
<hr>
<br>
What makes you move?<br>
당신을 움직이는 힘은 무엇인가요?<br>
<br>
앞으로 무슨 일을 하고<br>
누구와 동료가 되어 관계를 맺고<br>
어떤 회사의 구성원이 되고 싶은지<br>
'무엇이 나를 움직이게 하는지'<br>
삶에 대한 열정과 고민을 통해 이 질문에 답을 찾아내시는<br>
당신과 함께 세상을 움직입니다.<br>
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