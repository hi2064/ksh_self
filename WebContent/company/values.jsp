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
<center><h1>핵심 가치</h1></center>
<br>
<p>
5대 핵심가치는 현대자동차의 조직과 구성원에게 내재되어 있는 성공 DNA이자 더 나은 미래를 향하여 <br>
새롭게 발전시키고 있는 구체적인 행동양식입니다.<br>
현대자동차는 5대 핵심가치를 통해 글로벌 기업의 위상에 맞는 선진문화를 구축하며 <br>
성공 DNA를 더욱 발전시켜 나갈 것입니다.<br>
<br>
<center>
<table border="5" >
	<tr>
		<td height="80" width="130"><center>CUSTOMER<br>
		고객 최우선</center></td>
		<td><center>최고의 품질과 최상의 서비스를 제공함으로써 모든 가치의 중심에 <br>
		고객을 최우선으로 두는 고객 감동의 기업 문화를 조성한다.</center></td>
		
	</tr>
	<tr>
		<td height="80"><center>CHALLENGE<br>
		도전적 실행</center></td>
		<td><center>현실에 안주하지 않고 새로운 가능성에 도전하며 <br>
		'할 수 있다'는 열정과 창의적 사고로 반드시 목표를 달성한다.</center></td>
		
	</tr>
	<tr>
		<td height="80"><center>COLLABORATION<br>
		소통과 협력</center></td>
		<td><center>타 부문 및 협력사에 대한 상호 소통과 협력을 통해 <br>
		'우리'라는 공동체 의식을 나눔으로써 시너지효과를 창출한다.</center></td>
		
	</tr>
	<tr>
		<td height="80"><center>PEOPLE<br>
		인재 존중</center></td>
		<td><center>우리 조직의 미래가 각 구성원들의 마음가짐과 역량에 달려 있음을 믿고 자기계발에 힘쓰며, <br>
		인재 존중의 기업문화를 만들어 간다.</center></td>
		
	</tr>
	<tr>
		<td height="80"><center>GLOBALITY<br>
		글로벌 지향</center></td>
		<td><center>문화와 관행의 다양성을 존중하며, <br>
		모든 분야에서 글로벌 최고를 지향하고 글로벌 기업시민으로서 존경 받는 개인과 조직이 된다.</center></td>
		
	</tr>
</table>
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