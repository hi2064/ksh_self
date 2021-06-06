<%@page import="com.hyundai.member.MemberDAO"%>
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

	<jsp:useBean id="mb" class="com.hyundai.member.memberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
<%
	MemberDAO bdao = new MemberDAO();

	int check = bdao.delete(mb);

if(check == 1){
	session.invalidate();
%>
<script type="text/javascript">
	alert("탈퇴완료");
	location.href="loginForm.jsp";
	
</script>
<%
}else if(check == 0){
%>	
	<script type="text/javascript">
	alert("비밀번호 오류!!");
	history.back();
</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("존재하지 않는 아이디 입니다.");
		history.back();
	</script>
<%
}
%>
	
	

</body>
</html>