<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Blue Hands</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
 
 <SCRIPT type="text/javascript">
 
 	function winopen(){
 		// 버튼 클릭시 실행 -> 새창 열기
 		// id값이 입력되어있는지 없는지 체크
 		 if(document.fr.USER_ID.value == ""){
 			alert("아이디를 입력하세요");
 			document.fr.USER_ID.focus();
 			return;
 		} 
 		// html코드의 값을 가져오기
 		var userid = document.fr.USER_ID.value;
 		
 		// id값이 있을때 -> 새창열기
 		window.open("joinIDCheck.jsp?userid="+userid, "", "width=400,height=300");
 		
 	}
 	
 	function emailCheck(){
 		if(document.fr.USER_EMAIL.value == ""){
 			alert("이메일을 입력하세요.");
 			document.fr.USER_EMAIL.focus();
 			return;
 		}
 		var useremail = document.fr.USER_EMAIL.value;
 		
 		window.open("joinEMAILCheck.jsp?useremail="+useremail, "", "width=400,height=300");
 		
 	}
 	
 	
 	
 	function check(){
 		

 		if((document.fr.USER_ID.value) == ""){
 			alert("아이디를 입력하세요");
 			document.fr.USER_ID.focus();
 			return false;
 		}
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
 			alert("ID와 PW를 다르게 작성해주세요.");
 			return false;
 		}
 		if((document.fr.idDumplication.value)=="0"){
 			alert("중복된 아이디 입니다.");
 			return false;
 		}
 		if((document.fr.emailDumplication.value)=="0"){
 			alert("이메일 중복체크를 반드시 해주세요.");
 			return false;
 		}
 		
 	}
 </SCRIPT>
 
 
 
 
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>


<div id="wrap">
<jsp:include page="../inc/top.jsp" />
<br>

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>

<!-- 본문메인이미지 -->

<SCRIPT type="text/javascript">
$(function(){
	
	$(".id").on("keyup",function(){
		var idtext = $(".id").val();
			if(idtext.length<1){
				$("#tt").text("아이디를 입력하세요");
				$("#tt").css("color","red");
			}else{
					$.ajax({
						url:"joinIDCheck.jsp",
						type:"post",
						data:{"userid":$(".id").val()},
						success:function(data){
							console.log(data);
							if(data==1){
								$("#tt").text("이미 사용중인 아이디 입니다.");
								$("#tt").css("color","red");
							}else{
								$("#ttx").val("1");
								$("#tt").text("사용가능한 아이디 입니다.");
								$("#tt").css("color","green");
								
							}
							}
							
						
					});
				}
			});
});
	


</SCRIPT>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원가입</h1>



<form action="joinPro.jsp" id="join" name="fr" method="post" onsubmit="return check();">
<fieldset>
<legend>필수 입력 사항</legend>
<label>아이디</label>
<input type="text" name="USER_ID" class="id">
<div id="tt"></div>
<!-- <input type="button" value="중복체크" class="dup" onclick="winopen();" name="idcheck"/> --><br>
<input type="hidden" name="idDumplication" value="0" id="ttx">
<label>비밀번호</label>
<input type="password" name="USER_PW"><br>
<label>이름</label>
<input type="text" name="USER_NAME"><br>
<label>이메일</label>
<input type="email" name="USER_EMAIL">
<input type="button" value="중복체크" class="dup" onclick=" emailCheck();">
<input type="hidden" name="emailDumplication" value="0">

<div class="b"></div>
</fieldset>

<fieldset>
<legend>선택 입력 사항</legend>
<label>우편번호</label>

<input type="text" id="postcode" placeholder=" 우편번호" name="postcode">
<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" ><br>
<label>주소</label>
<input type="text" id="roadAddress" placeholder=" 도로명주소" name="roadAddress">

<input type="text" id="jibunAddress" placeholder=" 지번주소" name="jibunAddress"><br>
<label></label>
 <span id="guide" style="color:#999;display:none"></span><br>
 <label></label>
<input type="text" id="detailAddress" placeholder=" 상세주소" name="detailAddress">

<input type="text" id="extraAddress" placeholder=" 참고항목" name="extraAddress"><br>
<!-- <input type="text" name="USER_ADRESS"><br> -->
<hr>
<label>전화번호</label>
<input type="text" name="USER_PHONE" placeholder="  ' - ' 를제외한 숫자만 입력해주세요." size="30"><br>
<label>생년월일</label>
<input type="text" name="USER_BIRTHDAY" placeholder="  ex) 210522"><br>
<label>자동차명</label>
<input type="text" name="CAR"><br>
<label>자동차연식</label>
<input type="text" name="CARYEAR"><br>
</fieldset> 
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="가입" class="submit">
<input type="button" value="Cancel" class="cancel" onclick="location.href='join.jsp'">
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