<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.hyundai.member.memberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Blue Hands</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css"> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	 var roadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 참고 항목 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('postcode').value = data.zonecode;
             document.getElementById("roadAddress").value = roadAddr;
             document.getElementById("jibunAddress").value = data.jibunAddress;
             
             // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
             if(roadAddr !== ''){
                 document.getElementById("extraAddress").value = extraRoadAddr;
             } else {
                 document.getElementById("extraAddress").value = '';
             }

             var guideTextBox = document.getElementById("guide");
             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
             if(data.autoRoadAddress) {
                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                 guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                 guideTextBox.style.display = 'block';

             } else if(data.autoJibunAddress) {
                 var expJibunAddr = data.autoJibunAddress;
                 guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                 guideTextBox.style.display = 'block';
             } else {
                 guideTextBox.innerHTML = '';
                 guideTextBox.style.display = 'none';
             }
         }
    
     }).open();
   
 }
 
 
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<SCRIPT type="text/javascript">


$(function(){
	var check = 1;
	$("#y").on("click", function(){
		
		var d="<label>우편번호</label>"

			d += "<input type='text' id='postcode' placeholder='우편번호' name='postcode'>  ";
			d += "<input type='button' onclick='execDaumPostcode()' value='우편번호 찾기' ><br>";
			d += "<label>주소</label>";
			d += "<input type='text' id='roadAddress' placeholder='도로명주소' name='roadAddress'>  ";
			d += "<input type='text' id='jibunAddress' placeholder='지번주소' name='jibunAddress'><br>";
			d += "<label></label>";
			d += "<span id='guide' style='color:#999;display:none'></span><br>";
			d += "<label></label>";
			d += "<input type='text' id='detailAddress' placeholder='상세주소' name='detailAddress'>  ";
			d += "<input type='text' id='extraAddress' placeholder='참고항목' name='extraAddress'><br>";
			
			$('.u').html(d);
			$(".u").fadeToggle();
			check *= -1;
			document.fr.checkValue.value = check;
			
	});
	
});

</SCRIPT>
<SCRIPT type="text/javascript">
 
 function check(){
	 	var check = document.fr.checkValue.value;	
	 
	 	
		if((document.fr.USER_PW.value) == ""){
			alert("비밀번호를 입력하세요");
			document.fr.USER_PW.focus();
			return false;
		}
		if((document.fr.USER_NAME.value) == ""){
			alert("이름을 입력하세요");
			document.fr.USER_NAME.focus();
			return false;
		}
		if((document.fr.USER_EMAIL.value) == ""){
			alert("이메일을 입력하세요");
			document.fr.USER_EMAIL.focus();
			return false;
		}
		if((document.fr.USER_ID.value)==(document.fr.USER_PW.value)){
			alert("ID와 PW는 똑같지 않습니다.");
			return false;
		}
		if((document.fr.emailDumplication.value)=="0"){
 			alert("이메일 중복체크를 반드시 해주세요.");
 			return false;
 		}
		
		if (check == 1){
			document.fr.USER_ADRESS.value = document.fr.USER_ADRESS.value; 
		} else {
			document.fr.USER_ADRESS.value = "(" + document.fr.postcode.value + ")" + document.fr.roadAddress.value
					+ document.fr.jibunAddress.value + document.fr.detailAddress.value + document.fr.extraAddress.value;
		}
		
	}
 </SCRIPT>
 
 <!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp" />
<br>


<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->


<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<%
		request.setCharacterEncoding("UTF-8");

		String rid = (String)session.getAttribute("USER_ID");
		
		if(rid == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		final String DRIVER= "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/my";
		final String DBID = "root";
		final String DBPW = "1234";	
		
		Class.forName(DRIVER);
		
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		String sql = "select * from user where USER_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, rid);
		
		ResultSet rs= pstmt.executeQuery();
		
		memberBean mb = null;
		
		if(rs.next()){
			mb = new memberBean();
			mb.setUSER_ID(rs.getString("USER_ID"));
			mb.setUSER_PW(rs.getString("USER_PW"));
			mb.setUSER_NAME(rs.getString("USER_NAME"));
			mb.setUSER_EMAIL(rs.getString("USER_EMAIL"));
			mb.setUSER_ADRESS(rs.getString("USER_ADRESS"));
			mb.setUSER_PHONE(rs.getString("USER_PHONE"));
			mb.setUSER_BIRTHDAY(rs.getString("USER_BIRTHDAY"));
			mb.setCAR(rs.getString("CAR"));
			mb.setCARYEAR(rs.getInt("CARYEAR"));
			
			
		}
		%>
<article>
<h1>회원정보수정</h1>
<form action="updatdPro.jsp" id="join" name="fr" method="post" onsubmit="return check();">
<fieldset>
<legend>필수 입력 사항</legend>
<label>아이디</label>
<input type="text" name="USER_ID" class="id" value="<%=mb.getUSER_ID() %>" readonly="readonly"><br>

<label>비밀번호</label>
<input type="password" name="USER_PW" placeholder="본인확인을 위하여 현재비밀번호를 입력해주세요." size="40"> <br>
<label>이름</label>
<input type="text" name="USER_NAME" value="<%=mb.getUSER_NAME()%>"><br>
<label>이메일</label>
<input type="email" name="USER_EMAIL" value="<%=mb.getUSER_EMAIL() %>">
<SCRIPT type="text/javascript">
function emailCheck(){
	 if(document.fr.USER_EMAIL.value == ""){
		 alert("이메일을 입력하세요.");
		 document.fr.USER_EMAIL.focus();
		 return;
	 }
	 
	 var useremail = document.fr.USER_EMAIL.value;
	
	 window.open("joinEMAILCheck.jsp?useremail="+useremail+"&NAME=<%=rid %>", "", "width=400,height=300");
	 
}
</SCRIPT>
<input type="button" value="중복체크" class="dup" onclick=" emailCheck();">
<input type="hidden" name="emailDumplication" value="0">
</fieldset>

<fieldset>
<legend>선택 입력 사항</legend>
<div class="k">
</div>
<label>현재 주소</label>
<input type="text" size="35" value="<%=mb.getUSER_ADRESS() %>" name="USER_ADRESS">  
<input type="button" id="y" name="y" value="주소 재지정하기" class="dup">
<div class="u" style="display:none"></div>
<br>

<label>전화번호</label>
<input type="text" name="USER_PHONE" value="<%=mb.getUSER_PHONE() %>"><br>
<label>생년월일</label>
<input type="text" name="USER_BIRTHDAY" value="<%=mb.getUSER_BIRTHDAY() %>"><br>
<label>자동차명</label>
<input type="text" name="CAR" value="<%=mb.getCAR() %>"><br>
<label>자동차연식</label>
<input type="text" name="CARYEAR" value="<%=mb.getCARYEAR() %>"><br>
<input type="hidden" name="checkValue">
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="수정하기" class="submit">
<input type="button" value="취소" class="cancel" onclick="location.href='../index.jsp'">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<jsp:include page="/inc/bottom.jsp" />
</div>
</body>
</html>