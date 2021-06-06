<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>My Blue Hands</title>
</head>
<body>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 전달되는 파라미터값 저장(name, subject, filename, oFileName)
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename = request.getParameter("filename");
	String oFileName = request.getParameter("oFileName");
	
	%>
	<h2>파일 업로드 정보 및 전달 정보</h2>
	
	이름 : <%=name %>	<br/>
	제목 : <%=subject %>	<br/>
	파일이름 (서버에 저장된 이름) : <a href="file_down.jsp?filename"><%=filename %>	</a><br/>
	파일이름 (파일 원본이름) : <%=oFileName %>	<br/>

</body>
</html>