<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

	String USER_ADRESS =
			"("+ request.getParameter("postcode") + ")" + request.getParameter("roadAddress")+request.getParameter("jibunAddress")
			+ " " + request.getParameter("detailAddress") + request.getParameter("extraAddress");
%>

	<jsp:useBean id="mb" class="com.hyundai.member.memberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	<jsp:getProperty property="USER_ID" name="mb"/>
	<jsp:getProperty property="USER_PW" name="mb"/>
	<jsp:getProperty property="USER_NAME" name="mb"/>
	<jsp:getProperty property="USER_EMAIL" name="mb"/>
	<jsp:getProperty property="USER_ADRESS" name="mb"/>
	<jsp:getProperty property="USER_PHONE" name="mb"/>
	<jsp:getProperty property="USER_BIRTHDAY" name="mb"/>
	<jsp:getProperty property="CAR" name="mb"/>
	<jsp:getProperty property="CARYEAR" name="mb"/>
	
	
<%
	
	MemberDAO bdao = new MemberDAO();

	mb.setUSER_ADRESS(USER_ADRESS);
	bdao.join(mb);
	
%>
<script type="text/javascript">
	alert("환영합니다");
	location.href="../index.jsp"
</script>


	
	

</body>
</html>