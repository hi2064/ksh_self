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
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String) session.getAttribute("USER_ID");
	
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	%>
	<jsp:useBean id="mb" class="com.hyundai.member.memberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		System.out.println(mb);
	
		final String DRIVER= "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/my";
		final String DBID = "root";
		final String DBPW = "1234";	
	
		Class.forName(DRIVER);
		
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		String sql = "select * from user where USER_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		
 		if(rs.next()){
 			if(mb.getUSER_PW().equals(rs.getString("USER_PW"))){
				sql="update user set USER_NAME=?, USER_EMAIL=?, "
						+"USER_ADRESS =  ?, "
								+"USER_PHONE=?, USER_BIRTHDAY=?, CAR=?, CARYEAR=? where USER_ID=?";
				pstmt = conn.prepareStatement(sql);
				// USER_ADRESS = case when USER_ADRESS is not null then '무야호' else '오오' end where USER_ID = 'yolo';
				
				
				pstmt.setString(1, mb.getUSER_NAME());
				pstmt.setString(2, mb.getUSER_EMAIL());
				pstmt.setString(3, mb.getUSER_ADRESS());
				pstmt.setString(4, mb.getUSER_PHONE());
				pstmt.setString(5, mb.getUSER_BIRTHDAY());
				pstmt.setString(6, mb.getCAR());
				pstmt.setInt(7, mb.getCARYEAR());
				pstmt.setString(8, mb.getUSER_ID());
				
				pstmt.executeUpdate();
				
				%>
				<script type="text/javascript">
				alert("정보수정 완료");
				</script>
				
				<%
				response.sendRedirect("../index.jsp");	
			}else{
				%>
				<script type="text/javascript">
				alert("비밀번호는 변경하실수 없습니다.");
				history.back();
				</script>
				<%
			}
		}else{
			%>
			<script type="text/javascript">
			alert("아이디를 입력해주십시오.");
			history.back();
			</script>
			
			<%
		}
		%>
		<a href="../index.jsp"></a>
		
	


</body>
</html>