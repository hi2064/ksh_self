<%@page import="com.hyundai.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Blue Hands</title>
<%
request.setCharacterEncoding("UTF-8");
String id2 = request.getParameter("NAME");
String USER_EMAIL = request.getParameter("useremail");

%>
<script type="text/javascript">
function emailFix(){
	opener.document.fr.USER_EMAIL.value = document.ofr.useremail.value;
	opener.document.fr.emailDumplication.value = 1;
	opener.document.fr.USER_EMAIL.readOnly = true;
	window.close();
}
function closeWin(){
	opener.document.fr.USER_EMAIL.value = document.ofr.useremail.value;
	opener.document.fr.emailDumplication.value = 1;
	opener.document.fr.USER_EMAIL.readOnly = true;
	window.close();
}
</script>
</head>
<body>
<fieldset>
<legend>[이메일 중복체크]</legend>
<%





MemberDAO bdao = new MemberDAO();

int result = bdao.emailCheck(USER_EMAIL);

if(id2 != null ){
	out.print(id2+"님께서 사용하고 계신 이메일 입니다.");
	%>
	<input type="button" value="계속사용하기" onclick="closeWin();">
	<hr>
	<%
}else if(result == 1){



	
	out.print("이미 가입된 이메일입니다.");
		
	
}else{	// result = 0;
	
	out.print("사용 가능한 이메일입니다.");
	%>
		<input type="button" value="이메일 사용하기" onclick="emailFix();"/>		<input type="button" value="나가기" onclick="window.close();">
	<hr>
	
	<%
}


%>

<form action ="joinEMAILCheck.jsp" method="post" name="ofr">
	<input type="email" name="useremail" value="<%=USER_EMAIL %>">
	<input type="submit" value="중복확인">
</form>
</fieldset>


</body>
</html>