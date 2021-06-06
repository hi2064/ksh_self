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

String id = (String) session.getAttribute("USER_ID");

String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="cb" class="com.hyundai.comment.commentBean"></jsp:useBean>
<jsp:setProperty property="*" name="cb"/>
<%
commentDAO cdao = new commentDAO();


int check = cdao.update(cb,id);

if(check == 1){
	%>
	<script type="text/javascript">
	location.href="Content.jsp?NUM=<%=cb.getNUM() %>";
	</script>
	
	<%
}else if(check == 0){
	%>
	<script type="text/javascript">
	alert("댓글작성자가 아닙니다.");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("없는 댓글입니다.");
	history.back();
	</script>
	
	<%
}
	
%>

</body>
</html>