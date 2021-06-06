<%@page import="java.util.ArrayList"%>
<%@page import="com.hyundai.board.boardDAO"%>
<%@page import="com.hyundai.board.boardBean" %>
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
<!-- 내용 -->
<article>
<%
	request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("USER_ID");

if(id == null){
	%>
	<script type="text/javascript">
	alert("로그인후 이용해주세요!");
	history.back();
	</script>
	
	<%
}

	boardDAO bdao = new boardDAO();
	
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
	
	ArrayList boardList = bdao.getBoardList(startRow,pageSize);
	
	System.out.println(boardList.size());
	
%>
<h1>게시판</h1>
<br>
<center>

<table border="2" id="notice">
	<tr>
		<td>작성자</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>IP</td>
	</tr>
	<%
	for(int i=0;i<boardList.size();i++){
		boardBean bb = (boardBean) boardList.get(i);
	%>
	
	<tr onclick="location.href='Content.jsp?NUM=<%=bb.getNUM() %>&pageNum=<%=pageNum %>'">
		<td><%=bb.getNAME() %></td>
		<td>
		<%
		int wid = 0;
		if(bb.getRE_LEV()>0){
			wid = 10*bb.getRE_LEV();
		}
		%>
		<%=bb.getSUBJECT() %>
		</td>
		<td><%=bb.getDATE() %></td>
		<td><%=bb.getREADCOUNT() %></td>
		<td><%=bb.getIP() %></td>
	</tr>
		<%
	}
		%>
	
</table>
<br>
<%
if(cnt != 0){
	int pageCount = cnt/pageSize + (cnt% pageSize == 0 ? 0 : 1);
	int pageBlock = 2;
	int startpage = ((currentPage -1)/pageBlock)* pageBlock +1;
	int endPage = startpage + pageBlock -1;
	if(endPage > pageCount){
		endPage = pageCount;
	}
	if(startpage > pageBlock){
		%>
		<a href="board.jsp?pageNum=<%=startpage-pageBlock %>">[이전]</a>
		<%
	}
	for(int i=startpage;i<=endPage;i++){
		%>
		<a href="board.jsp?pageNum=<%=i %>">[<%=i %>]</a>
		<%
	}
	if(endPage < pageCount){
		%>
		<a href="board.jsp?pageNum=<%=startpage+pageBlock %>">[다음]</a>
		<%
	}
}
%>


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