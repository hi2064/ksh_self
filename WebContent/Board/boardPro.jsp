<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.hyundai.board.boardBean" %>
<%@page import="com.hyundai.board.boardDAO"%>
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
String id = (String) session.getAttribute("USER_ID");

%>
<jsp:useBean id="bb" class="com.hyundai.board.boardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>
<%
String path = request.getRealPath("/upload");

int maxSize = 10*1024*1024;

MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
String SUBJECT = multi.getParameter("SUBJECT");
String NAME = multi.getParameter("NAME");
String CONTENT = multi.getParameter("CONTENT");
String FILE =  multi.getFilesystemName("FILE");


bb.setSUBJECT(SUBJECT);
bb.setNAME(NAME);
bb.setCONTENT(CONTENT);
bb.setFILE(FILE);


bb.setIP(request.getRemoteAddr());


boardDAO bdao = new boardDAO();

bdao.insert(bb);

response.sendRedirect("board.jsp");

%>




</body>
</html>