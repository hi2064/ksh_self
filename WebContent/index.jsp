<%@page import="com.hyundai.board2.BoardBean2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hyundai.board2.Board2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
<title>My Blue Hands</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]--> 


</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="/inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="images/blue/hyundai1234.jpg"
 width="971" height="500"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">&nbsp&nbsp&nbsp&nbsp 공지사항</span></h3>
<dl>

<%
	request.setCharacterEncoding("UTF-8");


	Board2DAO bdao = new Board2DAO();
	
	int cnt = bdao.getBoardCount();
	
	int pageSize = 5;
	
	String pageNum = request.getParameter("pageNum");
			
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	
	int endRow = currentPage*pageSize;
	
	System.out.println(startRow + " / " + pageSize);
	
	ArrayList boardList = bdao.getBoardList(startRow, pageSize);
	
	System.out.println(boardList.size());
	
%>
<table border="3">
<tr>
		<td width="300" height="30" bgcolor="#708090"><center><h2>제목</h2></center></td>
		<td width="100" bgcolor="#708090"><center><h2>작성일</h2></center></td>
	</tr>
	<%
	for(int i=0;i<boardList.size();i++){
		BoardBean2 bb = (BoardBean2) boardList.get(i);
	%>
	
	<tr>
		<td height="20">
		<%
		int wid = 0;
		if(bb.getRE_LEV()>0){
			wid = 10*bb.getRE_LEV();
		}
			%>
			<center><%=bb.getSUBJECT() %></center>
			<%
		%>
		</td height="20">
		<td><center><%=bb.getDATE() %></center></td>
	</tr>
		<%
	}
		%>
</table>
</dl>

</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="/inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>