<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더들어가는 곳 -->
<header>
<% 
	String id = (String) session.getAttribute("USER_ID");

	if(id == null){
%>
<div id="login"><a href="<%=application.getContextPath()%>/member/loginForm.jsp">로그인</a> | <a href="<%=application.getContextPath()%>/member/join.jsp">회원가입</a></div>
<%
	}else{
%>
<div id="login"><%=id %>님 환영합니다. <a href="<%=application.getContextPath()%>/member/logout.jsp">로그아웃</a> | <a href="<%=application.getContextPath()%>/member/update.jsp">개인정보수정</a> | <a href="<%=application.getContextPath()%>/member/deleteForm.jsp">회원탈퇴</a></div>
<%
	}
%>
<div class="clear"></div>

<!-- 로고들어가는 곳 -->
<div id="logo"><img src="<%=application.getContextPath()%>/images/blue/logo.jpg" width="265" height="100" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="<%=application.getContextPath()%>/index.jsp">홈</a></li>
	<li><a href="<%=application.getContextPath()%>/company/sub.jsp">회사소개</a></li>
	<li><a href="<%=application.getContextPath() %>/Board/board.jsp">회원게시판</a></li>
	<li><a href="<%=application.getContextPath() %>/Board/board2.jsp">공지사항</a></li>
	<li><a href="<%=application.getContextPath() %>/map/map.jsp">가까운 정비소 찾기</a></li>
</ul>
</nav>
</header>
<!-- 헤더들어가는 곳 -->