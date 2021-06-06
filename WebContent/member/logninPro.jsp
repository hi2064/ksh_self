<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<jsp:getProperty property="USER_ID" name="mb"/>
	<jsp:getProperty property="USER_PW" name="mb"/>
	<%
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL ="jdbc:mysql://localhost:3306/my";
	final String DBID = "root";
	final String DBPW = "1234";
	
	Class.forName(DRIVER);
	
	Connection conn = 
			DriverManager.getConnection(DBURL, DBID, DBPW);
	
	String sql = "select USER_PW from user where USER_ID=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, mb.getUSER_ID());
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(mb.getUSER_PW().equals(rs.getString("USER_PW"))){
			session.setAttribute("USER_ID", mb.getUSER_ID());
			%>
			<script type="text/javascript">
			alert("로그인 성공");
			location.href="../index.jsp";
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
			alert("비밀번호 오류");
			history.back();
			</script>
			
			<%
		}
	}else{
		%>
		<script type="text/javascript">
		var delconfirm = confirm("비회원입니다. 회원가입 하시겠습니까?");
		if(delconfirm){
			location.href="join.jsp";
		}else{
			history.back();		
		}
		
		</script>
		
		
		<%
	}
	
	
	
	%>
	
</body>
</html>