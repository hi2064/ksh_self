<%@page import="com.hyundai.comment.commentDAO"%>
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
<jsp:useBean id="cb" class="com.hyundai.comment.commentBean" />
<jsp:setProperty property="*" name="cb"/>
<%
String id = (String) session.getAttribute("USER_ID");

String pageNum = request.getParameter("pageNum");

commentDAO cdao = new commentDAO();

cdao.delete(cb);
%>




</body>
</html>