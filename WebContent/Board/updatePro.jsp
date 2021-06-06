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

String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="bb" class="com.hyundai.board.boardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>

<%
boardDAO bdao = new boardDAO();

int check = bdao.update(bb,id);

if(check==1){
	%>
	<script type="text/javascript">
	alert("정보수정완료");
	location.href="board.jsp?pageNum=<%=pageNum %>";
	</script>
	
	<%
}else if(check == -1){
	%>
	<script type="text/javascript">
	alert("작성자가 아닙니다");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("없는 글입니다");
	location.href="board.jsp";
	</script>
	<%
}
%>


</body>
</html>