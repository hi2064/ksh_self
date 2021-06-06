<%@page import="com.hyundai.board.boardDAO"%>
<%@page import="com.hyundai.comment.commentBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Blue Hands</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="com.hyundai.board.boardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="cb" class="com.hyundai.comment.commentBean"></jsp:useBean>
<jsp:setProperty property="*" name="cb"/>

<%
boardDAO bdao = new boardDAO();
bdao.delete(bb, cb);
%>

<script type="text/javascript">
alert("삭제완료");
location.href="board.jsp";
</script>

</body>
</html>